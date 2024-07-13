(provide 'general-config)

;; General
;; https://github.com/noctuid/general.el
;;
;; A better interface for defining keybinds.
(use-package general
  :config
  (general-evil-setup)
  (general-create-definer custom/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (custom/leader-keys
    "rf" '(recentf-open-files :which-key "recentf open files")

    ;; Buffer Manipulation
    "b" '(:ignore t :which-key "buffer")
    "be" '(eval-buffer :which-key "buffer evaluate")
    "bs" '(consult-buffer :which-key "buffer switch")
    "bk" '(ido-kill-buffer :which-key "buffer kill")

    "f" '(:ignore t :which-key "find")

    "fc" '(:ignore t :which-key "find character")
    "fca" '(avy-goto-word-0 :which-key "find any")
    "fcs" '(avy-goto-word-1 :which-key "find specific")

    "fl" '(consult-line :which-key "find line")
    
    ;; EWW and Elfeed
    "ew" '(:ignore t :which-key "eww")
    "ewo" '(eww-open-in-new-buffer :which-key "eww open")

    "el" '(elfeed :which-key "elfeed")
    
    ;; org-mode
    "o" '(:ignore t :which-key "org")

    "oa" '(org-agenda :which-key "org agenda")

    "od" '(:ignore t :which-key "org denote")
    "odo" '(denote-open-or-create :which-key "org denote open")
    "odl" '(denote-link :which-key "org denote link")
    "odr" '(denote-rename-file :which-key "org denote rename")

    "of" '(:ignore t :which-key "org find")
    "ofh" '(consult-org-heading t :which-key "org find heading")

    "oh" '(:ignore t :which-key "org heading")
    "ohp" '(:ignore t :which-key "org heading properties")
    "ohpc" '(my/set-creation-date-heading-property :which-key "org heading properties created")
    "ohpu" '(my/set-updated-date-heading-property t :which-key "org heading properties updated")

    "ol" '(:ignore t :which-key "org link")
    "ole" '(org-insert-link :which-key "org link external")
    
    "oo" '(org-open-at-point :which-key "org open at point")
    
    "os" '(:ignore :which-key "org subtree")
    "osa" '(org-archive-subtree :which-key "org subtree archive")
    
    "ot" '(org-todo :which-key "org todo")

    "ou" '(:ignore t :which-key "org update")
    "ous" '(org-update-statistics-cookies :which-key "org update statistics")

    "ow" '(:ignore :which-key "org web")
    "owi" '(:ignore :which-key "org web insert")
    "owie" '(org-web-tools-insert-web-page-as-entry :which-key "org web insert entry")
    "owil" '(org-web-tools-insert-link-for-url :which-key "org web insert link")

    ;; Sly
    "s" '(:ignore t :which-key "sly")
    "se" '(:ignore t :which-key "sly eval")
    "seb" '(sly-eval-buffer :which-key "sly evaluate buffer")
    "sed" '(sly-eval-defun :which-key "sly evaluate defun")
    "see" '(sly-eval-last-expression :which-key "sly evaluate expression")
    "ser" '(sly-eval-region :which-key "sly evaluate region"))

  (general-define-key
   :states 'normal
   "-" 'dired-jump)

  (general-define-key
   :states 'normal
   "M-k" 'markdown-move-list-item-up
   "M-j" 'markdown-move-list-item-down)

  (general-imap "j"
    (general-key-dispatch 'self-insert-command
      :timeout 0.25
      "k" 'evil-normal-state))

  (general-imap "k"
    (general-key-dispatch 'self-insert-command
      :timeout 0.25
      "k" 'evil-normal-state))

  (general-imap "C-g" 'evil-normal-state)
  (general-vmap "C-g" 'evil-normal-state)

  (general-vmap "<SPC>/" 'comment-or-uncomment-region)

  ;; (general-vmap "j"
  ;;   (general-key-dispatch 'self-insert-command
  ;;     :timeout 0.25
  ;;     "k" 'evil-normal-state))

  ;; (general-vmap "k"
  ;;   (general-key-dispatch 'self-insert-command
  ;;     :timeout 0.25
  ;;     "k" 'evil-normal-state))
  )
