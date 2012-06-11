;;���������el-get������������
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(el-get 'sync) ;;ʹ��ͬ����ʽ���أ�Ĭ�����첽��ʽ

;;����csophys�ĸ�������
(add-to-list 'load-path "~/.emacs.d/csophys")
(require 'csophys_function)
(require 'csophys_writingStyle)
;;����custom�ļ�λ��
(setq custom-file "~/.emacs.d/.csophys_custom.el")
(load "~/.emacs.d/.csophys_custom.el")
;;����magit�ļ���·��
(add-to-list 'load-path "~/.emacs.d/magit")

;; ����һЩ�ļ�λ�ã��ж��Ƿ��ǹ�˾�Ļ���
(if (equal system-name "chensheng")
	(progn
(setq bookmark-default-file "~/.emacs.d/.csophys_company.bmk")
(setq default-directory "C:/EmacsDir");����Ĭ�Ϲ���Ŀ¼
) 
(setq bookmark-default-file "~/.emacs.d/.csophys_person.bmk")
(setq default-directory "D:/EmacsDir");����Ĭ�Ϲ���Ŀ¼
)
;;ȡ��һЩ�������Ϣ
(put 'dired-find-alternate-file 'disabled nil)
