(use-package meow)

(require 'mmx-funcs)

(defun meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)

  (meow-motion-overwrite-define-key
;;   '("j" . meow-next)
;;   '("k" . meow-prev)
   '("<escape>" . ignore))
  (meow-leader-define-key
   ;; SPC j/k will run the original command in MOTION state.
;;   '("j" . "H-j")
;;   '("k" . "H-k")

   ;; 常用
   ;;`("a" . ,help-map)
   ;;(cons "a" help-map)

   ;; == Buffer
   '("TAB" . meow-last-buffer)
   ;; switch buffer
   '("b b" . "C-x b")
   '("b d" . kill-this-buffer)

   ;; == Jump
   ;; imenu
   '("j i" . "M-g i")

   ;; == File
   ;; find file
   '("f f" . "C-x C-f")
   ;; save file
   '("f s" . "C-x C-s")
   '("f D" . mmx/delete-current-buffer-file)
   '("f R" . mmx/rename-current-buffer-file)

   ;; == Project
   '("p b" . counsel-projectile-switch-to-buffer)
   '("p f" . counsel-projectile-find-file)
   '("p p" . counsel-projectile-switch-project)

   ;; == Tags
   '("t j" . citre-jump)
   '("t J" . citre-jump-back)
   '("t p" . citre-ace-peek)
   '("t u" . citre-update-this-tags-file)

   ;; == Misc Tools
   '(", g" . eaf-open-git)
   '(", m" . magit-status)
   '(", r" . replace-regexp)
   '(", s" . flyspell-correct-wrapper)
   '(", t" . random-theme)

   ;; == Window
   '("w b" . split-window-below)
   '("w d" . delete-other-windows)
   '("w o" . other-window)

   ;; Use SPC (0-9) for digit arguments.
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)
   '("/" . meow-keypad-describe-key)
   '("?" . meow-cheatsheet))
  (meow-normal-define-key
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   '("a" . meow-append)
   '("A" . meow-open-below)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("d" . meow-delete)
   '("D" . meow-backward-delete)
   '("e" . meow-next-word)
   '("E" . meow-next-symbol)
   '("f" . meow-find)
   '("g" . meow-cancel-selection)
   '("G" . meow-grab)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-insert)
   '("I" . meow-open-above)
   '("j" . meow-next)
   '("J" . meow-next-expand)
   '("k" . meow-prev)
   '("K" . meow-prev-expand)
   '("l" . meow-right)
   '("L" . meow-right-expand)
   '("m" . meow-join)
   '("n" . meow-search)
   '("N" . mmx/open-two-below)
   '("o" . meow-block)
   '("O" . meow-to-block)
   '("p" . meow-yank)
   '("P" . mmx/open-two-above)
   '("q" . meow-quit)
   '("Q" . meow-goto-line)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)
   '("s" . meow-kill)
   '("t" . meow-till)
   '("u" . meow-undo)
   '("U" . meow-undo-in-selection)
   '("v" . meow-visit)
   '("w" . meow-mark-word)
   '("W" . meow-mark-symbol)
   '("x" . meow-line)
   '("X" . meow-goto-line)
   '("y" . meow-save)
   '("Y" . meow-sync-grab)
   '("z" . meow-pop-selection)
   '("'" . repeat)
   '("<escape>" . ignore)))

(meow-setup)
(meow-global-mode 1)

;; 延長提示
(setq meow-expand-hint-remove-delay 2)

;; fj 双击退出 INSERT
(key-chord-define-global "fj" 'meow-insert-exit)

(provide 'init-meow)
