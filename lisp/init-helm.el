(require-package 'helm)
(require 'helm-config)

(global-set-key (kbd "M-x") 'helm-M-x)

(helm-mode 1)
(provide 'init-helm)
