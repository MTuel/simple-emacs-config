(provide 'editing-modes)

;; Cider
;; https://github.com/clojure-emacs/cider
(use-package cider)

;; Markdown Mode
;; https://github.com/jrblevin/markdown-mode
(use-package markdown-mode
  :ensure t)

;; Web Mode
;; https://github.com/fxbois/web-mode
(use-package web-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode)))

;; SLY
;; https://github.com/joaotavora/sly
;;
;; I have it configured for Steel Bank Common Lisp (SBCL) through Roswell.
(use-package sly
  :init
  (setq inferior-lisp-program "ros -Q run"))

;; Avy
;; https://github.com/abo-abo/avy
(use-package avy)

;; Evil for VIM keybindings.
;; https://github.com/emacs-evil/evil
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-respect-visual-line-mode t)
  (setq evil-undo-system 'undo-redo)
  (setq evil-want-C-i-jump nil)

  :config

  ;; Turn on EVIL mode.
  (evil-mode 1)

  ;; Map CTRL+g to mimic ESC for consistency.
  (evil-define-key '(visual insert) custom-map "C-g" 'evil-normal-state)

  ;; Map CTRL+h to behave like regular Vim/Neovim instead of pulling up the help menu in insert mode.
  (evil-define-key '(insert) custom-map "C-h" 'evil-delete-backward-char-and-join)

  (evil-ex-define-cmd "W" "w")
  (evil-ex-define-cmd "Q" "q"))

;; Additional keybindings for evil.
;; https://github.com/emacs-evil/evil-collection
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))
