;; 禁用工具栏
(tool-bar-mode -1)
;; 禁用菜单栏
(menu-bar-mode -1);
;; 禁用滚动条
(scroll-bar-mode -1)
;; 长行移动
(global-visual-line-mode)

(setq
 ;; 不要创建~备份文件
 make-backup-files nil
 ;; 不要缩放frame.
 frame-inhibit-implied-resize t
 ;; 默认用最简单的模式
 initial-major-mode 'fundamental-mode
 )

(provide 'init-defaults)
