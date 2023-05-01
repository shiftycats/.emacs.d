;; init-which-key.el --- Key binding hints
;; https://github.com/justbur/emacs-which-key


(use-package which-key
  :diminish

  :custom
  (which-key-idle-delay 0.1)
  (which-key-idle-secondary-delay 0.05)

  :config
  (which-key-mode))


(provide 'package-which-key)
