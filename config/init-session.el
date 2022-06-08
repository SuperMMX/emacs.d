(require 'desktop)
(require 'basic-toolkit)

(setq
 ;; 预恢复
 desktop-restore-eager 3
 ;; 延迟恢复的详细信息
 desktop-lazy-verbose nil
 ;; 不用询问
 desktop-load-locked-desktop t
 ;; 不恢复别的窗口
 desktop-restore-frames nil
 ;; 保存频率：五分钟
 desktop-auto-save-timeout 300
 ;; 不询问，直接保存
 desktop-save t
 ;;
 desktop-path (list user-emacs-directory)
 desktop-dirname user-emacs-directory
)

(desktop-save-mode 1)

(setq desktop-globals-to-save
      '((file-name-history        . 100)
        (ivy-history              . 100)
        (minibuffer-history       . 50)
        (query-replace-history    . 60)
        (search-ring              . 20)
        (shell-command-history    . 50)
        )
      )

(defun emacs-session-restore ()
  "Restore emacs session."
  (message "here is the session restore hook")
  ;; Kill other windows.
  (delete-other-windows)
  ;; Kill unused buffers.
  ;;(kill-unused-buffers)
  ;; 恢复
  (desktop-read user-emacs-directory)
  )

(defun emacs-session-save ()
  "Save emacs session."
  ;; Kill unused buffers.
  (kill-unused-buffers)
  ;; Save all buffers before exit.
  (auto-save-buffers)
  )

(add-hook 'desktop-save-hook #'emacs-session-save)
;;(add-hook 'desktop-after-read-hook #'emacs-session-restore)

(provide 'init-session)
