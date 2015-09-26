(projectile-global-mode)

(setq projectile-completion-system 'grizzl
      projectile-mode-line         '(:eval (format " [%s]" (projectile-project-name))))

(provide 'projectile-conf)
