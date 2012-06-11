
;;如果不存在el-get，就连接网络
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(el-get 'sync) ;;使用同步方式下载，默认是异步方式

;;设置csophys的个人配置
(add-to-list 'load-path "~/.emacs.d/csophys")
(require 'csophys_function)
(require 'csophys_writingStyle)
;;设置custom文件位置
(setq custom-file "~/.emacs.d/.csophys_custom.el")
(load "~/.emacs.d/.csophys_custom.el")
;; 设置书签文件位置

(setq bookmark-default-file "~/.emacs.d/.csophys_company.bmk")
(setq default-directory "C:/EmacsDir");设置默认工作目录
(setq org-remember-templates
'(("TODO" ?t "* TODO %?\n %x\n %a"  "~/schedule.org.gpg" "Tasks")
("IDEA" ?i "* IDEA %?\n %i\n %a"  "~/schedule.org.gpg" "Idea")
("OTHER" ?o "* Other %?\n %o\n %a" "~/schedule.org.gpg" "Other")
))

