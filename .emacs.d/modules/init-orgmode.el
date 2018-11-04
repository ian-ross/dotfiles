;;; -*- lexical-binding: t -*-
;;; init-orgmode.el --- Your personal everything manager.

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

(use-package org
  :ensure org-plus-contrib
  :config
  ;; Fancy bullet rendering.
  (use-package org-bullets
    :config
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
  ;; Insert links from clipboard.
  (use-package org-cliplink
    :config
    (with-eval-after-load "org"
      (define-key org-mode-map (kbd "C-c M-l") 'org-cliplink)))

  (setq org-agenda-files '("~/org/projects/Agon.org"
                           "~/org/projects/MobileApps.org"
                           "~/org/projects/habits.org"
                           "~/org/projects/NetCDF.org"
                           "~/org/todo.org"
                           "~/org/blogging.org"
                           "~/org/memcachier.org"
                           "~/org/gardening.org"
                           "~/org/reading.org"))

  (setq org-directory "~/org/")
  (setq org-default-notes-file (concat org-directory "/notes.org"))
  (setq org-capture-templates
        '(("t" "todo" entry (file "~/org/refile.org")
           "** TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
          ("r" "respond" entry (file "~/org/refile.org")
           "** TODO Respond to %:from on %:subject\n%U\n%a\n"
           :clock-in t :clock-resume t :immediate-finish t)
          ("n" "note" entry (file "~/org/refile.org")
           "** %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)))

  (setq org-log-done 'time)
  (setq org-todo-keywords
        '((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
          (sequence "BUG(b)" "KNOWNCAUSE(k!)" "|" "FIXED(f!)")
          (sequence "WAITING(w@/!)" "|" "CANCELLED(c@/!)" "PHONE")))
  (setq org-todo-state-tags-triggers
        '(("CANCELLED" ("cancelled" . t))
          ("WAITING" ("waiting" . t))
          (done ("waiting"))
          ("BUG" ("bug" . t))
          ("KNOWNCAUSE" ("knowncause" . t))
          ("FIXED" ("waiting") ("cancelled"))
          ("TODO" ("waiting") ("cancelled"))
          ("STARTED" ("waiting") ("cancelled"))
          ("DONE" ("waiting") ("cancelled"))))
  (setq org-todo-keyword-faces
        '(("TODO" :foreground "red" :weight bold)
          ("STARTED" :foreground "blue" :weight bold)
          ("DONE" :foreground "forest green" :weight bold)
          ("BUG" :foreground "red" :weight bold)
          ("KNOWNCAUSE" :foreground "blue" :weight bold)
          ("FIXED" :foreground "forest green" :weight bold)
          ("WAITING" :foreground "orange" :weight bold)
          ("CANCELLED" :foreground "forest green" :weight bold)
          ("PHONE" :foreground "forest green" :weight bold)))
  (setq org-enforce-todo-dependencies t)
  (setq org-use-fast-todo-selection t)

  (setq org-clock-into-drawer t)
  (setq org-clock-in-resume t)
  (setq org-clock-out-remove-zero-time-clocks t)
  (setq org-clock-out-when-done t)
  (setq org-clock-persist t)
  (setq org-clock-persist-query-resume nil)
  (setq org-clock-report-include-clocking-task t)
  (org-clock-persistence-insinuate)

  (setq org-archive-mark-done nil)
  (setq org-archive-location "%s_archive::* Archived Tasks")

  (defun org-clocktable-indent-string (level)
    (if (= level 1) ""
      (let ((str " "))
        (dotimes (k (1- level) str)
	  (setq str (concat "." str))))))
  (setq org-duration-format (quote h:mm)))

(provide 'init-orgmode)
