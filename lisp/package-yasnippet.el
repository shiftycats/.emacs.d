;; package-yasnippet.el --- Snippets
;; https://github.com/joaotavora/yasnippet


(use-package yasnippet
  :hook (prog-mode-hook . yas-minor-mode)

  :custom
  (yas-indent-line 'fixed)

  :config
  (append yas-snippet-dirs (expand-file-name "snippets" user-emacs-directory))
  (yas-reload-all))


(provide 'package-yasnippet)
