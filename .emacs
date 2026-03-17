;; -------------------------
;; Package setup
;; -------------------------

(require 'package)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; -------------------------
;; UI cleanup
;; -------------------------

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 0)

(setq inhibit-startup-message t)

;; line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;; clipboard integration
(setq select-enable-clipboard t)

;; -------------------------
;; Doom theme + modeline
;; -------------------------

(use-package doom-themes
  :config
  (load-theme 'doom-one t))

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode))

(use-package nerd-icons)

;; -------------------------
;; Evil (vim bindings)
;; -------------------------

(use-package evil
  :init
  (setq evil-want-integration t)
  :config
  (evil-mode 1))

(with-eval-after-load 'evil
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
  (define-key evil-normal-state-map (kbd "C-d") 'evil-scroll-down))

;; -------------------------
;; Leader key system
;; -------------------------

(use-package general
  :config
  (general-evil-setup t)

  (general-create-definer my/leader
    :states '(normal visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC"))

(use-package which-key
  :config
  (which-key-mode))

;; -------------------------
;; Completion system
;; -------------------------

(use-package vertico
  :init
  (vertico-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless)))

(use-package marginalia
  :init
  (marginalia-mode))

(use-package consult)

;; -------------------------
;; On-demand autocomplete
;; -------------------------

(use-package corfu
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto nil) ;; disable automatic popup
  :bind
  (:map corfu-map
        ("C-n" . corfu-next)
        ("C-p" . corfu-previous)))

(global-set-key (kbd "C-n") #'completion-at-point)


;; -------------------------
;; Leader key bindings
;; -------------------------

(my/leader
 "y"  '("+y" :which-key "yank to clipboard")

 "f"  '(:ignore t :which-key "files")
 "ff" '(find-file :which-key "find file")
 "fg" '(consult-ripgrep :which-key "grep")
 "cc" '(compile :which-key "compile")
)

;; -------------------------
;; Misc improvements
;; -------------------------

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq-default tab-width 4)
(setq-default standard-indent 4)
(setq-default indent-tabs-mode nil)

(setq c-basic-offset 4)
(setq js-indent-offset 4)
(setq python-indent-offset 4)
(setq sh-basic-offset 4)

(setq ring-bell-function 'ignore)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(consult corfu doom-modeline doom-themes evil general lsp-mode lsp-ui
             magit marginalia orderless projectile vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
