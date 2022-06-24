;; 禁用工具栏
(tool-bar-mode -1)
;; 禁用菜单栏
(menu-bar-mode -1);
;; 禁用滚动条
(scroll-bar-mode -1)
;; 可视行移动
(global-visual-line-mode)

(setq
 ;; 不要创建~备份文件
 make-backup-files nil
 ;; 不要缩放frame.
 frame-inhibit-implied-resize t
 ;; 默认用最简单的模式
 initial-major-mode 'fundamental-mode
 )

(setq initial-buffer-choice t)
(run-with-timer 1 nil #'(lambda () (bury-buffer)))

;; 增加长行处理性能
(setq bidi-inhibit-bpa t)
(setq-default bidi-paragraph-direction 'left-to-right)

;; 增加IO性能
(setq process-adaptive-read-buffering nil)
(setq read-process-output-max (* 1024 1024))

;; 以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; 指针不闪动
(blink-cursor-mode -1)

;; 标记高亮
(transient-mark-mode 1)

;; Word移动支持 FooBar 的格式
(global-subword-mode 1)

;; never pop dialog
(setq use-dialog-box nil)

;; inhibit start screen
(setq inhibit-startup-screen t)

;; 关闭启动空白buffer, 这个buffer会干扰session恢复
(setq initial-scratch-message "")

;; 设定自动缩进的注释风格
(setq-default comment-style 'indent)

;; 关闭烦人的出错时的提示声
(setq ring-bell-function 'ignore)

;; 设置默认地主模式为TEXT模式
(setq default-major-mode 'text-mode)

;; 粘贴于光标处,而不是鼠标指针处
(setq mouse-yank-at-point t)

;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)

;; 分屏的时候使用上下分屏
(setq split-width-threshold nil)

;; 使用字体缓存，避免卡顿
(setq inhibit-compacting-font-caches t)

;; 退出自动杀掉进程
(setq confirm-kill-processes nil)

;; 避免magit报错
(setq async-bytecomp-allowed-packages nil)

;; 按照中文折行
(setq word-wrap-by-category t)

;; 让 profiler-report 第一列宽一点
(setq profiler-report-cpu-line-format
      '((100 left)
        (24 right ((19 right)
                   (5 right)))))
(setq profiler-report-memory-line-format
      '((100 left)
        (19 right ((14 right profiler-format-number)
                   (5 right)))))

;; 增强的括号高亮
(add-hook 'find-file-hook 'highlight-parentheses-mode t)

;; 不要烦人的 redefine warning
(setq ad-redefinition-action 'accept)

;; 设置缩放的模式,避免Mac平台最大化窗口以后右边和下边有空隙
(setq frame-resize-pixelwise t)

;; 平滑地进行半屏滚动，避免滚动后recenter操作
(setq scroll-step 1
      scroll-conservatively 10000)

;; 记住光标在文件中的位置
(save-place-mode)

;; 不显示 *scratch*
;;(defun remove-scratch-buffer ()
;;  (if (get-buffer "*scratch*")
;;      (kill-buffer "*scratch*")))
;;(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Don't ask me when close emacs with process is running
;;(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
;;  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
;;  (require 'noflet)
;;  (noflet ((process-list ())) ad-do-it))

;; Don't ask me when kill process buffer
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

(provide 'init-defaults)
