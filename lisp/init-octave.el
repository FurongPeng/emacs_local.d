(require-package 'ac-octave)
(autoload 'octave-mode "octave" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))

(require 'ac-octave)
    (defun ac-octave-mode-setup ()
      (setq ac-sources '(ac-source-octave)))
      (add-hook 'octave-mode-hook
		'(lambda () (ac-octave-mode-setup)))

(provide 'init-octave)
