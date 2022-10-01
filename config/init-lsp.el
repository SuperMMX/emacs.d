;; Enable Lombok for Java
(setq lsp-bridge-jdtls-jvm-args
      (list (format "%s%s%s" "-javaagent:" user-emacs-directory "files/lombok.jar")))

(require 'yasnippet)
(require 'lsp-bridge)

;; Java
(require 'lsp-bridge-jdtls)

(setq lsp-bridge-enable-log t)

;; 按键

(one-key-create-menu
 "LSP"
 '(
   (("a" . "Code Action") . lsp-bridge-code-action)
   (("d" . "Find Def") . lsp-bridge-find-def)
   (("i" . "Find Impl") . lsp-bridge-find-impl)
   (("b" . "Find Back") . lsp-bridge-return-from-def)
   (("r" . "Find Refs") . lsp-bridge-find-references)
   (("d" . "Open Doc") . lsp-bridge-lookup-documentation)
   (("R" . "Rename") . lsp-bridge-rename)
   (("n" . "Next Diag") . lsp-bridge-jump-to-next-diagnostic)
   (("p" . "Prev Diag") . lsp-bridge-jump-to-prev-diagnostic)
   (("S" . "Restart") . lsp-bridge-restart-process)
   )
 t)

(meow-leader-define-key '("l" . one-key-menu-lsp))

;; Disable Groovy for now
(delete '(groovy-mode . "groovy-language-server") lsp-bridge-single-lang-server-mode-list)
(delete 'groovy-mode-hook lsp-bridge-default-mode-hooks)

(global-lsp-bridge-mode)

(provide 'init-lsp)
