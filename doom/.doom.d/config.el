;;; $DOOMDIR/config.el  --- Personal Configuration -*- lexical-binding: t; -*-
;;
;;; Commentary:
;;
;;; Code:

;; --- Contact information
(setq user-full-name       "Rolfe Power"
      user-mail-address    (rot13 "ebysrcbjre4@tznvy.pbz"))

;; --- Directories
(setq power/home-directory "/home/rpower/")
(setq power/org-directory (concat power/home-directory "Dropbox/org/"))

;; --- Visual Settings
(setq doom-font (font-spec :family "Hack" :size 15)
      doom-variable-pitch-font (font-spec :family "Roboto")
      doom-serif-font (font-spec :family "Roboto"))

;; Line Numbers
(setq display-line-numbers-type t)

;; Thin grey line separating windows
(set-face-background 'vertical-border "grey")
(set-face-foreground 'vertical-border (face-background 'vertical-border))


;; --- Themes
(use-package! doom-themes
  :config
  (load-theme 'doom-homage-black t)
  (doom-themes-org-config))

(defun power/night-mode ()
  (interactive)
  (load-theme 'doom-homage-black t)
  (doom/reload-theme))

(defun power/day-mode ()
  (interactive)
  (load-theme 'doom-homage-white t)
  (doom/reload-theme))

;; --- Misc
;; Show time in mode line
(display-time-mode 1)

;; --- Org
(setq org-directory power/org-directory)
(use-package! org
  :mode ("\\.org\\'" . org-mode)
  :init
  (setq org-catch-invisible-edits 'show))

(after! org
  ;; Clear Doom's default templates
  (setq org-capture-templates '())
  (setq org-todo-keywords
        '((sequence "TODO(t)" "WIP(s)" "WAITING(w)" "ATTEND(a)" "QUESTION(q)"
                    "|"
                    "DONE(d)" "DEFERRED(f)" "CANCELED(c)")))
  (setq org-todo-keyword-faces
        '(("TODO" .     "#fb4933")
          ("ATTEND" .   "#d872cb")
          ("STARTED" .  "#fabd2f")
          ("WAITING" .  "#fe8019")
          ("DONE" .     "#b8bb26")
          ("DEFERRED" . "#de869b")
          ("CANCELED" . "#83a598"))
        )
  (setq org-confirm-babel-evaluate nil
        org-use-property-inheritance t
        org-export-use-babel nil
        org-startup-indented t
        org-pretty-entities nil
        org-outline-path-complete-in-steps nil)
  (setq org-agenda-files '("~/Dropbox/org/" "~/Dropbox/org/journal/")))

;; Org Journal
(use-package! org-journal
  :after org
  :config
  (customize-set-variable 'org-journal-dir (concat org-directory "journal/"))
  (customize-set-variable 'org-journal-file-format "%Y-%m-%d.org")
  (customize-set-variable 'org-journal-date-format "%Y-%m-%d")
  (customize-set-variable 'org-journal-time-prefix "* ")
  (customize-set-variable 'org-journal-time-format ""))

;; Pomodoro
(setq org-pomodoro-keep-killed-pomodoro-time 1)

;; -- Dired
(after! dired
  (setq dired-listing-switches "-aBhl  --group-directories-first"))

;; --- Python
(after! python
  (setq python-shell-interpreter "python3"))

;; --- Latex
(after! latex (setq font-latex-fontify-script nil))

;; --- Avy
(setq avy-all-windows t)

;; Custom Bindings for jumping
(use-package! avy
  :config
  (map! "M-SPC" #'avy-goto-word-or-subword-1))
(map! :leader
      :desc "Word"   "j" #'avy-goto-word-or-subword-1
      :desc "Window" "W" #'ace-window
      :desc "Line"   "J" #'avy-goto-line)

;; --- Ace window
(use-package! ace-window
  :config
  (map! "C-M-SPC" #'ace-window)
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

;; --- Swiper
(setq swiper-use-visual-line nil)
(setq swiper-use-visual-line-p (lambda (a) nil))

;; --- Clangd
(setq lsp-clients-clangd-args '("-j=3"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))

;; Misc
(setq confirm-kill-emacs nil)

(add-hook 'compilation-filter-hook 'comint-truncate-buffer)
(setq comint-buffer-maximum-size 2000)

(setq recentf-max-saved-items 10000)
