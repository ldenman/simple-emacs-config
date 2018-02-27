
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

(package-install 'use-package)

(setq custom-file "~/.emacs-custom.el")

(use-package paredit
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode 1)
  (setq projectile-switch-project-action 'projectile-vc))

(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status))

(use-package multi-term
  :ensure t
  :bind (("C-c t" . multi-term)))

(use-package ansi-color
  :config
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
(defun colorize-compilation-buffer ()  
  (toggle-read-only)  
  (ansi-color-apply-on-region compilation-filter-start (point))  
  (toggle-read-only))  
(defun display-ansi-colors ()
  (interactive)
  (ansi-color-apply-on-region (point-min) (point-max))))

(global-set-key [f5] (lambda () (interactive) (call-interactively #'compile)))

(use-package haml-mode
  :ensure t)

(use-package emms
  :ensure t)

(use-package org
  :ensure t
  :bind (("C-c l" . org-store-link)))
