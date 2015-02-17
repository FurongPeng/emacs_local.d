(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; base initialization
(require 'init-utils)
(require 'init-elpa)


(require 'init-exec-path)
(require 'init-ido)
;;(require 'init-helm); replace helm wiht ido
(require 'init-yasnippet)
(require 'init-auto-complete)
(require 'init-tabbar)
(require 'init-autopair)
(require 'init-pabbrev)

;;;;init python
;;(require 'init-flymake)
;;(require 'init-python-mode)


;; init latex
(require 'init-auctex-skim)
(require 'auto-complete-auctex)

;; init keys
(require 'init-keys)


;; init git
(require 'init-git)

;; init projectile
(require 'init-projectile)
