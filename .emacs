
;;-----------------------Basic View Settings-------------------------;;

;; Setting to inhibit toolbar, menubar and scrollbars.
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1) 

;; Setting to inhibit the Spalsh Screen and Echo Area Message
;; when starting Emacs
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; Setiings to display Row and Column numbers in the Echo Area.
(line-number-mode 1)
(column-number-mode 1)

;; Setting To show Line Numbers in all buffers
;; linum-mode does not enable in all buffers.
;; It just toggles the linum-mode in the active buffer.
(global-linum-mode 1)

;; Toggle line highlighting in all buffers (Global Hl-Line mode).
(global-hl-line-mode 1)

;; Turn on mouse wheel support for scrolling
(require 'mwheel)
(mouse-wheel-mode t)

;; Language Settings
(setq current-language-environment "English")


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
