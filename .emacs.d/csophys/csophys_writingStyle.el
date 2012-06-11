;;;csophys_writingSytle.el
;;;;;;;;;;;;;;;;;;;;;;;;基本配置;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(color-theme-gnome2);设置darkskategrey灰色
(setq default-major-mode 'text-mode);设置默认主属性为text模式。
;(setq-default ispell-program-name "aspell") ;;启用拼写检查
(delete-selection-mode); 操作region区域和其他程序
(auto-image-file-mode t);打开图片显示功能
(fset 'yes-or-no-p 'y-or-n-p);简化yes or no 选择
(column-number-mode t);显示列号
(setq default-fill-column 80);默认列数为80列

;日期和时间显示
(display-time-mode 1);打开时间显示模式
(setq display-time-24hr-format t) ;显示24小时制时间
(setq display-time-day-and-date t);显示时间的内容

(setq confirm-kill-emacs 'y-or-n-p);;关闭emacs给出提示
(global-auto-revert-mode t);;自动载入变化的文件
(mouse-avoidance-mode 'animate);光标远离鼠标指针
(setq make-backup-files nil);;去除emacs的自动备份功能
(setq default-tab-width 4 );;设置tab为4个空格的宽度，而不是原来的2
(blink-cursor-mode -1);关闭指针的闪烁
(set-message-beep 'silent);取消Emacs的错误提示音
(setq inhibit-startup-message t);取消emacs和gnus启动时的引导界面
(setq frame-title-format "%b@csophys");设置emacs的窗口标题,%b指的是当前活动窗口
(set-default-font "Consolas-10.5");;设置默认字体Ms Consolas
(set-fontset-font t 'unicode '("Microsoft Yahei" . "unicode-bmp"));;设置默认中文字体,不覆盖英文字体（Ms Consolas-10.5)
(setq default-directory "D:");设置默认工作目录
(show-paren-mode t) ;当指针到一个括号，自动显示所匹配的另一个括号
(global-linum-mode t);显示行号
(setq sql-mysql-options '("-C" "-t" "-f" "-n"));;sql-mode回显

;;;;配置org,agenda相关信息
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)));;org-mode 折行
(setq org-startup-indented t);;设置org的自动缩进
(org-remember-insinuate)
(define-key global-map "\C-ca" 'org-agenda);;映射org日程
(setq org-todo-keywords '((sequence "TODO" "DONE" "IDEA" "OTHER")))
(setq org-remember-templates
'(("TODO" ?t "* TODO %?\n %x\n %a"  "E:/kuaipan/document/schedule.org" "Tasks")
("IDEA" ?i "* IDEA %?\n %i\n %a"  "E:/kuaipan/document/schedule.org" "Idea")
("OTHER" ?o "* Other %?\n %o\n %a" "E:/kuaipan/document/schedule.org" "Other")
))

;;;;;;;;;;;;;;;;;;;;;;;;启用内置的一些功能;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'ibuffer)
(global-set-key (kbd "C-x C-b")'ibuffer);设置ibuffer为默认的buffer,并且绑定按键

(require 'ido)
(ido-mode t);设置智能文件名提示功能

(require 'tramp)
(os_tramp)

(require 'epa-file);;用easypg来进行文件的加密
(epa-file-enable)
;;使用对称加密
(setq epa-file-encrypt-to nil)
;;保存一个session的密码,不然需要总输入密码
;; save the password
(setq epa-file-cache-passphrase-for-symmetric-encryption t)
;; auto-save
(setq epa-file-inhibit-auto-save nil)

;;;;;;;;;;;;;;;;;;;;;;;;一些常用按键的绑定;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key [(f9)] 'quick-compile)
(define-key global-map [f12] 'org-remember);设置f12绑定org-remember
(global-set-key (kbd "RET")'newline-and-indent);设置RET的功能为newline and indent


(provide 'csophys_writingStyle)

