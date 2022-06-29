(require 'awesome-tray)

;; Meow 状态
(defun awesome-tray-module-meow-info ()
  (string-trim (meow-indicator)))

(add-to-list 'awesome-tray-module-alist
             '("meow" . (awesome-tray-module-meow-info awesome-tray-module-evil-face)))

;; 在 minibuffer 中不显示 awesome-tray
(setq awesome-tray-minibuffer nil)
;; inactive 颜色
(setq awesome-tray-mode-line-inactive-color "Gray75")
;; 修改
(setq awesome-tray-buffer-name-buffer-changed t)
;; 只读
(setq awesome-tray-buffer-read-only-style "%")

(setq awesome-tray-active-modules
      '("git" "buffer-read-only" "buffer-name" "belong" "location" "date"))

(awesome-tray-mode 1)

(provide 'init-awesome-tray)
