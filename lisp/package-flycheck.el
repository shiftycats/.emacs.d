;; package-flycheck.el --- Linter
;; https://github.com/flycheck/flycheck


(use-package flycheck
  :hook (prog-mode-hook . flycheck-mode)
  :custom
  (flycheck-check-syntax-automatically '(mode-enabled save))
  (flycheck-disabled-checkers '(emacs-lisp-checkdoc)))


(provide 'package-flycheck)
