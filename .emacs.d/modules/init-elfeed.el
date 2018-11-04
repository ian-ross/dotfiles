(require 'init-package)

(use-package elfeed
  :bind ("C-c f" . elfeed)
  :config
  (defface elfeed-jobs-face
    '((((class color) (background light)) (:foreground "#2a5e26")))
    "Face for jobs in feed reader")
  (add-to-list 'elfeed-search-face-alist '(jobs elfeed-jobs-face)))

(use-package elfeed-goodies
  :config
  (elfeed-goodies/setup))

(use-package elfeed-org
  :config
  (setq rmh-elfeed-org-files (list "~/.emacs.d/elfeed.org"))
  (elfeed-org))

(provide 'init-elfeed)
