;;; -*- lexical-binding: t -*-
;;; init-module-index.el --- The index of available Ohai Emacs modules.

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

(defvar init/modules
 '(init-appearance
   init-fonts
   init-general
   ;; init-ido
   init-navigation
   init-editing
   init-complete
   init-snippets
   init-codestyle
   init-dired
   init-project
   init-flycheck
   init-git
   init-orgmode
   init-help
   init-elisp
   init-helm
   init-eshell
   init-smart-mode-line
   init-lsp
   init-html
   init-markdown
   init-js-web-mode
   init-purescript
   init-haskell
   init-rust
   init-localisation
   init-ebib
   init-latex
   init-elfeed
   init-go
   init-xmonad
   init-rg
   init-emms
   init-nix
;;   init-urweb
   ))

(defun init/load-modules ()
  (interactive)
  (dolist (module init/modules) (require module nil t))
  (run-hooks 'init/modules-loaded-hook))

(provide 'init-module-index)
;;; init-module-index.el ends here
