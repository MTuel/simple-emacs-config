(provide 'dired-config)

;; Configure dired itself with just a couple of minor tweaks for evil.
(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "-" 'dired-single-up-directory
    "enter" 'dired-single-buffer)
  (setq dired-omit-mode nil)
  (setq dired-omit-files nil))

;; This allows us to hide or show dotfiles on the fly.
;; https://github.com/mattiasb/dired-hide-dotfiles
(use-package dired-hide-dotfiles
  :hook (dired-mode . dired-hide-dotfiles-mode)
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "H" 'dired-hide-dotfiles-mode))

;; https://github.com/protesilaos/dired-preview
(use-package dired-preview
  :config
  (dired-preview-global-mode)
  (setq dired-preview-delay 0.3))

(setq dired-preview-display-action-alist-function #'simple-dired-preview-to-the-right)
