
;; enable elpy
(require-package 'jedi)
(require-package 'elpy)
(require 'elpy nil t)  
(elpy-enable)  
(setq elpy-rpc-backend "jedi")
(add-hook 'python-mode-hook 'jedi:setup)



(provide 'init-python-mode)

