
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
;(require 'csophys_writingStyle)
;(require 'csophys_function)
;;����custom�ļ�λ��
(setq custom-file "~/.emacs.d/.csophys_custom.el")
(load "~/.emacs.d/.csophys_custom.el")
;; ������ǩ�ļ�λ��
(setq bookmark-default-file "~/.emacs.d/.csophys.bmk")
