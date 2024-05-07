(provide 'basic-config)

;; Skip the startup splash screen.
;; setq sets the input variable to the value we want, which in this case is t, or true.
(setq inhibit-startup-message t)

;; Remove the toolbar, menu, and scroll bars. Set these to 1 or comment them out to add them back. 
;; Each of these is a function, and we pass in the parameter of '-1' to disable them.
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq auto-revert-interval 1)
(setq auto-revert-check-vc-info t)
(global-auto-revert-mode)

;; Display line and column numbers in the modeline.
(setq line-number-mode t)
(setq column-number-mode t)

;; Display time in the modeline.
(setq display-time-format "%I:%M:%S %p")
(setq display-time-interval 1)
(display-time-mode)

;; Instead of the audible bell we get a flash on the screen.
(setq visible-bell t)

;; Don't use UI pop ups for prompting.
(setq use-dialog-box nil)

;; Recent File Mode
;; Keeps track of your recent files.
(recentf-mode 1)

;; Set backup files to be stored in a separate directory.
;; Do this so the directories you work in don't get cluttered with backup files.
(setq backup-directory-alist '(("." . "~/.config/emacs/backup")))
(setq auto-save-file-name-transforms '((".*" "~/.config/emacs.d/autosave" t)))

;; Easy command to kill all other buffers.
(defun kill-other-buffers ()
  "kill all other buffers except for the defaults."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer)
			   (delq (get-buffer "*Messages*")
				 (delq (get-buffer "*dashboard*")
				       (delq (get-buffer "*scratch*")
					     (delq (get-buffer "*Warnings*")
						   (buffer-list))))))))
