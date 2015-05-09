
;;-----------------------Basic View Settings-------------------------;;

;; Setting to inhibit toolbar, menubar and scrollbars.
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1) 

;; Setting to inhibit the Splash Screen and Echo Area Message
;; when starting Emacs
(setq inhibit-startup-message 1)
(setq inhibit-startup-echo-area-message 1)

;; Setiings to display Row and Column numbers in the Echo Area.
(line-number-mode 1)
(column-number-mode 1)

;; Setting To show Line Numbers in all buffers
;; linum-mode does not enable in all buffers.
;; It just toggles the linum-mode in the active buffer.
(global-linum-mode 1)

;; Toggle line highlighting in all buffers (Global Hl-Line mode).
;; http://www.jesshamrick.com/2012/09/18/emacs-as-a-python-ide/
(global-hl-line-mode 1)


;;-----------------------General Settings----------------------------;;

;; Removing Backup Files
;; http://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files
(defvar --backup-directory (concat user-emacs-directory "Backups"))
(if (not (file-exists-p --backup-directory))
    (make-directory --backup-directory t))
(setq backup-directory-alist `(("." . ,--backup-directory)))
(setq make-backup-files 1               ; backup of a file the first time it is saved.
      backup-by-copying 1               ; don't clobber symlinks
      version-control 1                 ; version numbers for backup files
      delete-old-versions 1             ; delete excess backup files silently
      auto-save-default 1               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )

;; Adding Melpa and Elpa packages list to install packages
;; http://melpa.org/getting-started
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") 1)
(add-to-list 'package-archives
	     '("gnu" . "http://elpa.gnu.org/packages/") 1)
(package-initialize)

;; Make Text mode the default mode for new buffers 
(setq default-major-mode 'text-mode)

;; New Key Binding for Save all Buffers and Close Emacs
(global-set-key (kbd "C-M-c") 'save-buffers-kill-emacs)

;; Set my default Email Address
(setq user-mail-address "ankitgoyal.bpl@hotmail.com")

;; Replacing "yes or no" prompt with "y/n"
(fset 'yes-or-no-p 'y-or-n-p)

; Ignore case when searching
(setq-default case-fold-search 1)

;; Turn on mouse wheel support for scrolling
(require 'mwheel)
(mouse-wheel-mode 1)

;; Language Settings
(setq current-language-environment "English")

;; Always use spaces, not tabs, when indenting
(setq-default indent-tabs-mode -1)

;; Set Tab Width to be 5
;; http://www.emacswiki.org/emacs/IndentationBasics
(setq-default tab-width 5) ; or any other preferred value
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)


;;-----------------------IDO Setting---------------------------------;;

;; http://emacswiki.org/emacs/InteractivelyDoThings
(require 'ido)
(ido-mode 1)
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)
;; M-x interface with Ido-style fuzzy matching.
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(require 'ido-vertical-mode)
(ido-vertical-mode 1)


;;-----------------------Auto-Complete Settings----------------------;;
(add-to-list 'load-path "~/.emacs.d/elpa/")
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
;;(global-set-key "m-/" 'company-complete-common)
(setq company-idle-delay 0)

(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap 1)
