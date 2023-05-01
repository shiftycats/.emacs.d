;; package-rg.el --- Search in files
;; https://github.com/dajva/rg.el


(use-package rg
  :custom
  (rg-custom-type-aliases '(("uc" . "*.uc"))) ; UnrealScript

  :config
  (rg-define-search rg-this-type-no-ignore
    :format regexp
    :dir project
    :files current
    :flags ("--word-regexp --no-ignore")
    :menu ("Custom" "1" "Project (this type, no ignore)")))


(provide 'package-rg)
