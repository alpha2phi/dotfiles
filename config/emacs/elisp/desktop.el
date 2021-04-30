;;; desktop.el --- Desktop management
;;; Commentary:
;;; Desktop management

;;; Code:
(use-package eaf
  :load-path "~/.config/emacs/emacs-application-framework" 
  :init
  (use-package epc :defer t :ensure t)
  (use-package ctable :defer t :ensure t)
  (use-package deferred :defer t :ensure t)
  (use-package s :defer t :ensure t)
  :custom
  (eaf-browser-continue-where-left-off t)
  :config
  (eaf-setq eaf-browser-enable-adblocker "true")
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  (eaf-bind-key take_photo "p" eaf-camera-keybinding)
  (eaf-bind-key nil "M-q" eaf-browser-keybinding)) 

(defun adviser-find-file (orig-fn file &rest args)
  (let ((fn (if (commandp 'eaf-open) 'eaf-open orig-fn)))
    (pcase (file-name-extension file)
      ("pdf"  (apply fn file nil))
      ("epub" (apply fn file nil))
      (_      (apply orig-fn file args)))))
(advice-add #'find-file :around #'adviser-find-file)

(provide 'desktop)
;;; desktop.el ends here
