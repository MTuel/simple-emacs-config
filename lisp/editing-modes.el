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
