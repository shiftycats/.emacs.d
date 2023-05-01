;; package-company.el --- Code completion
;; https://github.com/company-mode/company-mode

(use-package company
  :diminish

  :hook (after-init-hook . global-company-mode)

  :custom
  (tab-always-indent 'complete)
  (company-idle-delay nil)
  (company-minimum-prefix-length 3)

  :general
  (:states 'insert
    "C-j" 'company-complete-common)

  (:keymaps 'company-active-map
    "<tab>" 'company-complete-selection
    "C-j" 'company-select-next
    "C-k" 'company-select-previous))


(use-package company-prescient
  :hook (company-mode-hook . company-prescient-mode))


(provide 'package-company)
