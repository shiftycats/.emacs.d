;; init.el -*- lexical-binding: t -*-


;; Add `lisp` directory to the load path
(defvar my-lisp-dir (expand-file-name "lisp" user-emacs-directory)
  "Module directory. Default: `.emacs.d/lisp'")

(add-to-list 'load-path my-lisp-dir)


;; Load utilities
(require 'init-lib)


;; Set $HOME on Windows.
(when (and is-windows (null (getenv "HOME")))
  (setenv "HOME" (getenv "USERPROFILE")))


;; Bootstrap straight.el
(setq straight-use-package-by-default t
      straight-use-symlinks t
      straight-vc-git-default-clone-depth '(1 single-branch)
      straight-check-for-modifications '(check-on-save find-when-checking))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


;; Setup `use-package`
(straight-use-package 'use-package)
(setq use-package-hook-name-suffix nil)


;; Core packages
(use-package diminish)          ; hide minor mode icons
(require 'package-gcmh)         ; magit garbage collection
(require 'package-which-key)    ; key binding hints
(require 'package-general)      ; syntax sugar for keybindings
(require 'package-evil)         ; vim emulation

(require 'init-ui)              ; visuals (theme, fonts, etc.)
(require 'init-editor)          ; editor settings (indentation, encoding, etc.)
(require 'init-display-startup-time)
(require 'package-editorconfig) ; "per project" formatting


;; Completion
(require 'package-prescient)  ; filtering and sorting backend
(require 'package-ivy)        ; emacs completion
;; (require 'package-vertico)
(require 'package-company)    ; code completion
(require 'package-yasnippet)  ; snippets


;; Git
(require 'package-magit)      ; git interface
(require 'package-projectile) ; project management


;; Major modes
(require 'lang-elisp)
(require 'lang-python)
(require 'lang-haskell)
(require 'lang-csharp)
(require 'lang-uscript)
(require 'lang-docker)


;; Load `.emacs.d/custom.el`
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror 'nomessage)
