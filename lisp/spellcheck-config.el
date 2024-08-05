(provide 'spellcheck-config)

;; ispell/hunspell for spellcheck.

(setq ispell-program-name "/usr/local/Cellar/ispell/3.4.06/bin/ispell")

      (setq ispell-dictionary "english")
(setq ispell-local-dictionary-alist `(("english"
				       "[[:alpha:]]"
				       "[^[:alpha:]]"
				       "[']"
				       t
				       ("-d" "english")
				       nil
				       utf-8)))

(setq ispell-hunspell-dictionary-alist ispell-local-dictionary-alist)
