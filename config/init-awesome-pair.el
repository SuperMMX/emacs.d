(require 'awesome-pair)

(dolist (hook (list
               'c-mode-common-hook
               'c-mode-hook
               'c++-mode-hook
               'coffee-mode-hook
               'css-mode-hook
               'emacs-lisp-mode-hook
               'go-mode-hook
               'haskell-mode-hook
               'groovy-mode-hook
               'ielm-mode-hook
               'jade-mode-hook
               'java-mode-hook
               'js-mode-hook
               'js2-mode-hook
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
               'sh-mode-hook
               'swift-mode-hook
               ))
  (add-hook hook '(lambda () (awesome-pair-mode 1))))

(define-key awesome-pair-mode-map (kbd "(") 'awesome-pair-open-round)
(define-key awesome-pair-mode-map (kbd "[") 'awesome-pair-open-bracket)
(define-key awesome-pair-mode-map (kbd "{") 'awesome-pair-open-curly)
(define-key awesome-pair-mode-map (kbd ")") 'awesome-pair-close-round)
(define-key awesome-pair-mode-map (kbd "]") 'awesome-pair-close-bracket)
(define-key awesome-pair-mode-map (kbd "}") 'awesome-pair-close-curly)
(define-key awesome-pair-mode-map (kbd "=") 'awesome-pair-equal)

(define-key awesome-pair-mode-map (kbd "%") 'awesome-pair-match-paren)
(define-key awesome-pair-mode-map (kbd "\"") 'awesome-pair-double-quote)

(define-key awesome-pair-mode-map (kbd "M-o") 'awesome-pair-backward-delete)
(define-key awesome-pair-mode-map (kbd "C-d") 'awesome-pair-forward-delete)
(define-key awesome-pair-mode-map (kbd "C-k") 'awesome-pair-kill)

(define-key awesome-pair-mode-map (kbd "M-\"") 'awesome-pair-wrap-double-quote)
(define-key awesome-pair-mode-map (kbd "M-[") 'awesome-pair-wrap-bracket)
(define-key awesome-pair-mode-map (kbd "M-{") 'awesome-pair-wrap-curly)
(define-key awesome-pair-mode-map (kbd "M-(") 'awesome-pair-wrap-round)
(define-key awesome-pair-mode-map (kbd "M-)") 'awesome-pair-unwrap)

(provide 'init-awesome-pair)
