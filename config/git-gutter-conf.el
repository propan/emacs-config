(require 'git-gutter)

(global-git-gutter-mode +1)
(git-gutter:linum-setup)

(custom-set-variables
 '(git-gutter:update-interval 2)
 '(git-gutter:modified-sign "~")
 '(git-gutter:added-sign "+")
 '(git-gutter:deleted-sign "-"))

(setq git-gutter:lighter " +-")

(set-face-foreground 'git-gutter:modified "dodger blue")
(set-face-foreground 'git-gutter:added    "#6ac214")
(set-face-foreground 'git-gutter:deleted  "tomato")

(provide 'git-gutter-conf)
