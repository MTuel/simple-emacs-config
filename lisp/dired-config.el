(provide 'dired-config)

(use-package dired-single)

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

;; This adds icons to dired.
(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

;; This allows us to hide or show dotfiles on the fly.
(use-package dired-hide-dotfiles
  :hook (dired-mode . dired-hide-dotfiles-mode)
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "H" 'dired-hide-dotfiles-mode))

(use-package dired-preview
  :config
  (dired-preview-global-mode)
  (setq dired-preview-delay 0.3))

(defun my/dired-preview-to-the-right ()
  "My preferred `dired-preview-display-action-alist-function'."
  '((display-buffer-in-direction)
    (side . right)
    (width . 0.7)))

(setq dired-preview-display-action-alist-function #'my/dired-preview-to-the-right)
