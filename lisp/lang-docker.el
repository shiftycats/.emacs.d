;; lang-docker.el --- Docker modes


(use-package dockerfile-mode
  :mode ("\\Dockerfile\\'" . dockerfile-mode))


(use-package docker-compose-mode
  :mode ("\\docker-compose.yml\\'" . docker-compose-mode))


(provide 'lang-docker)
