;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; C style
(setq c-default-style "linux")


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Rolfe Power"
      user-mail-address "rolfepower4@gmail.com"
      user-login-name "rpower"
      user-real-login-name "rpower")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;;(setq doom-font (font-spec :family "Inconsolata Regular" :size 14))
(setq doom-font "Hack-10")

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-monokai-pro)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")
(setq org-agenda-files '("~/Dropbox/org/"))

;; Org Journal
(setq org-journal-dir "~/Dropbox/org/")
(setq org-journal-file-format "%Y-%m-%d.org")
(setq org-journal-date-format "%e %b %Y (%A)")
(setq org-journal-time-format " ")

;; Pomodoro
(setq org-pomodoro-keep-killed-pomodoro-time 1)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Deft
(setq deft-extensions '("org"))
(setq deft-recursive t)
(setq deft-default-extension "org")
(setq deft-directory "~/Dropbox/org")

;; Set the todo keywords with the corresponding "quick access keys"
(after! org
    (setq org-todo-keywords
        '((sequence "TODO(t)" "STARTED(s!)" "WAITING(w@/!)"
                    "|" 
                    "DONE(d!)" "DEFERRED(f@)" "CANCELED(c@)")))
    (setq org-todo-keyword-faces
          '(("TODO" .     "#fb4933")
            ("STARTED" .  "#fabd2f")
            ("WAITING" .  "#fe8019")
            ("DONE" .     "#b8bb26")
            ("DEFERRED" . "#de869b")
            ("CANCELED" . "#83a598"))
 ))

;; Set the
(after! python
  (setq python-shell-interpreter "python3"))

(after! latex (setq font-latex-fontify-script nil))

;; Allow avy to search all windows
(setq avy-all-windows t)

;; Start Emacs Maximized
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
