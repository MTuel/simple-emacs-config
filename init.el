;; -*- lexical-binding: t; -*-

;;
;;
;; CONFIGURE LOAD PATH
;;
;;

(add-to-list 'load-path "~/.config/emacs/lisp/")

;;
;;
;; PACKAGE MANAGER SETUP
;;
;;

;; Set up 'package.el' to work with MELPA, ORG, and ELPA.
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/"))) 

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize 'use-package' on non-Linux platforms.
;; https://github.com/jwiegley/use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;
;;
;; PACKAGE CONFIGURATIONS
;;
;;

(require 'basic-config)
(require 'theme-config)
(require 'editing-modes)
(require 'general-config)
(require 'autocomplete-config)
(require 'dired-config)
(require 'org-config)
(require 'elfeed-config)
(require 'spellcheck-config)
(require 'miscellaneous-package-configs)

;;
;;
;; CUSTOM VARIABLES
;;
;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("61526419f6ffee91cae16a75bfc0f39f7e9621280cc405edeae15699091e7c73" "d445c7b530713eac282ecdeea07a8fa59692c83045bf84dd112dd738c7bcad1d" default))
 '(org-agenda-files nil)
 '(package-selected-packages
   '(denote org-download org-ql dired-preview marginalia nov pdf-tools magit typo keycast keycast-mode speed-type dired-hide-dotfiles all-the-icons-dired dired-single elfeed-goodies elfeed org-web-tools hl-todo corfu orderless vertico atom-one-dark-theme org-preview-html org-html-preview web-mode markdown-mode aggressive-indent parinfer-rust-mode paredit cider centaur-tabs org-roam-ui websocket htmlize weblorg eglot company gruvbox-theme dashboard visual-fill-column evil-collection general counsel ivy-rich which-key rainbow-delimiters beacon doom-modeline ivy evil-mode evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit outline-1 :height 1.75))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.5))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.25))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.1)))))
