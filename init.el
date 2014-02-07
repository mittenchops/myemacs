(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
)
(toggle-fullscreen)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'pymacs)
 (pymacs-load "ropemacs" "rope-")
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")

; python-mode
(setq py-install-directory "~/.emacs.d/python-mode.el-6.1.2")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")
; use the wx backend, for both mayavi and matplotlib
(setq py-python-command-args
  '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)

; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
; don't split windows
(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
(setq py-smart-indentation t)

(require 'google-this)
(google-this-mode 1)

(require 'w3m)
(require 'ess-site)
(add-to-list 'load-path "~/.emacs.d/site-list/transpose-frame")
(require 'transpose-frame)
(require 'tramp)
    (setq tramp-default-method "ssh")

(setq smtpmail-stream-type 'ssl)
(setq smtpmail-smtp-server "smtp.gmail.com")
(setq smtpmail-smtp-service 465)
(require 'smtpmail)
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")

(require 'mu4e)     
;; default
(setq mu4e-maildir "~/Maildir")

(setq mu4e-drafts-folder "/[Gmail].Drafts")
(setq mu4e-sent-folder   "/[Gmail].Sent Mail")
(setq mu4e-trash-folder  "/[Gmail].Trash")
     
;; don't save message to Sent Messages, Gmail/IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)

;; setup some handy shortcuts
;; you can quickly switch to your Inbox -- press ``ji''
;; then, when you want archive some messages, move them to
;; the 'All Mail' folder by pressing ``ma''.

(setq mu4e-maildir-shortcuts
      '( ("/INBOX"               . ?i)
	 ("/[Gmail].Sent Mail"   . ?s)
	 ("/[Gmail].Trash"       . ?t)
	 ("/[Gmail].All Mail"    . ?a)))

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")

;; something about ourselves
(setq
 user-mail-address "ahogan@noodle.org"
 user-full-name  "Adam Hogan"
 message-signature "Adam Hogan")

;; sending mail -- replace USERNAME with your gmail username
;; also, make sure the gnutls command line utils are installed
;; package 'gnutls-bin' in Debian/Ubuntu

(require 'smtpmail)
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-stream-type 'starttls
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587)

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)

(setq
 mu4e-get-mail-command "offlineimap"   ;; or fetchmail, or ...
 mu4e-update-interval 300)             ;; update every 5 minutes

;; enable inline images
(setq mu4e-view-show-images t)
;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))
