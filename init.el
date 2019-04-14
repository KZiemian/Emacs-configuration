;; #################
;; First steps of initialization
;; Set up `windows-system' at the begining to avoid short displaying of
;; it default look at initialization


;; #########
;; Configuration of frames
(when window-system
  (menu-bar-mode -1)  ; Evaluate with positive integer to show menu
  ;; in the top of frame.
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1)  ; I don't know what this doing, but I never use
  ;; tooltips, so this probably doesn't matter.
  (set-frame-size (selected-frame) 80 100))


(setq inhibit-startup-message t)  ; Disable start up message.



;; #################
;; Configuration of package menager
(require 'package)
(setq package-enable-at-startup nil)

;; Setting up list of repositories
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
	     '("marmelade" . "https://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/") t)  ; This may be
;; redundant, but for "spokoju sumiania" I left if here



;; #################
;; Basic configuration of build-in features

;; Setting up built-in variables

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
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key [f1] 'shell)
(global-set-key [C-tab] 'other-window) 	; Don't work in org mode, correct
;; that



;; #####
;; Global minor modes
(global-linum-mode t)   ; Shows number of line on the left edge of window.
(column-number-mode t)	; Shows number of column where point is.
(winner-mode 1)		; Allow to undo windows changes
(electric-pair-mode t)	; Toggle automatic parenthis pairing
(global-visual-line-mode 1)	; Line of text are splited between buffers' line

(setq outline-minor-mode-prefix "\C-c \C-o") ; Somethings don't work



;; #####
;; Global hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; Remove additional white spaces from the end of the line and file
;; Comment it out if you work with CCLDoc





;; #################
;; Setting up backups management
(setq backup-directory-alist '(("." . "~/.emacs.d/backups"))
      delete-old-versions 1
      version-control t
      vc-make-backup-files t
      auto-save-file-name-transforms
      '((".*" "~/.emacs.d/auto-save-list" t)))











;; #################
;; Configuration of documentation
;; (setq apropos-sort-by-score t)
;; Emacs don't know this variable?!?!


;; #################
;; Setting up auto-correction
;; (setq ispell-program-name "aspell")	; By default is `aspell'
(setq ispell-dictionary "english")
;; (setq ispell-dictionary "polish")

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'flyspell-buffer)

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-buffer)





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








;;
(package-initialize)





;; #################
;; `Use-package' -- bookstraping package to manage packages
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; (setq use-package-verbose t)
;; (setq load-prefer-newer t)





;; ###########################
;; Installing packeges


;; #################
;; `Org-mode' -- configuration of gigant `org-mode'
(use-package org-bullets
  :ensure t
  :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))





;; #####
;; `Ace-window' -- moveing to numbered window
(use-package ace-window
  :ensure t
  :config
  (global-set-key [remap other-window] 'ace-window)
  (custom-set-faces
   '(aw-leading-char-face
     ((t (:inherit ace-jump-face-foreground :height 3.0))))))


;; #####
;; `Achievements' ;)
(use-package achievements
  :ensure t
  :config (achievements-mode t))


;; #####
;; `Auto-complete'
(use-package auto-complete
  :ensure t
  :config
  (ac-config-default)
  (global-auto-complete-mode t))


;; #####
;; `Avy' -- quick navigation in windows
(use-package avy
  :ensure t
  :bind (("C-:" . avy-goto-char)
	 ("C-'" . avy-goto-char-2)
	 ("M-g g" . avy-goto-line)
	 ("M-g M-g" . avy-goto-line)
	 ("M-g w" . avy-goto-word-1)
	 ("M-g e" . avy-goto-word-0)))
;; In Custoimize set `avy-style' to "Pre" or anything you prefere


;; #####
;; `Beacon' -- wave showing where point is
(use-package beacon
  :ensure t
  :config (beacon-mode t))


;; #####
;; `Color-theme' -- packages many Emacs' themes
(use-package color-theme-modern
  :ensure t
  ;; :config (load-theme 'wombat t)
  )


;; #####
;; `Counsel' -- need for Swiper packages
(use-package counsel
  :ensure t)


;; #####
;; `Flymake' -- I don't know what it does
(use-package flymake
  :ensure t
  :config
  (defun flymake-get-tex-args (file-name)
    (list "pdflatex"
	  (list "-file-line-error" "-draftmode" "-interaction=nonstopmode"
		file-name)))
  (add-hook 'LaTeX-mode-hook 'flymake-mode)
  )


;; #####
;; `Ivy' -- ?!?!
(use-package ivy
  :ensure t
  :diminish (ivy-mode)			; Why???
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy))


;; #####
;; `LaTeX-pretty-symbols' -- display unicode in place of LaTeX commands
(use-package latex-pretty-symbols
  :ensure t)


;; #####
;; `Lorem-ipsum' -- put pseudolatin (?) text convinient in testing
(use-package lorem-ipsum
  :ensure t
  ;; :config (lorem-ipsum-use-default-bindings)
  )


;; #####
;; `Rainbow-delimiters'
(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'LaTeX-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'BibTeX-mode-hook #'rainbow-delimiters-mode))


;; #####
;; `Rust-mode' -- Emacs mode for Rust programing language
(use-package rust-mode
  :ensure t
  ;; :config (setq rust-format-on-save t)
  )


;; #####
;; `Swiper' -- how to describe it????
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
	 ("C-S-o" . 'counsel-rhythmbox)
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
;; `Try' -- try package without installing it
(use-package try
  :ensure t)


;; #####
;; `Undo-tree' -- how to describe it????
(use-package undo-tree
  :ensure t
  :config (global-undo-tree-mode t))


;; #####
;; `Which-key' -- how to describe it????
(use-package which-key
  :ensure t
  :config (which-key-mode))





;; #################
;; Configuration of LaTeX-mode

(setq TeX-auto-save t
      TeX-parse-self t
      TeX-save-query nil
      TeX-PDF-mode t)
;; (setq-default TeX-master nil)  ; I don't know what this line do?!?!

(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'auto-complete-mode)
(add-hook 'outline-minor-mode (lambda () (outline-minor-mode 1)))



;; #####
;; Reftex
(autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Mace citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Pharse Mode" t)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'latex-mode-hook 'turn-on-reftex)
(add-hook 'reftex-load-hook 'imenu-add-menubar-index) ; Maybe this should be
;; comment out

(setq reftex-plug-into-AUCTeX t)	; I don't know what this do????

(setq LaTeX-eqnarray-label "eq"
      LaTeX-equation-label "eq"
      LaTeX-figure-label "fig"
      LaTeX-table-label "tab"
      LaTeX-myChapter-label "chap"
      TeX-auto-save t
      TeX-newline-function 'reindent-then-newline-and-indent
      TeX-parse-self t
      TeX-style-path '("style/" "auto/"
		       "/usr/share/emacs25/site-lisp/auctex/style/"
		       "/var/lib/auctex/emacs25"
		       "/usr/local/share/emacs25/site-lisp/auctex/style/")
      LaTeX-section-hook '(LaTeX-section-heading
			   LaTeX-section-title
			   LaTeX-section-toc
			   LaTeX-section-section
			   LaTeX-section-label))





;; ###########################
;; Code added by Custom

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(avy-case-fold-search t)
 '(avy-style (quote pre))
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("04232a0bfc50eac64c12471607090ecac9d7fd2d79e388f8543d1c5439ed81f5" default)))
 '(load-prefer-newer t)
 '(package-selected-packages
   (quote
    (badger-theme badwolf-theme zenburn-theme beacon latex-pretty-symbols undo-tree try swiper-helm rust-playground rainbow-delimiters org-bullets lorem-ipsum helm-gtags function-args auto-complete auctex-latexmk aggressive-indent achievements ace-window)))
 '(use-package-verbose t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0))))
 '(rainbow-delimiters-depth-1-face ((t (:inherit rainbow-delimiters-base-face :foreground "lawn green"))))
 '(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "cyan"))))
 '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "light gray"))))
 '(rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "yellow"))))
 '(rainbow-delimiters-depth-5-face ((t (:inherit rainbow-delimiters-base-face :foreground "purple"))))
 '(rainbow-delimiters-depth-6-face ((t (:inherit rainbow-delimiters-base-face :foreground "aquamarine4"))))
 '(rainbow-delimiters-depth-7-face ((t (:inherit rainbow-delimiters-base-face :foreground "khaki1"))))
 '(rainbow-delimiters-depth-8-face ((t (:inherit rainbow-delimiters-base-face :foreground "sienna"))))
 '(rainbow-delimiters-depth-9-face ((t (:inherit rainbow-delimiters-base-face :foreground "gold"))))
 '(rainbow-delimiters-mismatched-face ((t (:inherit (rainbow-delimiters-unmatched-face rainbow-delimiters-base-face)))))
 '(rainbow-delimiters-unmatched-face ((t (:inherit rainbow-delimiters-base-face :foreground "red")))))
