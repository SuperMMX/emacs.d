;; Subtitles
(use-package subed
  :config
  ;; Disable automatic movement of point by default
  (add-hook 'subed-mode-hook 'subed-disable-sync-point-to-player)
  ;; Remember cursor position between sessions
  (add-hook 'subed-mode-hook 'save-place-local-mode)
  )

(setq subed-auto-play-media nil)

(provide 'init-subed)
