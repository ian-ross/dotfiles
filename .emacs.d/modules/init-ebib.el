(require 'init-package)

(use-package ebib
  :commands ebib
  :bind ("C-c b" . ebib)
  :config
  (setq ebib-autogenerate-keys t)
  (setq ebib-bib-search-dirs (quote ("~/doc/bibtex")))
  (setq ebib-file-search-dirs (quote ("~/papers"))))

(provide 'init-ebib)
