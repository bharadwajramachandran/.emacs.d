;; Bharadwaj Ramachandran, 2016
;; https://github.com/bharadwajramachandran

;; Set line length with M-q
(setq-default fill-column 100)

;; Tabness is badness
(setq-default indent-tabs-mode nil)
(setq tab-width 4)

;; Keeps parens organized
(show-paren-mode 1)

;; No trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Package management
(require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; yasnippet
(add-to-list 'load-path "~/path-to-yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;; go mode
(require 'go-mode-autoloads)
(add-hook 'before-save-hook #'gofmt-before-save)

(provide 'init-go)

;; haskell-mode
(load "haskell-mode/haskell-site-file")
(setq haskell-font-lock-symbols 'unicode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(provide 'init-haskell)

;; html mode
(add-hook 'html-mode-hook
          (lambda()
            (setq sgml-basic-offset 4)
            (local-set-key "\r" 'newline-and-indent)
            (setq indent-tabs-mode nil)))

(provide 'init-html)

(require 'package)
(add-to-list 'package-archives' ("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;; c mode
(require 'cc-mode)
(add-to-list 'auto-mode-alist '("\\.cl$" . c-mode))
(add-to-list 'auto-mode-alist '("\\.cu$" . c-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
(add-hook 'c-mode-common-hook (
    lambda ()
        (c-set-style "linux")
        (setq c-basic-offset 4
                tab-width 4
                  indent-tabs-mode nil)))

(provide 'init-c)
