;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; update load path
(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/vendor/jade-mode")
(add-to-list 'load-path "~/.emacs.d/vendor/align-cljlet")
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(add-to-list 'load-path "~/.emacs.d/vendor/cider")

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(defvar my-packages '(dash
                      clojure-mode
                      clojurescript-mode
                      clojure-test-mode
                      fuzzy
                      auto-complete
                      git-gutter
                      fringe-helper
                      git-gutter-fringe
                      paredit
                      pkg-info
                      rainbow-delimiters
                      css-mode
                      haskell-mode))

(dolist (p my-packages)
      (when (not (package-installed-p p))
          (package-install p)))

(require 'cl)
(require 'cider)
(require 'saveplace)
(require 'uniquify)
(require 'powerline)

;; change identation to 4 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; show line number
(global-linum-mode t)

;; rainbow delimiters
(global-rainbow-delimiters-mode)

;; setup dirs
(setq
 tmp-dir       (file-name-as-directory "~/.emacs.d/tmp/")
 autosaves-dir (file-name-as-directory (concat tmp-dir  "autosaves"))
 backups-dir   (file-name-as-directory (concat tmp-dir  "backups")))

;; create tmp dirs if necessary
(make-directory tmp-dir t)
(make-directory autosaves-dir t)
(make-directory backups-dir t)

;; configs
(require 'auto-complete-conf)
(require 'backup-dir-conf)
(require 'colors-conf)
(require 'cider-conf)
(require 'hooks-conf)
(require 'clojure-conf)
(require 'bindings-conf)
(require 'align-cljlet)
(require 'git-gutter-conf)

;; hightlight HEX-colors in css
(require 'live-fontify-hex)
(font-lock-add-keywords 'css-mode
                        '((live-fontify-hex-colors)))

;; yaml-mode configuraion
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; jade-mode configuration

(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))
(add-to-list 'auto-mode-alist '("\\.cljx$" . clojure-mode))

;; other important stuff
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

(setq quotes-list
      (list  "It is sometimes an appropriate response to reality to go insane. Philip K. Dick"
             "Reality is that which, when you stop believing in it, doesn't go away. Philip K. Dick"
             "If you think this Universe is bad, you should see some of the others. Philip K Dick"
             "If this isn't nice, what is? Kurt Vonnegut"))

(defun welcome-message ()
    (nth (random (length quotes-list)) quotes-list))

(setq initial-scratch-message (concat ";;
;; " (welcome-message) "
;;
"))
