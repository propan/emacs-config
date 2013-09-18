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

(require 'ac-nrepl)
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)

(eval-after-load "auto-complete"
   '(add-to-list 'ac-modes 'nrepl-mode))

;; emacs-live: specify the print length to be 100 to stop infinite sequences killing things.
(defun live-nrepl-set-print-length ()
  (nrepl-send-string-sync "(set! *print-length* 100)" "clojure.core"))

(add-hook 'nrepl-connected-hook 'live-nrepl-set-print-length)

(provide 'nrepl-conf)
