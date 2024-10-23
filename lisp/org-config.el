(provide 'org-config)

(simple-setup-org-directory-and-files)

;; https://orgmode.org/
(use-package org
  :hook
  (org-mode . (lambda ()
		(org-indent-mode 1)
		(variable-pitch-mode -1)
		(visual-line-mode 1)
		(custom-set-faces
		 '(org-level-1 ((t (:inherit outline-1 :height 1.75))))
		 '(org-level-2 ((t (:inherit outline-2 :height 1.5))))
		 '(org-level-3 ((t (:inherit outline-3 :height 1.25))))
		 '(org-level-4 ((t (:inherit outline-4 :height 1.1))))
		 (set-face-attribute 'org-document-title nil :height 2.0))
		(setq evil-auto-indent nil)
		(setq org-hide-emphasis-markers t)
		(setq org-log-into-drawer t)
		(flyspell-mode 1)))

  :config
  (setq org-directory "~/Org/")
  (setq org-default-notes-file "~/Org/Notes.org")
  (setq org-agenda-files (directory-files-recursively "~/Org/Denote/Projects/" "\\.org$"))
  (setq org-archive-location "~/Org/Archive/%s_archive::")
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)
  (setq org-export-with-toc nil)
  (setq org-export-with-section-numbers nil)
  (setq org-export-with-tags nil)
  (setq-default org-todo-keywords
		'((sequence "TODO(t)" "NEXT(n)" "WAITING(w)" "SOMEDAY(s)" "|" "DONE(d)" "CANCELLED(c)"))))

;; Better theme for org-mode.
;; https://github.com/minad/org-modern
(use-package org-modern
  :hook
  (org-mode . global-org-modern-mode)
  :config
  (setq org-modern-todo nil
	org-modern-checkbox nil))

;; Package for helping organize notes.
;; https://github.com/protesilaos/denote
(use-package denote
  :ensure t
  :custom
  (denote-directory "~/Org/Denote/")
  :config
  (denote-rename-buffer-mode)
  (setq denote-known-keywords '("work" "personal" "metanote" "emacs"))

  (require 'denote-org-extras)

  (with-eval-after-load 'org-capture
    (add-to-list 'org-capture-templates
                 '("n" "New note (with Denote)" plain
                   (file denote-last-path)
                   #'denote-org-capture
                   :no-save t
                   :immediate-finish nil
                   :kill-buffer t
                   :jump-to-captured t))

    (add-to-list 'org-capture-templates
                 '("p" "New Project" plain
                   (file denote-last-path)
		   (function
                    (lambda ()
                      (denote-org-capture-with-prompts :title nil nil)))
                   :no-save t
                   :immediate-finish nil
                   :kill-buffer t
                   :jump-to-captured t
		   :keywords "project"))

    (add-to-list 'org-capture-templates
		 '("i" "Inbox" entry (file+olp "~/Org/Inbox.org" "Inbox")
		   "* TODO %?\n  %U\n  %a\n  %i" :empty-lines 1))))

;; Preview org file as HTML.
;; https://github.com/jakebox/org-preview-html
(use-package org-preview-html)

;; Downloads pictures to the org folder so they stay with the notes.
;; https://github.com/abo-abo/org-download
(use-package org-download
  :config
  (setq-default org-download-image-dir "~/Org/Pictures/"))

;; Tools for grabbing links and web content and
;; inserting them into an org buffer.
;; https://github.com/alphapapa/org-web-tools
(use-package org-web-tools)

;; Package for searching through/for org notes.
;;https://github.com/alphapapa/org-ql
(use-package org-ql)
