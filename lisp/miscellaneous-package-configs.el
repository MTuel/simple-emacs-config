(provide 'miscellaneous-package-configs)

;; Timers in Emacs.
;; https://github.com/alphapapa/hammy.el
(use-package hammy
  :init
  (hammy-mode))

;; Test your typing skills in any buffer.
;; https://github.com/dakra/speed-type
(use-package speed-type)

;; Broadcast your keystrokes in a buffer.
;; https://github.com/tarsius/keycast
(use-package keycast)

;; Open and view PDFs in Emacs.
;; https://github.com/vedang/pdf-tools
(use-package pdf-tools)

;; Open and view .epub files in Emacs.
;; https://github.com/emacsmirror/nov
(use-package nov
  :init
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
  :config
  (setq nov-text-width t)
  (setq visual-fill-column-width 100)
  (setq visual-fill-column-center-text t)
  (add-hook 'nov-mode-hook 'visual-line-mode)
  (add-hook 'nov-mode-hook 'visual-fill-column-mode))

;; "Emulate A Terminal"
;; Use Emacs as a full fledged terminal.
;; https://github.com/kephale/emacs-eat
(use-package eat)
