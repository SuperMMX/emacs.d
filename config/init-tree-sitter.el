;; Emacs builtin Tree Sitter
(require 'treesit)

;; (use-package treesit-auto
;;   :demand t
;;   :config
;;   (setq treesit-auto-install 'prompt)
;;   (global-treesit-auto-mode))

;; (use-package treesit
;;   :when (and (fboundp 'treesit-available-p)
;;              (treesit-available-p))
;;   :custom (major-mode-remap-alist
;;            '(
;;              (c-mode          . c-ts-mode)
;;              (c++-mode        . c++-ts-mode)
;;              (cmake-mode      . cmake-ts-mode)
;;              (conf-toml-mode  . toml-ts-mode)
;;              (css-mode        . css-ts-mode)
;;              (java-mode       . java-ts-mode)
;;              (js-mode         . js-ts-mode)
;;              (js-json-mode    . json-ts-mode)
;;              (python-mode     . python-ts-mode)
;;              (sh-mode         . bash-ts-mode)
;;              (typescript-mode . typescript-ts-mode)
;;              )))

;;(setq-local treesit-font-lock-level 4)
;;(treesit-font-lock-recompute-features '(command string variable function operator bracket keyword))

;; (global-tree-sitter-mode)
;; (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(setq global-treesit-auto-mode t)

(add-hook 'emacs-lisp-mode-hook #'(lambda () (treesit-parser-create 'elisp)))
(add-hook 'java-mode-hook #'(lambda () (treesit-parser-create 'java)))

(provide 'init-tree-sitter)
