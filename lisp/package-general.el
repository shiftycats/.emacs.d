;; init-general.el --- Syntax sugar for binding keys
;; https://github.com/noctuid/general.el


(use-package general
  :init
  (defvar my-leader-prefix "SPC"
    "The leader key.")

  (defvar my-leader-keymaps '(normal visual motion)
    "Keymaps where the leader key is defined.")

  :config
  (general-evil-setup t)

  (general-def
    :keymaps 'override
    [escape] 'keyboard-escape-quit)

  (general-create-definer my-leader-def
    :states my-leader-keymaps
    :keymaps 'override
    :prefix my-leader-prefix)

  ;; Definer for LEADER-M (major mode specific commands)
  (general-create-definer my-mode-def
    :states my-leader-keymaps
    :keymaps 'override
    :prefix (concat my-leader-prefix " m"))

  ;; Definer for LEADER-O (open...)
  (general-create-definer my-open-def
    :states my-leader-keymaps
    :keymaps 'override
    :prefix (concat my-leader-prefix " o"))

  (my-leader-def
    "" nil
    "m" '(:ignore t :which-key "MODE")
    "o" '(:ignore t :which-key "OPEN")))


(provide 'package-general)
