;; Emacs builtin Tree Sitter
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
;;              (typescript-mode . typescript-ts-mode))))

;; (setq-local treesit-font-lock-level 4)
;; (treesit-font-lock-recompute-features '(command string variable function operator bracket keyword))

(use-package tree-sitter)
(use-package tree-sitter-langs)

(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(provide 'init-tree-sitter)
