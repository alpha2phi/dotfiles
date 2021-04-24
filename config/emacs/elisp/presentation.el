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


(provide 'presentation)
;;; presentation.el ends here
