;; package-gcmh.el --- Magic garbage collection
;; https://github.com/emacsmirror/gcmh

(use-package gcmh
  :diminish

  :straight (:host github
             :repo "emacsmirror/gcmh")

  :hook (emacs-startup-hook . gcmh-mode)

  :custom (gcmh-verbose t))


(provide 'package-gcmh)
