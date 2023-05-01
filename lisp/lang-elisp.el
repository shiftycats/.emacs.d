;; lang-elisp.el --- Emacs Lisp mode


(use-package emacs-lisp
  :straight nil
  :general
  (:states 'normal
    "K" '(my-describe-symbol-at-point :which-key "describe"))
  (my-mode-def
    :keymaps 'emacs-lisp-mode-map
    "e" '(:ignore t :which-key "EVAL [...]")
    "eb" '(eval-buffer :which-key "buffer")
    "ee" '(eval-last-sexp :which-key "sexp before point")
    "er" '(eval-last-sexp :which-key "region")))


(provide 'lang-elisp)
