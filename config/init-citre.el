(use-package citre
  :init
  (require 'citre-config)
  :config
  (setq
   citre-default-create-tags-file-location 'global-cache
   citre-auto-enable-citre-mode-modes '(prog-mode)
   )
  )

(provide 'init-citre)
