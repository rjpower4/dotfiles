;;; $DOOMDIR/config.el  --- Personal Configuration -*- lexical-binding: t; -*-
;;
;;  Author: Rolfe Power
;;
;;; Commentary:
;;
;; This file contains the my personal configuration for Doom Emacs. To see what
;; packages are being installed, see `init.el' in this same directory. In this
;; file, I set constants, define my own functions, and modify the configuration
;; of several of the packages installed.
;;
;;; Code:

;; -------------------------------------------------------------------------- ;;
;; ------------------------- PERSONAL INFORMATION --------------------------- ;;
;; -------------------------------------------------------------------------- ;;
(setq user-full-name       "Rolfe Power"
      user-mail-address    (rot13 "ebysrcbjre4@tznvy.pbz"))

;; -------------------------------------------------------------------------- ;;
;; -------------------------- SYSTEM INFORMATION ---------------------------- ;;
;; -------------------------------------------------------------------------- ;;
(defconst *sys/linux* (eq system-type 'gnu/linux))  ; Linux (Well, actually...)
(defconst *sys/win32* (eq system-type 'windows-nt)) ; Windows (Why? God, Why?)
(defconst *sys/macos* (eq system-type 'darwin))     ; MacOS (Hail Tim Apple)

(defconst *sys/root* (string-equal "root" (getenv "USER"))) ; Are we root?

(defconst *sys/gui* (display-graphic-p)) ; Do we have a GUI?

;; -------------------------------------------------------------------------- ;;
;; ------------------------- FINDING EXECUTABLES ---------------------------- ;;
;; -------------------------------------------------------------------------- ;;
;; These are earmuffed variables that give the paths of some potentially use- ;;
;; ful programs. This is primarily to use in user-defined functions or config ;;
;; options.                                                                   ;;
;; -------------------------------------------------------------------------- ;;
(defconst *clangd* (executable-find "clangd"))     ; LLVM C/C++ Language Server
(defconst *gcc* (executable-find "gcc"))           ; Gnu C Compiler
(defconst *git* (executable-find "git"))           ; Git
(defconst *pdflatex* (executable-find "pdflatex")) ; LaTeX Building Tool
(defconst *python3* (executable-find "python3"))   ; Python 3 Executable
(defconst *python* (executable-find "python"))     ; Default System Python
(defconst *rg* (executable-find "rg"))             ; Ripgrep (grep alternative)
(defconst *tr* (executable-find "tr"))             ; Translate/Delete Char Tool

;; -------------------------------------------------------------------------- ;;
;; --------------------------- BASIC SETTINGS ------------------------------- ;;
;; -------------------------------------------------------------------------- ;;
(setq-default delete-by-moving-to-trash t)         ; Non-committal about it
(setq-default uniquify-buffer-name-style 'forward) ; Show path to uniquify
(setq inhibit-compacting-font-caches t)            ; Keep fonts, costs memory
(global-subword-mode 1)                            ; Iterate through CamelCase
(setq initial-scratch-message                      ; How nice...
      ";; Welcome to emacs!\n\n")
(add-hook 'compilation-filter-hook                 ; Keep Comint buffer within
          'comint-truncate-buffer)                 ; reason... i.e.,
(setq comint-buffer-maximum-size 2000)             ; under 2000 lines

;; -------------------------------------------------------------------------- ;;
;; ------------------------- DIRECTORY SETTINGS ----------------------------- ;;
;; -------------------------------------------------------------------------- ;;
(setq power/home-directory "/home/rpower/")
(setq power/org-directory (concat power/home-directory "Dropbox/org"))

;; -------------------------------------------------------------------------- ;;
;; --------------------------- VISUAL SETTINGS ------------------------------ ;;
;; -------------------------------------------------------------------------- ;;
(setq display-line-numbers-type t)      ; Line Numbers
(setq confirm-kill-emacs nil)           ; Don't Confirm Exit
(display-time-mode 1)                   ; Show Time in the Mode Line
(setq-default tab-width 4)              ; 1 Tab == 4 Spaces
(add-hook 'prog-mode-hook               ; Gray Line @ 80
          'display-fill-column-indicator-mode)
(setq-default fill-column 80)           ; I need to see multiple windows...

;; -------------------------------------------------------------------------- ;;
;; ------------------------------ LOCATION ---------------------------------- ;;
;; -------------------------------------------------------------------------- ;;
(setq calendar-latitude   40.424660)    ; Horizontal Lines...
(setq calendar-longitude -86.848460)    ; Vertical Lines...

;; -------------------------------------------------------------------------- ;;
;; ------------------------------- THEMING ---------------------------------- ;;
;; -------------------------------------------------------------------------- ;;
(use-package! modus-themes
  :custom
  (modus-themes-bold-constructs t)
  (modus-themes-completions 'nil)
  (modus-themes-no-mixed-fonts t)
  (modus-themes-diffs 'desaturated)
  (modus-themes-fringes 'intense)
  (modus-themes-lang-checkers 'colored-background)
  (modus-themes-links nil)
  (modus-themes-mail-citations nil)
  (modus-themes-mode-line nil)
  (modus-themes-org-blocks nil)
  (modus-themes-paren-match 'intense-bold)
  (modus-themes-prompts 'intense-gray)
  (modus-themes-region 'bg-only-no-extend)
  (modus-themes-scale-headings nil)
  (modus-themes-syntax 'yellow-comments-green-strings)
  (modus-themes-variable-pitch-headings nil)
  (modus-themes-variable-pitch-ui nil)
  (modus-themes-slanted-constructs t))

(setq power/light-theme   'modus-operandi)    ; Default Light Theme
(setq power/dark-theme    'modus-vivendi)     ; Default Dark Theme
(setq power/default-theme 'power/light-theme) ; Default Theme

(defun power/night-mode ()
  "Set the theme to the night-mode (dark) variant."
  (interactive)
  (load-theme power/dark-theme t)
  (doom/reload-theme))

(defun power/day-mode ()
  "Set the theme to the day-mode (light) variant."
  (interactive)
  (load-theme power/light-theme t)
  (doom/reload-theme))

(defun power/auto-theme ()
  "Select the theme automatically based on the sunrise/sunset time."
  (require 'solar)
  (let* ((cur-hour (string-to-number (substring (current-time-string) 11 13)))
         (sun-events (solar-sunrise-sunset (calendar-current-date)))
         (sunrise (caar sun-events))
         (sunset  (caadr sun-events)))
    (if (and (> cur-hour sunrise) (< cur-hour sunset))
        (power/day-mode)
      (power/night-mode))))

(after! modus-themes
  (power/auto-theme))

;; -------------------------------------------------------------------------- ;;
;; ---------------------------------- ORG ----------------------------------- ;;
;; -------------------------------------------------------------------------- ;;
(setq org-directory power/org-directory)
(use-package! org
  :mode ("\\.org\\'" . org-mode)
  :init
  (setq org-catch-invisible-edits 'show)
  :custom
  (org-capture-templates '())
  (org-todo-keywords
        '((sequence "TODO(t)" "PROG(p)" "WAIT(w)"
                    "|"
                    "DONE(d)" "CANC(c)")))
  (org-todo-keyword-faces
        '(("TODO" . "red")
          ("PROG" . "goldenrod")
          ("WAIT" . "orchid")
          ("DONE" . "forest green")
          ("CANC" . "dark gray"))
        )
  (org-confirm-babel-evaluate nil)
  (org-use-property-inheritance t)
  (org-export-use-babel nil)
  (org-startup-indented t)
  (org-pretty-entities nil)
  (org-outline-path-complete-in-steps nil)
  (org-agenda-files (list org-directory (concat org-directory "journal/"))))


;; Org Journal
(use-package! org-journal
  :after org
  :config
  (customize-set-variable 'org-journal-dir
                          (expand-file-name "journal/" org-directory))
  (customize-set-variable 'org-journal-file-format "%Y-%m-%d.org")
  (customize-set-variable 'org-journal-date-format "%e %b %Y (%A)")
  (customize-set-variable 'org-journal-date-prefix "#+TITLE: ")
  (customize-set-variable 'org-journal-time-prefix "* ")
  (customize-set-variable 'org-journal-time-format ""))

;; -------------------------------------------------------------------------- ;;
;; -------------------------------- DIRED ----------------------------------- ;;
;; -------------------------------------------------------------------------- ;;
(after! dired
  (setq dired-listing-switches "-aBhl  --group-directories-first"))

;; -------------------------------------------------------------------------- ;;
;; ----------------------------- ACE WINDOW --------------------------------- ;;
;; -------------------------------------------------------------------------- ;;
(use-package! ace-window
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))) ; Set keys to home row (easy)

;; -------------------------------------------------------------------------- ;;
;; ------------------------------- SWIPER ----------------------------------- ;;
;; -------------------------------------------------------------------------- ;;
(setq swiper-use-visual-line nil)
(setq swiper-use-visual-line-p (lambda (_) nil))

;; -------------------------------------------------------------------------- ;;
;; ------------------------------- HISTORY ---------------------------------- ;;
;; -------------------------------------------------------------------------- ;;
(use-package! recentf
  :custom
  (recentf-max-saved-items 10000)
  (recentf-exclude '((expand-file-name package-user-dir)
                     ".cache"
                     ".cask"
                     ".elfeed"
                     "bookmarks"
                     "cache"
                     "ido.*"
                     "persp-confs"
                     "recentf"
                     "undo-tree-hist"
                     "url"
                     "COMMIT_EDITMSG\\'")))

;; Turn off format on save for specific modes
(setq +format-on-save-enabled-modes
      `(not julia-mode
            text-mode))

;; -------------------------------------------------------------------------- ;;
;; -------------------------------- EVIL ------------------------------------ ;;
;; -------------------------------------------------------------------------- ;;
(use-package! evil
  :defer t
  :custom
  ;; I like seeing the box all the time...
  (evil-normal-state-cursor  'box)
  (evil-insert-state-cursor  'box)
  (evil-visual-state-cursor  'hollow)
  (evil-motion-state-cursor   nil)
  (evil-replace-state-cursor  'hbar)
  (evil-operator-state-cursor 'evil-half-cursor))

;; -------------------------------------------------------------------------- ;;
;; ------------------------------ LANGUAGES --------------------------------- ;;
;; -------------------------------------------------------------------------- ;;

;; -------------------------------- C/C++ ----------------------------------- ;;
(setq lsp-clients-clangd-args '("-j=3"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))

;; -------------------------------- JULIA ----------------------------------- ;;
(use-package! julia-repl
  :config
  (julia-repl-set-terminal-backend 'vterm))

;; -------------------------------- LATEX ----------------------------------- ;;
(after! latex
  (setq font-latex-fontify-script nil))


;; ------------------------------- PYTHON ----------------------------------- ;;
(after! python
  (setq python-shell-interpreter "python3"))
