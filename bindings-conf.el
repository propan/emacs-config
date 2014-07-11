(global-set-key (kbd "C-x M-c") 'kill-emacs)

;;
;; Code origin: http://unix.stackexchange.com/questions/29786/font-size-issues-with-emacs-in-linum-mode/
;;

(setq text-scale-mode-step 1.04)
;; List: `Sub-Zoom Font Heights per text-scale-mode-step`
(defvar sub-zoom-ht (list 130 120 120 110 100 100 90 80 80 80 80 70 70 60 60 50 50 50 40 40 40 30 20 20 20 20 20 20 10 10 10 10 10 10 10 10 10 10 5 5 5 5 5 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1 1 1))
(defvar sub-zoom-len (safe-length sub-zoom-ht))
(defvar def-zoom-ht (car sub-zoom-ht))
(set-face-attribute 'default nil :height def-zoom-ht)

(defun text-scale-decrease-zAp ()
  (interactive)
  (if (not (boundp 'text-scale-mode-amount)) ;; first-time init
      (setq  text-scale-mode-amount 0))
  (setq text-scale (round (/ (* 1 text-scale-mode-amount)
                             text-scale-mode-step)))
  (if (> text-scale (- 1 sub-zoom-len))
      (progn
        (text-scale-decrease text-scale-mode-step)
        (if (<= 0 text-scale-mode-amount)
            (set-face-attribute 'linum nil :height def-zoom-ht)
          (if (> 0 text-scale-mode-amount)
              (set-face-attribute 'linum nil :height
                                  (elt sub-zoom-ht (- 0 text-scale))))))))

(defun text-scale-increase-zAp ()
  (interactive)
  (if (not (boundp 'text-scale-mode-amount)) ;; first-time init
      (setq  text-scale-mode-amount 0))
  (setq text-scale (round (/ (* 1 text-scale-mode-amount)
                             text-scale-mode-step)))
  (if (< text-scale 85)
      (progn
        (text-scale-increase text-scale-mode-step)
        (if (< (- 0 text-scale-mode-step) text-scale-mode-amount)
            (set-face-attribute 'linum nil :height def-zoom-ht)
          (if (> 0 text-scale-mode-amount)
              (set-face-attribute 'linum nil :height
                                  (elt sub-zoom-ht (- 0 text-scale))))))))

(global-set-key (kbd "C-+") 'text-scale-increase-zAp)
(global-set-key (kbd "C--") 'text-scale-decrease-zAp)

(provide 'bindings-conf)
