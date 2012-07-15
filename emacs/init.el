(add-to-list 'load-path "~/.emacs.d/")
(require 'package)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)

(setq visible-bell t)

(require 'workgroups)
(setq wg-prefix-key (kbd "C-1"))
(workgroups-mode 1)

(defun clojure-slime-maybe-compile-and-load-file ()
  "Call function `slime-compile-and-load-file' if current buffer is connected to a swank server.Meant to be used in `after-save-hook'."
  (when (and (eq major-mode 'clojure-mode) (slime-connected-p))
    (slime-compile-and-load-file)))

(setq kill-region (kbd "C-w"))

(add-hook 'after-save-hook 'clojure-slime-maybe-compile-and-load-file)

(require 'ido)
(ido-mode t)
;;(setq ido-enable-flex-matching t) ;; enable fuzzy matching

(autoload 'paredit-mode "paredit"   
  "Minor mode for pseudo-structurally editing Lisp code."   
  t)   
;(add-hook 'lisp-mode-hook (lambda () (paredit-mode +1)))   
(mapc (lambda (mode)   
      (let ((hook (intern (concat (symbol-name mode)   
                   "-mode-hook"))))   
      (add-hook hook (lambda () (paredit-mode +1)))))   
    '(emacs-lisp lisp inferior-lisp slime slime-repl)) 

; stop the message "Fontifying *SLIME Compilation*"
(setq font-lock-verbose nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'default-frame-alist '(alpha 90 90))

(add-to-list 'load-path "~/.emacs.d/git-1.0")
(require 'git)
(require 'git-blame)

(add-to-list 'load-path "~/.emacs.d/nav-49")
(require 'nav)
(nav-disable-overeager-window-splitting)
;; Optional: set up a quick key to toggle nav
;; (global-set-key [f8] 'nav-toggle)
