;; init-lib.el --- Utility library -*- lexical-binding: t -*-


(defconst is-windows (memq system-type '(ms-dos windows-nt))
  "If non-nil, Windows is the current OS.")


(defun my-reload-config ()
  "Reload `init.el'."
  (interactive)
  (load-file (expand-file-name "init.el" user-emacs-directory)))


(defun my-open-init-file ()
  "Open `user-init-file'."
  (interactive)
  (find-file user-init-file))


(defun my-rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
      (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
          ((vc-backend filename) (vc-rename-file filename new-name))
          (t
            (rename-file filename new-name t)
            (set-visited-file-name new-name t t)))))))


(defun my-last-buffer ()
  "Switch to previously open buffer."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))


(defun my-split-window-below-and-move ()
  "Switch to previously open buffer."
  (interactive)
  (split-window-below)
  (windmove-down))


(defun my-split-window-right-and-move ()
  "Switch to previously open buffer."
  (interactive)
  (split-window-right)
  (windmove-right))


(defun my-describe-symbol-at-point ()
  (interactive)
  (describe-symbol (or (symbol-at-point) (error "No symbol-at-point"))))


(defun my-auto-fill-only-comments ()
  (setq-local comment-auto-fill-only-comments t)
  (auto-fill-mode 1))


(provide 'init-lib)
