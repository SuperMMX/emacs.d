;; Counsel / Ivy
(use-package counsel
  :config
  (setq
   ivy-use-virtual-buffers nil
   ivy-wrap t
   ivy-extra-directories nil
   ivy-enable-advanced-buffer-information t
   ivy-initial-inputs-alist nil
   )
  (ivy-mode t)
  (counsel-mode t)
  )

(use-package ivy-rich
  :config
  (setq ivy-rich-path-style 'abbrev)
  :init
  (ivy-rich-mode)
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  )

;; (use-package ivy-posframe
;;   :config
;;   (setq
;;    ivy-posframe-display-functions-alist '((t . ivy-posframe-display))
;;    )
;;   :init
;;   (ivy-posframe-mode 1)
;;   )

;;; 让`ivy-read'支持拼音
(use-package pinyinlib
    :autoload pinyinlib-build-regexp-string
    :init
    (with-no-warnings
      (defun my-pinyinlib-build-regexp-string (str)
        "Build a pinyin regexp sequence from STR."
        (cond ((equal str ".*") ".*")
              (t (pinyinlib-build-regexp-string str t))))

      (defun my-pinyin-regexp-helper (str)
        "Construct pinyin regexp for STR."
        (cond ((equal str " ") ".*")
              ((equal str "") nil)
              (t str)))

      (defun pinyin-to-utf8 (str)
        "Convert STR to UTF-8."
        (cond ((equal 0 (length str)) nil)
              ((equal (substring str 0 1) ",")
               (mapconcat
                #'my-pinyinlib-build-regexp-string
                (remove nil (mapcar
                             #'my-pinyin-regexp-helper
                             (split-string
                              (replace-regexp-in-string "," "" str )
                              "")))
                ""))
              (t nil)))

      (defun my-ivy--regex-pinyin (fn str)
        "The regex builder advice to support pinyin."
        (or (pinyin-to-utf8 str)
            (funcall fn str)))
      (advice-add #'ivy--regex-plus :around #'my-ivy--regex-pinyin)
      (advice-add #'ivy--regex-ignore-order :around #'my-ivy--regex-pinyin)))

(provide 'init-completion)
