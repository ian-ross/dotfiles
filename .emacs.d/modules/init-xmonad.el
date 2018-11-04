(require 'init-package)

;; Make Ediff work nicely in XMonad.
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-grab-mouse nil)

(provide 'init-xmonad)
