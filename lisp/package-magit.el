;; package-magit.el --- Git interface
;; https://github.com/magit/magit


(use-package magit
  :init
  ;; HACK: On Windows, Magit can't determine it's own version when being a sparse clone.
  ;; We override the magit-version function to keep it from complaining.
  ;; https://github.com/raxod502/straight.el/issues/480
  (when is-windows
    (advice-add #'magit-version :override #'ignore))

  :general
  ;; Exit trainsient on ESC press.
  (:keymaps '(transient-map transient-edit-map transient-sticky-map)
    "<escape>" 'transient-quit-one)
  (:keymaps 'transient-stick
    "<escape>" 'transient-quit-seq)
  (my-open-def
    "m" '(magit :which-key "magit")))


(use-package magit-gitflow
  :after magit
  :hook (magit-mode-hook . turn-on-magit-gitflow))


(provide 'package-magit)
