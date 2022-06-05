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

;; 缺省
(require 'init-defaults)
;; 包管理
(require 'init-package-management)
;; 双击
(require 'init-key-chord)
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

  ;; Meow
  (require 'init-meow)
  ;; 状态栏
  (require 'init-awesome-tray)
  ;; 补全
  (require 'init-completion)
  ;; 缩进
  (require 'init-indent)

  ;; 抹掉插件启动的输出
  (with-temp-message ""
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
         ;; 上下滚动留行
         (require 'init-smooth-scrolling)
         ;;(require 'init-idle)

         ;; 配对
         (require 'init-awesome-pair)
         ;; EAF
         (require 'init-eaf)
         ;; AsciiDoc
         (require 'init-asciidoc)
         ;; 项目
         (require 'init-project)
         ;; web-mode
         (require 'init-web-mode)

         ;; Restore session at last.
         ;;(require 'init-session)
         ;;(emacs-session-restore)

         ;; testing

         ))))

(provide 'init)
