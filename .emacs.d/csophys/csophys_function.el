(provide 'csophys_function)


(defun os_tramp()
(cond
 ((eq system-type 'windows-nt)
  (setq tramp-default-method "plink"
        tramp-password-end-of-line "\r\n"))
 ((eq system-type 'gnu/linux)
  (setq tramp-default-method "ssh")))
)

;;输入当前日期insert-date方法
 (defun insert-date ()
    "Inserts standard date time string." 
    (interactive)
    (insert (format-time-string "%c")))

;;;;用f9追踪elisp函数或变量声明位置
(define-key global-map (kbd "C-c j") 'find-tag-at-point)

(defun find-tag-at-point ()
  "Find variable or function at point."
  (interactive)
  (let ((variable (variable-at-point))
        (function (function-called-at-point)))
    (if (equal variable 0)
        (if function
            (find-function-do-it function nil 'switch-to-buffer)
		  (find-file-at-point)))
	(find-variable-at-point)))

;;;;;;;;;;;;;配置只能书签候选形式
(defun bookmark-ido-read()
(interactive)
(bookmark-maybe-load-default-file)
(let ((choise (ido-completing-read ">" bookmark-alist )))
(bookmark-jump choise)))
(define-key global-map (kbd "C-x rb") 'bookmark-ido-read)


;;;;;;;;;;配置c语言的编译器及快速编译键绑定
(defun quick-compile ()  
"A quick compile funciton for C++"  
(interactive)  
(compile (concat "gcc " (buffer-name (current-buffer))))
(switch-to-buffer-other-window "*compilation*")
(sleep-for 0 1000)

(if (search-forward "finished")
	(progn
	(shell)
	(insert "a")
	(sleep-for 0 1000)	
	(insert "\n")
	)
	)
)
