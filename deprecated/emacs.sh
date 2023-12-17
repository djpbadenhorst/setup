sudo apt install -y emacs

mkdir -p $HOME/.emacs.d
cat <<EOF | tee $HOME/.emacs.d/init.el > /dev/null
;; Location of backup files
(setq backup-directory-alist '(("." . "~/.saves")))
;; Setup theme
(custom-set-variables
 '(custom-safe-themes
   '("5768debbe7c8ba4db256a50a0785f08a8fa7df37435a6b75bd5994f543d5b2c1" "660376e0336bb04fae2dcf73ab6a1fe946ccea82b25f6800d51977e3a16de1b9" default))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(use-package smex neotree undo-tree elscreen dark-mint-theme)))
;; List of repositories to use
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)
;; Fetch information from repositories
(unless package-archive-contents
  (package-refresh-contents))
;; Install use-package
(setq my-package-list '(use-package))
(unless (package-installed-p 'use-package)
  (package-install 'use-package)
  )
;; Ensure some important key bindings can be overwritten
(define-key key-translation-map (kbd "M-p") (kbd "C-i"))
(define-key key-translation-map (kbd "M-g") (kbd "C-G"))
(define-key key-translation-map (kbd "M-n") (kbd "DEL"))
(define-key key-translation-map (kbd "M-,") (kbd "RET"))
(define-key key-translation-map (kbd "M-i") (kbd "<up>"))
(define-key key-translation-map (kbd "M-k") (kbd "<down>"))
(define-key key-translation-map (kbd "M-j") (kbd "<left>"))
(define-key key-translation-map (kbd "M-l") (kbd "<right>"))
;; Unset some keys that seems to cause troubles
(global-unset-key "\M-x")
(global-unset-key "\C-k")
(global-unset-key "\C-j")
(global-unset-key "\C-l")
(global-unset-key "\C-d")
(global-unset-key "\M-d")
;; Redirect M-x key binding
;(bind-key "M-\\\" 'execute-extended-command)
;; Some navigational key bindings
(bind-key "M-u" 'backward-word)
(bind-key "M-o" 'forward-word)
(bind-key "M-m" 'delete-forward-char)
;; Copy paste and search key bindings
(bind-key "M-f" 'isearch-forward)
(bind-key "M-f" 'isearch-repeat-forward isearch-mode-map)
(bind-key "M-w" 'kill-ring-save)
(bind-key "M-e" 'yank)
(bind-key "M-;" (lambda() (interactive) (push-mark nil nil 1)))
;; Some more uncommon shortcuts associated with M-q prefix
(bind-keys :prefix-map general-prefix-map
	   :prefix "M-q"
	   ("<left>" . move-beginning-of-line)
	   ("<right>" . move-end-of-line)
	   ("i" . beginning-of-buffer)
	   ("k" . end-of-buffer)
	   ("<up>" . (lambda () (interactive) (previous-line 50)))
	   ("<down>" . (lambda () (interactive) (next-line 50)))
	   ("M-w" . kill-region)
	   ("M-<return>" . save-buffer)
	   )
;; Load theme
(use-package dark-mint-theme
  :ensure t
  :init
  (load-theme 'dark-mint)
  )
;; Ensure highlighted text is overwritten
(delete-selection-mode 1)
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
	     ("<down>" . split-window-below)
	     ("<right>" . split-window-right)
	     ("<left>" . delete-window)
	     ("<up>" . elscreen-create)
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
  (bind-key "M-\\\" 'smex)
  )
;; Package for navigation of files
(use-package neotree
  :ensure t
  :config
  (bind-key "M-1 M-f" 'neotree)
  )
;; Settings for python mode for emacs
;;(use-package elpy
;;  :ensure t
;;  :init
;;  :config
;;  ;;(elpy-use-ipython)
;;  (add-hook 'python-mode-hook 'my-python-mode-hook)
;;  (defun my-python-mode-hook ()
;;    (hs-minor-mode 1)
;;    (bind-keys :prefix-map hs-prefix-map
;;	       :prefix "M-2"
;;	       ("<down>" . hs-show-all)
;;	       ("<up>" . hs-hide-all)
;;	       ("<left>" . hs-hide-block)
;;	       ("<right>" . hs-show-block)
;;	       )
    ;;    (bind-keys :prefix-map elpy-prefix-map
    ;;	       :prefix "M-3"
    ;;	       ("M-RET" . elpy-shell-send-region-or-buffer)
    ;;	       ("<left>" . elpy-nav-indent-shift-left)
    ;;	       ("<right>" . elpy-nav-indent-shift-right)
    ;;	       ("M-u" . elpy-goto-definition)
    ;;	       ("M-o" . elpy-goto-definition-other-window)
    ;;	       )
    ;;(setq python-shell-interpreter "ipython"
    ;;	python-shell-interpreter-args "--simple-prompt -i")
    ;;("M-f" . elpy-rgrep-symbol)
    ;;("<down>" . elpy-nav-forward-block)
    ;;("<up>" . elpy-nav-backward-block)
    ;;("M-1" . elpy-shell-switch-to-buffer)
    ;;("M-3" . elpy-company-backend)
    ;;(bind-key "M-1 M-3" 'elpy-shell-switch-to-buffer)
;;    )
;;  )
;;
;; Package for inline evaluation of latex-code
;;(use-package auctex-lua
;;  :ensure t
;;  :config
;;  (add-hook 'LaTeX-mode-hook 'my-latex-mode-hook)
;;  (defun my-latex-mode-hook ()
;;    (tex-pdf-mode 0)
;;    (set-default 'preview-scale-function 1.2)
;;    (setq-default TeX-master nil)
;;    (setq reftex-plug-into-AUCTeX t)
;;    (add-hook 'LaTeX-mode-hook 'visual-line-mode)
;;    (eval-after-load "preview"
;;      '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{tikzpicture}" t)
;;      )
;;    (bind-keys :prefix-map latex-prefix-map
;;	       :prefix "M-2"
;;	       ("<left>" . preview-at-point)
;;	       ("<right>" . preview-at-point)
;;	       ("<up>" . preview-buffer)
;;	       ("<down>" . preview-buffer)
;;	       )
;;    )
;;  )
;;
;; Package for org
;;(use-package org
;;  :ensure t
;;  :config
;;  (define-key org-mode-map (kbd "M-e") nil)
;;  (bind-keys :prefix-map org-prefix-map
;;	     :prefix "M-2"
;;	     ("<right>" . org-cycle)
;;	     ("<left>" . org-cycle)
;;	     ("<up>" . org-cycle)
;;	     ("<down>" . org-cycle)
;;	     )
;;  )
;;(add-to-list 'org-emphasis-alist '("*" (:foreground "red") ))
;;
;; Package for css
;;(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
;;(use-package css-mode
;;  :ensure t
;;  :init
;;  :config
;;  (add-hook 'css-mode-hook 'my-css-mode-hook)
;;  (defun my-css-mode-hook ()
;;    (hs-minor-mode 1)
;;    (setq css-indent-offset 2)
;;    (bind-keys :prefix-map hs-prefix-map
;;	       :prefix "M-2"
;;	       ("<down>" . hs-show-all)
;;	       ("<up>" . hs-hide-all)
;;	       ("<left>" . hs-hide-block)
;;	       ("<right>" . hs-show-block)
;;	       )
;;    )
;;  )
;;
;; Package for javascript
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;;(use-package js2-mode
;;  :ensure t
;;  :init
;;  :config
;;  (add-hook 'js2-mode-hook 'my-js2-mode-hook)
;;  (defun my-js2-mode-hook ()
;;    (hs-minor-mode 1)
;;    (setq js-indent-level 2)
;;    (bind-keys :prefix-map hs-prefix-map
;;	       :prefix "M-2"
;;	       ("<down>" . hs-show-all)
;;	       ("<up>" . hs-hide-all)
;;	       ("<left>" . hs-hide-block)
;;	       ("<right>" . hs-show-block)
;;	       )
;;  )
;;)
;;
;;(defun set-jsx-indentation ()
;;  (setq-local sgml-basic-offset 2))
;;(add-hook 'js-jsx-mode-hook #'set-jsx-indentation)
;;
;; Package for c-mode
;;(add-hook 'c-mode-hook 'my-c-mode-hook)
;;(defun my-c-mode-hook ()
;;  (hs-minor-mode 1)
;;  (bind-keys :prefix-map hs-prefix-map
;;	     :prefix "M-2"
;;	     ("<down>" . hs-show-all)
;;	     ("<up>" . hs-hide-all)
;;	     ("<left>" . hs-hide-block)
;;	     ("<right>" . hs-show-block)
;;	     )
;;  )
;;
;; Package for javascript
;;(add-to-list 'auto-mode-alist '("\\.hcl\\'" . hcl-mode))
;;(add-to-list 'auto-mode-alist '("\\.tf\\'" . hcl-mode))
;;(use-package hcl-mode
;;  :ensure t
;;  :init
;;  :config
;;  (add-hook 'hcl-mode-hook 'my-hcl-mode-hook)
;;  (defun my-hcl-mode-hook ()
;;    (hs-minor-mode 1)
;;    (bind-keys :prefix-map hs-prefix-map
;;	       :prefix "M-2"
;;	       ("<down>" . hs-show-all)
;;	       ("<up>" . hs-hide-all)
;;	       ("<left>" . hs-hide-block)
;;	       ("<right>" . hs-show-block)
;;	       )
;;    )
;;  )
;;
;; Package for jinja
;;(add-to-list 'auto-mode-alist '("\\.jinja\\'" . jinja2-mode))
;;(use-package jinja2-mode
;;  :ensure t
;;  :init
;;  :config
;;  (add-hook 'jinja2-mode-hook 'my-jinja2-mode-hook)
;;  (defun my-jinja2-mode-hook ()
;;    (hs-minor-mode 1)
;;    (bind-keys :prefix-map hs-prefix-map
;;	       :prefix "M-2"
;;	       ("<down>" . hs-show-all)
;;	       ("<up>" . hs-hide-all)
;;	       ("<left>" . hs-hide-block)
;;	       ("<right>" . hs-show-block)
;;	       )
;;    )
;;  )
;;
;; Package for go
;;(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
;;(use-package go-mode
;;  :config
;;  (add-hook 'go-mode-hook 'my-go-mode-hook)
;;  (defun my-go-mode-hook ()
;;    (hs-minor-mode 1)
;;    (setq indent-tabs-mode nil)
;;    (setq tab-width 4)
;;    (bind-keys :prefix-map hs-prefix-map
;;	       :prefix "M-2"
;;	       ("<down>" . hs-show-all)
;;	       ("<up>" . hs-hide-all)
;;	       ("<left>" . hs-hide-block)
;;	       ("<right>" . hs-show-block)
;;	       )
;;  )
;;)
;;  
;; Package for yaml
;;(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
;;(use-package yaml-mode
;;  :ensure t
;;  :init
;;  :config
;;  (add-hook 'yaml-mode-hook 'my-yaml-mode-hook)
;;  (defun my-yaml-mode-hook ()
;;    (yafolding-mode 1)
;;    (bind-keys :prefix-map yafolding-prefix-map
;;	       :prefix "M-2"
;;	       ("<up>" . yafolding-hide-all)
;;	       ("<left>" . yafolding-toggle-element)
;;	       ("<right>" . yafolding-toggle-element)
;;	       ("<down>" . yafolding-show-all)
;;	       )
;;    )
;;  )
;;
;;(defun my-flymd-browser-function (url)
;;  (let ((browse-url-browser-function 'browse-url-firefox))
;;    (browse-url url)))
;;(setq flymd-browser-open-function 'my-flymd-browser-function)
;; Last edits
(put 'upcase-region 'disabled nil)
(setq warning-minimum-level :emergency)
(setq create-lockfiles nil)
(custom-set-faces)
EOF

echo "export EDITOR=emacs" >> ~/.bashrc
