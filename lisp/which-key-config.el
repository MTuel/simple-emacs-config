(provide 'which-key-config)

;; WhichKey
;; https://github.com/justbur/emacs-which-key
;;
;; Help menu that displays possible completions for keybinds.
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config (setq which-key-idle-delay 0.3))
