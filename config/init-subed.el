;; Subtitles
(use-package subed
  :config
  ;; Disable automatic movement of point by default
  (add-hook 'subed-mode-hook 'subed-disable-sync-point-to-player)
  ;; Remember cursor position between sessions
  (add-hook 'subed-mode-hook 'save-place-local-mode)

  ;; Break lines automatically while typing
  ;;(add-hook 'subed-mode-hook 'turn-on-auto-fill)
  ;; Break lines at 40 characters
  ;;(add-hook 'subed-mode-hook (lambda () (setq-local fill-column 40)))

  (add-to-list 'subed-video-extensions "MPG")
  (add-to-list 'subed-video-extensions "rm")
  )

(provide 'init-subed)
