(use-package wucuo
  :ensure-t
  :init
  (add-hook 'prog-mode-hook #'wucuo-start)
  (add-hook 'text-mode-hook #'wucuo-start)
  )

(setq
 ispell-program-name "hunspell"
 ispell-local-dictionary "en_US"
 )

(use-package flyspell-correct
)

(use-package flyspell-correct-ivy
)

(provide 'init-spelling)
