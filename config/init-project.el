(use-package projectile)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(use-package counsel-projectile)

(counsel-projectile-mode)

(provide 'init-project)
