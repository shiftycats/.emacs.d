;; package-prescient.el --- Completion filtering and sorting
;; https://github.com/radian-software/prescient.el


(use-package prescient
  :demand t

  :custom
  (prescient-filter-method '(literal regexp))
  (prescient-sort-full-matches-first t)
  (prescient-use-case-folding 'smart)

  :config
  (prescient-persist-mode 1))


(provide 'package-prescient)
