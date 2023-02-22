(use-package wucuo
  :init
  (add-hook 'prog-mode-hook #'wucuo-start)
  (add-hook 'text-mode-hook #'wucuo-start)
  (add-hook 'adoc-mode-hook #'wucuo-start)
  )

;; only check comments
(setq wucuo-font-faces-to-check
      '(
        font-lock-comment-face
        font-lock-doc-face
        font-lock-string-face
        ))

(setq
 ispell-program-name "hunspell"
 ispell-local-dictionary "en_US"
 )

(use-package flyspell-correct
)

(use-package flyspell-correct-ivy
)

(provide 'init-spelling)
