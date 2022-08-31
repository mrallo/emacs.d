;;; init-local.el --- Custom initialization -*- lexical-binding: t -*-
;;; Commentary:

;; Provides local specific customizations.

;;; Code:

(when window-system
  (global-hl-line-mode 1)
  (setq whitespace-style '(face trailing))
  (add-to-list 'default-frame-alist '(font . "Fira Code Retina"))
  (put 'dired-find-alternate-file 'disabled nil)
  (color-theme-sanityinc-solarized-dark))


;; Basic AsciiDoc setup

(when (maybe-require-package 'adoc-mode)
  (require-package 'markup-faces)
  (with-eval-after-load 'adoc-mode
    (add-auto-mode 'adoc-mode "\\.adoc\\'" "\\.asciidoc\\'")))


;; Major mode for editing Csound files

(require-package 'csound-mode)


;; Major mode for editing (Standard) ML

(require-package 'sml-mode)


;; Beautifying Org mode

(with-eval-after-load 'org
  (require-package 'plantuml-mode)
  (setq org-directory "~/Notes"
        org-log-done t
        org-log-into-drawer t
        org-startup-indented t
        org-src-fontify-natively t
        org-plantuml-exec-mode 'plantuml)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((ruby      . t)
     (latex     . t)
     (plantuml  . t)
     (python    . t)
     (shell     . t)
     (calc      . t)
     (dot       . t)
     (ditaa     . t)
     (org       . t)))
  (add-hook 'org-mode-hook 'visual-line-mode)
  (add-hook 'org-mode-hook 'variable-pitch-mode)
  (add-hook 'org-babel-after-execute 'org-redisplay-inline-images)
  (set-face-attribute 'org-block nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil :inherit 'fixed-pitch))


;; Java

(when (maybe-require-package 'lsp-java)
  (require-package 'lsp-mode)
  (require-package 'lsp-ui)
  (require-package 'lsp-treemacs)
  (require-package 'dap-mode)
  (require-package 'helm-lsp)
  (with-eval-after-load 'lsp-java
    (add-hook 'java-mode-hook #'lsp)))

(provide 'init-local)

;;; init-local.el ends here
