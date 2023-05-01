;; lang-haskell.el --- Haskell mode


(use-package haskell-mode
  :mode ("\\.hs\\'" . haskell-mode)
  :config
  (setq haskell-stylish-on-save t
        haskell-mode-stylish-haskell-path "brittany"))


(use-package intero
  :hook (haskell-mode-hook . intero-mode)
  :general
  (my-mode-def
    :keymaps 'haskell-mode-map
    "r" '(intero-repl :which-key "REPL")
    "l" '(intero-repl-load :which-key "load")
    "e" '(intero-repl-eval-region :which-key "eval region")))


(provide 'lang-haskell)
