;; init-editor.el --- Editing settings and features


;; Use UTF-8 encoding
(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))
(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

;; Setting clipboard encoding to UTF-8 can cause issues on Windows. Let it use
;; the default enco (UTF-16).
;; https://rufflewind.com/2014-07-20/pasting-unicode-in-emacs-on-windows
(unless is-windows
  (setq selection-coding-system 'utf-8))


;; Indentation settings
(setq-default indent-tabs-mode nil) ; use spaces
(setq-default tab-width 2)


;; Auto-fill settings (breaking lines at certain width)
(defun my-auto-fill-only-comments-h ()
  (setq-local comment-auto-fill-only-comments t)
  (auto-fill-mode 1))

(add-hook 'prog-mode-hook #'my-auto-fill-only-comments-h)
(add-hook 'text-mode-hook #'auto-fill-mode)


;; Save cursor in files between sessions
(use-package saveplace
  :hook (after-init-hook . save-place-mode)
  :custom
  (save-place-file (expand-file-name "places" user-emacs-directory)))


;; Recent files
(use-package recentf
  :hook (after-init-hook . recentf-mode)
  :custom
  (recentf-max-menu-items 25))


(provide 'init-editor)
