
;;;csophys_writingSytle.el
;;;;;;;;;;;;;;;;;;;;;;;;基本配置;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(el-get-init "color-theme")
(color-theme-gnome2);设置darkskategrey灰色
(setq default-major-mode 'text-mode);设置默认主属性为text模式。
;(setq-default ispell-program-name "aspell") ;;启用拼写检查
(delete-selection-mode); 操作region区域和其他程序
(auto-image-file-mode t);打开图片显示功能
(fset 'yes-or-no-p 'y-or-n-p);简化yes or no 选择
(column-number-mode t);显示列号
(setq default-fill-column 80);默认列数为80列

;日期和时间显示
(display-time-mode 1);打开时间x显示模式
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
(setq frame-title-format '("%S" (buffer-file-name "%f" (dired-directory dired-directory "%b")) "@csophys"))
(set-default-font "Consolas-10.5");;设置默认字体Ms Consolas
(set-fontset-font t 'unicode '("Microsoft Yahei" . "unicode-bmp"));;设置默认中文字体,不覆盖英文字体（Ms Consolas-10.5)
(show-paren-mode t) ;当指针到一个括号，自动显示所匹配的另一个括号
(global-linum-mode t);显示行号
(setq sql-mysql-options '("-C" "-t" "-f" "-n"));;sql-mode回显

;;;;配置org,agenda相关信息
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)));;org-mode 折行
(setq org-startup-indented t);;设置org的自动缩进
(org-remember-insinuate)
(define-key global-map "\C-ca" 'org-agenda);;映射org日程
(setq org-todo-keywords '((sequence "TODO"  "IDEA" "OTHER" "|" "DONE")))
(setq org-remember-templates
'(("TODO" ?t "* TODO %?\n %x\n %a"  "~/schedule.org.gpg" "Tasks")
("IDEA" ?i "* IDEA %?\n %i\n %a"  "~/schedule.org.gpg" "Idea")
("OTHER" ?o "* Other %?\n %o\n %a" "~/schedule.org.gpg" "Other")
))

;;;;;;;;;;;;;;;;;;;;;;;;启用一些扩展功能;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'bookmark)
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

(require 'magit);;;;magit

(autopair-global-mode t);;;启动autopair mode

;;;;yasnippet
(yas/initialize)
(setq yas/prompt-functions '(yas/dropdown-prompt))
(define-key org-mode-map (kbd "<tab>") 'yas/expand)

;;;;auto-complete
(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-start t);;定义从输入几个字符开始提示
(define-key ac-completing-map (kbd "<return>") 'ac-complete)
(define-key ac-mode-map (kbd "M-/") 'auto-complete)
(define-key ac-completing-map (kbd "ESC") 'ac-stop)
(define-key ac-completing-map (kbd "<backtab>") 'ac-previous)


;;;;;;;;;;;;;;;;;;;;;;;;一些常用按键的绑定;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key [(f9)] 'quick-compile)
(define-key global-map [f12] 'org-remember);设置f12绑定org-remember
(global-set-key (kbd "RET")'newline-and-indent);设置RET的功能为newline and indent
(global-set-key "\C-x\C-j" 'dired-jump)
(provide 'csophys_writingStyle)

