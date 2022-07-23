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

(use-package ivy-rich
  :config
  (setq ivy-rich-path-style 'abbrev)
  :init
  (ivy-rich-mode)
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  )

(provide 'init-completion)
