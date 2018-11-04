(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(confirm-kill-emacs (quote yes-or-no-p))
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" default)))
 '(dante-project-root "~/memcachier/code/townhall")
 '(dante-repl-command-line-methods-alist
   (quote
    ((styx .
           #[257 "\300\301\302#\207"
                 [dante-repl-by-file
                  ("styx.yaml")
                  ("styx" "repl" dante-target)]
                 5 "

(fn ROOT)"])
     (nix .
          #[257 "\300\301\302#\207"
                [dante-repl-by-file
                 ("shell.nix" "default.nix")
                 ("nix-shell" "--attr" "env" "--run"
                  (concat "cabal repl "
                          (or dante-target "")
                          " --builddir=dist/dante"))]
                5 "

(fn ROOT)"])
     (stack .
            #[257 "\300\301\302#\207"
                  [dante-repl-by-file
                   ("stack.yaml")
                   ("stack" "repl" dante-target)]
                  5 "

(fn ROOT)"])
     (mafia .
            #[257 "\300\301\302#\207"
                  [dante-repl-by-file
                   ("mafia")
                   ("mafia" "repl" dante-target)]
                  5 "

(fn ROOT)"])
     (new-build .
                #[257 "\300\301\302#\204 \303\304!\205 \305\207"
                      [directory-files nil ".+\\.cabal$" file-exists-p "cabal.project"
                                       ("cabal" "new-repl" dante-target "--builddir=dist/dante")]
                      5 "

(fn ROOT)"])
     (bare .
           #[257 "\300\207"
                 [("cabal" "repl" dante-target "--builddir=dist/dante")]
                 2 "

(fn _)"]))))
 '(dante-target "mc-bootstrap")
 '(haskell-mode-hook (quote (turn-on-haskell-indentation turn-on-haskell-doc)) t)
 '(package-selected-packages
   (quote
    (company-go go-eldoc go-mode vue-mode ess dante nix-mode latex-preview-pane elfeed-org emms floobits exec-path-from-shell f use-package paradox hydra))))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white smoke" :foreground "dim gray" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "unknown" :family "Source Code Pro"))))
 '(flymake-errline ((((class color)) (:underline "red"))) t)
 '(flymake-warnline ((((class color)) (:underline "orange"))) t)
 '(mode-line ((t (:background "light gray" :inverse-video nil))))
 '(mode-line-inactive ((t (:background "dark gray" :inverse-video nil))))
 '(org-column ((t (:background "grey90" :strike-through nil :underline nil :slant normal :weight normal :height 113 :family "Monaco"))))
 '(outline-1 ((t (:inherit default :foreground "dark blue" :weight bold :height 1.25))))
 '(outline-2 ((t (:inherit default :foreground "dark goldenrod" :weight bold :height 1.1))))
 '(show-paren-match ((t (:background "khaki"))))
 '(web-mode-html-attr-name-face ((t (:foreground "saddle brown"))))
 '(web-mode-html-tag-face ((t (:foreground "forest green" :weight bold))))
 '(web-mode-symbol-face ((t (:foreground "dark orange")))))
