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
                                    "elpa" ; Package 会自动将其下目录加入 load-path
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

;; init.el 所在目录当作 .emacs.d
(setq user-emacs-directory (file-name-directory load-file-name))

;; 递归把所有目录加入 load-path
(add-subdirs-to-load-path user-emacs-directory)

;; 编码
(require 'init-encoding)
;; 缺省
(require 'init-defaults)
;; 包管理
(require 'init-package-management)
;;; 状态
(require 'init-awesome-tray)
; 主题
(require 'init-theme)
;; 字体设置
(require 'init-font)
;; 全屏
(require 'init-fullscreen)

(let (
      ;; 加载的时候临时增大`gc-cons-threshold'以加速启动速度。
      (gc-cons-threshold most-positive-fixnum)
      (gc-cons-percentage 0.6)
      ;; 清空避免加载远程文件的时候分析文件。
      (file-name-handler-alist nil))

  ;; 抹掉插件启动的输出
  (with-temp-message ""
    ;;(require 'benchmark-init-modes)
    ;;(require 'benchmark-init)
    ;;(benchmark-init/activate)

    ;; 双击
    (require 'init-key-chord)
    ;; Meow
    (require 'init-meow)
    ;; 一键设置
    (require 'init-one-key)
;;    (require 'init-key)
;;    (require 'init-vi-navigate)
;;    (require 'init-isearch-mb)

    ;; 可以延后加载的
    (run-with-idle-timer
     1 nil
     #'(lambda ()
         ;; Trim trailing whitespaces
         (require 'init-ws-butler)
         ;; unfill
         (require 'init-unfill)
         ;; 自动保存
         (require 'init-auto-save)
         ;; 缩进
         (require 'init-indent)
         ;; 行号
         (require 'init-line-number)
         ;; 补全
         (require 'init-completion)
         ;; 模式关联
         (require 'init-mode)
         ;; Posframe
         (require 'init-posframe)
         ;; 上下滚动留行
         ;;(require 'init-smooth-scrolling)
         ;;(require 'init-idle)
         ;; AsciiDoc
         (require 'init-asciidoc)
         ;; 项目
         (require 'init-project)
         ;; Markdown
         (require 'init-markdown)
         ;; TypeScript
         (require 'init-typescript)
         ;; Magit
         ;;(require 'init-magit)
         ;; Tree Sitter
         (require 'init-tree-sitter)
         ;; 括号高亮
         (require 'init-highlight-parentheses)
         ;; 配对
         ;;(require 'init-awesome-pair)
         (require 'init-grammatical-edit)
         ;; Highlight some key words
         (require 'init-hl-todo)
         ;; Popwin
         (require 'init-popwin)

         ;; Web Mode
         (require 'init-web-mode)
         ;; Groovy Mode
         (require 'init-groovy)
         ;; YAS
         (require 'init-yas)
         ;; Language Server
         (require 'init-lsp)
         ;; EAF
         (require 'init-eaf)
         ;; Citre
         (require 'init-citre)
         ;; Symbol Overlay
         (require 'init-symbol-overlay)
         ;; TeX
         (require 'init-tex)
         ;; Spelling check
         (require 'init-spelling)

         ;; Other utilities

         ;; Subtitle
         (require 'init-subed)

         ;; Restore session at last.
         (require 'init-session)
         (emacs-session-restore)

         ;; testing

         ))))

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(tree-sitter-langs tree-sitter ivy-rich lush-theme yasnippet groovy-mode obsidian-theme popwin web-mode gotham-theme planet-theme ujelly-theme ample-zen-theme doom-themes darktooth-theme jbeans-theme adoc-mode smooth-scrolling mustang-theme counsel-projectile citre unfill soft-charcoal-theme hl-todo key-chord solarized-theme ample-theme tangotango-theme magit meow ws-butler markdown-mode posframe)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
