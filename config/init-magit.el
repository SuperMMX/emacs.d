(use-package magit)

;; Magit Status 全屏
(setq magit-display-buffer-function
      'magit-display-buffer-fullframe-status-v1)

(provide 'init-magit)
