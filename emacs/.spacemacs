;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     html
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     bibtex
     dash
;    (bibtex :variables
;             bibtex-completion-pdf-field "file"
;    ;         ;;如果你想用 ivy 进行文献的插入管理，请使用 org-ref-default-bibliography
;             org-ref-default-bibliography 'org-ref-helm-cite
;             bibtex-completion-bibliography "~/Dropbox/bibliography/references.bib"
;             bibtex-completion-library-path "~/Dropbox/bibliography/bibtex-pdfs"
;             org-ref-notes-directory "~/Dropbox/bibliography/helm-bibtex-note"
;             org-ref-bibliography-notes "~/Dropbox/bibliography/notes.org"
;             bibtex-completion-notes "~/Dropbox/bibliography/notes.org"
;             org-ref-pdf-directory "~/Dropbox/bibliography/bibtex-pdfs"
;             org-ref-default-bibliography "~/Dropbox/bibliography/references.bib"
;             )
     auto-completion
     (auto-completion :variables auto-completion-enable-sort-by-usage t
                      auto-completion-enable-snippets-in-popup t
                      :disabled-for org markdown)
     emacs-lisp
     git
     ess
     polymode
     latex
     (latex :variables latex-build-command "LaTeX")
     (latex :variables latex-enable-auto-fill t)
     (latex :variables latex-enable-folding t)
     themes-megapack
     funk
     pandoc
     mu4e
     markdown
     org
     (chinese :variables
              chinese-youdao-dict t
      org-enable-reveal-js-support t)
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     spell-checking
     (syntax-checking :variables syntax-checking-enable-by-default nil
                      syntax-checking-enable-tooltips nil)
     (spell-checking :variables spell-checking-enable-by-default nil)
     (git :variables
          git-magit-status-fullscreen t
          magit-push-always-verify nil
          magit-save-repository-buffers 'dontask
          magit-revert-buffers 'silent
          magit-refs-show-commit-count 'all
          magit-revision-show-gravatars nil)
     syntax-checking
     version-control
     (colors :variables
             colors-enable-nyan-cat-progress-bar t)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      helm-bibtex
                                      org-ref
                                      org-edit-latex
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))
(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
  ; dotspacemacs-themes '(spacemacs-light
  ;                       spacemacs-dark)
   dotspacemacs-themes '(tango-plus
                          tango)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Courier New"
                               :size 21
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq configuration-layer--elpa-archives
        '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
          ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
          ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
  ;; https://github.com/syl20bnr/spacemacs/issues/2705
  ;; (setq tramp-mode nil)
;  (setq tramp-ssh-controlmaster-options
;        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

  ;; ss proxy. But it will cause anacond-mode failed.
;  (setq socks-server '("Default server" "127.0.0.1" 1080 5))
;  (setq evil-shift-round nil)
;  (setq byte-compile-warnings '(not obsolete))
;  (setq warning-minimum-level :error)
;  ;; hack for remove purpose mode
  (setq purpose-mode nil)
 )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
   ;; force horizontal split window
  (setq split-width-threshold 120)
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;AUCTeX
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)

                                        ;(add-to-list 'load-path "~/.emacs.d/elpa/auctex-11.90.2")
;   (load "auctex.el" nil t t)
;    (load "tex-site.el" nil t t)
;   (load "preview.el" nil t t)
;(if (string-equal system-type "windows-nt")
;     (require 'tex-mik)) 
;	 (mapc (lambda (mode)
;         (add-hook 'LaTeX-mode-hook mode))
;        (list 'auto-fill-mode
;               'LaTeX-math-mode
;               'turn-on-reftex
;               'linum-mode))
;(add-hook 'LaTeX-mode-hook (lambda()
;                              (add-to-list 'TeX-command-list '("XeLaTeX" "%`xela;tex%(mode)%' %t" TeX-run-TeX nil t))
;                              (setq TeX-command-default "XeLaTeX")
;                                 (setq TeX-save-query  nil )
;                                  (setq TeX-show-compilation t)))
;								  ;; turn on image file support 
;(auto-image-file-mode)
; (require 'cdlatex)
;将cdlatex设置为AUCtex的辅模式
(autoload 'cdlatex-mode "cdlatex" "CDLaTeX Mode" t)
(autoload 'turn-on-cdlatex "cdlatex" "CDLaTeX Mode" nil)
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
;;设置xelatex为默认引擎
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq TeX-auto-untabify t     ; remove all tabs before saving
                  TeX-engine 'xetex       ; use xelatex default
                  TeX-show-compilation t) ; display compilation windows
            (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
            (setq TeX-save-query nil)
            (imenu-add-menubar-index)
            (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)))

;;配置org-edit-latex
;(require 'org-edit-latex)
;(org-babel-do-load-languages
; 'org-babel-load-languages
; '((emacs-lisp . t)
;   (latex . t)   ;; <== add latex to the list
;   (python . t)
;   (shell . t)
;   (ruby . t)
;   (perl . t)))
;(setq org-edit-latex-create-master t)
;(setq org-edit-latex-packages-alist
;      '(("range-phrase=-,range-units=single" "siunitx")
;        ("" "mathptmx")))
  ;;markdown mode
  (add-to-list 'load-path "~/.emacs.d/elpa/markdown-mode-20170624.1101")
  (autoload 'markdown-mode "markdown-mode"
    "Major mode for editing Markdown files" t)
  (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
  (add-hook 'markdown-mode-hook
            (lambda ()
              (visual-line-mode t)
              (writegood-mode t)
              (flyspell-mode t)))
  (setq markdown-command "pandoc -s -c ~/Dropbox/css/myblog.css --mathjax --highlight-style espresso")
  ;;flymd markdown preview
  (add-to-list 'load-path "C:/Users/Administrator/.emacs.d/private/flymd")
  (require 'flymd)
  ;;自动补全括号
  (defun my-c-mode-auto-pair ()
    (interactive)
    (make-local-variable 'skeleton-pair-alist)
    (setq skeleton-pair-alist  '(
                                 (?` ?` _ "''")
                                 (?\( ?  _ " )")
                                 (?\[ ?  _ " ]")
                                 (?{ \n > _ \n ?} >)))
    (setq skeleton-pair t)
    (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
    (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
    (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
    (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
  (add-hook 'c-mode-hook 'my-c-mode-auto-pair)
  (add-hook 'c++-mode-hook 'my-c-mode-auto-pair)
  ;;输入左边的括号，就会自动补全右边的部分.包括(), "", [] , {} , 等等。
  ;;写作模式
  (add-to-list 'load-path "~/.emacs.d/private/olivetti/")
  (require 'olivetti)
  ;;;;开启半透明模式
  (global-set-key (kbd "<f10>") 'loop-alpha)  ;;注意这行中的F8 , 可以改成你想要的按键    
  (setq alpha-list '((90 70) (100 100))) 
  (defun loop-alpha () 
    (interactive) 
    (let ((h (car alpha-list)))                ;; head value will set to 
      ((lambda (a ab) 
         (set-frame-parameter (selected-frame) 'alpha (list a ab)) 
         (add-to-list 'default-frame-alist (cons 'alpha (list a ab))) 
         ) (car h) (car (cdr h))) 
      (setq alpha-list (cdr (append alpha-list (list h)))))) 
  (loop-alpha)
  ;;设置polymode
  (add-to-list 'load-path "C:/Users/Administrator/.emacs.d/elpa/polymode-20170307.322")
  (require 'poly-R)
  (require 'poly-markdown)
     ;;; MARKDOWN
     (add-to-list 'auto-mode-alist '("\\.md$" . poly-markdown-mode))
     ;;; ORG
     ;; org is not working presently
     ;(add-to-list 'auto-mode-alist '("\\.org" . poly-org-mode))
     ;;; R related modes
     (add-to-list 'auto-mode-alist '("\\.Snw$" . poly-noweb+r-mode))
     (add-to-list 'auto-mode-alist '("\\.Rnw$" . poly-noweb+r-mode))
     (add-to-list 'auto-mode-alist '("\\.Rmd$" . poly-markdown+r-mode))
     (add-to-list 'auto-mode-alist '("\\.rapport$" . poly-rapport-mode))
     (add-to-list 'auto-mode-alist '("\\.Rhtml$" . poly-html+r-mode))
     (add-to-list 'auto-mode-alist '("\\.Rbrew$" . poly-brew+r-mode))
     (add-to-list 'auto-mode-alist '("\\.Rcpp$" . poly-r+c++-mode))
     (add-to-list 'auto-mode-alist '("\\.cppR$" . poly-c++r-mode))
     (provide 'polymode-configuration)
  ;;设置ess
  (setq ess-directory-containing-R "c:")
  ;; Add to list of prefixes recognized by ESS. 
  ;; Matching versions will appear after doing M-x R <TAB> <TAB> 
  (setq ess-r-versions '("R-1" "R-2" "R-3" "R-current" "R-devel" "R-patched"))
  (load "C:/Users/Administrator/.emacs.d/elpa/ess-20170603.817/lisp/ess-site.el")
  ;; Set default R version, (i.e. the one launched by typing M-x R <RET>)
  (setq inferior-R-program-name "D:/LJ/R-3.4.0/bin/x64/Rterm.exe")
  ;;设置中文字体方法二
  (set-fontset-font "fontset-default"
                    (cons (decode-char 'ucs #x4e00)
                          (decode-char 'ucs #x9fff))
                    "-*-思源宋体-*-*-*-*-23-*-*-*-*-*-*-*")
  ;;显示时间
  (display-time-mode 1)
;;;配置org-ref
;(add-to-list 'load-path "~/.emacs.d/elpa/org-ref-20170626.1834")
;; make sure you have dash, helm, helm-bibtex, ebib, s, f, hydra and key-chord
;; in your load-path
(setq org-ref-completion-library 'org-ref-helm-cite)
(setq reftex-default-bibliography '("~/Dropbox/bibliography/references.bib"))
(setq org-ref-default-bibliography '("~/Dropbox/bibliography/references.bib")
      org-ref-bibliography-notes "~/Dropbox/bibliography/notes.org"
      org-ref-pdf-directory "~/Dropbox/bibliography/bibtex-pdfs/")
(setq bibtex-completion-bibliography "~/Dropbox/bibliography/references.bib"
      bibtex-completion-library-path "~/Dropbox/bibliography/bibtex-pdfs"
      bibtex-completion-notes-path "~/Dropbox/bibliography/helm-bibtex-notes")
(global-set-key [f10] 'org-ref-open-bibtex-notes)
(global-set-key [f11] 'org-ref-open-bibtex-pdf)
(global-set-key [f12] 'org-ref-open-in-browser)
(require 'org-ref)
;(require 'org-ref-core)
;(require 'org-ref-citeproc)
(require 'org-ref-helm)
;(require 'helm-bibtex)
;; optional but very useful libraries in org-ref
;(require 'doi-utils)
;(require 'jmax-bibtex)
;(require 'pubmed)
;(require 'org-ref-arxiv)
;(require 'org-ref-sci-id)
;(require 'org-ref-wos)
;(require 'org-ref-scopus)
;(require 'org-ref-sci-id)
 ;;;ox-publish-网站生成程序
  ;(add-to-list 'load-path "~/.emacs.d/elpa/org-20170606")
  (require 'ox-publish)
  (require 'ox-html)
  (setq org-publish-project-alist
      '(("blog-notes"
 :base-directory "C:/Users/Administrator/Dropbox/org/notes/"
 :base-extension "org"
 :publishing-directory "C:/Users/Administrator/Dropbox/org/public_html/"
 :recursive t
 :publishing-function org-html-publish-to-html
 :html-link-home "index.html"
 :html-link-org-files-as-html  org-html-link-org-files-as-html
 :headline-levels 5             ; Just the default for this project.
 :with-author nil 
 :with-email nil 
 :with-creator nil 
 :section-numbers t       
 :with-timestamp nil 
 :html-postamble nil
 :htmlized-source t
 :auto-preamble t
 ;:author "Yourname"
 ;:email "example@test.com"
 :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"../css/org-css.css\" />"
 :html-preamble "<div id="content"> </div> "
 :html-postamble "<div id=\"disqus_thread\"></div><script>
/**
*  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
*  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
/*
var disqus_config = function () {
this.page.url = https://luyajun01.github.io;  // Replace PAGE_URL with your page's canonical URL variable
this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
};
*/
(function() { // DON'T EDIT BELOW THIS LINE
var d = document, s = d.createElement('script');
s.src = 'https://tonylu.disqus.com/embed.js';
s.setAttribute('data-timestamp', +new Date());
(d.head || d.body).appendChild(s);
})();
</script><noscript>Please enable JavaScript to view the <a href=\"https://disqus.com/?ref_noscript\">comments powered by Disqus.</a></noscript>"
 :auto-sitemap t                ; Generate sitemap.org automagically...
 :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
 :sitemap-title "Sitemap"         ; ... with title 'Sitemap'.
 :sitemap-sort-files anti-chronologically
 :sitemap-file-entry-format "%d %t"
 )
   ("images"
               :base-directory "C:/Users/Administrator/Dropbox/org/images/"
               :base-extension "jpg\\|gif\\|png"
               :publishing-directory "/images/"
               :publishing-function org-publish-attachment)
("blog-static"
 :base-directory "C:/Users/Administrator/Dropbox/org/notes"
 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
 :publishing-directory "C:/Users/Administrator/Dropbox/org/public_html/"
 :recursive t
 :publishing-function org-publish-attachment
 )
 ("blog" :components ("blog-notes" "blog-static"))))  
(add-to-list 'org-structure-template-alist
        '("r" "#+begin_src R :results output :session *R* :exports both\n\n#+end_src" "<src lang=\"R\">\n\n</src>"))
 (add-to-list 'org-structure-template-alist
        '("R" "#+begin_src R :results output graphics :file (org-babel-temp-file \"figure\" \".png\") :exports both :width 600 :height 400 :session *R* \n\n#+end_src" "<src lang=\"R\">\n\n</src>"))
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (org-edit-latex pangu-spacing ox-reveal find-by-pinyin-dired chinese-pyim chinese-pyim-basedict ace-pinyin pinyinlib zeal-at-point helm-dash zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme organic-green-theme omtose-phellack-theme oldlace-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme firebelly-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme pdf-tools key-chord ivy helm-bibtex tablist parsebib company-auctex biblio biblio-core json-mode js2-mode graphviz-dot-mode coffee-mode auctex org-ref flymd occidental-theme polymode pandoc-mode ox-pandoc mu4e-maildirs-extension mu4e-alert ht ess-smart-equals ess-R-object-popup ess-R-data-view ctable ess julia-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data unfill smeargle rainbow-mode rainbow-identifiers orgit org-projectile org-present org-pomodoro alert log4e gntp org-download mwim mmm-mode markdown-toc markdown-mode magit-gitflow htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor diff-hl company-statistics company color-identifiers-mode auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async org-plus-contrib evil-unimpaired f s dash))))


