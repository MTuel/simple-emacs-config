(provide 'theme-config)

;; https://github.com/jonathanchu/atom-one-dark-theme
(use-package atom-one-dark-theme
  :init
  (load-theme 'atom-one-dark :no-confirm)))

;; Use the custom function to load the font.
(simple-configure-custom-font)

;; NOTE: You will need to run 'M-x nerd-icons-install-fonts' and then manually install the
;; downloaded font on Windows.
;; https://github.com/rainstormstudio/nerd-icons.el#installing-fonts
(use-package nerd-icons)

;; nerd-icons support for Corfu.
;; https://github.com/LuigiPiucco/nerd-icons-corfu
(use-package nerd-icons-corfu
  :after
  (corfu)
  :init
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

;; https://github.com/domtronn/all-the-icons.el
(use-package all-the-icons
  :if (display-graphic-p))

;; This adds all-the-icons support to dired.
;; https://github.com/jtbm37/all-the-icons-dired
(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

;; https://github.com/seagle0128/doom-modeline
(use-package doom-modeline
  :init
  (doom-modeline-mode 1))

;; https://github.com/emacs-dashboard/emacs-dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-center-content t))

(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

;; Rainbow Delimiters for .
;; https://github.com/Fanael/rainbow-delimiters
;;
;; Colored braces and parentheses. This is a must have for Lisp programming.
(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

;; Highlights the cursor as you jump through or between windows/buffers.
;; https://github.com/Malabarba/beacon
(use-package beacon
  :init
  (beacon-mode 1))

;; Set line numbers to display.
;; https://www.emacswiki.org/emacs/LineNumbers
(require 'display-line-numbers)

(simple-display-line-numbers--turn-on)

(use-package visual-fill-column
  :hook
  (org-mode . simple-visual-fill)
  (nov-mode . simple-visual-fill))

;;(add-hook 'nov-mode 'simple-visual-fill)

;; Highlights specific keywords in comments.
;; https://github.com/tarsius/hl-todo?tab=readme-ov-file
(use-package hl-todo
  :init
  (global-hl-todo-mode)
  :config
  (setq hl-todo-keyword-faces
	'(("TODO" . "#61AFEF")
	  ("NOTE" . "#56B6C2")
	  ("WARNING" . "#E5C07B")
	  ("FIX" . "#E06C75")))
  ;; NOTE: Sets whether or not the color is applied to the foreground (nil) or background (t) of the text.
  (setq hl-todo-color-background nil)
  (setq hl-todo-highlight-punctuation ""))
