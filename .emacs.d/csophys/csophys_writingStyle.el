;;;csophys_writingSytle.el
;;;;;;;;;;;;;;;;;;;;;;;;基本配置;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(el-get-init "color-theme")
(el-get-init "dired+")
(color-theme-gnome2);设置darkskategrey灰色
(global-undo-tree-mode t);启用undotree
(setq default-major-mode 'text-mode);设置默认主属性为text模式。
;(setq-default ispell-program-name "aspell") ;;启用拼写检查
(delete-selection-mode); 操作region区域和其他程序
(auto-image-file-mode t);打开图片显示功能
(fset 'yes-or-no-p 'y-or-n-p);简化yes or no 选择
(column-number-mode t);显示列号
(setq default-fill-column 80);默认列数为80列
(setq user-full-name "csophys");设置用户名
(setq user-mail-address "zjsy_cs@163.com");设置邮箱
(add-hook 'clojure-mode-hook 'paredit-mode-enable);在clojure模式时启用paredit
(add-hook 'emacs-lisp-mode-hook 'paredit-mode-enable);在elisp模式时启用paredit
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
(setq w32-get-true-file-attributes nil) ; try to improve slow performance on windows.
;;;;配置org,agenda相关信息
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)));;org-mode 折行
(setq org-startup-indented t);;设置org的自动缩进
(org-remember-insinuate)
(setq org-src-fontify-natively t);;;;org中的代码段语法高亮 
(define-key global-map "\C-ca" 'org-agenda);;映射org日程
(setq org-todo-keywords '((sequence "TODO"  "IDEA"  "|" "DONE")))
(setq org-remember-templates
'(("TODO" ?t "* TODO %?\n %x\n %a"  "~/schedule.org.gpg" "Tasks")
("IDEA" ?i "* IDEA %?\n %i\n %a"  "~/schedule.org.gpg" "Idea")
("编程语言" ?b "* 编程语言 %?\n %i\n %a"  "~/study.org" "编程语言")
("设计模式" ?s "* 设计模式 %?\n %i\n %a"  "~/study.org" "设计模式")
("基本概念" ?j "* 基本概念 %?\n %i\n %a"  "~/study.org" "基本概念")
("算法" ?a "* 算法 %?\n %i\n %a"  "~/study.org" "算法")
))

;;;;;;;;;;;;;;;;;;;;;;;;启用一些扩展功能;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'bookmark)
(require 'ibuffer)
(global-set-key (kbd "C-x C-b")'ibuffer);设置ibuffer为默认的buffer,并且绑定按键

(require 'ido)
(ido-mode t);设置智能文件名提示功能

(require 'tramp)
(os_tramp)

(require 'magit);;;;magit
(el-get-init "w32-browser")
(require 'w32-browser);;;;w32-brower
(el-get-init "autopair")
(autopair-global-mode t);;;启动autopair mode
(setq graphviz-dot-mode-syntax-table (syntax-table));;;是autopair可以用于dot-mode
;------------------------------------------------------------------------------
(require 'epa-file);;用easypg来进行文件的加密
(epa-file-enable)
;;使用对称加密
(setq epa-file-encrypt-to nil)
;;保存一个session的密码,不然需要总输入密码
;; save the password
(setq epa-file-cache-passphrase-for-symmetric-encryption t)
;; auto-save
(setq epa-file-inhibit-auto-save nil)
;------------------------------------------------------------------------------
(semantic-mode 1)
(global-semantic-idle-scheduler-mode t)
;(global-semanticdb-minor-mode t)
(global-semantic-idle-summary-mode t)
;(global-semantic-idle-completions-mode t)
(global-semantic-highlight-func-mode t)
(global-semantic-decoration-mode t)
;------------------------------------------------------------------------------
;;;;yasnippet
(el-get-init "yasnippet")
(yas/initialize)
(add-to-list 'yas/snippet-dirs "~/.emacs.d/snippets")
(yas/reload-all)
(setq yas/prompt-functions '(yas/dropdown-prompt))
(define-key org-mode-map (kbd "<tab>") 'yas/expand)
;------------------------------------------------------------------------------
;;;;auto-complete
(el-get-init "popup")
(el-get-init "auto-complete")
(require 'auto-complete-config)
;;;;重新定义函数ac-source-yasnippet，能够适用于最新的yasnippet
(defun ac-yasnippet-candidates ()
  (with-no-warnings
        ;; >0.6.0
        (apply 'append (mapcar 'ac-yasnippet-candidate-1 (yas/get-snippet-tables)))
      ))
;;;;添加directionary
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;;;;增加ac-modes的
(setq ac-modes
      (append ac-modes '( objc-mode jde-mode sql-mode
								  eshell-mode shell-mode
                                  change-log-mode text-mode
                                  makefile-gmake-mode makefile-bsdmake-mo
                                  autoconf-mode makefile-automake-mode graphviz-dot-mode))
      )

(defun ac-common-setup ()
  (add-to-list 'ac-sources  'ac-source-filename)
  (add-to-list 'ac-sources  'ac-source-yasnippet)
  )

(defun ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-yasnippet ac-source-gtags ac-source-semantic) ac-sources)))
;;;;可以载入多个字典目录
(defun ac-mode-dictionary (mode)
  (let (result)
    (dolist (name (cons (symbol-name mode)
		      (ignore-errors (list (file-name-extension (buffer-file-name))))))
    (dolist (dir ac-dictionary-directories)
      (let ((file (concat dir "/" name)))
 	(if (file-exists-p file)
 	    (setq result (append result (ac-file-dictionary file)))))))
    result))

(ac-config-default)
(setq ac-auto-start 4);;设定输入几个字符后提示

(define-key ac-completing-map (kbd "<return>") 'ac-complete)
(define-key ac-mode-map (kbd "M-/") 'auto-complete)
(define-key ac-completing-map (kbd "ESC") 'ac-stop)
(define-key ac-completing-map (kbd "<tab>") 'ac-next)
(define-key ac-completing-map (kbd "<backtab>") 'ac-previous)
;------------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/ecb/");
(require 'ecb)
(defconst initial-frame-width (frame-width)
  "This file will change the width of frame,remember the init value.")
(setq ecb-compile-window-height 6
      ecb-compile-window-width 'edit-window
      ecb-compile-window-temporally-enlarge 'both
      ecb-create-layout-file "~/.emacs.d/auto-save-list/.ecb-user-layouts.el"
      ecb-windows-width 30
      ecb-fix-window-size 'width ;
      ecb-layout-name "right1"
      ecb-tip-of-the-day nil
      ecb-tip-of-the-day-file "~/.emacs/auto-save-list/.ecb-tip-of-day.el"
      ecb-primary-secondary-mouse-buttons 'mouse-1--mouse-2 ;
      ;;ecb-create-layout-frame-height 40
      ;;ecb-create-layout-frame-width 110
      )
(add-to-list 'ecb-compilation-buffer-names '("*info*"))

(add-hook 'ecb-show-ecb-windows-before-hook
          'ecb-enlarge-frame-width-before-show)
(add-hook 'ecb-hide-ecb-windows-before-hook
          'ecb-shrink-frame-width-before-hide)
(add-hook 'ecb-deactivate-hook
          'ecb-shrink-frame-width-before-hide)
(add-hook 'ecb-activate-before-layout-draw-hook
          'ecb-enlarge-frame-width-before-activate)

(defun frame-horizontal-maximized-p ()
  "Test current frame wheather be maxmized by test the frame width and height equal to the screen resolution"
  (interactive)
  (equal (frame-pixel-width) (display-pixel-width)))

(defun ecb-enlarge-frame-width-before-show ()
  "Enlarge frame width before ecb shows layout."
  (if (and (ecb-windows-all-hidden)
           (<= (+ (frame-pixel-width) (* (frame-char-width)
                                         (+ ecb-windows-width 2)))
               (display-pixel-width)))
      (set-frame-width (selected-frame) (+ (frame-width) (+ ecb-windows-width 2)))))
(defun ecb-shrink-frame-width-before-hide ()
  "Shrink frame width before ecb hide layout."
  (if (and (not (ecb-windows-all-hidden))
           
           (not (eq (frame-pixel-width)
                    (display-pixel-width))))
      (if (< (- (frame-width) (+ ecb-windows-width 2)) initial-frame-width)
          (set-frame-width (selected-frame) initial-frame-width)
        (set-frame-width (selected-frame) (- (frame-width) (+ ecb-windows-width 2))))))
(defun ecb-enlarge-frame-width-before-activate ()
  "Enlarge frame width when ecb active and need it to."
  (let ((use-last-win-conf (and ecb-last-window-config-before-deactivation
                                (equal ecb-split-edit-window-after-start
                                       'before-deactivation)
                                (not (ecb-window-configuration-invalidp
                                      ecb-last-window-config-before-deactivation)))))
    (unless (or (and use-last-win-conf
                     (eq (nth 5 ecb-last-window-config-before-deactivation)
                         ecb-windows-hidden-all-value))
                (> (+ (frame-pixel-width) (* (frame-char-width)
                                         (+ ecb-windows-width 2)))
                   (display-pixel-width)))
      (set-frame-width (selected-frame) (+ (frame-width) (+ ecb-windows-width 2))))))

(defadvice ecb-activate (after ecb-activate-after activate)
  "Redraw layout after activation of ecb."
  (ecb-redraw-layout))
(setq ecb-compile-window-height nil);;;取消编译窗口显示
; ;;ecb开启时隐藏ecb-window，不要删除该代码!!!
;;;默认ecb关闭，可以用C-c .ls和C-c .ld来开启和关闭
(define-key global-map (kbd "C-c ls") 'ecb-activate);
(define-key global-map (kbd "C-c ld") 'ecb-deactivate);
;------------------------------------------------------------------------------

;------------------------------------------------------------------------------
(require 'autoinsert)
(setq auto-insert-mode t)  ;;; Adds hook to find-files-hook
(setq auto-insert-directory "~/.emacs.d/auto-insert/")
(setq auto-insert 'other)
(setq auto-insert-query nil)

;; auto-insert stuff
(add-hook 'find-file-hooks 'auto-insert)
(setq auto-insert-alist
      '(
        ("\\.java$" . ["insert.java"  auto-update-java-source-file])
		("\\.el$" . ["insert.el" default-autoinsert])
        ))

(defun default-autoinsert ()
  "default function when open the insert templete"
  (goto-char (point-max))
	)

(defun auto-update-java-source-file ()
  "do something when open an java source"
  (goto-char (- (point-max) 1))
  (yas/expand)
	)
;-----------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/el-get/dos/")
(require 'dos);;使用dos,修改了原文件中的配色(line:127)
(require 'dos-indent);;用于dos缩进
(setq auto-mode-alist  
	  (append  
	   '(("\\.bat\\'" . dos-mode))  
	   auto-mode-alist))
(defun run-current-bat()
  (interactive)
  (w32-browser buffer-file-name)
 )
(define-key dos-mode-map (kbd "M-RET") 'run-current-bat)
;-----------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/default")

(require 'hideshow-org)
(global-set-key "\C-ch" 'hs-org/minor-mode)

;ajc--------------------------------------------------------------------------
(add-to-list 'load-path  "~/.emacs.d/el-get/ajc-java-complete/")
 (require 'ajc-java-complete-config)
(add-hook 'java-mode-hook 'ajc-java-complete-mode)
(setq ajc-tag-file "~/.emacs.d/el-get/ajc-java-complete/java_base.tag") 
;;;;;;;;;;;;;;;;;;;;;;;;一些常用按键的绑定;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key [(f9)] 'quick-compile)
(define-key global-map [f12] 'org-remember);设置f12绑定org-remember
(global-set-key (kbd "RET")'newline-and-indent);设置RET的功能为newline and indent
(global-set-key "\C-x\C-j" 'dired-jump)
(provide 'csophys_writingStyle)

