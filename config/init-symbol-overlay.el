(use-package symbol-overlay
  :config
  (setq symbol-overlay-idle-time 0.2)
  )

(add-hook 'prog-mode-hook #'symbol-overlay-mode)

(meow-leader-define-key (cons "o" symbol-overlay-map))

(provide 'init-symbol-overlay)
