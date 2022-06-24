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


(defun set-font (FONT-NAME CN-FONT-NAME EXTB-FONT-NAME &optional INITIAL-SIZE CN-FONT-RESCALE-RATIO EXTB-FONT-RESCALE-RATIO)
  "Set different font-family for Latin and Chinese charactors."
  (let* ((size (or INITIAL-SIZE 14))
	       (ratio (or CN-FONT-RESCALE-RATIO 0.0))
	       (extb-ratio (or EXTB-FONT-RESCALE-RATIO CN-FONT-RESCALE-RATIO))
	       (main (font-spec :name FONT-NAME :size size))
	       (cn (font-spec :name CN-FONT-NAME))
	       (extb (font-spec :name EXTB-FONT-NAME)))
    (set-face-attribute 'default nil :font main)
    (dolist (charset '(kana han symbol cjk-misc bopomofo gb18030))
      (set-fontset-font t charset cn))
    (set-fontset-font t nil extb)
    (setq face-font-rescale-alist
          `((,CN-FONT-NAME . ,ratio)
            (,EXTB-FONT-NAME . ,extb-ratio)))
    ))

(set-font "Hack" "H-MingLan" "中华书局宋体02平面" 16 1.25 1.25)

(provide 'init-font)
