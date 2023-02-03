;; 不要自动启用package
;;(setq package-enable-at-startup nil)
;;(setq package--init-file-ensured t)

;; ==== Package ====

(require 'package)

(setq
 package-archives
 '(
   ("melpa" . "http://melpa.org/packages/")
   ("nongnu"   . "http://elpa.nongnu.org/nongnu/")
   ("gnu"   . "http://elpa.gnu.org/packages/")
   ))

;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;;(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
;;(add-to-list 'package-archives '("melpa" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/melpa/"))

;; 包的保存位置
(setq package-user-dir (locate-user-emacs-file "elpa"))

(package-initialize)

;;防止反复调用 package-refresh-contents 会影响加载速度
(when (not package-archive-contents)
  (package-refresh-contents))

;; 如果 use-package 没安装
(unless (package-installed-p 'use-package)
  ;; 更新本地缓存
  (package-refresh-contents)
  ;; 之后安装它。use-package 应该是你配置中唯一一个需要这样安装的包。
  (package-install 'use-package))

(require 'use-package)
;; 让 use-package 自动安装系统没有的 package
(setq use-package-always-ensure t)

;; (setq package-list
;;       '(
;;         flyspell-correct
;;         flyspell-correct-ivy
;;         ;;ivy-posframe
;;         subed
;;         wucuo
;;         ))

;; ;; install the missing packages
;; (dolist (package package-list)
;;   (unless (package-installed-p package)
;;     (package-install package)))

;; 不刷新
;;(unless (package-installed-p 'use-package)
;;  (package-refresh-contents)
;;  (package-install 'use-package))

;; Not checking package repositories
;;(eval-and-compile
;;  (setq use-package-always-ensure t
;;        use-package-expand-minimally t))

;; ==== Straight ====

;;(setq comp-deferred-compilation-deny-list ())
;;(setq straight-vc-git-default-clone-depth 1)
;;
;;(setq straight-disable-native-compile
;;      (when (fboundp 'native-comp-available-p)
;;	(not (native-comp-available-p))))

;;(defvar bootstrap-version)
;;(let ((bootstrap-file
;;       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
;;      (bootstrap-version 5))
;;  (unless (file-exists-p bootstrap-file)
;;    (with-current-buffer
;;        (url-retrieve-synchronously
;;         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
;;         'silent 'inhibit-cookies)
;;      (goto-char (point-max))
;;      (eval-print-last-sexp)))
;;  (load bootstrap-file nil 'nomessage))

;;(defvar straight-keymap
;;  (let ((m (make-keymap)))
;;    (define-key m (kbd "p") 'straight-pull-package)
;;    (define-key m (kbd "P") 'straight-pull-all)
;;    (define-key m (kbd "c") 'straight-check-package)
;;    (define-key m (kbd "C") 'straight-check-all)
;;    (define-key m (kbd "b") 'straight-rebuild-package)
;;    (define-key m (kbd "B") 'straight-rebuild-all)
;;    m))
;;
;;(defalias 'straight-keymap straight-keymap)
;;(global-set-key (kbd "C-x M-s") 'straight-keymap)

(provide 'init-package-management)
