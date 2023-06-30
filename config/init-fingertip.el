(require 'fingertip)
(require 'lazy-load)

(dolist (hook (list
               'c-mode-common-hook
               'c-mode-hook
               'c++-mode-hook
               'coffee-mode-hook
               'css-mode-hook
               'emacs-lisp-mode-hook
               'go-mode-hook
               'haskell-mode-hook
               'ielm-mode-hook
               'jade-mode-hook
               'java-mode-hook
               'js-mode-hook
               'lisp-interaction-mode-hook
               'lisp-mode-hook
               'lua-mode-hook
               'makefile-gmake-mode-hook
               'maxima-mode-hook
               'minibuffer-inactive-mode-hook
               'php-mode-hook
               'python-mode-hook
               'qmake-mode-hook
               'qml-mode-hook
               'ruby-mode-hook
               'rust-mode-hook
               'typescript-mode-hook
               'sh-mode-hook
               'swift-mode-hook

               'bash-ts-mode-hook
               'c-ts-mode-hook
               'c++-ts-mode-hook
               'cmake-ts-mode-hook
               'css-ts-mode-hook
               'java-ts-mode-hook
               'js-ts-mode-hook
               'json-ts-mode-hook
               'python-ts-mode-hook
               'toml-ts-mode-hook
               'typescript-ts-mode-hook
               ))
  (add-hook hook #'(lambda () (fingertip-mode 1))))

(defvar fingertip-key-alist nil)
(setq fingertip-key-alist
      '(
        ;; 移动
        ("M-n" . fingertip-jump-left)
        ("M-p" . fingertip-jump-right)
        ;; 符号插入
        ;;("%" . fingertip-match-paren)       ;括号跳转
        ("M-}" . fingertip-match-paren)       ;括号跳转
        ("(" . fingertip-open-round)        ;智能 (
        ("[" . fingertip-open-bracket)      ;智能 [
        ("{" . fingertip-open-curly)        ;智能 {
        (")" . fingertip-close-round)       ;智能 )
        ("]" . fingertip-close-bracket)     ;智能 ]
        ("}" . fingertip-close-curly)       ;智能 }
        ("\"" . fingertip-double-quote)     ;智能 "
        ("'" . fingertip-single-quote)      ;智能 '
        ("=" . fingertip-equal)             ;智能 =
        ;;("SPC" . fingertip-space)           ;智能 space
        ;;("RET" . fingertip-newline)         ;智能 newline
        ;; 删除
        ("DEL" . fingertip-backward-delete) ;向后删除
        ;;("C-h" . fingertip-backward-delete)  ;向后删除
        ;;("C-d" . fingertip-forward-delete)  ;向前删除
        ;;("C-k" . fingertip-kill)            ;向前kill
        ;; 包围
        ("M-\"" . fingertip-wrap-double-quote) ;用 " " 包围对象, 或跳出字符串
        ("M-'" . fingertip-wrap-single-quote) ;用 ' ' 包围对象, 或跳出字符串
        ("M-[" . fingertip-wrap-bracket)      ;用 [ ] 包围对象
        ("M-{" . fingertip-wrap-curly)        ;用 { } 包围对象
        ("M-(" . fingertip-wrap-round)        ;用 ( ) 包围对象
        ("M-)" . fingertip-unwrap)            ;去掉包围对象
        ;; 跳出并换行缩进
        ("M-:" . fingertip-jump-out-pair-and-newline) ;跳出括号并换行
        ;; 向父节点跳动
        ("C-j" . fingertip-jump-up)
        ))
(lazy-load-set-keys fingertip-key-alist fingertip-mode-map)

(provide 'init-fingertip)
