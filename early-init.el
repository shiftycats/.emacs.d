;; early-init.el -*- coding: utf-8; lexical-binding: t; -*-


(setq
  package-enable-at-startup nil    ; don't load `package.el`
  inhibit-default-init t           ; don't load `default.el`
  inhibit-compacting-font-caches t ; performance boost
  inhibit-splash-screen t
  inhibit-startup-message t
  initial-major-mode 'fundamental-mode

  ;; Security hardening
  gnutls-verify-error t
  gnutls-min-prime-bits 3072
  gnutls-algorithm-priority "SECURE192:+SECURE128:-VERS-ALL:+VERS-TLS1.3:+VERS-TLS1.2"
  network-security-level 'high
  nsm-save-host-names t)


;; Disable UI elements
(mapc
  (lambda (item) (add-to-list 'default-frame-alist item))
  '((menu-bar-lines . nil)
    (tool-bar-lines . nil)
    (horizontal-scroll-bars . nil)
    (vertical-scroll-bars . nil)))


;; Disable bidirectional font rendering
(setq-default bidi-display-reordering 'left-to-right
              bidi-paragraph-direction 'left-to-right)


;; Windows I/O optimizations
(when (boundp 'w32-pipe-read-delay)
  (setq w32-pipe-read-delay 0))

(when (boundp 'w32-pipe-buffer-size)
  (setq w32-pipe-buffer-size (* 64 1024)))


;; Temporarily disable garbage collection to speed up boot time
(let ((default-gc-cons-threshold gc-cons-threshold))
  (setq gc-cons-threshold most-positive-fixnum)

  (defun my-reset-gc-cons-threshold ()
    "Reset `gc-cons-threshold` to its default value."
    (setq gc-cons-threshold default-gc-cons-threshold))

  (add-hook 'emacs-startup-hook #'my-reset-gc-cons-threshold))


;; Termporarily disable file name handlers to speed up boot time
(unless noninteractive
  (let ((default-file-name-handler-alist file-name-handler-alist))
    (setq file-name-handler-alist nil)

    (defun my-restore-file-name-handler-alist ()
      "Restore `file-name-handler-alist` while preserving any added handlers."

      (dolist (handler file-name-handler-alist)
        (add-to-list 'default-file-name-handler-alist handler)
        (setq file-name-handler-alist default-file-name-handler-alist)))

    (add-hook 'emacs-startup-hook #'my-restore-file-name-handler-alist)))
