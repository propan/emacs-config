;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode)(menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; update load path
(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path "~/.emacs.d/vendor/jade-mode")

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(defvar my-packages '(clojure-mode
                      clojurescript-mode
                      clojure-test-mode
                      fuzzy
                      auto-complete
                      nrepl
                      ac-nrepl
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

(require 'auto-complete-conf)
(require 'nrepl-conf)
(require 'colors-conf)
(require 'hooks-conf)
(require 'clojure-conf)

;; jade-mode configuration

(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

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
