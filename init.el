;; -*- lexical-binding: t; -*-

;;
;;
;; BASIC INITIALIZATION
;;
;;

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

;; If the font is installed then we will use it, otherwise it should just skip.
;; condition-case operates like a try/catch in other languages.
(defun my/configure-custom-font ()
  "Set the font if it exists, otherwise ignore."
  (condition-case nil
    (setq default-frame-alist '((font . "CaskaydiaCove NF 10")))
    (error nil)))

(my/configure-custom-font)

(if (daemonp)
  (add-hook 'after-make-frame-functions
    (lambda (frame)
      (with-selected-frame frame
	(my/configure-custom-font)))))

;; Set line numbers to display.
;; https://www.emacswiki.org/emacs/LineNumbers
(require 'display-line-numbers)

;; Create a custom function to set which modes we do not want to see line numbers in.
(defcustom display-line-numbers-exempt-modes
  '(vterm-mode eshell-mode shell-mode term-mode ansi-term-mode org-mode)
  "Major modes on which to disable line numbers."
  :group 'display-line-numbers
  :type 'list
  :version "green")

(defun display-line-numbers--turn-on ()
  "Turn on line numbers except for certain major modes.
Exempt major modes are defined in `display-line-numbers-exempt-modes'."
  (unless (or (minibufferp)
              (member major-mode display-line-numbers-exempt-modes))
    (display-line-numbers-mode)))

(global-display-line-numbers-mode)

;; Set backup files to be stored in a separate directory.
;; Do this so the directories you work in don't get cluttered with backup files.
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/autosave" t)))

;;
;;
;; PACKAGE MANAGER SETUP
;;
;;

;; Set up package.el to work with MELPA, ORG, and ELPA.
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/"))) 

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize 'use-package' on non-Linux platforms.
;; https://github.com/jwiegley/use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;
;;
;; LOAD ADDITIONAL FILES
;;
;;

(load "~/.emacs.d/general-config.el")

;;
;;
;; PACKAGE CONFIGURATIONS
;;
;;

;; Evil for VIM keybindings.
;; https://github.com/emacs-evil/evil
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-respect-visual-line-mode t)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join))

;; Additional keybindings for evil.
;; https://github.com/emacs-evil/evil-collection
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; Catppuccin for the theme.
;; https://github.com/catppuccin/emacs
(use-package catppuccin-theme
  :init
  ;;(load-theme 'catppuccin :no-confirm)
  (setq catppuccin-flavor 'mocha))

;; Gruvbox for change of pace every now and then.
;; https://github.com/greduan/emacs-theme-gruvbox
(use-package gruvbox-theme
  :init
  (load-theme 'gruvbox :no-confirm))

;; Nerd Icons
;; https://github.com/rainstormstudio/nerd-icons.el#installing-fonts
;;
;; NOTE: You will need to run 'M-x nerd-icons-install-fonts' and then manually install the
;; downloaded font on Windows.
(use-package nerd-icons)

;; Doom Modeline for a cleaner modeline.
;; https://github.com/seagle0128/doom-modeline
(use-package doom-modeline
  :init
  (doom-modeline-mode 1))

(use-package dimmer
  :config
   (dimmer-configure-which-key)
   (dimmer-configure-helm)
   (dimmer-configure-org)
   (setq dimmer-fraction 0.50)
   (dimmer-mode t))


;; Dashboard
;; https://github.com/emacs-dashboard/emacs-dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

;; Rainbow Delimiters for colored braces.
;; https://github.com/Fanael/rainbow-delimiters
;;
;; This is a must have for Lisp programming.
(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

;; Beacon
;; https://github.com/Malabarba/beacon
;;
;; Highlights the cursor as you jump through or between windows/buffers.
(use-package beacon
  :init
  (beacon-mode 1))

;; WhichKey
;; https://github.com/justbur/emacs-which-key
;;
;; Help menu that displays possible completions for keybinds.
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config (setq which-key-idle-delay 0.3))

;; General
;; https://github.com/noctuid/general.el
;;
;; A better interface for defining keybinds.
(use-package general
  :config
  (require 'general-config))

;; Magit
;; https://magit.vc/
;;
;; Git interface.
(use-package magit
  :commands (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; Ivy 
;; https://github.com/abo-abo/swiper
;;
;; Command autocompletion.
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x X-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil))

(use-package swiper)

;; https://github.com/Yevgnen/ivy-rich
;;
;; Additional functionality for Ivy. 
(use-package ivy-rich
  :init (ivy-rich-mode 1))

;; Helpful
;; https://github.com/Wilfred/helpful
(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package eglot
  :commands (eglot eglot-ensure)
  :hook ((csharp-mode . eglot-ensure))
  ;; Configure hooks to automatically turn-on eglot for selected modes
  ; :hook
  ; (((python-mode ruby-mode elixir-mode) . eglot))

  :custom
  (eglot-send-changes-idle-time 0.1)

  :config
  (fset #'jsonrpc--log-event #'ignore)  ; massive perf boost---don't log every event
  ;; Sometimes you need to tell Eglot where to find the language server
  ; (add-to-list 'eglot-server-programs
					;              '(haskell-mode . ("haskell-language-server-wrapper" "--lsp")))
  (add-to-list 'eglot-server-programs
             '(csharp-mode . ("csharp-ls"))))

(use-package project
  :config
  (setq project-vc-extra-root-markers '("pom.xml" "*.csproj")))

;; Company
;; https://company-mode.github.io/
(use-package company
  :config
  (company-mode-on))

;; SLIME (Superior Lisp Interaction Mode for Emacs)
;; I have it configured for Steel Bank Common Lisp (SBCL) http://www.sbcl.org/
(use-package slime
  :init
  (setq inferior-lisp-program "sbcl"))

(defun setup-org-directory-and-files ()
  "Setup Org files and directories if they don't exist."
  (unless (file-directory-p "~/Org/")
    (make-directory "~/Org/"))

  (unless (file-directory-p "~/Org/Roam/")
    (make-directory "~/Org/Roam/"))

  (unless (file-directory-p "~/Org/Archive/")
    (make-directory "~/Org/Archive/"))

  (unless (file-exists-p "~/Org/Archive/Archive.org")
    (dired-create-empty-file "~/Org/Archive/Archive.org"))

  (unless (file-exists-p "~/Org/Tasks.org")
    (dired-create-empty-file "~/Org/Tasks.org"))
)

(setup-org-directory-and-files)
 
(defun custom/org-mode-setup ()
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
  (flyspell-mode 1))

;; Org
;; https://orgmode.org/
(use-package org
  :hook (org-mode . custom/org-mode-setup)
  :config
  (setq org-default-notes-file "~/Org/Notes.org")
  (setq org-agenda-files '("~/Org/" "~/Org/Tasks.org"))
  (setq org-archive-location "~/Org/Archive/Archive.org")
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun custom/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
	visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . custom/org-mode-visual-fill)) 

;; Org Roam
;; https://www.orgroam.com/ 
(use-package org-roam
  :ensure t
  :demand t  ;; Ensure org-roam is loaded by default
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/Org/Roam/")
  (org-roam-completion-everywhere t)
  :config
  (require 'org-roam-dailies) ;; Ensure the keymap is available
  (org-roam-db-autosync-mode))

(defun org-roam-node-insert-now (arg &rest args)
  (interactive "P")
  (let ((args (push arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))

(defun my/org-roam-filter-by-tag (tag-name)
  (lambda (node)
    (member tag-name (org-roam-node-tags node))))

(defun my/org-roam-list-notes-by-tag (tag-name)
  (mapcar #'org-roam-node-file
          (seq-filter
           (my/org-roam-filter-by-tag tag-name)
           (org-roam-node-list))))

(defun my/org-roam-refresh-agenda-list ()
  (interactive)
  (setq org-agenda-files (my/org-roam-list-notes-by-tag "Project")))

;; Build the agenda list the first time for the session
(my/org-roam-refresh-agenda-list)

(defun my/org-roam-project-finalize-hook ()
  "Adds the captured project file to `org-agenda-files' if the
capture was not aborted."
  ;; Remove the hook since it was added temporarily
  (remove-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

  ;; Add project file to the agenda list if the capture was confirmed
  (unless org-note-abort
    (with-current-buffer (org-capture-get :buffer)
      (add-to-list 'org-agenda-files (buffer-file-name)))))

(defun my/org-roam-find-project ()
  (interactive)
  ;; Add the project file to the agenda after capture is finished
  (add-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

  ;; Select a project file to open, creating it if necessary
  (org-roam-node-find
   nil
   nil
   (my/org-roam-filter-by-tag "Project")
   :templates
   '(("p" "project" plain "* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Dates\n\n"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+category: ${title}\n#+filetags: Project")
      :unnarrowed t))))

(defun my/org-roam-capture-inbox ()
  (interactive)
  (org-roam-capture- :node (org-roam-node-create)
                     :templates '(("i" "inbox" plain "* %?"
                                  :if-new (file+head "Inbox.org" "#+title: Inbox\n")))))

(defun my/org-roam-capture-task ()
  (interactive)
  ;; Add the project file to the agenda after capture is finished
  (add-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

  ;; Capture the new task, creating the project file if necessary
  (org-roam-capture- :node (org-roam-node-read
                            nil
                            (my/org-roam-filter-by-tag "Project"))
                     :templates '(("p" "project" plain "** TODO %?"
                                   :if-new (file+head+olp "%<%Y%m%d%H%M%S>-${slug}.org"
                                                          "#+title: ${title}\n#+category: ${title}\n#+filetags: Project"
                                                          ("Tasks"))))))

(defun my/org-roam-copy-todo-to-today ()
  (interactive)
  (let ((org-refile-keep t) ;; Set this to nil to delete the original!
        (org-roam-dailies-capture-templates
          '(("t" "tasks" entry "%?"
             :if-new (file+head+olp "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n" ("Tasks")))))
        (org-after-refile-insert-hook #'save-buffer)
        today-file
        pos)
    (save-window-excursion
      (org-roam-dailies--capture (current-time) t)
      (setq today-file (buffer-file-name))
      (setq pos (point)))

    ;; Only refile if the target file is different than the current file
    (unless (equal (file-truename today-file)
                   (file-truename (buffer-file-name)))
      (org-refile nil nil (list "Tasks" today-file nil pos)))))

(add-to-list 'org-after-todo-state-change-hook
             (lambda ()
               (when (equal org-state "DONE")
                 (my/org-roam-copy-todo-to-today))))

(use-package websocket
    :after org-roam)

(use-package org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

;; ispell/hunspell for spellcheck.
(setq ispell-dictionary "english")
(setq ispell-local-dictionary-alist `(("english"
				       "[[:alpha:]]"
				       "[^[:alpha:]]"
				       "[']"
				       t
				       ("-d" "en_US")
				       nil
				       utf-8)))

(setq ispell-hunspell-dictionary-alist ispell-local-dictionary-alist)

;;
;;
;; CUSTOM VARIABLES
;;
;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("61526419f6ffee91cae16a75bfc0f39f7e9621280cc405edeae15699091e7c73" "d445c7b530713eac282ecdeea07a8fa59692c83045bf84dd112dd738c7bcad1d" default))
 '(minimap-width-fraction 0.1)
 '(minimap-window-location 'right)
 '(org-agenda-files '("~/Org/Tasks.org"))
 '(package-selected-packages
   '(org-roam-ui websocket dimmer htmlize weblorg eglot company magit gruvbox-theme dashboard visual-fill-column org-bullets org-static-blog evil-collection general counsel ivy-rich which-key rainbow-delimiters beacon slime doom-modeline ivy evil-mode catppuccin-theme evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit outline-1 :height 1.75))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.5))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.25))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.1)))))
