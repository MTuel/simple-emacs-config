(provide 'slime-config)

;; SLIME (Superior Lisp Interaction Mode for Emacs)
;; I have it configured for Steel Bank Common Lisp (SBCL) http://www.sbcl.org/
(use-package slime
  :init
  (setq inferior-lisp-program "ros -Q run"))

