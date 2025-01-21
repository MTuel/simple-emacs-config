(provide 'spellcheck-config)

;; ispell/hunspell for spellcheck.

(setq ispell-program-name "/usr/bin/ispell")

      (setq ispell-dictionary "american")
(setq ispell-local-dictionary-alist `(("american"
				       "[[:alpha:]]"
				       "[^[:alpha:]]"
				       "[']"
				       t
				       ("-B")
				       nil
				       utf-8)))

(setq ispell-hunspell-dictionary-alist ispell-local-dictionary-alist)
