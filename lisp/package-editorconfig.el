;; package-editorconfig.el
;; https://github.com/editorconfig/editorconfig-emacs


(use-package editorconfig
  :diminish

  :hook ((text-mode-hook prog-mode-hook snippet-mode-hook) . editorconfig-mode)

  :config
  (add-hook 'editorconfig-hack-properties-functions
    #'(lambda (props)
        (when (derived-mode-p 'snippet-mode)
          (puthash 'indent_style "space" props)
          (puthash 'indent_size "4" props)
          (puthash 'insert_final_newline "false" props)))))


(provide 'package-editorconfig)
