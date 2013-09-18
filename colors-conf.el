;; custom themes folder
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(load-theme 'tangotango t)

;; highlight current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#1C1F1F")

(provide 'colors-conf)
