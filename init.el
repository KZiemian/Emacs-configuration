;; ##################
;; Configuration of frames

;; We first set up `windows-system' at the begining to avoid short displaying of
;; it default look at initialization. This is advaice from Daniel Mai.

(when window-system
  ;; Evaluate `menu-bar-mode' with positive integer to show menu in the top
  ;; of the frame.
  ;; (menu-bar-mode 1)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  ;; I don't know what this thing is doing, but I probably never use
  ;; tooltips, so I guess this doesn't matter.
  (tooltip-mode -1)
  (set-frame-size (selected-frame) 80 100))


;; Disable start up message.
(setq inhibit-startup-message t)





;; ##################
;; Confiugration package manager.

(require 'package)
(setq package-enable-at-startup nil)

;; Setting up list of repositories.
(add-to-list 'package-archives
	     '("melp" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("gnu" . "https://elpa.gnu.org/packages/") t)
;; Adding position below be redundant, adding the same repositor as under
;; "gnu", but I will keep it anyway.
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/") t)

;; ???? I don't know what this code is doing.
(when (boundp 'package-pinned-packages)
  (setq package-pinned-packages
	'((org-plus-contrib . "org"))))

;; ???? I don't know what this code is doing.
(package-initialize)





;; ##################
;; `Use-package' -- bootstraping package to manage packages
;; `Diminish' -- ????

(unless (or (package-installed-p 'use-package)
	    (package-installed-p 'diminish))
  (package-refresh-contents)
  (package-install 'use-package)
  (package-install 'diminish))

(setq use-package-verbose t
      load-prefer-newer t)


;; Code form `use-package' README
(eval-when-compile
  (require 'use-package))
(require 'bind-key)




;; #################
;; Load the `configuration-basic.org' file.

;; Command below don't work, because it want to open file
;; configuration-basics.el (Emacs Lisp file). At this moment I don't know
;; how to fix it.
;; (org-babel-load-file
;;  (concat user-emacs-directory "Configuration-org/configuration-basic.org"))

;; !!!!!!!!!!
;; All code below should at the end be in file
;; Configuration-org/configuation-basic.org, but since loading this file don't
;; work at this moment, I just placed it here.

;; * Configuration of basic build-in features

;; ** Setting up few built-in variables
;; #+BEGIN_SRC emacs-lisp
(setq next-line-add-newlines t)
(setq sentence-end-double-space nil)

(setq save-interprogram-paste-before-kill t)
;; #+END_SRC

;; ** Setting up predicators
;; Change question from "yes or no" to "y or n".
;; #+BEGIN_SRC emacs-lisp
(fset 'yes-or-no-p 'y-or-n-p)
;; #+END_SRC

;; ** Global keychords
;; #+BEGIN_SRC emacs-lisp
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key [f1] 'shell)
;; Key binding below don't work in org mode. How to fix that?
(global-set-key [C-tab] 'other-window) 
;; #+END_SRC





;; #################
;; Load the `general-packages' file.

;; !!!!!!!!!!
;; All code below should at the end be in file
;; Configuration-org/general-packages.org, but since loading this file don't
;; work at this moment, I just placed it here.

;; #+TITLE Overpowered cofiguration for Emacs
;; These packages are used by wild area of buffers.

;; ** Achievements (;-)
;; #+BEGIN_SRC emacs-lisp
  (use-package achievements
    :ensure t
    :config (achievements-mode t))
;; #+END_SRC

;; ** Beacon
;; Wave showing where point is
;; #+BEGIN_SRC emacs-lisp
  (use-package beacon
    :ensure t
    :config (beacon-mode t))



;; #+END_SRC


;; #################
;; Load the `programming-languages.org' file.

;; !!!!!!!!!!
;; All code below should at the end be in file
;; Configuration-org/programminglanguages.org, but since loading this file don't
;; work at this moment, I just placed it here.


;; Go language major mode
(use-package go-mode
  :ensure t)












;; Code added by customize mode
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(nimbus))
 '(custom-safe-themes
   '("2d0c343156093c69d9c4a5e2b59b0808dc6e7e4588a3750eca3d709eff180f87" default))
 '(ispell-dictionary nil)
 '(package-selected-packages '(nimbus-theme use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
