(add-hook 'emacs-lisp-mode-hook 'display-line-numbers-mode)
(add-hook 'scheme-mode-hook 'display-line-numbers-mode)
(add-hook 'c-mode-hook 'display-line-numbers-mode)

(add-hook 'emacs-lisp-mode-hook 'whitespace-mode)
(add-hook 'scheme-mode-hook 'whitespace-mode)
(add-hook 'c-mode-hook 'whitespace-mode)

(require 'whitespace)
(set-face-attribute 'whitespace-space nil :background nil :foreground "gray30")
(set-face-attribute 'whitespace-tab nil :background nil :foreground "gray30")
(set-face-attribute 'whitespace-space-after-tab nil :background nil :foreground "gray30")
(add-hook 'c-mode-hook (lambda () (set-syntax-table c-mode-syntax-table)))

(global-unset-key (kbd "M-o"))
(global-unset-key (kbd "C-o"))
(global-set-key (kbd "M-o") 'new-previous-line)
(global-set-key (kbd "C-o") 'new-next-line)

(defun new-previous-line ()
  (interactive)
  (prelude-move-beginning-of-line nil)
  (newline-and-indent)
  (previous-line))

(defun new-next-line()
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

;; (defun mytest ()
;;   (interactive)
;;   (write-region (point-at-bol)
;;                 (- (point-at-eol) 2) "/home/EVERYOO/.emacs.d/custom/wangyin-scheme.el" t)
;;   (write-region "\n" nil "/home/EVERYOO/.emacs.d/custom/wangyin-scheme.el" t))

;; (defun mytest ()
;;   (interactive)
;;   (write-region (kill-ring-save (point-at-bol) (point-at-eol)) nil "/home/EVERYOO/.emacs.d/custom/wangyin-scheme.el" t)
;;   (write-region "\n" nil "/home/EVERYOO/.emacs.d/custom/wangyin-scheme.el" t))


(defun mytest ()
  (interactive)
  (let ((target_file "")))
  (write-region  (replace-regexp-in-string "\\().+?\\)$" ");"
                                           (buffer-substring-no-properties
                                            (point-at-bol)
                                            (point-at-eol))) nil "/home/EVERYOO/.emacs.d/custom/wangyin-scheme.el"
                                             t)
  (write-region "\n" nil (replace-regexp-in-string "\\..*" "" "Test.m") t))
(replace-regexp-in-string "\\..*" "" "Test.m")

(replace-regexp-in-string "\\().+?\\)$" ");"
                          (buffer-substring-no-properties
                           (point-at-bol)
                           (point-at-eol)))
;; (kill-ring-save (point-at-bol) (point-at-eol))

(provide 'myown)
