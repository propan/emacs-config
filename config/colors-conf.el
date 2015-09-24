;; custom themes folder
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(load-theme 'tangotango t)

;; highlight current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#1C1F1F")

;; powerline configuration
(custom-set-faces
 '(mode-line ((t (:height 100 :foreground "#030303" :background "#edd400" :box nil))))
 '(mode-line-inactive ((t (:height 100 :foreground "#f9f9f9" :background "#666666" :box nil)))))

;;(setq powerline-color1 "#e5246f")
;;(setq powerline-color2 "#4a4a4a")

(provide 'colors-conf)
