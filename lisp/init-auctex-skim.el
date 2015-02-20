;;; auctex-skim.el --- Add Skim as viewer to AUCTeX  -*- lexical-binding: t; -*-

;; Copyright (C) 2012-2015  Sebastian Wiesner <swiesner@lunaryorn.com>

;; Author: Sebastian Wiesner <swiesner@lunaryorn.com>
;; URL: https://gihub.com/lunaryorn/.emacs.d

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Setup Skim as viewer for AUCTeX with `auctex-skim-setup', or select it as
;; default viewer with `auctex-skim-select'.

;;; Code:

(require-package 'auctex )
(require 'tex-site)
                                        ; invoke the AUCTeX package (LaTeX support)


(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

;; setup path emacsclient which should be in path
(setenv "PATH" (concat "/usr/texbin:/usr/local/bin:" (getenv "PATH")))
(push "/usr/texbin" exec-path)
(push "/Applications/Emacs.app/Contents/MacOS/bin" exec-path)
(push "/Applications/Emacs.app/Contents/MacOS/libexec" exec-path)
(push "/usr/local/bin" exec-path)
 

;; AucTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)


;; make latexmk available via C-c C-c
;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
(add-hook 'LaTeX-mode-hook (lambda ()
  (push
    '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
      :help "Run latexmk on file")
    TeX-command-list)))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))


(add-hook 'LaTeX-mode-hook
          (lambda () (local-set-key (kbd "<S-s-mouse-1>") #'TeX-view))
          )

;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background  
(setq TeX-view-program-selection '((output-pdf "Skim-viewer")))
(setq TeX-view-program-list
      '(("Skim-viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

(server-start); start emacs in server mode so that skim can talk to it


(provide 'init-auctex-skim)

;; Local Variables:
;; coding: utf-8
;; indent-tabs-mode: nil
;; End:

;;; auctex-skim.el ends here
