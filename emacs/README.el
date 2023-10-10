(add-to-list 'load-path "~/.emacs.d/scripts/")

(require 'elpaca-config)

(require 'completion-config)

(use-package dashboard
:ensure t 
:init
(setq initial-buffer-choice 'dashboard-open)
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-banner-logo-title "Emacs Is More Than A Text Editor!")
(setq dashboard-startup-banner 'logo) ;; use standard emacs logo as banner
(setq dashboard-center-content nil) ;; set to 't' for centered content
(setq dashboard-items '((recents . 5)
			(agenda . 5 )
			(bookmarks . 3)
			(projects . 3)
			(registers . 3)))
:custom 
(dashboard-modify-heading-icons '((recents . "file-text")
				    (bookmarks . "book")))
:config
(dashboard-setup-startup-hook))

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package all-the-icons-dired
  :hook (dired-mode . (lambda () (all-the-icons-dired-mode t))))

(set-face-attribute 'font-lock-comment-face nil
		    :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
		    :slant 'italic)

(setq-default line-spacing 0.25)

(use-package which-key
  :init
    (which-key-mode 1)
  :diminish
  :config
  (setq which-key-side-window-location 'bottom
          which-key-sort-order #'which-key-key-order-alpha
          which-key-allow-imprecise-window-fit nil
          which-key-sort-uppercase-first nil
          which-key-add-column-padding 1
          which-key-max-display-columns nil
          which-key-min-display-lines 6
          which-key-side-window-slot -10
          which-key-side-window-max-height 0.25
          which-key-idle-delay 0.8
          which-key-max-description-length 25
          which-key-allow-imprecise-window-fit nil
          which-key-separator " → " ))

(use-package magit)

(menu-bar-mode -1)
(setq scroll-bar-mode -1)
(tool-bar-mode -1)

(electric-indent-mode -1)
(electric-pair-mode 1)
;; The following prevents <> from auto-pairing when electric-pair-mode is on.
;; Otherwise, org-tempo is broken when you try to <s TAB...
(add-hook 'org-mode-hook (lambda ()
                           (setq-local electric-pair-inhibit-predicate
                                       `(lambda (c)
                                          (if (char-equal c ?<) t (,electric-pair-inhibit-predicate c))))))

(global-auto-revert-mode t)

(global-display-line-numbers-mode 1)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 35      ;; sets modeline height
	doom-modeline-bar-width 5    ;; sets right bar width
	doom-modeline-persp-name t   ;; adds perspective name to modeline
	doom-modeline-persp-icon t)) ;; adds folder icon next to persp name

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-tokyo-night t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(delete-selection-mode 1)

(use-package toc-org
  :commands toc-org-enable
  :init (add-hook 'org-mode-hook 'toc-org-enable))

(add-hook 'org-mode-hook 'org-indent-mode)
(use-package org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(require 'org-tempo)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)))

(use-package projectile
  :config
  (projectile-mode 1))

(use-package vterm
  :config
  (setq shell-file-name "/bin/zsh"
        vterm-max-scrollback 5000))

(use-package vterm-toggle
  :after vterm)
