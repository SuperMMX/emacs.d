(require 'cl-lib)

(defun add-subdirs-to-load-path (search-dir)
  (interactive)
  (let* ((dir (file-name-as-directory search-dir)))
    (dolist (subdir
             ;; 过滤出不必要的目录，提升Emacs启动速度
             (cl-remove-if
              #'(lambda (subdir)
                  (or
                   ;; 不是文件的都移除
                   (not (file-directory-p (concat dir subdir)))
                   ;; 目录匹配下面规则的都移除
                   (member subdir '("." ".." ;Linux当前目录和父目录
                                    "dist" "node_modules" "__pycache__" "build" "target" ;语言相关的模块目录
                                    "RCS" "CVS" "rcs" "cvs" ".git" ".github")))) ;版本控制目录
              (directory-files dir)))
      (let ((subdir-path (concat dir (file-name-as-directory subdir))))
        ;; 目录下有 .el .so .dll 文件的路径才添加到 `load-path' 中，提升Emacs启动速度
        (when (cl-some #'(lambda (subdir-file)
                           (and (file-regular-p (concat subdir-path subdir-file))
                                ;; .so .dll 文件指非Elisp语言编写的Emacs动态库
                                (member (file-name-extension subdir-file) '("el" "so" "dll"))))
                       (directory-files subdir-path))

          ;; 注意：`add-to-list' 函数的第三个参数必须为 t ，表示加到列表末尾
          ;; 这样Emacs会从父目录到子目录的顺序搜索Elisp插件，顺序反过来会导致Emacs无法正常启动
          (add-to-list 'load-path subdir-path t))

        ;; 继续递归搜索子目录
        (add-subdirs-to-load-path subdir-path)))))

(add-subdirs-to-load-path ".")

;; 禁用工具栏
(tool-bar-mode -1)
;; 禁用菜单栏
(menu-bar-mode -1);
;; 禁用滚动条
(scroll-bar-mode -1)

(setq
 ;; 不要缩放frame.
 frame-inhibit-implied-resize t
 ;; 默认用最简单的模式
 initial-major-mode 'fundamental-mode
)

;; 包管理
(require 'init-package-management)

;; 主题
(require 'init-theme)

;; 字体设置
(require 'init-font)

(let (
      ;; 加载的时候临时增大`gc-cons-threshold'以加速启动速度。
      (gc-cons-threshold most-positive-fixnum)
      (gc-cons-percentage 0.6)
      ;; 清空避免加载远程文件的时候分析文件。
      (file-name-handler-alist nil))

  (require 'init-indent)

  (with-temp-message ""              ;抹掉插件启动的输出
    ;;(require 'benchmark-init-modes)
    ;;(require 'benchmark-init)
    ;;(benchmark-init/activate)

    (require 'init-fullscreen)
    (require 'init-generic)
    (require 'init-line-number)
    (require 'init-highlight-parentheses)
;;    (require 'init-one-key)
;;    (require 'init-key)
;;    (require 'init-vi-navigate)
;;    (require 'init-isearch-mb)

    ;; 可以延后加载的
    (run-with-idle-timer
     1 nil
     #'(lambda ()
         (message "inside timer")
         (require 'init-smooth-scrolling)
         ;;(require 'init-idle)

         (require 'init-eaf)
         ;; Restore session at last.
         ;;(require 'init-session)
         ;;(emacs-session-restore)

         (require 'init-asciidoc)
         ))))

(provide 'init)
