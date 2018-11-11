;;; -*- lexical-binding: t -*-
;;; init.el --- This is where all emacs start.

;; Copyright (C) 2015 Bodil Stokke, 2018 Ian Ross

;; Author: Bodil Stokke <bodil@bodil.org> (modified from ohai-emacs).

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

(package-initialize)

(setq inhibit-startup-message t)

(defvar dotfiles-dir
  (file-name-directory
   (or (buffer-file-name) (file-chase-links load-file-name))))
(add-to-list 'load-path (concat dotfiles-dir "lib"))
(add-to-list 'load-path (concat dotfiles-dir "modules"))
(setq custom-file "~/.emacs-custom.el")
(load custom-file 'noerror)

(require 'init-lib)
(require 'init-package)
(require 'init-module-index)
(require 'init-set-path)

(init/load-modules)
(load custom-file 'noerror)
(load (concat dotfiles-dir "global-bindings.el") 'noerror)
(load (concat dotfiles-dir "windows.el") 'noerror)
(put 'upcase-region 'disabled nil)
