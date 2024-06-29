(provide 'miscellaneous-package-configs)

;; Hammy
;; https://github.com/alphapapa/hammy.el
(use-package hammy
  :init
  (hammy-mode))

(use-package speed-type)

(use-package keycast)

(use-package pdf-tools)

(use-package nov
  :init
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))
