;; Counsel / Ivy
(use-package counsel
  :config
  (setq
   ivy-use-virtual-buffers nil
   ivy-wrap t
   ivy-extra-directories nil
   ivy-enable-advanced-buffer-information t
   ivy-initial-inputs-alist nil
   )
  (ivy-mode t)
  (counsel-mode t)
  )


(provide 'init-completion)
