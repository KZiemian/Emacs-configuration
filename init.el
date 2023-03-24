;; ##################
;; Configuration of frames

;; We first set up `windows-system' at the begining to avoid short displaying of
;; it default look at initialization. This is advaice from Daniel Mai.

(when window-system
  ;; Evaluate `menu-bar-mode' with positive integer to show menu in the top
  ;; of the frame.
  ;; (menu-bar-mode 1)
  (menu-bar-mode -1)
  ;; Analogous as in the case of manu-bar-mode.
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  ;; I don't know what this thing is doing, but I probably never use
  ;; tooltips, so I guess this doesn't matter.
  (tooltip-mode -1)
  ;; Setting the saize of main Emacs frame.
  (set-frame-size (selected-frame) 80 100))


;; Disable start up message.
(setq inhibit-startup-message t)
;; Set up initial *scratch* content to nothing (empty string).
(setq initial-scratch-message "")





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
;; `Use-package' -- bootstraping `use-package' package to manage
;; other packages.
;; `Bind-key' -- ????
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
;; Line below is from Daniel Mai's Emacs configuration. It has comment
;; that you should add it if you use :diminish. I don't know
;; what is :diminish doing.
(require 'diminish)





;; #################
;; Load the `personal-information.org' file.

;; Backup file for `personal-information.org' is in directory
;; $HOME/Private-backups/Emacs-backups.





;; #################
;; Load the `configuration-basic.org' file.

(org-babel-load-file
 (concat user-emacs-directory "Configuration-org/configuration-basic.org"))





;; #################
;; Load the `general-packages.org' file.

(org-babel-load-file
 (concat user-emacs-directory "Configuration-org/general-packages.org"))





;; #################
;; Load the `specialized-packages.org' file.

(org-babel-load-file
 (concat user-emacs-directory "Configuration-org/specialized-packages.org"))





;; #################
;; Load the `programming-languages.org' file.

(org-babel-load-file
 (concat user-emacs-directory "Configuration-org/programming-languages.org"))
