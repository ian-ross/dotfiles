;;; -*- lexical-binding: t -*-
;;; init-fonts.el --- On-the-fly font size adjustment.

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

(require 'init-lib)

(defun init-fonts/spec-to-list (spec)
  (s-split "-" spec))

(defun init-fonts/list-to-spec (spec)
  (s-join "-" spec))

(defun init-fonts/update-font-spec-size (spec increment)
  (init-fonts/list-to-spec
   (-update-at 7 (lambda (i) (number-to-string
                              (+ (string-to-number i) increment)))
               (init-fonts/spec-to-list spec))))

(defun init-fonts/update-font-size (increment)
  (set-frame-font
   (init-fonts/update-font-spec-size (frame-parameter nil 'font) increment)))

(global-set-key (kbd "C-M--") (lambda () (interactive)
                                (init-fonts/update-font-size -1)))
(global-set-key (kbd "C-M-=") (lambda () (interactive)
                                (init-fonts/update-font-size 1)))

(provide 'init-fonts)
;;; init-fonts.el ends here
