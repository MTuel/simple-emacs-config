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

    "f" '(:ignore t :which-key "avy")
    "fa" '(avy-goto-word-0 :which-key "find any")
    "fs" '(avy-goto-word-1 :which-key "find specific")
    
    ;; Buffer Manipulation
    "b" '(:ignore t :which-key "buffer")
    "be" '(eval-buffer :which-key "evaluate buffer")
    "bs" '(counsel-switch-buffer :which-key "counsel switch buffer")
    "bk" '(kill-buffer :which-key "kill buffer")
    
    ;; org-mode
    "o" '(:ignore t :which-key "org")

    "oa" '(org-agenda :which-key "org agenda")

    "ol" '(:ignore t :which-key "org link")
    "ole" '(org-insert-link :which-key "org link external")
    "oli" '(counsel-org-link :which-key "org link internal")

    "ou" '(:ignore t :which-key "org update")
    "ous" '(org-update-statistics-cookies :which-key "org update statistics")

    "oo" '(org-open-at-point :which-key "org open at point")

    "or" '(:ignore t :which-key "org roam")
    "ora" '(my/org-roam-refresh-agenda-list :which-key "org roam agenda refresh")

    "orb" '(:ignore t :which-key "org roam buffer")
    "orbt" '(org-roam-buffer-toggle :which-key "org roam buffer toggle")
    "orbt" '(org-roam-buffer-refresh :which-key "org roam buffer refresh")
    "orc" '(org-roam-capture :which-key "org roam capture")

    "ord" '(:ignore t :which-key "org roam dailies")
    "ordc" '(org-roam-dailies-capture-today :which-key "org roam dailies capture today")

    "orn" '(:ignore t :which-key "org roam node")
    "ornf" '(org-roam-node-find :which-key "org roam node find")
    "orni" '(org-roam-node-insert :which-key "org roam node insert")
    "ornn" '(org-roam-node-insert-now :which-key "org roam node now")

    "oru" '(org-roam-ui-open :which-key "org roam ui open")

    "os" '(:ignore :which-key "org subtree")
    "osa" '(org-archive-subtree :which-key "org subtree archive")
    
    "ot" '(org-todo :which-key "org todo")

    ;; slime related keys.
    "s" '(:ignore t :which-key "sly")
    "se" '(:ignore t :which-key "sly eval")
    "seb" '(sly-eval-buffer :which-key "sly evaluate buffer")
    "sed" '(sly-eval-defun :which-key "sly evaluate defun")
    "see" '(sly-eval-last-expression :which-key "sly evaluate expression")
    "ser" '(sly-eval-region :which-key "sly evaluate region"))

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
