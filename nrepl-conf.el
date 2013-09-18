;; enable eldoc in clojure buffers
(add-hook 'nrepl-interaction-mode-hook
          'nrepl-turn-on-eldoc-mode)

;; hide the *nrepl-connection* and *nrepl-server* buffers from appearing
(setq nrepl-hide-special-buffers t)

;; stop the error buffer from popping up while working
;; in buffers other than the REPL
(setq nrepl-popup-stacktraces nil)

;; change buffer name separator from space to "-"
(setq nrepl-buffer-name-separator "-")

;; hooks
(add-hook 'nrepl-mode-hook 'paredit-mode)
(add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)

(provide 'nrepl-conf)
