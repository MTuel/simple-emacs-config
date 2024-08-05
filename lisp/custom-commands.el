(provide 'custom-commands)

;; Enable the hide/show mode for folds.
(defun simple-hide-all()
  "Toggle all folds in the file."
  (interactive)
  (hs-minor-mode)
  (hs-hide-all))

;; Easy command to kill all other buffers.
(defun simple-kill-other-buffers ()
  "Kill all other buffers except for the defaults."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer)
			   (delq (get-buffer "*Messages*")
				 (delq (get-buffer "*dashboard*")
				       (delq (get-buffer "*scratch*")
					     (delq (get-buffer "*Warnings*")
						   (buffer-list))))))))

;; If the font is installed then we will use it, otherwise it should just skip.
;; condition-case operates like a try/catch in other languages.
(defun simple-configure-custom-font ()
  "Set the font if it exists, otherwise ignore."
  (condition-case nil
      (setq default-frame-alist '((font . "CaskaydiaCove NF 14")))
    (error nil))
  (set-face-attribute 'italic nil :slant 'italic :underline 'unspecified))

;; Create a custom symbol to set which modes we do not want to see line numbers in.
(defcustom simple-display-line-numbers-exempt-modes
  '(vterm-mode eshell-mode shell-mode term-mode ansi-term-mode org-mode pdf-view-mode nov-mode)
  "Major modes on which to disable line numbers."
  :group 'display-line-numbers
  :type 'list
  :version "green")

(defun simple-display-line-numbers--turn-on ()
  "Turn on line numbers except for certain major modes.
Exempt major modes are defined in `display-line-numbers-exempt-modes'."
  (interactive)
  (unless (or (minibufferp)
              (member major-mode simple-display-line-numbers-exempt-modes))
    (display-line-numbers-mode)))

;; (defun simple-display-line-numbers--turn-off ()
;;   "Turn off line numbers in all buffers."
;;   (interactive)
;;   (display-line-numbers-mode -1))

(defun simple-diplay-line-numbers--toggle ()
  "Toggle the state of 'display-line-numbers-mode'."
  (interactive)
  (if (bound-and-true-p 'display-line-numbers-mode)
      (display-line-numbers-mode -1)
    (display-line-numbers--turn-on)))

(defun simple-dired-preview-to-the-right ()
  "Sets dired to preview to the right."
  '((display-buffer-in-direction)
    (side . right)
    (width . 0.7)))

(defun simple-safe-setup-directory (name)
  "Setup a directory if it doesn't exist."
  (unless (file-directory-p name)
    (make-directory name)))

(defun simple-safe-setup-file (name)
  "Setup a file if it doesn't exist."
  (unless (file-exists-p name)
    (dired-create-empty-file name)))

(defun simple-setup-org-directory-and-files ()
  "Setup Org files and directories if they don't exist."
  (simple-safe-setup-directory "~/Org/")
  (simple-safe-setup-directory "~/Org/Pictures")
  (simple-safe-setup-directory "~/Org/Denote")
  (simple-safe-setup-directory "~/Org/Denote/Projects")
  (simple-safe-setup-directory "~/Org/Denote/Journal")
  (simple-safe-setup-directory "~/Org/Archive")
  (simple-safe-setup-file "~/Org/Archive/Archive.org"))

(defun simple-set-creation-date-heading-property ()
  "Sets the creation date property on an org header."
  (interactive)
  (save-excursion
    (org-back-to-heading)
    (unless (member "CREATED" org-entry-properties)
      (org-set-property "CREATED" (format-time-string "%Y-%m-%d %T")))))

(defun simple-set-updated-date-heading-property ()
  "Sets the updated date property on an org header."
  (interactive)
  (save-excursion
    (org-back-to-heading)
    (unless (member "UPDATED" org-entry-properties)
      (org-set-property "UPDATED" (format-time-string "%Y-%m-%d %T")))))

(defun simple-visual-fill ()
  (interactive)
  (setq visual-fill-column-width 100
	visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

