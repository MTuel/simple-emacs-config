(provide 'evil-config)

(defun my/no-arrow-keys ()
  "Stop using the arrow keys!")

;; Evil for VIM keybindings.
;; https://github.com/emacs-evil/evil
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-respect-visual-line-mode t)
  (setq evil-undo-system 'undo-redo)

  :config

  ;; Turn on EVIL mode.
  (evil-mode 1)

  ;; Map CTRL+g to mimic ESC for consistency.
  (evil-define-key '(visual insert) custom-map "C-g" 'evil-normal-state)

  ;; Map CTRL+h to behave like regular Vim/Neovim instead of pulling up the help menu in insert mode.
  (evil-define-key '(insert) custom-map "C-h" 'evil-delete-backward-char-and-join)

  ;; Map H and L to mimic 0 and $ respectively for better ergonomics.
  (evil-define-key '(normal visual) custom-map
    "H" 'evil-beginning-of-visual-line
    "L" 'evil-end-of-visual-line)

  (evil-ex-define-cmd "W" "w")
  (evil-ex-define-cmd "Q" "q"))

;; Additional keybindings for evil.
;; https://github.com/emacs-evil/evil-collection
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

