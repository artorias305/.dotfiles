(setq package-enable-at-startup nil)

;; Bootstrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        user-emacs-directory))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(require 'use-package)
(setq straight-use-package-by-default t)

(use-package evil)

(require 'evil)

(setq evil-default-cursor 'box)
(setq evil-normal-state-cursor 'box)
(setq evil-insert-state-cursor 'box)
(setq evil-visual-state-cursor 'box)
(setq evil-replace-state-cursor 'box)
(setq evil-operator-state-cursor 'box)
(setq evil-motion-state-cursor 'box)
(setq evil-emacs-state-cursor 'box)

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)

(evil-mode 1)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq backward-delete-char-untabify nil)

(use-package ivy)
(require 'ivy)
(ivy-mode 1)

(use-package gruber-darker-theme)
(use-package naysayer-theme)

(require 'treesit)
(add-to-list 'treesit-language-source-alist
	     '(odin "https://github.com/tree-sitter-grammars/tree-sitter-odin"))

(use-package odin-ts-mode
  :straight
  (:host github
		 :repo "Sampie159/odin-ts-mode")
  :mode "\\.odin\\'")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; Your init file should contain only one such instance.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("09276f492e8e604d9a0821ef82f27ce58b831f90f49f986b4d93a006c12dbcdb"
     "01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
     default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 )
