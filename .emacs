
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


;;-----------------------Font and Theme Settings--------------------;;

;; Adding Color-Theme
;; https://github.com/fniessen/emacs-leuven-themex
;; https://github.com/owainlewis/emacs-color-themes
;; Have Modified Hickey.el file to set comment color to #FCAEAE
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/sublime-themes-20150328.131")
(load-theme 'hickey 1)


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

;; http://auto-complete.org/doc/manual.html
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20150408.1132")
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-clang-20140409.52")
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20150408.1132/dict")
(require 'auto-complete)
(require 'auto-complete-clang)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode 1)
(ac-set-trigger-key "TAB")
(setq ac-auto-show-menu 0.5)
(setq ac-delay 0.5)
(setq ac-use-fuzzy 1)
(setq ac-auto-start 3)
(setq ac-menu-height 5)
(setq ac-candidate-limit 10)
(setq ac-ignore-case 'smart)
(setq ac-use-quick-help 1)
(setq ac-quick-help-delay 1)


;;-----------------------C++ Mode Settings---------------------------;;

;; Created after studying from multiple sources.
;; https://truongtx.me/2013/03/10/emacs-setting-up-perfect-environment-for-cc-programming/
;; https://www.youtube.com/watch?v=HTUE03LnaXA
;; http://www.emacswiki.org/emacs/IndentingC
;; http://cc-mode.sourceforge.net/html-manual/index.html
(require 'cc-mode)
(setq-default c-indent-tabs-mode 1)
(setq-default c-tab-always-indent 1)
(setq-default c-indent-level 5)
(setq-default backward-delete-function -1)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)


;; Need to read more about c-offsets-alist
(c-add-style "my-c-style"
		   '("stroustrup"
			(c-offsets-alist
			 (innamespace . -)
			 (inline-open . 0)
			 (inher-cont . c-lineup-multi-inher)
			 (arglist-cont-nonempty . +)
			 (template-args-cont . +))))

(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap 1)

(defun my-c-mode-hook ()
  (c-set-style "my-c-style")
  (c-set-offset 'substatement-open '0) ; brackets should be at same indentation level as the statements they open
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'inline-open '+)
  (c-set-offset 'block-open '+)
  (c-set-offset 'brace-list-open '+)   ; all "opens" should be indented by the c-indent-level
  (c-set-offset 'case-label '+))       ; indent case labels by c-indent-level, too
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)


(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)


;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map "<TAB>" 'irony-completion-at-point-async)
  (define-key irony-mode-map "<TAB>" 'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;;-----------------------Default Entries by Emacs--------------------;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

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


;;-----------------------Font and Theme Settings--------------------;;

;; Adding Color-Theme
;; https://github.com/fniessen/emacs-leuven-themex
;; https://github.com/owainlewis/emacs-color-themes
;; Have Modified Fogus.el file to set comment color and highlight color
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/sublime-themes-20150328.131")
(load-theme 'fogus 1)


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

;; http://auto-complete.org/doc/manual.html
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20150408.1132")
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-clang-20140409.52")
(require 'auto-complete)
(require 'auto-complete-clang)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20150408.1132/dict")
(ac-config-default)
(global-auto-complete-mode 1)
(ac-set-trigger-key "TAB")
(setq ac-auto-show-menu 0.5)
(setq ac-delay 0.5)
(setq ac-use-fuzzy 1)
(setq ac-auto-start 3)
(setq ac-menu-height 5)
(setq ac-candidate-limit 10)
(setq ac-ignore-case 'smart)
(setq ac-use-quick-help 1)
(setq ac-quick-help-delay 1)


;;-----------------------C++ Mode Settings---------------------------;;

;; Created after studying from multiple sources.
;; https://truongtx.me/2013/03/10/emacs-setting-up-perfect-environment-for-cc-programming/
;; https://www.youtube.com/watch?v=HTUE03LnaXA
;; http://www.emacswiki.org/emacs/IndentingC
;; http://cc-mode.sourceforge.net/html-manual/index.html
(require 'cc-mode)
(setq-default c-indent-tabs-mode 1)
(setq-default c-tab-always-indent 1)
(setq-default c-indent-level 5)
(setq-default backward-delete-function -1)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)


;; Need to read more about c-offsets-alist
(c-add-style "my-c-style"
		   '("stroustrup"
			(c-offsets-alist
			 (innamespace . -)
			 (inline-open . 0)
			 (inher-cont . c-lineup-multi-inher)
			 (arglist-cont-nonempty . +)
			 (template-args-cont . +))))

(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap 1)

(defun my-c-mode-hook ()
  (c-set-style "my-c-style")
  (c-set-offset 'substatement-open '0) ; brackets should be at same indentation level as the statements they open
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'inline-open '+)
  (c-set-offset 'block-open '+)
  (c-set-offset 'brace-list-open '+)   ; all "opens" should be indented by the c-indent-level
  (c-set-offset 'case-label '+))       ; indent case labels by c-indent-level, too
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)


(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)


;;-----------------------Default Entries by Emacs--------------------;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
