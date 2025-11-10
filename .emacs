(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)

(setq-default indent-tabs-mode t)
(setq-default tab-width 4)

(defun my-c-mode-hook ()
  (setq c-basic-offset 4)
  (setq indent-tabs-mode t))

(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(setq evil-want-keybinding nil)

(use-package evil
  :init
  (setq evil-want-C-u-scroll t) 
  :config
  (evil-mode 1))

(use-package general
  :config
  (general-create-definer my/leader-keys
    :states '(normal visual emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "C-SPC") 
  (my/leader-keys
    "f"  '(:ignore t :which-key "files")
    "f f" '(find-file :which-key "find file")
    "b"  '(:ignore t :which-key "buffers")
    "b b" '(switch-to-buffer :which-key "switch buffer")))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package general
  :config
  (general-create-definer my/leader-keys
    :prefix "SPC")
  (my/leader-keys
    "f"  '(:ignore t :which-key "files")
    "ff" '(find-file :which-key "find file")
    "b"  '(:ignore t :which-key "buffers")
    "bb" '(switch-to-buffer :which-key "switch buffer")))

(use-package which-key
  :config
  (which-key-mode))

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

(use-package evil-commentary
  :config
  (evil-commentary-mode))

(use-package undo-fu
  :config
  (global-set-key (kbd "C-/") #'undo-fu-only-undo)
  (global-set-key (kbd "C-?") #'undo-fu-only-redo))

(use-package avy
  :bind ("C-:" . avy-goto-char))

(use-package ivy
  :config
  (ivy-mode 1))
(use-package counsel
  :after ivy
  :config
  (counsel-mode 1))

(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)

(use-package gruber-darker-theme
  :ensure t
  :config
  (load-theme 'gruber-darker t))

(use-package vterm
  :ensure t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
