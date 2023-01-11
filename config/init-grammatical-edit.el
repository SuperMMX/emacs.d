(require 'grammatical-edit)
(require 'lazy-load)

(dolist (hook (list
               'c-mode-common-hook
               'c-mode-hook
               'c-ts-mode-hook
               'c++-mode-hook
               'c++-ts-mode-hook
               'coffee-mode-hook
               'conf-toml-mode-hook
               'css-mode-hook
               'css-ts-mode-hook
               'emacs-lisp-mode-hook
               'go-mode-hook
               'haskell-mode-hook
               'ielm-mode-hook
               'jade-mode-hook
               'java-mode-hook
               'java-ts-mode-hook
               'js-mode-hook
               'js-ts-mode-hook
               'lisp-interaction-mode-hook
               'lisp-mode-hook
               'llvm-mode-hook
               'lua-mode-hook
               'makefile-gmake-mode-hook
               'markdown-mode-hook
               'maxima-mode-hook
               'nim-mode-hook
               'php-mode-hook
               'python-mode-hook
               'python-ts-mode-hook
               'qmake-mode-hook
               'qml-mode-hook
               'ruby-mode-hook
               'rust-mode-hook
               'sh-mode-hook
               'swift-mode-hook
               'toml-ts-mode-hook
               'typescript-mode-hook
               'typescript-ts-mode-hook
               'web-mode-hook
               ))
  (add-hook hook #'(lambda () (grammatical-edit-mode 1))))

(defvar grammatical-edit-key-alist nil)
(setq grammatical-edit-key-alist
      '(
        ;; 移动
        ("M-n" . grammatical-edit-jump-left)
        ("M-p" . grammatical-edit-jump-right)
        ;; 符号插入
        ("%" . grammatical-edit-match-paren)       ;括号跳转
        ("(" . grammatical-edit-open-round)        ;智能 (
        ("[" . grammatical-edit-open-bracket)      ;智能 [
        ("{" . grammatical-edit-open-curly)        ;智能 {
        (")" . grammatical-edit-close-round)       ;智能 )
        ("]" . grammatical-edit-close-bracket)     ;智能 ]
        ("}" . grammatical-edit-close-curly)       ;智能 }
        ("\"" . grammatical-edit-double-quote)     ;智能 "
        ("'" . grammatical-edit-single-quote)      ;智能 '
        ("=" . grammatical-edit-equal)             ;智能 =
        ("SPC" . grammatical-edit-space)           ;智能 space
        ("RET" . grammatical-edit-newline)         ;智能 newline
        ;; 删除
        ("DEL" . grammatical-edit-backward-delete) ;向后删除
        ("C-h" . grammatical-edit-backward-delete)  ;向后删除
        ("C-d" . grammatical-edit-forward-delete)  ;向前删除
        ;;("C-k" . grammatical-edit-kill)            ;向前kill
        ;; 包围
        ("M-\"" . grammatical-edit-wrap-double-quote) ;用 " " 包围对象, 或跳出字符串
        ("M-'" . grammatical-edit-wrap-single-quote) ;用 ' ' 包围对象, 或跳出字符串
        ("M-[" . grammatical-edit-wrap-bracket)      ;用 [ ] 包围对象
        ("M-{" . grammatical-edit-wrap-curly)        ;用 { } 包围对象
        ("M-(" . grammatical-edit-wrap-round)        ;用 ( ) 包围对象
        ("M-)" . grammatical-edit-unwrap)            ;去掉包围对象
        ;; 跳出并换行缩进
        ("M-:" . grammatical-edit-jump-out-pair-and-newline) ;跳出括号并换行
        ;; 向父节点跳动
        ("C-j" . grammatical-edit-jump-up)
        ))
(lazy-load-set-keys grammatical-edit-key-alist grammatical-edit-mode-map)

(provide 'init-grammatical-edit)
