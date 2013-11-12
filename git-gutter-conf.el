(require 'git-gutter-fringe)

(global-git-gutter-mode t)

(setq git-gutter:window-width 2)
(setq git-gutter:lighter " G-+")

(set-face-foreground 'git-gutter-fr:modified "dodger blue")
(set-face-foreground 'git-gutter-fr:added    "#6ac214")
(set-face-foreground 'git-gutter-fr:deleted  "tomato")

(provide 'git-gutter-conf)
