;; init-display-startup-time.el


(defun my-display-startup-time ()
  "Display Emacs start up time"
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                   (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'my-display-startup-time)


(provide 'init-display-startup-time)
