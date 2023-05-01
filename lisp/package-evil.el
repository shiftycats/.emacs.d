;; init-evil.el --- Vim emulation
;; https://github.com/emacs-evil/evil


(use-package evil
  :diminish undo-tree-mode

  :hook (after-init-hook . evil-mode)

  :custom
  (evil-want-keybinding nil)
  (evil-want-fine-undo t)
  (evil-shift-width 2)

  :config
  (setq evil-emacs-state-modes (delq 'ibuffer-mode evil-emacs-state-modes))

  (defun my-evil-shift-left-visual ()
    (interactive)
    (call-interactively 'evil-shift-left)
    (evil-normal-state)
    (evil-visual-restore))

  (defun my-evil-shift-right-visual ()
    (interactive)
    (call-interactively 'evil-shift-right)
    (evil-normal-state)
    (evil-visual-restore))

  :general
  (:states 'visual
    "<" 'my-evil-shift-left-visual
    ">" 'my-evil-shift-right-visual)

  (:states 'insert
    "TAB" 'tab-to-tab-stop)

  ;; Add key bindings to the leader
  (my-leader-def
    ;; Buffer controls
    "TAB" '(my-last-buffer :which-key "last buffer")
    "q" '(evil-prev-buffer :which-key "prev buffer")
    "w" '(evil-next-buffer :which-key "next buffer")

    ;; Window controls
    "u" '(:ignore t :which-key "WINDOW")
    "ui" '(my-split-window-right-and-move :which-key "split right")
    "uu" '(my-split-window-below-and-move :which-key "split down")
    "y" '(delete-window :which-key "delete window")

    ;; Config shortcuts
    "R" '(my-reload-config :which-key "reload config")
    "C" '(my-open-init-file :which-key "edit config")))


(use-package evil-collection
  :hook (evil-mode-hook . evil-collection-init))


(use-package evil-commentary
  :hook (evil-mode-hook . evil-commentary-mode))


(use-package evil-surround
  :hook (evil-mode-hook . global-evil-surround-mode))


(provide 'package-evil)
