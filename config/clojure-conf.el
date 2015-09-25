;; bits of internal beauty

(dolist (mode '(clojure-mode))
  (eval-after-load mode
    '(font-lock-add-keywords
      mode `(("(\\(fn\\)[\[[:space:]]"
              (0 (progn (compose-region (match-beginning 1)
                                        (match-end 1) "λ")
                        nil))))))

  (eval-after-load mode
    '(font-lock-add-keywords
      mode `(("\\(#\\)("
              (0 (progn (compose-region (match-beginning 1)
                                        (match-end 1) "ƒ")
                        nil))))))
  
  (eval-after-load mode
    '(font-lock-add-keywords
      mode `(("\\(#\\){"
              (0 (progn (compose-region (match-beginning 1)
                                        (match-end 1) "∈")
                        nil)))))))

(eval-after-load 'find-file-in-project
  '(add-to-list 'ffip-patterns "*.clj"))

(provide 'clojure-conf)
