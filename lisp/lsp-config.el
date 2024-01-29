(provide 'lsp-config)

(use-package eglot
  :commands
  (eglot eglot-ensure)
  
  :hook
  ((csharp-mode . eglot-ensure))
  
  :custom
  (eglot-send-changes-idle-time 0.1)

  :config
  (fset #'jsonrpc--log-event #'ignore)  ; massive perf boost---don't log every event
  ;; Sometimes you need to tell Eglot where to find the language server
    (add-to-list 'eglot-server-programs
             '(csharp-mode . ("csharp_ls"))))

;; Company
;; https://company-mode.github.io/
(use-package company
  :config
  (global-company-mode))

;; Paredit
(use-package paredit
  :hook ((emacs-lisp-mode . enable-paredit-mode)
	 (emacs-lisp-mode-hook . enable-paredit-mode)
	 (eval-expression-minibuffer-setup-hook . enable-paredit-mode)
	 (ielm-mode-hook . enable-paredit-mode)
	 (lisp-mode-hook . enable-paredit-mode)
	 (lisp-interaction-mode-hook . enable-paredit-mode)
	 (scheme-mode-hook . enable-paredit-mode))
  :config
  (show-paren-mode t))

