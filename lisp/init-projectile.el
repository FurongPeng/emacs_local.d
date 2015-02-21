(require-package 'projectile)
(require-package 'helm-projectile)
(require 'projectile)
(projectile-global-mode)
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)

;; setup helm 
(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action 'helm-projectile)



;; rebind all project prefex shortcut to s-p
;;(define-key some-keymap (kbd "s-p") 'projectile-command-map)
;;(setq projectile-keymap-prefix (kbd "C-c C-p"))
(provide 'init-projectile)
