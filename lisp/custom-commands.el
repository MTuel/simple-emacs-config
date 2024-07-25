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
      (setq default-frame-alist '((font . "CaskaydiaCove NF 10")))
    (error nil))
  (set-face-attribute 'italic nil :slant 'italic :underline 'unspecified))

