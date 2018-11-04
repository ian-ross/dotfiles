;;; -*- lexical-binding: t -*-
;;; init-haskell.el --- FIRE ALL MONAD TRANSFORMERS

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

;; (use-package dante
;;   :ensure t
;;   :after haskell-mode
;;   :commands 'dante-mode
;;   :init
;;   (add-hook 'haskell-mode-hook 'dante-mode)
;;   (add-hook 'haskell-mode-hook 'flycheck-mode)
;;   (set (make-local-variable 'flymake-no-changes-timeout) nil)
;;   (set (make-local-variable 'flymake-start-syntax-check-on-newline) nil)
;;   (set (make-local-variable 'flycheck-check-syntax-automatically) '(save mode-enabled)))

(use-package haskell-mode
  :commands haskell-mode
  :config
  ;; Setup haskell-mode hooks
  (custom-set-variables
   '(haskell-mode-hook
     '(turn-on-haskell-indentation
       turn-on-haskell-doc
       intero-mode))))

(use-package intero)


;; ;; Flycheck addons
;; (use-package flycheck-haskell
;;   :config
;;   (with-eval-after-load "flycheck"
;;     (with-eval-after-load "haskell"
;;       (add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))))


(provide 'init-haskell)
;;; init-haskell.el ends here
