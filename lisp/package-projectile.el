;; package-projectile.el -- Project management
;; https://github.com/bbatsov/projectile


(use-package projectile
  :hook (after-init-hook . projectile-mode)

  :custom
  (projectile-enable-caching t)
  (projectile-mode-line-prefix " P")

  :config
  ;; Enable alien indexing in Windows (requires `coreutils' installed)
  (when (and is-windows (executable-find "tr"))
          (setq projectile-indexing-method 'alien))

  (defvar my--projectile-ignore
    '(".git"
      "*.png"
      "*.gif"
      "*.tga"
      "*.bmp"
      "*.jpg"
      "*.jpeg"
      "*.ico"
      "*.wav"
      "*.ogg"
      "*.dll"
      "*.exe"

      ;; Unreal
      "*.u"
      "*.ucl"
      "*.dmp"
      "*.det"
      "*.det_utx"
      "*.vdf"
      "Animations"
      "Sounds"
      "StaticMeshes"
      "Textures"
      "Maps")
    "List of patterns for `projectile' to ignore")

  (when (executable-find "fd")
    (setq projectile-git-command (concat
                                   "fd . --color=never --no-ignore --type f -0 -H "
                                   (mapconcat
                                     (lambda(pattern)
                                       (concat "-E " pattern))
                                     my--projectile-ignore
                                     " "))
          projectile-generic-command projectile-git-command)))


(use-package counsel-projectile
  :hook (after-init-hook . counsel-projectile-mode)
  :general
  (my-open-def
    "p" '(counsel-projectile-switch-project :which-key "switch project"))
  (my-leader-def
    "f" '(counsel-projectile :which-key "project find")))


(provide 'package-projectile)
