;; (defun load-font-setup()
;;   (cond ((eq window-system 'pgtk)
;;          (set-face-attribute 'default nil :family "Hack"))
;;         (t
;;          (let ((emacs-font-size 12)
;;                (chinese-font-name  "H-MingLan")
;;                english-font-name)
;;            (cond
;;             ((featurep 'cocoa)
;;              (setq english-font-name "Hack"))
;;             ((string-equal system-type "gnu/linux")
;;              (setq english-font-name "Hack")))
;;            (when (display-grayscale-p)
;;              (set-frame-font (format "%s-%s" (eval english-font-name) (eval emacs-font-size)))
;;              (set-fontset-font (frame-parameter nil 'font) 'unicode (eval english-font-name))
;;
;;              (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;                (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family (eval chinese-font-name))))
;;              )))))
;;
;; (load-font-setup)


(defun set-font (FONT-NAME CN-FONT-NAME &optional INITIAL-SIZE CN-FONT-RESCALE-RATIO)
  "Set different font-family for Latin and Chinese charactors."
  (let* ((size (or INITIAL-SIZE 14))
	       (ratio (or CN-FONT-RESCALE-RATIO 0.0))
	       (main (font-spec :name FONT-NAME :size size))
	       (cn (font-spec :name CN-FONT-NAME)))
    (set-face-attribute 'default nil :font main)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font t charset cn))
    (setq face-font-rescale-alist (if (/= ratio 0.0) `((,CN-FONT-NAME . ,ratio)) nil))))

(set-font "Hack" "H-MingLan" 16 1.25)

(provide 'init-font)
