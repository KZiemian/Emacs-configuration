;; (defun set-exec-path-from-shell-PATH ()
;;   "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.

;; This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
;;   (interactive)
;;   (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
;;     (setenv "PATH" path-from-shell)
;;     (setq exec-path (split-string path-from-shell path-separator))))
;; (setenv "PATH" (shell-command-to-string "bash -i -c `echo -n $PATH'"))
;; PATH




;; ###########################
;; Installing packeges



;; (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Inicjalizowanie paczek Emacsa


;; Ustawienia wyszukiwania ostatnio edytowanych plikow.
;; Nie wiem czy to jest potrzebne, gdy używam helma, jednak
;; nie chcę stracić 150 ostatnio odwiedzonych buforów testując to.

(use-package recentf
  :config
  (recentf-mode t)
  (setq recentf-max-saved-items 500
	recentf-max-menu-items 500))






;; Ustawienia trybu glownego Text

(add-hook 'text-mode-hook 'auto-complete-mode)




(defun recentf-clear ()
  (setq recentf-list nil))

;; Ustawienia LaTeXa.



;; (add-hook 'LaTeX-mode-hook (lambda ()
;; 			     (push
;; 			      '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
;; 				:help "Run latexmk on file")
;; 			      TeX-command-list)))


;; Ustawienia pomniejszego, acz wszedobylskiego, trybu Helm.
;; To jest eksperymentalne ustawienie Helma.
;; (use-package helm)
;; (use-package helm-config
;;   :config
;;   (setq helm-candidate-number-limit 400)
;;   (global-unset-key (kbd "C-x c"))
;;   ;; Zapytalem sie na GitHubie Helma jak zwiekszyc ilosc zapamietywanych
;;   ;; buforow i polecili mi ustawic ta zmienna.
;;   :bind
;;   (("C-c h" . helm-command-prefix)
;;    ;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;;    ;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;;    ;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
;;    )
;;   )


;; Ustawienie HELMA

(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", whic quite Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally,
;; because we cannot change `helm-command-prefix-key' once `helm-config'
;; is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
;; rebind TAB to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-presistent-action)
;; make TAB work in terminal
(define-key helm-map (kbd "C-z") 'helm-select-action)
;; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p t ; open helm buffer inside current window,
      ;; not occupy other window
      helm-move-to-line-cycle-in-source t ; move to end ro beginning of
      ;; source whe reaching top or bottom of source
      helm-ff-search-library-in-sexp t ; search for library in `require'
      ;; and `declare-function' sexp.
      helm-scroll-amount 8 ; scroll 8 lines other window using
      ;; M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
		   (let ((bg-color (face-background 'default nil)))
		     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))

(add-hook 'helm-minibuffer-set-up-hook
	  'spacemacs//helm-hide-minibuffer-maybe)

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 40)
(helm-autoresize-mode t)

(helm-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t)

(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-mini)

(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t)

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(setq helm-ff-newfile-prompt-p nil) ; Nie pyta się czy utworzyć nowy plik,
;; tylko robi to od razu.

(setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match t)

(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

(setq helm-locate-fuzzy-match t)

(global-set-key (kbd "C-c h o") 'helm-occur)

(setq helm-apropos-fuzzy-match t)

(setq helm-lisp-fuzzy-completion t)

(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)

(global-set-key (kbd "M-:") 'helm-eval-expression-with-eldoc)
(global-set-key (kbd "C-c h M-:") 'eval-expression)
(global-set-key (kbd "C-c C-,") 'helm-calcul-expresion)

(require 'helm-eshell)

(add-hook 'eshell-mode-hook
	  #'(lambda ()
	      (define-key eshell-mode-map (kbd "C-c C-l")
		'helm-eshell-history)))

(require 'shell)
(define-key shell-mode-map (kbd "C-c C-l") 'helm-comit-input-ring)
(define-key minibuffer-local-map (kbd "C-c C-l") 'helm-minibuffer-history)



;;;;;;;;;;
;; Swiper helm
(define-key global-map (kbd "C-s") 'swiper-helm)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs as Python IDE
(with-eval-after-load 'python
  (defun python-shell-completion-native-try ()
    "Return non-nil if can trigger native completion."
    (let ((python-shell-completion-native-enable t)
          (python-shell-completion-native-output-timeout
           python-shell-completion-native-try-output-timeout))
      (python-shell-completion-native-get-completions
       (get-buffer-process (current-buffer))
       nil "_"))))









;; Do C++
(require 'auto-complete)
;; (require 'auto-complete-config)
;; (ac-config-default)
;; ;; ustawnienie pomniejszego trybu autouzupelniania.
;; ;; (ac-config-default)
;; ;; Jest potrzebny dla powłoki.
;; (require 'yasnippet)
;; (yas-global-mode 1)
;; (defun my:ac-c-header-c-headers-init ()
;;   (reuire 'auto-complete-c-headers)
;;   (add-to-list 'ac-sources 'ac-source-c-headers))
;; (add-hook 'c++-mode-hook 'my:ac-c-header-c-headers-init)
;; (add-hook 'c-mode-hook 'my:ac-c-header-c-headers-init)

;; (defun my:flymake-google-init ()
;;   (require 'flymake-google-cpplint)
;;   (custom-set-variables
;;    '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
;;   (flymake-google-cpplint-load))

;; (add-hook 'c++-mode-hook 'my:flymake-google-init)
;; (add-hook 'c-mode-hook 'my:flymake-google-init)
;; ;; cpplint to moduł Python instaluj przep pip
;; (require 'google-c-style)
;; (add-hook 'c-mode-common-hook 'google-set-c-style)
;; (add-hook 'c-mode-common-hook 'google-set-c-make-newline-indent)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Ustawienie autouzupelniania w powloce.

(setq explicit-shell-file-name "bash")
(setq explicit-bash-args '("-c" "export EMACS=; stty echo; bash"))
(setq comint-process-echoes t)

(add-to-list 'ac-modes 'shell-mode)
(add-hook 'shell-mode-hook 'ac-rlc-setup-sources)

;; Ustawienia pomniejszego trybu function-args.

(fa-config-default)

;; Ustawienia SLIME
(use-package slime
  :init
  (load (expand-file-name "~/quicklisp/slime-helper.el"))
  (setq inferior-lisp-program "~/ccl/lx86cl64")
  ;; Aby zmienić na SBCL napisz po prostu "sbcl"
  :config (slime-setup '(slime-fancy
			 slime-asdf
			 slime-repl
			 slime-mrepl
			 slime-indentation inferior-slime))
  (add-hook 'slime-repl-mode-hook 'rainbow-delimiters-mode)
  (define-key global-map (kbd "M-s M-l") 'slime)
  (define-key global-map (kbd "C-r")
    'slime-restart-inferior-lisp))


;; Tryb dla CCLDOC
(load "~/.emacs.d/elisp/ccldoc.el")

;; Skrot dla compilacji
(define-key global-map (kbd "C-c C-v") 'compile)

;; Rust mode - rozszerzenia
(add-hook 'rust-mode-hook 'cargo-minor-mode)
