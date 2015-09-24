(require 'auto-complete)
(require 'auto-complete-config)

(ac-config-default)

(global-auto-complete-mode t)

;; enable completion by fuzzy matching
(setq ac-fuzzy-complete t)
;; start completion after 2 symbols
(setq ac-auto-start 2)
;; limit completetion menu by 10 lines
(setq ac-menu-height 10)
;; help configuration
(setq ac-quick-help-delay 0.5)
(setq ac-quick-help-height 60)

(setq ac-auto-show-menu t)
(setq ac-show-menu-immediately-on-auto-complete t)

;; enabled modes
(dolist (mode '(magit-log-edit-mode log-edit-mode text-mode
                sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                html-mode nxml-mode sh-mode smarty-mode clojure-mode
                lisp-mode textile-mode markdown-mode))
  (add-to-list 'ac-modes mode))

;; key bindings
(global-set-key (kbd "<C-tab>") 'auto-complete)

(provide 'auto-complete-conf)
