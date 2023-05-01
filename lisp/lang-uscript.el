;; lang-uscript.el --- UnrealScript mode


(use-package uscript
  :straight nil

  :init
  (define-derived-mode uscript-mode csharp-mode
    "UnrealScript")

  :mode ("\\.uc\\'" . uscript-mode))


(provide 'lang-uscript)
