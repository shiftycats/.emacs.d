;; package-ivy.el -- Emacs completion interface
;; https://github.com/abo-abo/swiper


(use-package ivy
  :diminish

  :hook (after-init-hook . ivy-mode)

  :custom
  (ivy-use-virtual-buffers t)
  (ivy-initial-inputs-alist nil)

  :general
  (:keymaps '(ivy-minibuffer-map ivy-switch-buffer-map)
    "C-j" 'ivy-next-line
    "C-k" 'ivy-previous-line)

  (:keymaps 'ivy-switch-buffer-map
    "C-c C-k" 'ivy-switch-buffer-kill)

  (my-leader-def
    "r" '(ivy-resume :which-key "ivy resume")
    "a" '(ivy-switch-buffer :which-key "switch buffer")))


(use-package counsel
  :after ivy
  :general
  (my-leader-def
    "A" '(counsel-recentf :which-key "recent files")
    "e" '(counsel-find-file :which-key "edit file")
    "d" '(rg-menu :which-key "rg")))


(use-package swiper
  :after ivy
  :general
  (my-leader-def "s" '(swiper :which-key "swiper")))


(use-package ivy-prescient
  :hook (ivy-mode-hook . ivy-prescient-mode)
  :custom
  (ivy-prescient-enable-sorting t)
  (ivy-prescient-enable-filtering t)
  (ivy-prescient-retain-classic-highlighting nil))


(provide 'package-ivy)
