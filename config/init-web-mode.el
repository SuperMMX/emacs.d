(use-package web-mode
  :config
  ;; disable automatic insertion of double quotes, not easy to use if cursor in string
  (setq web-mode-enable-auto-quoting nil)
  ;; 2 mean auto-close with > and </.
  (setq web-mode-tag-auto-close-style 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-enable-auto-indentation nil)
)

(use-package js)

(require 'lazy-load)
(require 'fingertip)
(require 'instant-rename-tag)
(require 'highlight-matching-tag)
(require 'mmx-funcs)

(highlight-matching-tag 1)

;; TODO: Emmit.

;; Web-mode.
(lazy-load-set-keys fingertip-key-alist web-mode-map)
(lazy-load-local-keys
 '(
;;   ("M-s-SPC" . web-mode-element-content-select)
;;   ("C-s-l" . web-mode-element-clone)
;;   ("C-M-SPC" . web-mode-mark-and-expand)
;;   ("C-:" . web-mode-comment-or-uncomment)
;;   ("C-M-SPC" . mark-sexp)
   ("M-R" . instant-rename-tag)
   )
 web-mode-map
 "web-mode-extension")

(mmx/add-to-mode
 'web-mode (list
            "\\.vue$"
            "\\.html$"
            "\\.xml$"
            ))

(provide 'init-web-mode)
