(use-package doom-themes)

(use-package ample-theme
  :init 
  (progn
    (load-theme 'ample-flat t t)
    (enable-theme 'ample-flat))
  )
(use-package ample-zen-theme)
(use-package darktooth-theme)
(use-package gotham-theme)
(use-package jbeans-theme)
(use-package lush-theme)
(use-package mustang-theme)
(use-package obsidian-theme)
(use-package planet-theme)
(use-package soft-charcoal-theme)
(use-package solarized-theme)
(use-package tangotango-theme)
(use-package ujelly-theme)

(defvar mmx-themes 
  '(
    ample-flat
    ample-zen
    darktooth
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
    gotham
    jbeans
    lush
    mustang
    misterioso
    obsidian
    planet
    soft-charcoal
    solarized-dark
    tangotango
    ujelly
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

(provide 'init-theme)
