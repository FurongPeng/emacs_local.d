(require-package 'projectile)
(require 'projectile)
(projectile-global-mode)
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)
;; rebind all project prefex shortcut to s-p
;;(define-key some-keymap (kbd "s-p") 'projectile-command-map)
;;(setq projectile-keymap-prefix (kbd "C-c C-p"))
(provide 'init-projectile)
