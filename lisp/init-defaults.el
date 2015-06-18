;;; init-defaults.el

(defconst is-osx (eq system-type 'darwin))
(defconst my-gen-dir (file-name-as-directory (concat user-emacs-directory "gen")))

(global-linum-mode 1)
(line-number-mode 1)
(column-number-mode 1)
;(global-hl-line-mode 1)
(show-paren-mode 1)
(electric-pair-mode 1)
(size-indication-mode t)
(blink-cursor-mode -1)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Automatically refresh buffers when the underlying file changes.
(global-auto-revert-mode t)

(setq font-lock-maximum-decoration t
      color-theme-is-global t

      inhibit-startup-screen t
      inhibit-startup-echo-area-message t
      initial-scratch-message nil

      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      ring-bell-function 'ignore
      load-prefer-newer t
      ediff-window-setup-function 'ediff-setup-windows-plain

      save-place-file (concat my-gen-dir "places")
      custom-file (concat my-gen-dir "custom.el")

      ;; Backups
      backup-by-copying t
      version-control t
      delete-old-versions t
      delete-by-moving-to-trash t
      kept-new-versions 6
      kept-old-versions 2
      vc-make-backup-files t
      backup-directory-alist `(("." . ,(concat my-gen-dir "backups")))

;      confirm-kill-emacs 'y-or-n-p
      )

;; Font
(set-default-font "Source Code Pro 14")
;(when window-system
;  (add-to-list 'default-frame-alist '(font . "Source Code Pro")))
;(set-face-attribute 'default nil :height 140)

;; OSX specific setup.
(when is-osx
  (setq mac-option-modifier nil
        mac-command-modifier 'meta))

(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))

(global-set-key "\C-u" 'backward-kill-line) ;; `C-c u'

(provide 'init-defaults)
;;; init-defaults.el ends here
