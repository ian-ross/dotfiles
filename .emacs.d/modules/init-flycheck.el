;;; -*- lexical-binding: t -*-
;;; init-flycheck.el --- Spot all the errors.

;; Copyright (C) 2015 Bodil Stokke

;; Author: Bodil Stokke <bodil@bodil.org>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(require 'init-package)

;; Bind M-n and M-p to navigate to the next/previous errors.
(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-p") 'previous-error)

;; Install Flycheck.
(use-package flycheck
  :config
  ;; Start it automatically for all modes except ELisp mode,
  ;; where the linter is just designed to make you mad.
  (add-hook 'find-file-hook
            (lambda ()
              (when (not (equal 'emacs-lisp-mode major-mode))
                (flycheck-mode)))))

;; Turn the modeline red when Flycheck has errors.
(use-package flycheck-color-mode-line
  :config
  (with-eval-after-load "flycheck"
    (setq flycheck-highlighting-mode 'symbols)
    (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)))

(with-eval-after-load "helm"
  (use-package helm-flycheck
    :bind (("C-c ! !" . helm-flycheck))))


(provide 'init-flycheck)
