(provide 'dired-config)

(use-package dired-single)

;; Configure dired itself with just a couple of minor tweaks for evil.
(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-single-up-directory
    "l" 'dired-single-buffer))

;; This adds icons to dired.
(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

;; This allows us to hide or show dotfiles on the fly.
(use-package dired-hide-dotfiles
  :hook (dired-mode . dired-hide-dotfiles-mode)
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "H" 'dired-hide-dotfiles-mode))
