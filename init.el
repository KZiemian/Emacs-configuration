;; #################
;; Basic configuration of build-in features

;; Setting up built-in variables
(setq inhibit-startup-message t)  ; Disable start up message.
(setq next-line-add-newlines t)
(setq sentence-end-double-space nil)


;; Setting up predicators
(fset 'yes-or-no-p 'y-or-n-p)   ; Change question from "yes or no"
;; to "y or n"



;; #####
;; Releasing built-in keychords (????)

;; (global-set-key (kbd "<f3>") nil)
;; ;; Release `kmacro-start-macro-or-insert-counter'
;; (global-set-key (kbd "<f4>") nil)
;; ;; Release `kmacro-end-or-call-macro'



;; #####
;; Global keychords (????)
(global-set-key [f1] 'shell)
(global-set-key [C-tab] 'other-window) 	; Don't work in org mode, correct
;; that



;; #####
;; Global modes
(global-linum-mode t)   ; Shows number of line on the left edge of window.
(column-number-mode t)	; Shows number of column where point is.
(winner-mode 1)		; Allow to undo windows changes
(electric-pair-mode t)	; Toggle automatic parenthis pairing






;; #################
;; Configuration of frames
(menu-bar-mode -1)  ; Evaluate with positive integer to show menu
;; in the top of frame.
(tool-bar-mode -1)
(scroll-bar-mode -1)





;; #################
;; Setting up backups management
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions 1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/auto-save-list" t)))





;; #################
;; Cofiguration of ido (Interactive DO things)

;; Maybe this is still needed. But I don't know.
(setq ido-file-extensions-order '(".tex" ".org" ".txt" ".el"
				  ".rs" ".lisp"))
(setq ido-ignore-extensions t) 		; Ignore objects definde by
;; `complete-ignored-extensions' variable





;; #################
;; Configuration of buffers list
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)

(setq ibuffer-default-sorting-mode 'major-mode)  ; Sorts buffers
;; in buffers list by major mode of buffer





;; #################
;; Configuration of package menager
(require 'package)
(setq package-enable-at-startup nil)

;; Setting up list of repositories
(setq package-archives
      '(("gnu" . "https://elspa.gnu.org/packages/")))
(add-to-list 'package-archives
	     '("marmelade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

;; 
(package-initialize)





;; #################
;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; (setq use-package-verbose t)
;; (setq load-prefer-newer t)





;; ###########################
;; Installing packeges


;; #################
;; Org-mode configuration
(use-package org-bullets
  :ensure t
  :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))





;; #####
;; Ace-window -- moveing to numbered window
(use-package ace-window
  :ensure t
  :config
  (global-set-key [remap other-window] 'ace-window)
  (custom-set-faces
   '(aw-leading-char-face
     ((t (:inherit ace-jump-face-foreground :height 3.0)))))
  )
	  

;; #####
;; Achievements ;)
(use-package achievements
  :ensure t
  :config (achievements-mode t))


;; #####
;; Beacon -- wave showing where point is
(use-package beacon
  :ensure t
  :config (beacon-mode t))


;; #####
;; Counsel -- need for Swiper packages
(use-package counsel
  :ensure t)


;; #####
;; Ivy
(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy))


;; #####
;; Lorem-ipsum
(use-package lorem-ipsum
  :ensure t
  ;; :config (lorem-ipsum-use-default-bindings)
  )


;; #####
;; Rust-mode -- Emacs mode for Rust programing language
(use-package rust-mode
  :ensure t
  ;; :config (setq rust-format-on-save t)
  )


;; #####
;; Swiper
(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . 'counsel-find-file)
	 ("C-h f" . 'counsel-describe-function)
	 ("C-h v" . 'counsel-describe-variable)
	 ("C-h l" . 'counsel-find-library)
	 ("C-h i" . 'counsel-info-lookup-symbol)
	 ("C-c u" . 'counsel-unicode-char)
	 ("C-c g" . 'counsel-git)
	 ("C-c j" . 'counsel-git-grep)
	 ("C-c k" . 'counsel-ag)
	 ("C-x l" . 'counsel-locate)
	 ("C-S-o" . 'counsel-rythmbox)
	 ;; Alternative keychords
	 ;; ("<f4>" . 'ivy-resume)
	 ;; ("<f2> f" . 'counsel-describe-function)
	 ;; ("<f2> v" . 'counsel-describe-variable)
	 ;; ("<f2> l" . 'counsel-find-library)
	 ;; ("<f2> i" . 'counsel-info-lookup-symbol)
	 ;; ("<f3> u" . 'counsel-unicode-char)
	 )
  ;; :config
  ;; enable this if you want `swiper' to use it
  ;; (setq search-default-mode #'char-fold-to-regexp)
)


;; #####
;; Try -- try package without installing it
(use-package try
  :ensure t)


;; #####
;; Undo-tree
(use-package undo-tree
  :ensure t
  :config (global-undo-tree-mode t))


;; #####
;; Which-key
(use-package which-key
  :ensure t
  :config (which-key-mode))





;; ###########################
;; Code added by Custom

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(load-prefer-newer t)
 '(package-selected-packages
   (quote
    (counsel undo-tree try swiper-helm slime rust-playground rainbow-delimiters org-bullets lorem-ipsum inf-ruby impatient-mode helm-gtags ggtags function-args cargo beacon auto-complete auto-compile auctex-latexmk aggressive-indent achievements ace-window)))
 '(use-package-verbose t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
