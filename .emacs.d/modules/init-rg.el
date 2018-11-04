(require 'init-package)

(use-package rg
  :config
  (rg-enable-default-bindings (kbd "M-s")))

(provide 'init-rg)
