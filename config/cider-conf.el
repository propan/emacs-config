(setq cider-lein-command "/usr/local/bin/lein")

;; hide the *nrepl-connection* and *nrepl-server* buffers
(setq nrepl-hide-special-buffers t)

;; stop the error buffer from popping up while working
;; in buffers other than the REPL
(setq cider-popup-stacktraces nil)

;; change buffer name separator from space to "-"
(setq nrepl-buffer-name-separator "-")

(provide 'cider-conf)
