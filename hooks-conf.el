;; automatic indentation on enter
(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))

;; line truncation mode
(defun set-truncate-lines ()
  (setq truncate-lines t))

;; do not ask, just save
(defun set-save-without-query ()
  (setq buffer-save-without-query t))

;; enable magic powers
(dolist (x '(scheme emacs-lisp lisp clojure emacs-interaction nrepl))
  (dolist (m '(paredit-mode set-truncate-lines         set-newline-and-indent
                            rainbow-delimiters-mode    set-save-without-query))
    (add-hook (intern (concat (symbol-name x) "-mode-hook")) m)))

;; auto-indent yanked code
(dolist (command '(yank yank-pop))
   (eval `(defadvice ,command (after indent-region activate)
            (and (not current-prefix-arg)
                 (member major-mode '(emacs-lisp-mode lisp-mode
                                                      clojure-mode    scheme-mode
                                                      haskell-mode    ruby-mode
                                                      rspec-mode      python-mode
                                                      c-mode          c++-mode
                                                      objc-mode       latex-mode
                                                      plain-tex-mode))
                 (let ((mark-even-if-inactive transient-mark-mode))
                   (indent-region (region-beginning) (region-end) nil))))))

(provide 'hooks-conf)






































