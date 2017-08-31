;; Repositories

(setq package-archive-priorities
      '(("melpa-stable" . 30)
        ("marmalade" . 20)
        ("gnu" . 10)
        ("melpa" . 0)))

(setq-default package-menu-hide-low-priority t)


(setq package-archives '(
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/"))
             )

;;Drag stuff
;;(drag-stuff-global-mode 1)
;;(drag-stuff-define-keys)

;; Evil leader (SHOULD BE ENABLED BEFORE EVIL MODE)
(require 'evil-leader)
(global-evil-leader-mode)

(evil-leader/set-leader "\\") ; Default is backslash (\)

(evil-leader/set-key
  "e" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer)

;;EVIL
(require 'evil)
(evil-mode 1)

;;Evil-nerd-commenter
;; (evilnc-default-hotkeys)

;; Emacs key bindings
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "C-c l") 'evilnc-quick-comment-or-uncomment-to-the-line)
(global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
(global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs)

;; Vim key bindings
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-key
  ";" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  "."  'evilnc-copy-and-comment-operator
  "\\" 'evilnc-comment-operator ; if you prefer backslash key
)

;;LINUM
(global-linum-mode 1)
(linum-mode)
(linum-relative-global-mode)
(setq linum-relative-current-symbol "")

;; Smooth Scrolling
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)
(setq smooth-scroll-margin 5)


;;Whitespace Mode
(setq whitespace-line-column 80)
(setq whitespace-style '(face trailing)) ;;Face, space and hard space

(setq-default whitespace-display-mappings '((trailing 32 [?·])))

(global-whitespace-mode 1)

;; yasnippet code 'optional', before auto-complete
(require 'yasnippet)
(add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets/")
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<M-tab>") 'yas-expand) ;Shift-Tab to expand yasnippet
(yas-global-mode 1)

;;Company

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(global-company-mode)

;; set default `company-backends'
(add-to-list 'company-backends
      '(company-files          ; files & directory
        company-keywords       ; keywords
        company-capf
        company-abbrev
        company-dabbrev)
      )

;; company delay until suggestions are shown
(setq company-idle-delay 0.0)

;; weight by frequency
(setq company-transformers '(company-sort-by-occurrence))

;; Add yasnippet support for all company backends
;; https://github.com/syl20bnr/spacemacs/pull/179
(defvar company-mode/enable-yas t "Enable yasnippet for all backends.")

(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas) (and (listp backend)    (member 'company-yasnippet backend)))
  backend
(append (if (consp backend) backend (list backend))
        '(:with company-yasnippet))))

(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "<tab>") #'company-select-next)
  (define-key company-active-map (kbd "<S-tab>") #'company-select-previous)
  (setq company-minimum-prefix-length 2)
  (setq company-show-numbers t)) ;<M-nthdigit> expands suggestion at the nth digit

;;hlinum
(require 'hlinum)
(hlinum-activate)
;; (setq linum-highlight-face "red") ;; This is getting overwritten by the theme
(setq linum-highlight-in-all-buffersp t)

;;Term
(defun term ()
  (interactive)
  (ansi-term "/bin/zsh"))

;; Rainbow Delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Powerline
(require 'powerline)
(powerline-center-evil-theme)
(setq powerline-default-separator 'utf-8) ; Fixes bad colours

;; Markdown-mode
(setq auto-window-vscroll nil)
(setq markdown-header-scaling t)
(setq markdown-header-scaling-values '(1.5 1.4 1.3 1.2 1.1 1.0))

;; Command log mode
(add-hook 'find-file-hook (lambda () (command-log-mode)))

(provide 'pacman)
