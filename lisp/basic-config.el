(provide 'basic-config)

;; Skip the startup splash screen.
;; setq sets the input variable to the value we want, which in this case is t, or true.
(setq inhibit-startup-message t)

;; Remove the toolbar, menu, and scroll bars. Set these to 1 or comment them out to add them back. 
;; Each of these is a function, and we pass in the parameter of '-1' to disable them.
(menu-bar-mode -1)

;; Only try and disable these when running GUI emacs.
;; Throws an error when running in the terminal.
(when window-system
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

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

;; Keeps track of your recent files.
(recentf-mode 1)

;; Set backup and autosave files to be stored in a separate directory.
;; Do this so the directories you work in don't get cluttered with backup and autosave files.
(setq backup-directory-alist '(("." . "~/.config/emacs/backup")))
(setq auto-save-file-name-transforms '((".*" "~/.config/emacs/autosave" t)))

;; This sets URLs to open in eww instead of the OS's default browser. 
(setq browse-url-browser-function 'eww)

