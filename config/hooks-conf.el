;; line truncation mode
(defun set-truncate-lines ()
  (setq truncate-lines t))

;; do not ask, just save
(defun set-save-without-query ()
  (setq buffer-save-without-query t))

;; enable magic powers
(dolist (x '(scheme emacs-lisp lisp clojure clojurescript emacs-interaction cider-repl))
  (dolist (m '(paredit-mode set-truncate-lines rainbow-delimiters-mode set-save-without-query))
    (add-hook (intern (concat (symbol-name x) "-mode-hook")) m)))

;; clojure mode bindings
(add-hook 'clojure-mode-hook
	  (lambda ()
	    (define-key clojure-mode-map (kbd "RET") 'paredit-newline)
	    (define-key clojure-mode-map (kbd "C-M-z") 'align-cljlet)))

;; haskell mode hooks
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;; yaml-mode hooks
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; global aggressive indent
(global-aggressive-indent-mode 1)

(provide 'hooks-conf)
