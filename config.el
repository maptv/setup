;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dark+)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

;; auto-save
(setq auto-save-visited-file-name t)
(setq auto-save-timeout 1)

;; evil mode settings
(setq vim-style-visual-feedback t)
(setq vim-style-remap-Y-to-y$ t)
(setq vc-follow-symlinks t)

;; persistent undo
(setq undo-tree-auto-save-history t)

;; Don't let evil-snipe remap s and S
(remove-hook 'doom-first-input-hook #'evil-snipe-mode)

;; Replace evil-mode's f/F/t/T functionality with (1-character) sniping
(evil-snipe-override-mode +1)

;; Don't let evil-snipe repeat with f/F/t/T
(setq evil-snipe-repeat-keys nil)

;; Use ; and , for evil-snipe 
(setq evil-snipe-override-evil-repeat-keys t)

;; cursor-shape
(use-package term-cursor)
(global-term-cursor-mode)

;; copying to system clipboard is working
(osx-clipboard-mode +1)

;; quit without confirmation
(setq confirm-kill-emacs nil)

;; completely black background
(custom-set-faces '(default ((t (:background "#000000")))))

;; do not highlight current line
(setq global-hl-line-modes nil)

;; do not show modeline/statusline
;; https://github.com/doomemacs/doomemacs/issues/6209#issuecomment-1075137980
(add-hook 'buffer-list-update-hook (lambda ()
                                     (unless (active-minibuffer-window)
                                       (hide-mode-line-mode))))

(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))

(evil-define-key 'insert global-map (kbd "M-r") 'move-to-window-line-top-bottom)
(evil-define-key 'normal global-map (kbd "M-r") 'move-to-window-line-top-bottom)
(evil-define-key 'insert global-map (kbd "C-d") 'delete-forward-char)
(evil-define-key 'insert global-map (kbd "C-h") 'delete-backward-char)
(evil-define-key 'insert global-map (kbd "C-k") 'kill-line)
(evil-define-key 'insert global-map (kbd "C-t") 'transpose-chars)
(evil-define-key 'insert global-map (kbd "C-u") 'backward-kill-line)
(evil-define-key 'normal global-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(evil-define-key 'normal global-map (kbd "C-g") 'evil-show-file-info)
(evil-define-key 'normal global-map (kbd "C-i") 'evil-jump-forward)
(evil-define-key 'normal global-map (kbd "C-x") 'evil-numbers/dec-at-pt)
(evil-define-key 'insert global-map (kbd "C-y") 'yank)
(evil-define-key 'normal global-map (kbd "gx") 'browse-url-at-point)
(evil-define-key 'normal global-map (kbd "ZA") 'evil-save-and-quit)
(evil-define-key 'normal evil-command-window-mode-map (kbd "ZZ") 'evil-quit)
(evil-define-key 'normal evil-command-window-mode-map (kbd "C-c") 'evil-quit)
(evil-define-key 'normal evil-command-window-mode-map [escape] 'evil-normal-state)
(define-key evil-ex-completion-map "\C-f" 'evil-ex-command-window)

;; evil-quickscope
(require 'evil-quickscope)
(global-evil-quickscope-always-mode 1)

;; evil-replace-with-register
(require 'evil-replace-with-register)
(setq evil-replace-with-register-key (kbd "gr"))
(evil-replace-with-register-install)

;; evil-exchange
(require 'evil-exchange)
(setq evil-exchange-key (kbd "gy"))
(evil-exchange-install)

(global-undo-fu-session-mode)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
