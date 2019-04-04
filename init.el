;; #################
;; Basic configuration of build-in features

;; Setting up build-in variables
(setq inhibit-startup-message t)  ; Disable start up message.
(setq next-line-add-newlines t)
(setq sentence-end-double-space nil)


;; Setting up predicators
(fset 'yes-or-no-p 'y-or-n-p)   ; Change question from "yes or no"
;; to "y or n"



;; #####
;; Global modes
(global-linum-mode t)   ; Shows number of line on the left edge of window.
(column-number-mode t)	; Shows number of column where point is.
(winner-mode 1)		; Allow to undo windows changes


;; #####
;; Global keychords (????)
(global-set-key [f1] 'shell)
(global-set-key [C-tab] 'other-window) 	; Don't work in org mode, correct
;; that





;; #################
;; Configuration of frames
(tool-bar-mode -1)





;; #################
;; Setting up backups management
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-version -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/auto-save-list" t)))





;; #################
;; Cofiguration of ido (Interactive DO things)
(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(setq ido-use-filename-at-point 'guess)	; Find File At Point
(setq ido-create-new-buffer 'always)	; Don't ask when you create new
;; buffer

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

;; Custom code
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (lorem-ipsum ace-window org-bullets which-key try use-package undo-tree swiper-helm slime rust-playground rainbow-delimiters multiple-cursors inf-ruby impatient-mode helm-gtags ggtags function-args cargo beacon avy auto-complete auto-compile auctex-lua auctex-latexmk aggressive-indent achievements))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))





;; ###########################
;; Installing packeges


;; ##########
;; Org-mode configuration
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))





;; #####
;; Ace-window -- moveing to numbered window
(use-package ace-window
  :ensure t
  :init
  (global-set-key [remap other-window] 'ace-window)
  (custom-set-faces
   '(aw-leading-char-face
     ((t (:inherit ace-jump-face-foreground :height 3.0))))))
	  

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
;; Try -- try package without installing it
(use-package try
  :ensure t)


;; #####
(use-package undo-tree
  :ensure t
  :config (global-undo-tree-mode t))

;; #####
(use-package which-key
  :ensure t
  :config (which-key-mode))


