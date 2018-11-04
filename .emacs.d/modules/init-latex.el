(require 'init-package)

(use-package tex-mode
  :config
  (setq latex-run-command "pdflatex")
  (setq tex-pdf-view-command "xpdf")
  (defun tex-pdf-view ()
    (interactive)
    (or tex-pdf-view-command
        (error "You must set `tex-pdf-view-command'"))
    (tex-send-command tex-pdf-view-command (tex-append tex-print-file ".pdf")))

  ;; Override the default DVI view, since we're going to use pdflatex
  ;; for everything....
  (define-key tex-mode-map "\C-c\C-v" 'tex-pdf-view)

  (defun flymake-get-tex-args (file-name)
    (list "pdflatex" (list "-file-line-error" "-draftmode"
                           "-interaction=nonstopmode" file-name))))

(provide 'init-latex)
