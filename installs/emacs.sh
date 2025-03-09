sudo apt install -y emacs

mkdir -p ~/.emacs.d
echo "" > ~/.emacs.d/init.el
cat << EOF > ~/.emacs.d/init.el
;; Set up package repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)
(unless package-archive-contents (package-refresh-contents)) ;; Refresh package repos

;; Some setup variables
(setq backup-directory-alist '(("." . "~/.saves"))) ;; Prevent backup saves in folder
(setq package-enable-at-startup nil) ;; Prevent second call to package-initialize
(setq inhibit-startup-screen t) ;; Disable startup screen
(setq create-lockfiles nil) ;; Prevent lockfiles
(put 'upcase-region 'disabled nil) ;; Prevent auto casing issues
(delete-selection-mode 1) ;; Ensure highlighted text is overwritten

;; Unset initial global keys
(global-unset-key "\C-@") ;; set-mark-command
(global-unset-key "\C-a") ;; move-beginning-of-line
(global-unset-key "\C-b") ;; backward-char
(global-unset-key "\C-d") ;; delete-char
(global-unset-key "\C-e") ;; move-end-of-line
(global-unset-key "\C-f") ;; forward-char
(global-unset-key "\C-g") ;; keyboard-quit
(global-unset-key "\C-j") ;; electric-newline-and-maybe-indent
(global-unset-key "\C-k") ;; kill-line
(global-unset-key "\C-l") ;; recenter-top-bottom
(global-unset-key "\C-n") ;; next-line
(global-unset-key "\C-o") ;; open-line
(global-unset-key "\C-p") ;; previous-line
(global-unset-key "\C-q") ;; quoted-insert
(global-unset-key "\C-r") ;; isearch-backward
(global-unset-key "\C-s") ;; isearch-forward
(global-unset-key "\C-t") ;; transpose-chars
(global-unset-key "\C-u") ;; universal-argument
(global-unset-key "\C-v") ;; scroll-up-command
(global-unset-key "\C-w") ;; kill-region
(global-unset-key "\C-y") ;; yank
(global-unset-key "\C-?") ;; undo-redo
;;(global-unset-key "\C-z") ;; suspend-frame
;;(global-unset-key "\C-\") ;; toggle-input-method
;;(global-unset-key "\C-]") ;; abort-recursive-edit
;;(global-unset-key "\C-_") ;; undo
;;(global-unset-key "\C--") ;; negative-argument
;;(global-unset-key "\C-/") ;; undo
;;(global-unset-key "\C-SPC") ;; set-mark-command
;;(global-unset-key "\C-M-<backspace>") ;; backward-kill-sexp
;;(global-unset-key "\C-M-<delete>") ;; backward-kill-sexp
;;(global-unset-key "\C-M-<down>") ;; down-list
;;(global-unset-key "\C-M-<down-mouse-1>") ;; mouse-drag-region-rectangle
;;(global-unset-key "\C-M-<drag-mouse-1>") ;; ignore
;;(global-unset-key "\C-M-<end>") ;; end-of-defun
;;(global-unset-key "\C-M-<home>") ;; beginning-of-defun
;;(global-unset-key "\C-M-<left>") ;; backward-sexp
;;(global-unset-key "\C-M-<mouse-1>") ;; mouse-set-point
;;(global-unset-key "\C-M-<mouse-4>") ;; mouse-wheel-global-text-scale
;;(global-unset-key "\C-M-<mouse-5>") ;; mouse-wheel-global-text-scale
;;(global-unset-key "\C-M-<right>") ;; forward-sexp
;;(global-unset-key "\C-M-<up>") ;; backward-up-list
;;(global-unset-key "\C-M-<wheel-down>") ;; mouse-wheel-global-text-scale
;;(global-unset-key "\C-M-<wheel-up>") ;; mouse-wheel-global-text-scale
;;(global-unset-key "\C-S-<backspace>") ;; kill-whole-line
;;(global-unset-key "\C-<backspace>") ;; backward-kill-word
;;(global-unset-key "\C-<delete>") ;; kill-word
;;(global-unset-key "\C-<down>") ;; forward-paragraph
;;(global-unset-key "\C-<down-mouse-1>") ;; mouse-buffer-menu
;;(global-unset-key "\C-<end>") ;; end-of-buffer
;;(global-unset-key "\C-<f10>") ;; buffer-menu-open
;;(global-unset-key "\C-<home>") ;; beginning-of-buffer
;;(global-unset-key "\C-<insert>") ;; kill-ring-save
;;(global-unset-key "\C-<insertchar>") ;; kill-ring-save
;;(global-unset-key "\C-<left>") ;; left-word
;;(global-unset-key "\C-<mouse-4>") ;; mouse-wheel-text-scale
;;(global-unset-key "\C-<mouse-5>") ;; mouse-wheel-text-scale
;;(global-unset-key "\C-<next>") ;; scroll-left
;;(global-unset-key "\C-<prior>") ;; scroll-right
;;(global-unset-key "\C-<right>") ;; right-word
;;(global-unset-key "\C-<up>") ;; backward-paragraph
;;(global-unset-key "\C-<wheel-down>") ;; mouse-wheel-text-scale
;;(global-unset-key "\C-<wheel-up>") ;; mouse-wheel-text-scale
;;(global-unset-key "\C-0 .. C-9 ;; digit-argument

(global-unset-key "\M-!") ;; shell-command
(global-unset-key "\M-$") ;; ispell-word
(global-unset-key "\M-%") ;; query-replace
(global-unset-key "\M-&") ;; async-shell-command
(global-unset-key "\M-'") ;; abbrev-prefix-mark
(global-unset-key "\M-(") ;; insert-parentheses
(global-unset-key "\M-)") ;; move-past-close-and-reindent
(global-unset-key "\M-,") ;; xref-go-back
(global-unset-key "\M--") ;; negative-argument
(global-unset-key "\M-.") ;; xref-find-definitions
(global-unset-key "\M-/") ;; dabbrev-expand
(global-unset-key "\M-:") ;; eval-expression
(global-unset-key "\M-;") ;; comment-dwim
(global-unset-key "\M-<") ;; beginning-of-buffer
(global-unset-key "\M-=") ;; count-words-region
(global-unset-key "\M->") ;; end-of-buffer
(global-unset-key "\M-?") ;; xref-find-references
(global-unset-key "\M-@") ;; mark-word
(global-unset-key "\M-X") ;; execute-extended-command-for-buffer
(global-unset-key "\M-^") ;; delete-indentation
(global-unset-key "\M-`") ;; tmm-menubar
(global-unset-key "\M-a") ;; backward-sentence
(global-unset-key "\M-b") ;; backward-word
(global-unset-key "\M-c") ;; capitalize-word
(global-unset-key "\M-d") ;; kill-word
(global-unset-key "\M-e") ;; forward-sentence
(global-unset-key "\M-f") ;; forward-word
(global-unset-key "\M-h") ;; mark-paragraph
(global-unset-key "\M-i") ;; tab-to-tab-stop
(global-unset-key "\M-j") ;; default-indent-new-line
(global-unset-key "\M-k") ;; kill-sentence
(global-unset-key "\M-l") ;; downcase-word
(global-unset-key "\M-m") ;; back-to-indentation
(global-unset-key "\M-q") ;; fill-paragraph
(global-unset-key "\M-}") ;; forward-paragraph
;;(global-unset-key "\M-\") ;; delete-horizontal-space
;;(global-unset-key "\M-r") ;; move-to-window-line-top-bottom
;;(global-unset-key "\M-t") ;; transpose-words
;;(global-unset-key "\M-u") ;; upcase-word
;;(global-unset-key "\M-v") ;; scroll-down-command
;;(global-unset-key "\M-w") ;; kill-ring-save
;;(global-unset-key "\M-x") ;; execute-extended-command
;;(global-unset-key"\M-y") ;; yank-pop
;;(global-unset-key "\M-z") ;; zap-to-char
;;(global-unset-key "\M-{") ;; backward-paragraph
;;(global-unset-key "\M-|") ;; shell-command-on-region

;;M-<begin>		beginning-of-buffer-other-window
;;M-<down-mouse-1>	mouse-drag-secondary
;;M-<drag-mouse-1>	mouse-set-secondary
;;M-<end>			end-of-buffer-other-window
;;M-<f10>			toggle-frame-maximized
;;M-<home>		beginning-of-buffer-other-window
;;M-<left>		left-word
;;M-<mouse-1>		mouse-start-secondary
;;M-<mouse-2>		mouse-yank-secondary
;;M-<mouse-3>		mouse-secondary-save-then-kill
;;M-<mouse-4>		mwheel-scroll
;;M-<mouse-5>		mwheel-scroll
;;M-<mouse-6>		mwheel-scroll
;;M-<mouse-7>		mwheel-scroll
;;M-<next>		scroll-other-window
;;M-<prior>		scroll-other-window-down
;;M-<right>		right-word
;;M-<wheel-down>		mwheel-scroll
;;M-<wheel-left>		mwheel-scroll
;;M-<wheel-right>		mwheel-scroll
;;M-<wheel-up>		mwheel-scroll
;;<Scroll_Lock>		scroll-lock-mode
;;S-<delete>		kill-region
;;S-<down-mouse-1>	mouse-appearance-menu
;;S-<f10>			context-menu-open
;;S-<insert>		yank
;;S-<insertchar>		yank
;;S-<mouse-3>		kmacro-end-call-mouse
;;S-<mouse-4>		mwheel-scroll
;;S-<mouse-5>		mwheel-scroll
;;S-<mouse-6>		mwheel-scroll
;;S-<mouse-7>		mwheel-scroll
;;S-<wheel-down>		mwheel-scroll
;;S-<wheel-left>		mwheel-scroll
;;S-<wheel-right>		mwheel-scroll
;;S-<wheel-up>		mwheel-scroll
;;<XF86Back>		previous-buffer
;;<XF86Forward>		next-buffer
;;<XF86WakeUp>		ignore
;;<again>			repeat-complex-command
;;<begin>			beginning-of-buffer
;;<compose-last-chars>	compose-last-chars
;;<copy>			clipboard-kill-ring-save
;;<cut>			clipboard-kill-region
;;<deletechar>		delete-forward-char
;;<deleteline>		kill-line
;;<delete-frame>		handle-delete-frame
;;<down>			next-line
;;<down-mouse-1>		mouse-drag-region
;;<drag-mouse-1>		mouse-set-region
;;<end>			move-end-of-line
;;<execute>		execute-extended-command
;;<f3>			kmacro-start-macro-or-insert-counter
;;<f4>			kmacro-end-or-call-macro
;;<f10>			menu-bar-open
;;<f11>			toggle-frame-fullscreen
;;<f16>			clipboard-kill-ring-save
;;<f18>			clipboard-yank
;;<f20>			clipboard-kill-region
;;<find>			search-forward
;;<home>			move-beginning-of-line
;;<iconify-frame>		ignore-event
;;<insert>		overwrite-mode
;;<insertchar>		overwrite-mode
;;<insertline>		open-line
;;<left>			left-char
;;<make-frame-visible>	ignore-event
;;<menu>			execute-extended-command
;;<mouse-1>		mouse-set-point
;;<mouse-2>		mouse-yank-primary
;;<mouse-3>		mouse-save-then-kill
;;<mouse-4>		mwheel-scroll
;;<mouse-5>		mwheel-scroll
;;<mouse-6>		mwheel-scroll
;;<mouse-7>		mwheel-scroll
;;<mouse-movement>	ignore-preserving-kill-region
;;<next>			scroll-up-command
;;<open>			find-file
;;<paste>			clipboard-yank
;;<pinch>			text-scale-pinch
;;<prior>			scroll-down-command
;;<redo>			repeat-complex-command
;;<right>			right-char
;;<select-window>		handle-select-window
;;<switch-frame>		handle-switch-frame
;;<touch-end>		ignore
;;<undo>			undo
;;<up>			previous-line
;;<wheel-down>		mwheel-scroll
;;<wheel-left>		mwheel-scroll
;;<wheel-right>		mwheel-scroll
;;<wheel-up>		mwheel-scroll
;;C-h C-a		about-emacs
;;C-h C-c		describe-copying
;;C-h C-d		view-emacs-debugging
;;C-h C-e		view-external-packages
;;C-h C-f		view-emacs-FAQ
;;C-h C-h		help-for-help
;;C-h RET		view-order-manuals
;;C-h C-n		view-emacs-news
;;C-h C-o		describe-distribution
;;C-h C-p		view-emacs-problems
;;C-h C-q		help-quick-toggle
;;C-h C-s		search-forward-help-for-help
;;C-h C-t		view-emacs-todo
;;C-h C-w		describe-no-warranty
;;C-h C-\		describe-input-method
;;C-h .		display-local-help
;;C-h ?		help-for-help
;;C-h C		describe-coding-system
;;C-h F		Info-goto-emacs-command-node
;;C-h I		describe-input-method
;;C-h K		Info-goto-emacs-key-command-node
;;C-h L		describe-language-environment
;;C-h P		describe-package
;;C-h R		info-display-manual
;;C-h S		info-lookup-symbol
;;C-h a		apropos-command
;;C-h b		describe-bindings
;;C-h c		describe-key-briefly
;;C-h d		apropos-documentation
;;C-h e		view-echo-area-messages
;;C-h f		describe-function
;;C-h g		describe-gnu-project
;;C-h h		view-hello-file
;;C-h i		info
;;C-h k		describe-key
;;C-h l		view-lossage
;;C-h m		describe-mode
;;C-h n		view-emacs-news
;;C-h o		describe-symbol
;;C-h p		finder-by-keyword
;;C-h q		help-quit
;;C-h r		info-emacs-manual
;;C-h s		describe-syntax
;;C-h t		help-with-tutorial
;;C-h v		describe-variable
;;C-h w		where-is
;;C-h x		describe-command
;;C-h <f1>	help-for-help
;;C-h <help>	help-for-help
;;C-x C-@		pop-global-mark
;;C-x C-b		list-buffers
;;C-x C-c		save-buffers-kill-terminal
;;C-x C-d		list-directory
;;C-x C-e		eval-last-sexp
;;C-x C-f		find-file
;;C-x TAB		indent-rigidly
;;C-x C-j		dired-jump
;;C-x C-l		downcase-region
;;C-x C-n		set-goal-column
;;C-x C-o		delete-blank-lines
;;C-x C-p		mark-page
;;C-x C-q		read-only-mode
;;C-x C-r		find-file-read-only
;;C-x C-s		save-buffer
;;C-x C-t		transpose-lines
;;C-x C-u		upcase-region
;;C-x C-v		find-alternate-file
;;C-x C-w		write-file
;;C-x C-x		exchange-point-and-mark
;;C-x C-z		suspend-frame
;;C-x SPC		rectangle-mark-mode
;;C-x $		set-selective-display
;;C-x '		expand-abbrev
;;C-x (		kmacro-start-macro
;;C-x )		kmacro-end-macro
;;C-x *		calc-dispatch
;;C-x +		balance-windows
;;C-x -		shrink-window-if-larger-than-buffer
;;C-x .		set-fill-prefix
;;C-x 0		delete-window
;;C-x 1		delete-other-windows
;;C-x 2		split-window-below
;;C-x 3		split-window-right
;;C-x ;		comment-set-column
;;C-x <		scroll-left
;;C-x =		what-cursor-position
;;C-x >		scroll-right
;;C-x [		backward-page
;;C-x \		activate-transient-input-method
;;C-x ]		forward-page
;;C-x ^		enlarge-window
;;C-x `		next-error
;;C-x b		switch-to-buffer
;;C-x d		dired
;;C-x e		kmacro-end-and-call-macro
;;C-x f		set-fill-column
;;C-x h		mark-whole-buffer
;;C-x i		insert-file
;;C-x k		kill-buffer
;;C-x l		count-lines-page
;;C-x m		compose-mail
;;C-x o		other-window
;;C-x q		kbd-macro-query
;;C-x s		save-some-buffers
;;C-x u		undo
;;C-x z		repeat
;;C-x {		shrink-window-horizontally
;;C-x }		enlarge-window-horizontally
;;C-x DEL		backward-kill-sentence
;;C-x C-SPC	pop-global-mark
;;C-x C-+		text-scale-adjust
;;C-x C--		text-scale-adjust
;;C-x C-0		text-scale-adjust
;;C-x C-;		comment-line
;;C-x C-=		text-scale-adjust
;;C-x C-<left>	previous-buffer
;;C-x C-<right>	next-buffer
;;C-x <left>	previous-buffer
;;C-x <right>	next-buffer
;;M-0 .. M-9	digit-argument
;;C-M-@			mark-sexp
;;C-M-a			beginning-of-defun
;;C-M-b			backward-sexp
;;C-M-c			exit-recursive-edit
;;C-M-d			down-list
;;C-M-e			end-of-defun
;;C-M-f			forward-sexp
;;C-M-h			mark-defun
;;C-M-j			default-indent-new-line
;;C-M-k			kill-sexp
;;C-M-l			reposition-window
;;C-M-n			forward-list
;;C-M-o			split-line
;;C-M-p			backward-list
;;C-M-r			isearch-backward-regexp
;;C-M-s			isearch-forward-regexp
;;C-M-t			transpose-sexps
;;C-M-u			backward-up-list
;;C-M-v			scroll-other-window
;;C-M-w			append-next-kill
;;C-M-\			indent-region
;;C-M-_			undo-redo
;;M-SPC			cycle-spacing

;;M-~			not-modified
;;M-DEL			backward-kill-word
;;C-M-S-l			recenter-other-window
;;C-M-S-v			scroll-other-window-down
;;C-M-SPC			mark-sexp
;;C-M-%			query-replace-regexp
;;C-M-,			xref-go-forward
;;C-M--			negative-argument
;;C-M-.			xref-find-apropos
;;C-M-/			dabbrev-completion
;;C-M-0 .. C-M-9		digit-argument
;;ESC C-<backspace>	backward-kill-sexp
;;ESC C-<delete>		backward-kill-sexp
;;ESC C-<down>		down-list
;;ESC C-<end>		end-of-defun
;;ESC C-<home>		beginning-of-defun
;;ESC C-<left>		backward-sexp
;;ESC C-<right>		forward-sexp
;;ESC C-<up>		backward-up-list
;;ESC <begin>		beginning-of-buffer-other-window
;;ESC <end>		end-of-buffer-other-window
;;ESC <f10>		toggle-frame-maximized
;;ESC <home>		beginning-of-buffer-other-window
;;ESC <left>		backward-word
;;ESC <next>		scroll-other-window
;;ESC <prior>		scroll-other-window-down
;;ESC <right>		forward-word
;;M-s .		isearch-forward-symbol-at-point
;;M-s _		isearch-forward-symbol
;;M-s o		occur
;;M-s w		isearch-forward-word
;;M-g TAB		move-to-column
;;M-g c		goto-char
;;M-g g		goto-line
;;M-g i		imenu
;;M-g n		next-error
;;M-g p		previous-error
;;M-ESC ESC	keyboard-escape-quit
;;M-ESC :		eval-expression
;;<right-fringe> <mouse-4>	mwheel-scroll
;;<right-fringe> <mouse-5>	mwheel-scroll
;;<right-fringe> <mouse-6>	mwheel-scroll
;;<right-fringe> <mouse-7>	mwheel-scroll
;;<right-fringe> <wheel-down>	mwheel-scroll
;;<right-fringe> <wheel-left>	mwheel-scroll
;;<right-fringe> <wheel-right>	mwheel-scroll
;;<right-fringe> <wheel-up>	mwheel-scroll
;;<left-fringe> <mouse-4>		mwheel-scroll
;;<left-fringe> <mouse-5>		mwheel-scroll
;;<left-fringe> <mouse-6>		mwheel-scroll
;;<left-fringe> <mouse-7>		mwheel-scroll
;;<left-fringe> <wheel-down>	mwheel-scroll
;;<left-fringe> <wheel-left>	mwheel-scroll
;;<left-fringe> <wheel-right>	mwheel-scroll
;;<left-fringe> <wheel-up>	mwheel-scroll
;;<right-margin> <mouse-4>	mwheel-scroll
;;<right-margin> <mouse-5>	mwheel-scroll
;;<right-margin> <mouse-6>	mwheel-scroll
;;<right-margin> <mouse-7>	mwheel-scroll
;;<right-margin> <wheel-down>	mwheel-scroll
;;<right-margin> <wheel-left>	mwheel-scroll
;;<right-margin> <wheel-right>	mwheel-scroll
;;<right-margin> <wheel-up>	mwheel-scroll
;;<left-margin> <mouse-4>		mwheel-scroll
;;<left-margin> <mouse-5>		mwheel-scroll
;;<left-margin> <mouse-6>		mwheel-scroll
;;<left-margin> <mouse-7>		mwheel-scroll
;;<left-margin> <wheel-down>	mwheel-scroll
;;<left-margin> <wheel-left>	mwheel-scroll
;;<left-margin> <wheel-right>	mwheel-scroll
;;<left-margin> <wheel-up>	mwheel-scroll
;;<bottom-left-corner> <down-mouse-1> mouse-drag-bottom-left-corner
;;<bottom-left-corner> <mouse-1>	    ignore
;;<bottom-edge> <down-mouse-1>	mouse-drag-bottom-edge
;;<bottom-edge> <mouse-1>		ignore
;;<bottom-right-corner> <down-mouse-1> mouse-drag-bottom-right-corner
;;<bottom-right-corner> <mouse-1>	     ignore
;;<right-edge> <down-mouse-1>	mouse-drag-right-edge
;;<right-edge> <mouse-1>		ignore
;;<top-right-corner> <down-mouse-1> mouse-drag-top-right-corner
;;<top-right-corner> <mouse-1>	  ignore
;;<top-edge> <down-mouse-1>	mouse-drag-top-edge
;;<top-edge> <mouse-1>		ignore
;;<top-left-corner> <down-mouse-1> mouse-drag-top-left-corner
;;<top-left-corner> <mouse-1>	 ignore
;;<left-edge> <down-mouse-1>	mouse-drag-left-edge
;;<left-edge> <mouse-1>		ignore
;;<bottom-divider> C-<mouse-2>	mouse-split-window-horizontally
;;<bottom-divider> <down-mouse-1>	mouse-drag-mode-line
;;<bottom-divider> <mouse-1>	ignore
;;<right-divider> C-<mouse-2>	mouse-split-window-vertically
;;<right-divider> <down-mouse-1>	mouse-drag-vertical-line
;;<right-divider> <mouse-1>	ignore
;;<vertical-line> C-<mouse-2>	mouse-split-window-vertically
;;<vertical-line> <down-mouse-1>	mouse-drag-vertical-line
;;<vertical-line> <mouse-1>	mouse-select-window
;;<horizontal-scroll-bar> C-<mouse-2>   mouse-split-window-horizontally
;;<horizontal-scroll-bar> <mouse-1>     scroll-bar-toolkit-horizontal-scroll
;;<horizontal-scroll-bar> <mouse-4>     mwheel-scroll
;;<horizontal-scroll-bar> <mouse-5>     mwheel-scroll
;;<horizontal-scroll-bar> <mouse-6>     mwheel-scroll
;;<horizontal-scroll-bar> <mouse-7>     mwheel-scroll
;;<horizontal-scroll-bar> <wheel-down>  mwheel-scroll
;;<horizontal-scroll-bar> <wheel-left>  mwheel-scroll
;;<horizontal-scroll-bar> <wheel-right> mwheel-scroll
;;<horizontal-scroll-bar> <wheel-up>    mwheel-scroll
;;<vertical-scroll-bar> C-<mouse-2>   mouse-split-window-vertically
;;<vertical-scroll-bar> <mouse-1>	    scroll-bar-toolkit-scroll
;;<vertical-scroll-bar> <mouse-4>	    mwheel-scroll
;;<vertical-scroll-bar> <mouse-5>	    mwheel-scroll
;;<vertical-scroll-bar> <mouse-6>	    mwheel-scroll
;;<vertical-scroll-bar> <mouse-7>	    mwheel-scroll
;;<vertical-scroll-bar> <wheel-down>  mwheel-scroll
;;<vertical-scroll-bar> <wheel-left>  mwheel-scroll
;;<vertical-scroll-bar> <wheel-right> mwheel-scroll
;;<vertical-scroll-bar> <wheel-up>    mwheel-scroll
;;<mode-line> C-<mouse-2>		mouse-split-window-horizontally
;;<mode-line> <down-mouse-1>	mouse-drag-mode-line
;;<mode-line> <mouse-1>		mouse-select-window
;;<mode-line> <mouse-2>		mouse-delete-other-windows
;;<mode-line> <mouse-3>		mouse-delete-window
;;<mode-line> <mouse-4>		mwheel-scroll
;;<mode-line> <mouse-5>		mwheel-scroll
;;<mode-line> <mouse-6>		mwheel-scroll
;;<mode-line> <mouse-7>		mwheel-scroll
;;<mode-line> <wheel-down>	mwheel-scroll
;;<mode-line> <wheel-left>	mwheel-scroll
;;<mode-line> <wheel-right>	mwheel-scroll
;;<mode-line> <wheel-up>		mwheel-scroll
;;<tab-line> <down-mouse-1>	mouse-drag-tab-line
;;<tab-line> <mouse-1>		mouse-select-window
;;<header-line> <down-mouse-1>	mouse-drag-header-line
;;<header-line> <mouse-1>		mouse-select-window
;;<header-line> <mouse-4>		mwheel-scroll
;;<header-line> <mouse-5>		mwheel-scroll
;;<header-line> <mouse-6>		mwheel-scroll
;;<header-line> <mouse-7>		mwheel-scroll
;;<header-line> <wheel-down>	mwheel-scroll
;;<header-line> <wheel-left>	mwheel-scroll
;;<header-line> <wheel-right>	mwheel-scroll
;;<header-line> <wheel-up>	mwheel-scroll
;;<f1> C-a	about-emacs
;;<f1> C-c	describe-copying
;;<f1> C-d	view-emacs-debugging
;;<f1> C-e	view-external-packages
;;<f1> C-f	view-emacs-FAQ
;;<f1> C-h	help-for-help
;;<f1> RET	view-order-manuals
;;<f1> C-n	view-emacs-news
;;<f1> C-o	describe-distribution
;;<f1> C-p	view-emacs-problems
;;<f1> C-q	help-quick-toggle
;;<f1> C-s	search-forward-help-for-help
;;<f1> C-t	view-emacs-todo
;;<f1> C-w	describe-no-warranty
;;<f1> C-\	describe-input-method
;;<f1> .		display-local-help
;;<f1> ?		help-for-help
;;<f1> C		describe-coding-system
;;<f1> F		Info-goto-emacs-command-node
;;<f1> I		describe-input-method
;;<f1> K		Info-goto-emacs-key-command-node
;;<f1> L		describe-language-environment
;;<f1> P		describe-package
;;<f1> R		info-display-manual
;;<f1> S		info-lookup-symbol
;;<f1> a		apropos-command
;;<f1> b		describe-bindings
;;<f1> c		describe-key-briefly
;;<f1> d		apropos-documentation
;;<f1> e		view-echo-area-messages
;;<f1> f		describe-function
;;<f1> g		describe-gnu-project
;;<f1> h		view-hello-file
;;<f1> i		info
;;<f1> k		describe-key
;;<f1> l		view-lossage
;;<f1> m		describe-mode
;;<f1> n		view-emacs-news
;;<f1> o		describe-symbol
;;<f1> p		finder-by-keyword
;;<f1> q		help-quit
;;<f1> r		info-emacs-manual
;;<f1> s		describe-syntax
;;<f1> t		help-with-tutorial
;;<f1> v		describe-variable
;;<f1> w		where-is
;;<f1> x		describe-command
;;<f1> <f1>	help-for-help
;;<f1> <help>	help-for-help
;;<help> C-a	about-emacs
;;<help> C-c	describe-copying
;;<help> C-d	view-emacs-debugging
;;<help> C-e	view-external-packages
;;<help> C-f	view-emacs-FAQ
;;<help> C-h	help-for-help
;;<help> RET	view-order-manuals
;;<help> C-n	view-emacs-news
;;<help> C-o	describe-distribution
;;<help> C-p	view-emacs-problems
;;<help> C-q	help-quick-toggle
;;<help> C-s	search-forward-help-for-help
;;<help> C-t	view-emacs-todo
;;<help> C-w	describe-no-warranty
;;<help> C-\	describe-input-method
;;<help> .	display-local-help
;;<help> ?	help-for-help
;;<help> C	describe-coding-system
;;<help> F	Info-goto-emacs-command-node
;;<help> I	describe-input-method
;;<help> K	Info-goto-emacs-key-command-node
;;<help> L	describe-language-environment
;;<help> P	describe-package
;;<help> R	info-display-manual
;;<help> S	info-lookup-symbol
;;<help> a	apropos-command
;;<help> b	describe-bindings
;;<help> c	describe-key-briefly
;;<help> d	apropos-documentation
;;<help> e	view-echo-area-messages
;;<help> f	describe-function
;;<help> g	describe-gnu-project
;;<help> h	view-hello-file
;;<help> i	info
;;<help> k	describe-key
;;<help> l	view-lossage
;;<help> m	describe-mode
;;<help> n	view-emacs-news
;;<help> o	describe-symbol
;;<help> p	finder-by-keyword
;;<help> q	help-quit
;;<help> r	info-emacs-manual
;;<help> s	describe-syntax
;;<help> t	help-with-tutorial
;;<help> v	describe-variable
;;<help> w	where-is
;;<help> x	describe-command
;;<help> <f1>	help-for-help
;;<help> <help>	help-for-help
;;<f2> 2		2C-two-columns
;;<f2> b		2C-associate-buffer
;;<f2> s		2C-split
;;<f2> <f2>	2C-two-columns
;;C-<down-mouse-2> <dc>	list-colors-display
;;C-<down-mouse-2> <df>	list-faces-display
;;C-<down-mouse-2> <dp>	describe-text-properties
;;C-<down-mouse-2> <ra>	facemenu-remove-all
;;C-<down-mouse-2> <rm>	facemenu-remove-face-props
;;C-h 4 i		info-other-window
;;C-x C-k C-a	kmacro-add-counter
;;C-x C-k C-c	kmacro-set-counter
;;C-x C-k C-d	kmacro-delete-ring-head
;;C-x C-k C-e	kmacro-edit-macro-repeat
;;C-x C-k C-f	kmacro-set-format
;;C-x C-k TAB	kmacro-insert-counter
;;C-x C-k C-k	kmacro-end-or-call-macro-repeat
;;C-x C-k C-l	kmacro-call-ring-2nd-repeat
;;C-x C-k RET	kmacro-edit-macro
;;C-x C-k C-n	kmacro-cycle-ring-next
;;C-x C-k C-p	kmacro-cycle-ring-previous
;;C-x C-k C-s	kmacro-start-macro
;;C-x C-k C-t	kmacro-swap-ring
;;C-x C-k C-v	kmacro-view-macro-repeat
;;C-x C-k SPC	kmacro-step-edit-macro
;;C-x C-k b	kmacro-bind-to-key
;;C-x C-k d	kmacro-redisplay
;;C-x C-k e	edit-kbd-macro
;;C-x C-k l	kmacro-edit-lossage
;;C-x C-k n	kmacro-name-last-macro
;;C-x C-k q	kbd-macro-query
;;C-x C-k r	apply-macro-to-region-lines
;;C-x C-k s	kmacro-start-macro
;;C-x C-k x	kmacro-to-register
;;C-x RET C-\	set-input-method
;;C-x RET F	set-file-name-coding-system
;;C-x RET X	set-next-selection-coding-system
;;C-x RET c	universal-coding-system-argument
;;C-x RET f	set-buffer-file-coding-system
;;C-x RET k	set-keyboard-coding-system
;;C-x RET l	set-language-environment
;;C-x RET p	set-buffer-process-coding-system
;;C-x RET r	revert-buffer-with-coding-system
;;C-x RET t	set-terminal-coding-system
;;C-x RET x	set-selection-coding-system
;;C-x ESC ESC	repeat-complex-command
;;C-x M-:		repeat-complex-command
;;C-x C-M-+	global-text-scale-adjust
;;C-x C-M--	global-text-scale-adjust
;;C-x C-M-0	global-text-scale-adjust
;;C-x C-M-=	global-text-scale-adjust
;;C-x 4 C-f	find-file-other-window
;;C-x 4 C-j	dired-jump-other-window
;;C-x 4 C-o	display-buffer
;;C-x 4 .		xref-find-definitions-other-window
;;C-x 4 0		kill-buffer-and-window
;;C-x 4 1		same-window-prefix
;;C-x 4 4		other-window-prefix
;;C-x 4 a		add-change-log-entry-other-window
;;C-x 4 b		switch-to-buffer-other-window
;;C-x 4 c		clone-indirect-buffer-other-window
;;C-x 4 d		dired-other-window
;;C-x 4 f		find-file-other-window
;;C-x 4 m		compose-mail-other-window
;;C-x 4 p		project-other-window-command
;;C-x 4 r		find-file-read-only-other-window
;;C-x 5 C-f	find-file-other-frame
;;C-x 5 C-o	display-buffer-other-frame
;;C-x 5 .		xref-find-definitions-other-frame
;;C-x 5 0		delete-frame
;;C-x 5 1		delete-other-frames
;;C-x 5 2		make-frame-command
;;C-x 5 5		other-frame-prefix
;;C-x 5 b		switch-to-buffer-other-frame
;;C-x 5 c		clone-frame
;;C-x 5 d		dired-other-frame
;;C-x 5 f		find-file-other-frame
;;C-x 5 m		compose-mail-other-frame
;;C-x 5 o		other-frame
;;C-x 5 p		project-other-frame-command
;;C-x 5 r		find-file-read-only-other-frame
;;C-x 5 u		undelete-frame
;;C-x 6 2		2C-two-columns
;;C-x 6 b		2C-associate-buffer
;;C-x 6 s		2C-split
;;C-x 6 <f2>	2C-two-columns
;;C-x 8 RET	insert-char
;;C-x a C-a	add-mode-abbrev
;;C-x a '		expand-abbrev
;;C-x a +		add-mode-abbrev
;;C-x a -		inverse-add-global-abbrev
;;C-x a e		expand-abbrev
;;C-x a g		add-global-abbrev
;;C-x a l		add-mode-abbrev
;;C-x a n		expand-jump-to-next-slot
;;C-x a p		expand-jump-to-previous-slot
;;C-x n d		narrow-to-defun
;;C-x n g		goto-line-relative
;;C-x n n		narrow-to-region
;;C-x n p		narrow-to-page
;;C-x n w		widen
;;C-x p C-b	project-list-buffers
;;C-x p !		project-shell-command
;;C-x p &		project-async-shell-command
;;C-x p D		project-dired
;;C-x p F		project-or-external-find-file
;;C-x p G		project-or-external-find-regexp
;;C-x p b		project-switch-to-buffer
;;C-x p c		project-compile
;;C-x p d		project-find-dir
;;C-x p e		project-eshell
;;C-x p f		project-find-file
;;C-x p g		project-find-regexp
;;C-x p k		project-kill-buffers
;;C-x p p		project-switch-project
;;C-x p r		project-query-replace-regexp
;;C-x p s		project-shell
;;C-x p v		project-vc-dir
;;C-x p x		project-execute-extended-command
;;C-x r C-@	point-to-register
;;C-x r SPC	point-to-register
;;C-x r +		increment-register
;;C-x r M		bookmark-set-no-overwrite
;;C-x r N		rectangle-number-lines
;;C-x r b		bookmark-jump
;;C-x r c		clear-rectangle
;;C-x r d		delete-rectangle
;;C-x r f		frameset-to-register
;;C-x r g		insert-register
;;C-x r i		insert-register
;;C-x r j		jump-to-register
;;C-x r k		kill-rectangle
;;C-x r l		bookmark-bmenu-list
;;C-x r m		bookmark-set
;;C-x r n		number-to-register
;;C-x r o		open-rectangle
;;C-x r r		copy-rectangle-to-register
;;C-x r s		copy-to-register
;;C-x r t		string-rectangle
;;C-x r w		window-configuration-to-register
;;C-x r x		copy-to-register
;;C-x r y		yank-rectangle
;;C-x r C-SPC	point-to-register
;;C-x t C-f	find-file-other-tab
;;C-x t RET	tab-switch
;;C-x t C-r	find-file-read-only-other-tab
;;C-x t 0		tab-close
;;C-x t 1		tab-close-other
;;C-x t 2		tab-new
;;C-x t G		tab-group
;;C-x t M		tab-move-to
;;C-x t N		tab-new-to
;;C-x t O		tab-previous
;;C-x t b		switch-to-buffer-other-tab
;;C-x t d		dired-other-tab
;;C-x t f		find-file-other-tab
;;C-x t m		tab-move
;;C-x t n		tab-duplicate
;;C-x t o		tab-next
;;C-x t p		project-other-tab-command
;;C-x t r		tab-rename
;;C-x t t		other-tab-prefix
;;C-x t u		tab-undo
;;C-x v !		vc-edit-next-command
;;C-x v +		vc-update
;;C-x v =		vc-diff
;;C-x v D		vc-root-diff
;;C-x v G		vc-ignore
;;C-x v I		vc-log-incoming
;;C-x v L		vc-print-root-log
;;C-x v O		vc-log-outgoing
;;C-x v P		vc-push
;;C-x v a		vc-update-change-log
;;C-x v d		vc-dir
;;C-x v g		vc-annotate
;;C-x v h		vc-region-history
;;C-x v i		vc-register
;;C-x v l		vc-print-log
;;C-x v m		vc-merge
;;C-x v r		vc-retrieve-tag
;;C-x v s		vc-create-tag
;;C-x v u		vc-revert
;;C-x v v		vc-next-action
;;C-x v x		vc-delete-file
;;C-x v ~		vc-revision-other-window
;;C-x w -		fit-window-to-buffer
;;C-x w 0		delete-windows-on
;;C-x w 2		split-root-window-below
;;C-x w 3		split-root-window-right
;;C-x w s		window-toggle-side-windows
;;C-x x f		font-lock-update
;;C-x x g		revert-buffer-quick
;;C-x x i		insert-buffer
;;C-x x n		clone-buffer
;;C-x x r		rename-buffer
;;C-x x t		toggle-truncate-lines
;;C-x x u		rename-uniquely
;;M-s h .		highlight-symbol-at-point
;;M-s h f		hi-lock-find-patterns
;;M-s h l		highlight-lines-matching-regexp
;;M-s h p		highlight-phrase
;;M-s h r		highlight-regexp
;;M-s h u		unhighlight-regexp
;;M-s h w		hi-lock-write-interactive-patterns
;;M-s M-.		isearch-forward-thing-at-point
;;M-s M-w		eww-search-words
;;M-g M-g		goto-line
;;M-g M-n		next-error
;;M-g M-p		previous-error
;;<f1> 4 i	info-other-window
;;<help> 4 i	info-other-window
;;C-<down-mouse-2> <fc> b	facemenu-set-bold
;;C-<down-mouse-2> <fc> d	facemenu-set-default
;;C-<down-mouse-2> <fc> i	facemenu-set-italic
;;C-<down-mouse-2> <fc> l	facemenu-set-bold-italic
;;C-<down-mouse-2> <fc> o	facemenu-set-face
;;C-<down-mouse-2> <fc> u	facemenu-set-underline
;;C-<down-mouse-2> <fg> o	facemenu-set-foreground
;;C-<down-mouse-2> <bg> o	facemenu-set-background
;;C-<down-mouse-2> <sp> c	facemenu-set-charset
;;C-<down-mouse-2> <sp> r	facemenu-set-read-only
;;C-<down-mouse-2> <sp> s	facemenu-remove-special
;;C-<down-mouse-2> <sp> t	facemenu-set-intangible
;;C-<down-mouse-2> <sp> v	facemenu-set-invisible
;;C-<down-mouse-2> <ju> b	set-justification-full
;;C-<down-mouse-2> <ju> c	set-justification-center
;;C-<down-mouse-2> <ju> l	set-justification-left
;;C-<down-mouse-2> <ju> r	set-justification-right
;;C-<down-mouse-2> <ju> u	set-justification-none
;;C-<down-mouse-2> <in> <decrease-left-margin>  decrease-left-margin
;;C-<down-mouse-2> <in> <decrease-right-margin> decrease-right-margin
;;C-<down-mouse-2> <in> <increase-left-margin>  increase-left-margin
;;C-<down-mouse-2> <in> <increase-right-margin> increase-right-margin
;;C-x 8 e +	emoji-zoom-increase
;;C-x 8 e -	emoji-zoom-decrease
;;C-x 8 e 0	emoji-zoom-reset
;;C-x 8 e d	emoji-describe
;;C-x 8 e e	emoji-insert
;;C-x 8 e i	emoji-insert
;;C-x 8 e l	emoji-list
;;C-x 8 e r	emoji-recent
;;C-x 8 e s	emoji-search
;;C-x a i g	inverse-add-global-abbrev
;;C-x a i l	inverse-add-mode-abbrev
;;C-x r M-w	copy-rectangle-as-kill
;;C-x t ^ f	tab-detach
;;C-x v M D	vc-diff-mergebase
;;C-x v M L	vc-log-mergebase
;;C-x v b c	vc-create-branch
;;C-x v b l	vc-print-branch-log
;;C-x v b s	vc-switch-branch
;;C-x w ^ f	tear-off-window
;;C-x w ^ t	tab-window-detach
;;C-@			C-SPC
;;C-M-S-<kp-0>		C-M-S-0
;;C-M-S-<kp-1>		C-M-S-1
;;C-M-S-<kp-2>		C-M-S-2
;;C-M-S-<kp-3>		C-M-S-3
;;C-M-S-<kp-4>		C-M-S-4
;;C-M-S-<kp-5>		C-M-S-5
;;C-M-S-<kp-6>		C-M-S-6
;;C-M-S-<kp-7>		C-M-S-7
;;C-M-S-<kp-8>		C-M-S-8
;;C-M-S-<kp-9>		C-M-S-9
;;C-M-S-<kp-add>		C-M-S-+
;;C-M-S-<kp-begin>	C-M-S-<begin>
;;C-M-S-<kp-decimal>	C-M-S-.
;;C-M-S-<kp-delete>	C-M-S-<delete>
;;C-M-S-<kp-divide>	C-M-S-/
;;C-M-S-<kp-down>		C-M-S-<down>
;;C-M-S-<kp-end>		C-M-S-<end>
;;C-M-S-<kp-enter>	C-M-S-<enter>
;;C-M-S-<kp-home>		C-M-S-<home>
;;C-M-S-<kp-insert>	C-M-S-<insert>
;;C-M-S-<kp-left>		C-M-S-<left>
;;C-M-S-<kp-multiply>	C-M-S-*
;;C-M-S-<kp-next>		C-M-S-<next>
;;C-M-S-<kp-prior>	C-M-S-<prior>
;;C-M-S-<kp-right>	C-M-S-<right>
;;C-M-S-<kp-subtract>	C-M-S--
;;C-M-S-<kp-up>		C-M-S-<up>
;;C-M-<kp-0>		C-M-0
;;C-M-<kp-1>		C-M-1
;;C-M-<kp-2>		C-M-2
;;C-M-<kp-3>		C-M-3
;;C-M-<kp-4>		C-M-4
;;C-M-<kp-5>		C-M-5
;;C-M-<kp-6>		C-M-6
;;C-M-<kp-7>		C-M-7
;;C-M-<kp-8>		C-M-8
;;C-M-<kp-9>		C-M-9
;;C-M-<kp-add>		C-M-+
;;C-M-<kp-begin>		C-M-<begin>
;;C-M-<kp-decimal>	C-M-.
;;C-M-<kp-delete>		C-M-<delete>
;;C-M-<kp-divide>		C-M-/
;;C-M-<kp-down>		C-M-<down>
;;C-M-<kp-end>		C-M-<end>
;;C-M-<kp-enter>		C-M-<enter>
;;C-M-<kp-home>		C-M-<home>
;;C-M-<kp-insert>		C-M-<insert>
;;C-M-<kp-left>		C-M-<left>
;;C-M-<kp-multiply>	C-M-*
;;C-M-<kp-next>		C-M-<next>
;;C-M-<kp-prior>		C-M-<prior>
;;C-M-<kp-right>		C-M-<right>
;;C-M-<kp-subtract>	C-M--
;;C-M-<kp-up>		C-M-<up>
;;C-S-<kp-0>		C-S-0
;;C-S-<kp-1>		C-S-1
;;C-S-<kp-2>		C-S-2
;;C-S-<kp-3>		C-S-3
;;C-S-<kp-4>		C-S-4
;;C-S-<kp-5>		C-S-5
;;C-S-<kp-6>		C-S-6
;;C-S-<kp-7>		C-S-7
;;C-S-<kp-8>		C-S-8
;;C-S-<kp-9>		C-S-9
;;C-S-<kp-add>		C-S-+
;;C-S-<kp-begin>		C-S-<begin>
;;C-S-<kp-decimal>	C-S-.
;;C-S-<kp-delete>		C-S-<delete>
;;C-S-<kp-divide>		C-S-/
;;C-S-<kp-down>		C-S-<down>
;;C-S-<kp-end>		C-S-<end>
;;C-S-<kp-enter>		C-S-<enter>
;;C-S-<kp-home>		C-S-<home>
;;C-S-<kp-insert>		C-S-<insert>
;;C-S-<kp-left>		C-S-<left>
;;C-S-<kp-multiply>	C-S-*
;;C-S-<kp-next>		C-S-<next>
;;C-S-<kp-prior>		C-S-<prior>
;;C-S-<kp-right>		C-S-<right>
;;C-S-<kp-subtract>	C-S--
;;C-S-<kp-up>		C-S-<up>
;;C-<kp-0>		C-0
;;C-<kp-1>		C-1
;;C-<kp-2>		C-2
;;C-<kp-3>		C-3
;;C-<kp-4>		C-4
;;C-<kp-5>		C-5
;;C-<kp-6>		C-6
;;C-<kp-7>		C-7
;;C-<kp-8>		C-8
;;C-<kp-9>		C-9
;;C-<kp-add>		C-+
;;C-<kp-begin>		C-<begin>
;;C-<kp-decimal>		C-.
;;C-<kp-delete>		C-<delete>
;;C-<kp-divide>		C-/
;;C-<kp-down>		C-<down>
;;C-<kp-end>		C-<end>
;;C-<kp-enter>		C-<enter>
;;C-<kp-home>		C-<home>
;;C-<kp-insert>		C-<insert>
;;C-<kp-left>		C-<left>
;;C-<kp-multiply>		C-*
;;C-<kp-next>		C-<next>
;;C-<kp-prior>		C-<prior>
;;C-<kp-right>		C-<right>
;;C-<kp-subtract>		C--
;;C-<kp-up>		C-<up>
;;M-S-<kp-0>		M-S-0
;;M-S-<kp-1>		M-S-1
;;M-S-<kp-2>		M-S-2
;;M-S-<kp-3>		M-S-3
;;M-S-<kp-4>		M-S-4
;;M-S-<kp-5>		M-S-5
;;M-S-<kp-6>		M-S-6
;;M-S-<kp-7>		M-S-7
;;M-S-<kp-8>		M-S-8
;;M-S-<kp-9>		M-S-9
;;M-S-<kp-add>		M-S-+
;;M-S-<kp-begin>		M-S-<begin>
;;M-S-<kp-decimal>	M-S-.
;;M-S-<kp-delete>		M-S-<delete>
;;M-S-<kp-divide>		M-S-/
;;M-S-<kp-down>		M-S-<down>
;;M-S-<kp-end>		M-S-<end>
;;M-S-<kp-enter>		M-S-<enter>
;;M-S-<kp-home>		M-S-<home>
;;M-S-<kp-insert>		M-S-<insert>
;;M-S-<kp-left>		M-S-<left>
;;M-S-<kp-multiply>	M-S-*
;;M-S-<kp-next>		M-S-<next>
;;M-S-<kp-prior>		M-S-<prior>
;;M-S-<kp-right>		M-S-<right>
;;M-S-<kp-subtract>	M-S--
;;M-S-<kp-up>		M-S-<up>
;;M-<backspace>		M-DEL
;;M-<clear>		C-M-l
;;M-<delete>		M-DEL
;;M-<escape>		M-ESC
;;M-<kp-0>		M-0
;;M-<kp-1>		M-1
;;M-<kp-2>		M-2
;;M-<kp-3>		M-3
;;M-<kp-4>		M-4
;;M-<kp-5>		M-5
;;M-<kp-6>		M-6
;;M-<kp-7>		M-7
;;M-<kp-8>		M-8
;;M-<kp-9>		M-9
;;M-<kp-add>		M-+
;;M-<kp-begin>		M-<begin>
;;M-<kp-decimal>		M-.
;;M-<kp-delete>		M-<delete>
;;M-<kp-divide>		M-/
;;M-<kp-down>		M-<down>
;;M-<kp-end>		M-<end>
;;M-<kp-enter>		M-<enter>
;;M-<kp-home>		M-<home>
;;M-<kp-insert>		M-<insert>
;;M-<kp-left>		M-<left>
;;M-<kp-multiply>		M-*
;;M-<kp-next>		M-<next>
;;M-<kp-prior>		M-<prior>
;;M-<kp-right>		M-<right>
;;M-<kp-subtract>		M--
;;M-<kp-up>		M-<up>
;;M-<linefeed>		C-M-j
;;M-<return>		M-RET
;;M-<tab>			C-M-i
;;S-<iso-lefttab>		<backtab>
;;S-<kp-0>		S-0
;;S-<kp-1>		S-1
;;S-<kp-2>		S-2
;;S-<kp-3>		S-3
;;S-<kp-4>		S-4
;;S-<kp-5>		S-5
;;S-<kp-6>		S-6
;;S-<kp-7>		S-7
;;S-<kp-8>		S-8
;;S-<kp-9>		S-9
;;S-<kp-add>		S-+
;;S-<kp-begin>		S-<begin>
;;S-<kp-decimal>		S-.
;;S-<kp-delete>		S-<delete>
;;S-<kp-divide>		S-/
;;S-<kp-down>		S-<down>
;;S-<kp-end>		S-<end>
;;S-<kp-enter>		S-<enter>
;;S-<kp-home>		S-<home>
;;S-<kp-insert>		S-<insert>
;;S-<kp-left>		S-<left>
;;S-<kp-multiply>		S-*
;;S-<kp-next>		S-<next>
;;S-<kp-prior>		S-<prior>
;;S-<kp-right>		S-<right>
;;S-<kp-subtract>		S--
;;S-<kp-up>		S-<up>
;;S-<tab>			<backtab>
;;<backspace>		DEL
;;<clear>			C-l
;;<delete>		<deletechar>
;;<escape>		ESC
;;<iso-lefttab>		<backtab>
;;<kp-0>			0
;;<kp-1>			1
;;<kp-2>			2
;;<kp-3>			3
;;<kp-4>			4
;;<kp-5>			5
;;<kp-6>			6
;;<kp-7>			7
;;<kp-8>			8
;;<kp-9>			9
;;<kp-add>		+
;;<kp-begin>		<begin>
;;<kp-decimal>		.
;;<kp-delete>		<deletechar>
;;<kp-divide>		/
;;<kp-down>		<down>
;;<kp-end>		<end>
;;<kp-enter>		RET
;;<kp-equal>		=
;;<kp-home>		<home>
;;<kp-insert>		<insert>
;;<kp-left>		<left>
;;<kp-multiply>		*
;;<kp-next>		<next>
;;<kp-prior>		<prior>
;;<kp-right>		<right>
;;<kp-separator>		,
;;<kp-space>		SPC
;;<kp-subtract>		-
;;<kp-tab>		TAB
;;<kp-up>			<up>
;;<linefeed>		C-j
;;<return>		RET
;;<tab>			TAB
;;<right-fringe> <mouse-1>	mouse--strip-first-event
;;<right-fringe> <mouse-2>	mouse--strip-first-event
;;<right-fringe> <mouse-3>	mouse--strip-first-event
;;<left-fringe> <mouse-1>	mouse--strip-first-event
;;<left-fringe> <mouse-2>	mouse--strip-first-event
;;<left-fringe> <mouse-3>	mouse--strip-first-event
;;C-x @ S		event-apply-shift-modifier
;;C-x @ a		event-apply-alt-modifier
;;C-x @ c		event-apply-control-modifier
;;C-x @ h		event-apply-hyper-modifier
;;C-x @ m		event-apply-meta-modifier

;; Bind keys for navigation
(bind-key "M-i" 'previous-line)
(bind-key "M-k" 'next-line)
(bind-key "M-j" 'left-char)
(bind-key "M-l" 'right-char)
(bind-key "M-u" 'backward-word)
(bind-key "M-o" 'forward-word)
(bind-key "M-," 'newline)
(bind-key "M-n" 'delete-backward-char)
(bind-key "M-m" 'delete-forward-char)
(bind-key "M-g" 'keyboard-quit)

;; Bind keys for copy paste
(bind-key "M-f" 'isearch-forward)
(bind-key "M-f" 'isearch-repeat-forward isearch-mode-map)
(bind-key "M-w" 'kill-ring-save)
(bind-key "M-e" 'yank)
(bind-key "M-;" (lambda() (interactive) (push-mark nil nil 1)))

;; Bind keys for M-q
(bind-keys :prefix-map general-prefix-map
           :prefix "M-q"
           ("M-j" . move-beginning-of-line)
           ("M-l" . move-end-of-line)
           ("i" . beginning-of-buffer)
           ("k" . end-of-buffer)
           ("M-i" . (lambda () (interactive) (previous-line 50)))
           ("M-k" . (lambda () (interactive) (next-line 50)))
           ("M-w" . kill-region)
           ("M-<return>" . save-buffer)
           )

;;;; Load theme
(use-package cyberpunk-theme
  :ensure t
  :config
  (load-theme 'cyberpunk t))

;; Ensure bindings for hs-minor-mode
(bind-keys :prefix-map hs-minor-mode-prefix-map
	   :prefix "M-2"
	   ("<up>" . hs-hide-all)
	   ("<down>" . hs-show-all)
	   ("<left>" . hs-hide-block)
	   ("<right>" . hs-show-block)
	   )

;; Allows for multiple screens
(use-package elscreen
  :ensure t
  :init
  (elscreen-start)
  (bind-keys :prefix-map window-prefix-map
             :prefix "M-1"
             ("M-b" . buffer-menu)
             ("M-1" . other-window)
             ("M-2" . buffer-menu)
             ("M-k" . split-window-below)
             ("M-l" . split-window-right)
             ("M-j" . delete-window)
             ("M-i" . elscreen-create)
             ("M-u" . elscreen-previous)
             ("M-o" . elscreen-next)
             ("C-i" . elscreen-kill))
  )

;; Enables undo-tree key bindings
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode 1)
  (setq undo-tree-auto-save-history nil)
  :config
  (bind-key "M-s" 'undo)
  (bind-key "M-d" 'redo)
  )

;; Allows for multiple cursors
(use-package multiple-cursors
  :ensure t
  :config
  (bind-key "M-q M-;" 'mc/edit-lines)
  (bind-key "M-q M-f" 'mc/mark-next-like-this)
  )

;; Package for autocompletion of extended commands
(use-package smex
  :ensure t
  :init
  (setq smex-save-file "~/.emacs.d/smex.save")
  (smex-initialize)
  (bind-key "M-\\" 'smex)
  )

;; Corfu
(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  )

;; Package for navigation of files
(use-package neotree
  :ensure t
  :config
  (bind-key "M-1 M-f" 'neotree)
  )

;; Location of backup files
;;(setq backup-directory-alist '(("." . "~/.saves")))
;;
;;;; Setup theme
;;(custom-set-variables
;; ;; custom-set-variables was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; '(custom-safe-themes
;;   '("5c64430cb8e12e2486cd9f74d4ce5172e00f8e633095d27edd212787a4225245" "5768debbe7c8ba4db256a50a0785f08a8fa7df37435a6b75bd5994f543d5b2c1" "660376e0336bb04fae2dcf73ab6a1fe946ccea82b25f6800d51977e3a16de1b9" default))
;; '(inhibit-startup-screen t)
;; '(package-selected-packages
;;   '(multiple-cursors use-package smex neotree undo-tree elscreen dark-mint-theme)))
;;
;;;; List of repositories to use
;;(require 'package)
;;(setq package-enable-at-startup nil)
;;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;;(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
;;(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
;;(package-initialize)
;;
;;;; Fetch information from repositories
;;(unless package-archive-contents
;;  (package-refresh-contents))
;;
;;;; Install use-package
;;(setq my-package-list '(use-package))
;;(unless (package-installed-p 'use-package)
;;  (package-install 'use-package)
;;  )
;;
;;;; Ensure some important key bindings can be overwritten
;;(define-key key-translation-map (kbd "M-p") (kbd "C-i"))
;;(define-key key-translation-map (kbd "M-g") (kbd "C-G"))
;;(define-key key-translation-map (kbd "M-n") (kbd "DEL"))
;;(define-key key-translation-map (kbd "M-,") (kbd "RET"))
;;(define-key key-translation-map (kbd "M-i") (kbd "<up>"))
;;(define-key key-translation-map (kbd "M-k") (kbd "<down>"))
;;(define-key key-translation-map (kbd "M-j") (kbd "<left>"))
;;(define-key key-translation-map (kbd "M-l") (kbd "<right>"))
;;
;;;; Unset some keys that seems to cause troubles
;;(global-unset-key "\M-x")
;;(global-unset-key "\C-k")
;;(global-unset-key "\C-j")
;;(global-unset-key "\C-l")
;;(global-unset-key "\C-d")
;;(global-unset-key "\M-d")
;;(global-unset-key "\M-o")
;;
;;;; Some navigational key bindings
;;(bind-key "M-u" 'backward-word)
;;(bind-key "M-o" 'forward-word)
;;(bind-key "M-m" 'delete-forward-char)
;;
;;;; Copy paste and search key bindings
;;(bind-key "M-f" 'isearch-forward)
;;(bind-key "M-f" 'isearch-repeat-forward isearch-mode-map)
;;(bind-key "M-w" 'kill-ring-save)
;;(bind-key "M-e" 'yank)
;;(bind-key "M-;" (lambda() (interactive) (push-mark nil nil 1)))
;;
;;;; Some more uncommon shortcuts associated with M-q prefix
;;(bind-keys :prefix-map general-prefix-map
;;           :prefix "M-q"
;;           ("<left>" . move-beginning-of-line)
;;           ("<right>" . move-end-of-line)
;;           ("i" . beginning-of-buffer)
;;           ("k" . end-of-buffer)
;;           ("<up>" . (lambda () (interactive) (previous-line 50)))
;;           ("<down>" . (lambda () (interactive) (next-line 50)))
;;           ("M-w" . kill-region)
;;           ("M-<return>" . save-buffer)
;;           )
;;
;;;; Load theme
;;(use-package dark-mint-theme
;;  :ensure t
;;  :init
;;  (load-theme 'dark-mint)
;;  )
;;
;;;; Ensure highlighted text is overwritten
;;(delete-selection-mode 1)
;;
;;;; Ensure bindings for hs-minor-mode
;;(bind-keys :prefix-map hs-minor-mode-prefix-map
;;	   :prefix "M-2"
;;	   ("<up>" . hs-hide-all)
;;	   ("<down>" . hs-show-all)
;;	   ("<left>" . hs-hide-block)
;;	   ("<right>" . hs-show-block)
;;	   )
;;
;;;; Allows for multiple screens
;;(use-package elscreen
;;  :ensure t
;;  :init
;;  (elscreen-start)
;;  (bind-keys :prefix-map window-prefix-map
;;             :prefix "M-1"
;;             ("M-b" . buffer-menu)
;;             ("M-1" . other-window)
;;             ("M-2" . buffer-menu)
;;             ("<down>" . split-window-below)
;;             ("<right>" . split-window-right)
;;             ("<left>" . delete-window)
;;             ("<up>" . elscreen-create)
;;             ("M-u" . elscreen-previous)
;;             ("M-o" . elscreen-next)
;;             ("C-i" . elscreen-kill))
;;  )
;;
;;;; Enables undo-tree key bindings
;;(use-package undo-tree
;;  :ensure t
;;  :init
;;  (global-undo-tree-mode 1)
;;  (setq undo-tree-auto-save-history nil)
;;  :config
;;  (bind-key "M-s" 'undo)
;;  (bind-key "M-d" 'redo)
;;  )
;;
;;;; Allows for multiple cursors
;;(use-package multiple-cursors
;;  :ensure t
;;  :config
;;  (bind-key "M-q M-;" 'mc/edit-lines)
;;  (bind-key "M-q M-f" 'mc/mark-next-like-this)
;;  )
;;
;;;; Package for autocompletion of extended commands
;;(use-package smex
;;  :ensure t
;;  :init
;;  (setq smex-save-file "~/.emacs.d/smex.save")
;;  (smex-initialize)
;;  (bind-key "M-\\\\" 'smex)
;;  )
;;
;;;; Package for navigation of files
;;(use-package neotree
;;  :ensure t
;;  :config
;;  (bind-key "M-1 M-f" 'neotree)
;;  )
;;
;;;; Last edits
;;(put 'upcase-region 'disabled nil)
;;(setq warning-minimum-level :emergency)
;;(setq create-lockfiles nil)
;;(custom-set-faces
;; ;; custom-set-faces was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; )

(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/")
(require 'eaf)
(require 'eaf-browser)
(require 'eaf-pdf-viewer)

(use-package eaf
  :ensure t
  :load-path "~/.emacs.d/site-lisp/emacs-application-framework"
  :custom
  ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
  (eaf-browser-continue-where-left-off t)
  (eaf-browser-enable-adblocker t)
  (browse-url-browser-function 'eaf-open-browser)
  :config
  (defalias 'browse-web #'eaf-open-browser)
  (eaf-bind-key take_photo "p" eaf-camera-keybinding)
  (eaf-bind-key nil "M-q" eaf-browser-keybinding)) ;; unbind, see more in the Wiki


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(corfu vundo undo-tree tron-legacy-theme smex neotree multiple-cursors leuven-theme green-phosphor-theme green-is-the-new-black-theme elscreen doom-themes dark-mint-theme cyberpunk-theme chyla-dark-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
EOF
