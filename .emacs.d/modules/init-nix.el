;;; -*- lexical-binding: t -*-

(require 'init-package)
(require 'init-lib)

(use-package nix-mode
  :mode (("\\.nix$" . nix-mode)))

(provide 'init-nix)
