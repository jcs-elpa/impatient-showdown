;;; impatient-showdown.el --- Preview markdown buffer live over HTTP  -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Shen, Jen-Chieh
;; Created date 2020-08-31 16:08:08

;; Author: Shen, Jen-Chieh <jcs090218@gmail.com>
;; Description: Preview markdown buffer live over HTTP.
;; Keyword: live preview markdown http server impatient
;; Version: 0.0.1
;; Package-Requires: ((emacs "24.3") (impatient-mode "1.1"))
;; URL: https://github.com/jcs-elpa/impatient-showdown

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Preview markdown buffer live over HTTP.
;;

;;; Code:

(require 'impatient-mode)

(defgroup impatient-showdown nil
  "Preview markdown buffer live over HTTP."
  :prefix "impatient-showdown-"
  :group 'tool
  :link '(url-link :tag "Repository" "https://github.com/jcs-elpa/impatient-showdown"))

(defconst impatient-showdown--home-dir (file-name-directory load-file-name)
  "`impatient-showdown' home directory.")

(defconst impatient-showdown--preview-template
  (expand-file-name "preview.html" impatient-showdown--home-dir)
  "`impatient-showdown' html preview template.")

(defcustom impatient-showdown-scripts
  '("https://cdnjs.cloudflare.com/ajax/libs/showdown/1.9.1/showdown.min.js"
    "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.18.3/highlight.min.js"
    "https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.17.1/build/highlight.min.js")
  "File path for showdown highlight."
  :type 'list
  :group 'impatient-showdown)

(defcustom impatient-showdown-links
  '("https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.18.3/styles/github-gist.min.css")
  "File path for showdown highlight."
  :type 'list
  :group 'impatient-showdown)

;;; Util

(defun impatient-showdown--get-string-from-file (path)
  "Return PATH file content."
  (with-temp-buffer
    (insert-file-contents path)
    (buffer-string)))

(defun impatient-showdown--form-script-tag (url)
  "Form a script tag by URL."
  (format "<script src=\"%s\"></script>" url))

(defun impatient-showdown--form-link-tag (url)
  "Form a link tag by URL."
  (format "<link rel=\"stylesheet\" href=\"%s\" />" url))

(defun impatient-showdown--form-script-tags (url-lst)
  "Form list of script tag by URL-LST."
  (let ((tags ""))
    (dolist (url url-lst)
      (setq tags (concat tags (impatient-showdown--form-script-tag url))))
    tags))

(defun impatient-showdown--form-link-tags (url-lst)
  "Form list of link tag by URL-LST."
  (let ((tags ""))
    (dolist (url url-lst)
      (setq tags (concat tags (impatient-showdown--form-link-tag url))))
    tags))

;;; Core

(defun impatient-showdown--buffer-filter (buf)
  "Impatient buffer filter for Markdown file."
  (princ
   (with-temp-buffer
     (set-buffer buf)
     (let ((preview-str (impatient-showdown--get-string-from-file impatient-showdown--preview-template)))
       (format preview-str (buffer-string)
               (impatient-showdown--form-script-tags impatient-showdown-scripts)
               (impatient-showdown--form-link-tags impatient-showdown-links))))
   (current-buffer)))

(defun impatient-showdown--start ()
  "Start real time editing with default port."
  (unless (process-status "httpd") (httpd-start))
  (impatient-mode 1)
  (imp-set-user-filter 'impatient-showdown--buffer-filter)
  (imp-visit-buffer))

(defun impatient-showdown--stop ()
  "Shutdown real time editing with default port."
  (httpd-stop)
  (impatient-mode -1))

;;;###autoload
(define-minor-mode impatient-showdown-mode
  "Minor mode 'impatient-showdown-mode'."
  :lighter " IS"
  :group impatient-showdown
  (if impatient-showdown-mode (impatient-showdown--start) (impatient-showdown--stop)))

(provide 'impatient-showdown)
;;; impatient-showdown.el ends here
