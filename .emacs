;; init.el - Practical Evil setup
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(setq evil-want-keybinding nil)

;; Core Evil
(use-package evil
  :init
  (setq evil-want-C-u-scroll t) ;; let C-u scroll up like Vim
  :config
  (evil-mode 1))

;; Make SPC a leader key in normal/visual/emacs states
(use-package general
  :config
  (general-create-definer my/leader-keys
    :states '(normal visual emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "C-SPC") ;; optional global leader
  ;; now we can define SPC bindings safely
  (my/leader-keys
    "f"  '(:ignore t :which-key "files")
    "f f" '(find-file :which-key "find file")
    "b"  '(:ignore t :which-key "buffers")
    "b b" '(switch-to-buffer :which-key "switch buffer")))

;; Better integration for many modes
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; Leader key and nicer keybinding DSL
(use-package general
  :config
  (general-create-definer my/leader-keys
    :prefix "SPC")
  (my/leader-keys
    "f"  '(:ignore t :which-key "files")
    "ff" '(find-file :which-key "find file")
    "b"  '(:ignore t :which-key "buffers")
    "bb" '(switch-to-buffer :which-key "switch buffer")))

;; Show possible keybindings
(use-package which-key
  :config
  (which-key-mode))

;; Surround (cs, ds, ys style)
(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

;; Commenting
(use-package evil-commentary
  :config
  (evil-commentary-mode))

;; Better undo (preserves tree of undos like vim-undo-tree alternative)
(use-package undo-fu
  :config
  (global-set-key (kbd "C-/") #'undo-fu-only-undo)
  (global-set-key (kbd "C-?") #'undo-fu-only-redo))

;; Optional: quick jumping
(use-package avy
  :bind ("C-:" . avy-goto-char))

;; Optional: fuzzy search (ivy/counsel) or helm; pick one family
(use-package ivy
  :config
  (ivy-mode 1))
(use-package counsel
  :after ivy
  :config
  (counsel-mode 1))

;; Performance / UI tweaks
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)

;; Gruber Darker (Rexim version)
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
