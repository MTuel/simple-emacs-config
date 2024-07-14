(provide 'org-config)

(defun my/safe-setup-directory (name)
  "Setup a directory if it doesn't exist."
  (unless (file-directory-p name)
    (make-directory name)))

(defun my/safe-setup-file (name)
  "Setup a file if it doesn't exist."
  (unless (file-exists-p name)
    (dired-create-empty-file name)))

(defun my/setup-org-directory-and-files ()
  "Setup Org files and directories if they don't exist."

  (my/safe-setup-directory "~/Org/")
  (my/safe-setup-directory "~/Org/Pictures")
  (my/safe-setup-directory "~/Org/Denote")
  (my/safe-setup-directory "~/Org/Denote/Projects")
  (my/safe-setup-directory "~/Org/Denote/Journal")
  (my/safe-setup-directory "~/Org/Archive")
  (my/safe-setup-file "~/Org/Archive/Archive.org"))

(my/setup-org-directory-and-files)

(defun my/org-mode-setup ()
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
  (flyspell-mode 1))

(use-package org
  :hook (org-mode . my/org-mode-setup)
  :config
  (setq org-default-notes-file "~/Org/Notes.org")
  (setq org-agenda-files '("~/Org/" "~/Org/Tasks.org"))
  (setq org-archive-location "~/Org/Archive/%s_archive::")
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)
  (setq org-export-with-toc nil)
  (setq org-export-with-section-numbers nil)
  (setq org-export-with-tags nil)
  (setq-default org-todo-keywords
                '((sequence "TODO(t)" "NEXT(n)" "WAITING(w)" "SOMEDAY(s)" "|" "DONE(d)" "CANCELLED(c)"))))

(defun my/visual-fill ()
  (interactive)
  (setq visual-fill-column-width 100
	visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . my/visual-fill))

(add-hook 'nov-mode 'my/visual-fill)

(defun my/set-creation-date-heading-property ()
  (interactive)
  (save-excursion
    (org-back-to-heading)
    (unless (member "CREATED" org-entry-properties)
      (org-set-property "CREATED" (format-time-string "%Y-%m-%d %T")))))

(defun my/set-updated-date-heading-property ()
  (interactive)
  (save-excursion
    (org-back-to-heading)
    (unless (member "UPDATED" org-entry-properties)
      (org-set-property "UPDATED" (format-time-string "%Y-%m-%d %T")))))

(use-package org-modern
  :hook
  (org-mode . global-org-modern-mode)
  :config
  (setq org-modern-todo nil
	org-modern-checkbox nil))

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


;; (defun my/org-roam-filter-by-tag (tag-name)
;;   (lambda (node)
;;     (member tag-name (org-roam-node-tags node))))

;; (defun my/org-roam-list-notes-by-tag (tag-name)
;;   (mapcar #'org-roam-node-file
;;           (seq-filter
;;            (my/org-roam-filter-by-tag tag-name)
;;            (org-roam-node-list))))

;; (defun my/org-roam-find-project ()
;;   (interactive)
;;   ;; Add the project file to the agenda after capture is finished
;;   (add-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

;;   ;; Select a project file to open, creating it if necessary
;;   (org-roam-node-find
;;    nil
;;    nil
;;    (my/org-roam-filter-by-tag "Project")
;;    :templates
;;    '(("p" "project" plain "* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Dates\n\n"
;;       :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+category: ${title}\n#+filetags: Project")
;;       :unnarrowed t))))

(defun my/org-denote-capture-inbox ()
  (interactive)
  (org-roam-capture- :node (org-roam-node-create)
                     :templates '(("i" "inbox" plain "* %?"
                                   :if-new (file+head "Inbox.org" "#+title: Inbox\n")))))

(use-package org-preview-html)

(use-package org-download
  :config
  (setq-default org-download-image-dir "~/Org/Pictures/"))

(use-package org-web-tools)

(use-package org-ql)
