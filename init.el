;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; update load path
(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))

(add-to-list 'load-path dotfiles-dir)

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(defvar my-packages '(clojure-mode
                      clojurescript-mode
                      clojure-test-mode
                      nrepl
		      paredit
                      rainbow-delimiters
		      css-mode))

(dolist (p my-packages)
      (when (not (package-installed-p p))
	          (package-install p)))

(require 'cl)
(require 'saveplace)
(require 'uniquify)

;; change identation to 4 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; Show line number
(global-linum-mode t)

;; Rainbow Delimiters
(global-rainbow-delimiters-mode)

(require 'custom-colors)
