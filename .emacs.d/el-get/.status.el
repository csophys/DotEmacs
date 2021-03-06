((auto-complete status "installed" recipe
				(:name auto-complete :website "http://cx4a.org/software/auto-complete/" :description "The most intelligent auto-completion extension." :type github :pkgname "m2ym/auto-complete" :depends
					   (popup fuzzy)))
 (autopair status "installed" recipe
		   (:name autopair :website "https://github.com/capitaomorte/autopair" :description "Autopair is an extension to the Emacs text editor that automatically pairs braces and quotes." :type github :pkgname "capitaomorte/autopair" :features autopair))
 (clojure-mode status "installed" recipe
			   (:name clojure-mode :website "https://github.com/technomancy/clojure-mode" :description "Emacs support for the Clojure language." :type github :pkgname "technomancy/clojure-mode"))
 (color-theme status "installed" recipe
			  (:name color-theme :description "An Emacs-Lisp package with more than 50 color themes for your use. For questions about color-theme" :website "http://www.nongnu.org/color-theme/" :type http-tar :options
					 ("xzf")
					 :url "http://download.savannah.gnu.org/releases/color-theme/color-theme-6.6.0.tar.gz" :load "color-theme.el" :features "color-theme" :post-init
					 (progn
					   (color-theme-initialize)
					   (setq color-theme-is-global t))))
 (color-theme-tomorrow status "removed" recipe nil)
 (dired+ status "installed" recipe
		 (:name dired+ :description "Extensions to Dired" :type emacswiki :features dired+))
 (el-get status "installed" recipe
		 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "3.stable" :pkgname "dimitri/el-get" :features el-get :load "el-get.el" :info "el-get.info"))
 (fuzzy status "installed" recipe
		(:name fuzzy :website "https://github.com/m2ym/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "m2ym/fuzzy-el"))
 (graphviz-dot-mode status "installed" recipe
					(:name graphviz-dot-mode :type http :website "http://www.graphviz.org/" :description "graphviz dot language mode" :url "http://www.graphviz.org/Misc/graphviz-dot-mode.el" :autoloads t))
 (hideshow-org status "installed" recipe
			   (:name hideshow-org :description "Provides org-mode like hide and show for hideshow.el" :type github :pkgname "secelis/hideshow-org"))
 (htmlize status "installed" recipe
		  (:name htmlize :website "http://www.emacswiki.org/emacs/Htmlize" :description "Convert buffer text and decorations to HTML." :type http :url "http://fly.srk.fer.hr/~hniksic/emacs/htmlize.el.cgi" :localname "htmlize.el" :feature htmlize))
 (org-html5presentation status "installed" recipe
						(:name org-html5presentation :type http :website "https://gist.github.com/509761" :description "html5 presentation from org files" :url "https://raw.github.com/gist/509761/org-html5presentation.el" :autoloads t))
 (paredit status "installed" recipe
		  (:name paredit :description "Minor mode for editing parentheses" :type http :url "http://mumble.net/~campbell/emacs/paredit.el" :features "paredit"))
 (popup status "installed" recipe
		(:name popup :website "https://github.com/m2ym/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :pkgname "m2ym/popup-el"))
 (swank-clojure status "removed" recipe nil)
 (w32-browser status "installed" recipe
			  (:name w32-browser :type emacswiki :description "Run Windows application associated with a file." :load-path "."))
 (yasnippet status "installed" recipe
			(:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :features "yasnippet" :pre-init
				   (unless
					   (or
						(boundp 'yas/snippet-dirs)
						(get 'yas/snippet-dirs 'customized-value))
					 (setq yas/snippet-dirs
						   (list
							(concat el-get-dir
									(file-name-as-directory "yasnippet")
									"snippets"))))
				   :post-init
				   (put 'yas/snippet-dirs 'standard-value
						(list
						 (list 'quote
							   (list
								(concat el-get-dir
										(file-name-as-directory "yasnippet")
										"snippets")))))
				   :compile nil :submodule nil)))
