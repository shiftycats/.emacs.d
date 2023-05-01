;; lang-python.el --- Python mode


(use-package python
  :straight nil
  :mode ("[./]flake8\\'" . conf-mode)
  :mode ("/Pipfile\\'" . conf-mode))


(use-package anaconda-mode
  :hook (python-mode . anaconda-mode))


(use-package company-anaconda
  :requires (company anaconda-mode)
  :init
  (add-to-list 'company-backends 'company-anaconda))


(provide 'lang-python)
