(use-package! toc-org
  :commands toc-org-enable
  :init (add-hook 'org-mode-hook 'toc-org-enable))

(use-package! org-bullets)
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package! org-tempo)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)))

(delete-selection-mode 1)

(electric-indent-mode -1)
(electric-pair-mode 1)
;; The following prevents <> from auto-pairing when electric-pair-mode is on.
;; Otherwise, org-tempo is broken when you try to <s TAB...
(add-hook 'org-mode-hook (lambda ()
                           (setq-local electric-pair-inhibit-predicate
                                       `(lambda (c)
                                          (if (char-equal c ?<) t   (,electric-pair-inhibit-predicate   c))))))

(global-auto-revert-mode t)

(provide 'my-configs)
