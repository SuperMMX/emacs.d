(require 'awesome-tray)

(defun awesome-tray-module-meow-info ()
  (string-trim (meow-indicator)))

(add-to-list 'awesome-tray-module-alist
             '("meow" . (awesome-tray-module-meow-info awesome-tray-module-evil-face)))

(setq awesome-tray-active-modules
      '("buffer-name" "belong" "location" "mode-name" "meow" "date"))

(awesome-tray-mode 1)

(provide 'init-awesome-tray)
