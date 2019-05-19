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
;; in buffers list by maj.r .ode..f buffer
