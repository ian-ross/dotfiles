;;; -*- lexical-binding: t -*-
;;; init-git.el --- Things for working with Git.

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

;; Invoke Magit by typing C-c g, and you can thank me later.
;; See http://magit.github.io/ for instructions.
(use-package magit
  :commands magit-status
  :bind ("C-c g" . magit-status))

;; Use M-x gist-buffer or M-x gist-region to create a gist
;; directly from the current buffer or selection.
(use-package gist)

;; Mark uncommitted changes in the fringe.
(use-package git-gutter
  :config
  (global-git-gutter-mode t)
  (add-hook 'magit-post-refresh-hook
            #'git-gutter:update-all-windows)
  (set-face-foreground 'git-gutter:modified "steelblue")
  (set-face-foreground 'git-gutter:added "darkgreen")
  (set-face-foreground 'git-gutter:deleted "darkred")
  :diminish git-gutter-mode)

(use-package smerge-mode
  :config
  (defun sm-try-smerge ()
    (save-excursion
      (goto-char (point-min))
      (when (re-search-forward "^<<<<<<< " nil t)
        (smerge-mode 1))))
  (add-hook 'find-file-hook 'sm-try-smerge t))

(provide 'init-git)
