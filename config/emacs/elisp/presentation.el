;;; presentation.el --- Presentation
;;; Commentary:
;;; Presentation


;;; Code:

(use-package org-tree-slide
  :custom
  (org-tree-slide-slide-in-effect t)
  (org-tree-slide-activate-message "Presentation started!")
  (org-tree-slide-deactivate-message "Presentation finished!")
  (org-tree-slide-header t)
  (org-tree-slide-breadcrumbs " > ")
  (org-tree-slide-skip-outline-level 0)
  (org-image-actual-width nil))

(use-package ox-reveal
  :custom
  (org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")
  (org-reveal-mathjax t)

)
;; for syntax highlightng
(use-package htmlize)

(defun alpha2phi/org-present-prepare-slide ()
  "Prepare slide."
  (org-overview)
  (org-show-entry)
  (org-show-children))

(defun alpha2phi/org-present-prev ()
  "Previous slide."
  (interactive)
  (org-present-prev)
  (alpha2phi/org-present-prepare-slide))

(defun alpha2phi/org-present-next ()
  "Next slide."
  (interactive)
  (org-present-next)
  (alpha2phi/org-present-prepare-slide))

(use-package org-present
  :bind (:map org-present-mode-keymap
         ("C-c C-j" . alpha2phi/org-present-next)
         ("C-c C-k" . alpha2phi/org-present-prev))
  :hook (
	 (org-present-mode . (lambda ()
                 (org-present-big)
                 (org-display-inline-images)
                 (org-present-hide-cursor)
                 (org-present-read-only)))
         (org-present-mode-quit . (lambda ()
                 (org-present-small)
                 (org-remove-inline-images)
                 (org-present-show-cursor)
                 (org-present-read-write)))
	))

(provide 'presentation)
;;; presentation.el ends here
