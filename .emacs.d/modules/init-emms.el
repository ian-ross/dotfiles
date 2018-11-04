(require 'init-package)

(use-package emms
  :config
  (require 'emms-setup)
  (emms-all)
  (emms-default-players)
  (setq emms-source-file-default-directory "/big/music")
  (setq emms-player-list (quote (emms-player-mplayer))))

(provide 'init-emms)
