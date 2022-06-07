(use-package doom-themes)

(defvar mmx-themes '(
                     doom-city-lights
                     doom-dark+
                     doom-gruvbox
                     doom-Iosvkem
                     doom-material
                     doom-molokai
                     doom-oceanic-next
                     doom-one
                     doom-palenight
                     doom-peacock
                     doom-snazzy
                     doom-sourcerer
                     doom-spacegrey
                     doom-tomorrow-night
                     doom-vibrant
                     ))

;; Random theme
(defun random-list-element (arg-list)
  (nth (random (length arg-list)) arg-list))

(defun random-theme ()
  "Choose random theme"
  (interactive)
  (load-theme (random-list-element mmx-themes) t)
;;  (cnfonts-set-font-with-saved-step)
  )

(random-theme)

;;(load-theme 'ample-theme)

(provide 'init-theme)
