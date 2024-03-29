(provide 'lsp-config)

;; Eglot
;; https://github.com/joaotavora/eglot
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
               '(csharp-mode . ("csharp_ls")))
  (add-to-list 'eglot-server-programs
               '(fennel-mode . ("fennel-ls"))))

;; Company
;; https://company-mode.github.io/
(use-package company
  :config
  (global-company-mode))

;; Aggressive Indent
;; https://github.com/Malabarba/aggressive-indent-mode
(use-package aggressive-indent
  :init
  (global-aggressive-indent-mode))
