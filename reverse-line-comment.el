(defun my/comment-line-right ()
  "comment line and align it to the right hand side"
  (interactive)
  (let (mp p1 p2)
    (if (region-active-p)
        (progn (setq p1 (region-beginning))
               (setq p2 (region-end)))
      (progn
        (back-to-indentation)
        (setq p1 (point))
        (setq p2 (line-end-position))))

    (save-excursion
      (let (charCnt)
        (back-to-indentation)
        (setq mp (point))
        (setq charCnt ( - p2 p1 ))
        (insert-char ?\; 2)
        (setq charCnt (- p2 p1))
        (while (< (current-column) ( - 80 charCnt ))
          (insert-char ?_))
        ))))
