(provide 'sly-config)

;; SLY
;; https://github.com/joaotavora/sly
;;
;; I have it configured for Steel Bank Common Lisp (SBCL) through Roswell.
(use-package sly
  :init
  (setq inferior-lisp-program "ros -Q run"))

