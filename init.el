;; Setting up build-in variables
(setq inhibit-startup-message t)	; Disable start up message.
(setq next-line-add-newlines t)



;; ##################
;; Configuration of package menager
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)



;; ##################
;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refres-contents)
  (package-install 'use-package))

;; Custom code
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (org-bullets which-key try use-package undo-tree swiper-helm slime rust-playground rainbow-delimiters multiple-cursors inf-ruby impatient-mode helm-gtags ggtags function-args cargo beacon avy auto-complete auto-compile auctex-lua auctex-latexmk aggressive-indent achievements))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;; ##################
;; Installing packeges

;; #####
(use-package try
  :ensure t)

;; #####
(use-package which-key
  :ensure t
  :config (which-key-mode))


;; ##########
;; Org-mode configuration
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
