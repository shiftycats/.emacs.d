;; package-git-gutter.el --- Show line changes in the gutter
;; https://github.com/jisaacks/GitGutter


(use-package git-gutter
  :diminish

  :hook
  ((prog-mode-hook text-mode-hook) . git-gutter-mode)

  :custom
  (git-gutter:modified-sign "~")
  (git-gutter:update-interval 0)

  :general
  (my-leader-def
    "n" '(git-gutter:next-hunk :which-key "next hunk")
    "p" '(git-gutter:previous-hunk :which-key "prev hunk"))

  :config
  (add-to-list 'git-gutter:update-hooks 'magit-post-refresh-hook))


(provide 'package-git-gutter)
