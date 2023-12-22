sudo apt install -y emacs

mkdir -p ~/.emacs.d
echo "" > ~/.emacs.d/init.el
cat << EOF > ~/.emacs.d/init.el
;; Location of backup files
(setq backup-directory-alist '(("." . "~/.saves")))

;; Setup theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("5c64430cb8e12e2486cd9f74d4ce5172e00f8e633095d27edd212787a4225245" "5768debbe7c8ba4db256a50a0785f08a8fa7df37435a6b75bd5994f543d5b2c1" "660376e0336bb04fae2dcf73ab6a1fe946ccea82b25f6800d51977e3a16de1b9" default))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(multiple-cursors use-package smex neotree undo-tree elscreen dark-mint-theme)))

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
(global-unset-key "\M-o")

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
  (bind-key "M-\\\\" 'smex)
  )

;; Package for navigation of files
(use-package neotree
  :ensure t
  :config
  (bind-key "M-1 M-f" 'neotree)
  )

;; Last edits
(put 'upcase-region 'disabled nil)
(setq warning-minimum-level :emergency)
(setq create-lockfiles nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
EOF
