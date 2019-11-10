import System.IO
import System.Exit
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.Spiral
import XMonad.Layout.Grid
import XMonad.Layout.Spacing
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import Graphics.X11.ExtraTypes.XF86
import qualified XMonad.StackSet as W
import qualified Data.Map as M


----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
--                                     Preferred Applications                               --
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------

myTerminal = "urxvt"
myLauncher = "rofi -show run"

----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
--                                        Workspaces                                        --
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------

myWorkspaces = map show [1..9]

----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
--                                      Window Rules                                        --
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------

myManageHook = composeAll
    [   className =? "stalonetray" --> doIgnore 
        ,isFullscreen --> (doF W.focusDown <+> doFullFloat) ]

----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
--                                         Layouts                                          --
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------

myLayouts = avoidStruts $
    smartSpacingWithEdge 5 $ emptyBSP |||
    tabbed shrinkText tabConfig |||
    Full

----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
--                                        Colors                                            --
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------

myNormalBorderColor  = "#7c7c7c"
myFocusedBorderColor = "#ffb6b0"

-- Colors for text and backgrounds of each tab when in "Tabbed" layout.
tabConfig = defaultTheme {
    activeBorderColor = "#7C7C7C",
    activeTextColor = "#CEFFAC",
    activeColor = "#000000",
    inactiveBorderColor = "#7C7C7C",
    inactiveTextColor = "#EEEEEE",
    inactiveColor = "#000000"
}

-- Color of current window title in xmobar.
xmobarTitleColor = "#FFB6B0"

-- Color of current workspace in xmobar.
xmobarCurrentWorkspaceColor = "#CEFFAC"

-- Width of the window border in pixels.
myBorderWidth = 1

----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
--                                      Key Bindings                                        --
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------

myModMask = mod4Mask

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $


    -- Start a terminal
    [ ((modMask .|. shiftMask, xK_Return),
        spawn $ XMonad.terminal conf)

    -- Spawn the launcher
    , ((modMask, xK_p), 
        spawn myLauncher)

    -- Close the focused window
    , ((modMask .|. shiftMask, xK_c),
        kill)

    -- Cycle through the available layout algorithms
    , ((modMask, xK_space), 
        sendMessage NextLayout)

    -- Reset the layouts on the current workspace to default
    , ((modMask .|. shiftMask, xK_space),
        setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    -- , ((modMask, xK_n), refresh)

    -- Move focus to the next window
    , ((modMask, xK_j),
        windows W.focusDown)

    -- Move focus to the previous window.
    , ((modMask, xK_k),
        windows W.focusUp  )

    -- Move focus to the master window.
    , ((modMask, xK_m),
        windows W.focusMaster  )

    -- Swap the focused window and the master window.
    , ((modMask, xK_Return),
        windows W.swapMaster)

    -- Swap the focused window with the next window.
    , ((modMask .|. shiftMask, xK_period), windows W.swapDown)

    -- Swap the focused window with the previous window.
    , ((modMask .|. shiftMask, xK_comma), windows W.swapUp)

    -- Shrink the master area.
    -- , ((modMask .|. shiftMask, xK_h), sendMessage Shrink)

    -- Expand the master area.
    -- , ((modMask .|. shiftMask, xK_l), sendMessage Expand)

    -- Push window back into tiling.
    , ((modMask, xK_t),
        withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area.
    , ((modMask, xK_comma),
        sendMessage (IncMasterN 1))

    -- Decrement the number of windows in the master area.
    , ((modMask, xK_period),
        sendMessage (IncMasterN (-1)))

    -- Change spacing
    , ((modMask, xK_g), incWindowSpacing 5)
    , ((modMask .|. shiftMask, xK_g), decWindowSpacing 5)
    , ((modMask .|. controlMask, xK_g), setScreenWindowSpacing 5)

    -- Toggle the status bar gap.
    -- TODO: update this binding with avoidStruts, ((modMask, xK_b),

    -- BSP Bindings
    , ((modMask .|. shiftMask, xK_l), sendMessage $ ExpandTowards R)
    , ((modMask .|. shiftMask, xK_h), sendMessage $ ExpandTowards L)
    , ((modMask .|. shiftMask, xK_j), sendMessage $ ExpandTowards D)
    , ((modMask .|. shiftMask, xK_k), sendMessage $ ExpandTowards U)
    , ((modMask, xK_r), sendMessage $ Rotate)
    , ((modMask, xK_s), sendMessage $ Swap)
    , ((modMask .|. shiftMask, xK_n), sendMessage $ Balance)
    , ((modMask .|. shiftMask, xK_a), sendMessage $ Equalize)

    -- Quit xmonad.
    , ((modMask .|. shiftMask, xK_q),
        io (exitWith ExitSuccess))

    -- Restart xmonad.
    , ((modMask, xK_q),
        restart "xmonad" True)
    ]
    ++

    -- mod-[1-9], switch to workspace N
    -- mod-shift-[1-9] move client to workspace N
    [((m .|. modMask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
--                                    Mouse Bindings                                        --
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
    [
        -- mod-button1, set the window to floating mode and move by dragging
        ((modMask, button1),
            (\w -> focus w >> mouseMoveWindow w))

        -- mod-button2, raise the window to the top of the stack
        , ((modMask, button2),
            (\w -> focus w >> windows W.swapMaster))

        -- mod-button3, Set the window to floating and resize by dragging
        , ((modMask, button3),
            (\w -> focus w >> mouseResizeWindow w))
    ]

----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
--                              Status Bars and Logging                                     --
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
--                                     Startup Hook                                         --
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------

myStartupHook = do
    setWMName "LG3D"
    spawn "stalonetray"
    spawn "dropbox start"


----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
--                                      Run XMonad                                          --
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaults {
        logHook = dynamicLogWithPP $ xmobarPP {
            ppOutput = hPutStrLn xmproc
            , ppTitle = xmobarColor xmobarTitleColor "" . shorten 100
            , ppCurrent = xmobarColor xmobarCurrentWorkspaceColor ""
            , ppSep = "    "
        }
        , manageHook = manageDocks <+> myManageHook
        , startupHook = myStartupHook
        , handleEventHook = docksEventHook
    }


defaults = defaultConfig {
    terminal = myTerminal,
    focusFollowsMouse = myFocusFollowsMouse,
    borderWidth = myBorderWidth,
    modMask = myModMask,
    workspaces = myWorkspaces,
    normalBorderColor = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,

    keys = myKeys,
    mouseBindings = myMouseBindings,

    layoutHook = smartBorders $ myLayouts,
    manageHook = myManageHook,
    startupHook = myStartupHook
}
