(provide 'editing-modes)

;; Sly is an editing mode for Lisp.
;; I have it configured for Steel Bank Common Lisp (SBCL) through Roswell.
;; https://github.com/joaotavora/sly
(use-package sly
  :init
  (setq inferior-lisp-program "ros run"))

;; Provides a better lisp editing experience by
;; helping keep indenation in line.
;; https://github.com/Malabarba/aggressive-indent-mode
(use-package aggressive-indent
  :init
  (global-aggressive-indent-mode))

;; Clojure focused package.
;; https://github.com/clojure-emacs/cider
(use-package cider)

;; https://github.com/jrblevin/markdown-mode
(use-package markdown-mode
  :ensure t)

;; https://github.com/fxbois/web-mode
(use-package web-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode)))

;; Provides a EasyMode like way of jumping to any location in the buffer.
;; https://github.com/abo-abo/avy
(use-package avy)

