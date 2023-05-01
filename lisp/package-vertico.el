;; package-vertico.el --- Emacs completion interface
;; https://github.com/minad/vertico


(use-package vertico
  :init
  (vertico-mode))


(use-package consult
  :after vertico)


(use-package vertico-prescient
  :after vertico
  :config
  (vertico-prescient-mode))


(provide 'package-vertico)
