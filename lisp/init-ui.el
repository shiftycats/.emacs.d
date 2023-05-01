;; init-ui.el --- Emacs look and feel


;; Font
(add-to-list 'default-frame-alist '(font . "Hack-10"))


;; Main theme
(use-package kaolin-themes
  :demand t
  :config
  (load-theme 'kaolin-temple t))


;; Use color-coded parentheses
(use-package rainbow-delimiters
  :hook (prog-mode-hook . rainbow-delimiters-mode)

  :config
  ;; Make delimeters bold
  (mapc
    (lambda (face) (set-face-bold face t))
    '(rainbow-delimiters-depth-1-face
      rainbow-delimiters-depth-2-face
      rainbow-delimiters-depth-3-face
      rainbow-delimiters-depth-4-face
      rainbow-delimiters-depth-5-face
      rainbow-delimiters-depth-6-face
      rainbow-delimiters-depth-7-face
      rainbow-delimiters-depth-8-face
      rainbow-delimiters-depth-9-face)))


;; Show indent guides
(use-package highlight-indent-guides
  :hook (prog-mode-hook . highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-method 'bitmap))


;; Highlight the line under the cursor
(global-hl-line-mode)


;; Change prompts to y/n
(defalias 'yes-or-no-p 'y-or-n-p)


;; Clickable URLs in text files
(add-hook 'text-mode-hook 'goto-address-mode)


;; Show temporary buffers as popup windows
(use-package popwin
  :demand t
  :config
  (popwin-mode 1))


(provide 'init-ui)
