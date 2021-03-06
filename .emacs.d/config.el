(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(setq ivy-re-builders-alist
      '((swiper-isearch . ivy--regex-plus)
        (swiper-isearch-backward . ivy--regex-plus)
        (t . ivy--regex-plus)))

;; (setq ivy-initial-inputs-alist nil)

;; ui settings
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(fringe-mode 1)
(display-time-mode 1)
(display-battery-mode 1)

;; Server
(server-start)

;; Global hooks
(add-hook 'after-init-hook 'show-paren-mode)
(add-hook 'after-init-hook 'electric-pair-mode)

;; exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Auto-revert
(global-auto-revert-mode 1)

;; disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq ring-bell-function nil)

;; disable *.~undo-tree~" pollution
(setq undo-tree-auto-save-history nil)

;; Hihglighting current line
(global-hl-line-mode 1)
(set-face-foreground 'hl-line nil)

(autorandr)
(winum-mode)

(setq ring-bell-function nil)
(setq avy-all-windows 'nil)
(setq avy-styles-alist '((avy-goto-char . at)))
(setq avy-orders-alist
      '((avy-goto-char . avy-order-closest)
        (avy-goto-word-0 . avy-order-closest)
        (avy-goto-line . avy-order-closest)))

(desktop-environment-mode)

(setq-default indent-tabs-mode nil)
(setq inferior-lisp-program "sbcl")

(setq inhibit-startup-screen t)

(yas-global-mode)

(setq highlight-indent-guides-method 'character)

;; Suggestions from official docs
(setq gc-cons-threshold 100000000)
(setq lsp-completion-provider :capf)
(setq lsp-idle-delay 0.500)
(setq lsp-log-io nil)

;; Annoying stuff
(setq lsp-enable-links t)
(setq lsp-signature-render-documentation t)
(setq lsp-headerline-breadcrumb-enable t)
(setq lsp-ui-doc-enable t)
(setq lsp-completion-enable-additional-text-edit t)

(setq lsp-ui-sideline-show-diagnostics t)
;; (setq lsp-ui-sideline-enable nil)

(setq web-mode-enable-current-element-highlight t)

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
;; (add-hook 'before-save-hook 'tide-format-before-save)

;;(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'typescript-mode-hook 'setup-tide-mode)
;; (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . typescript-mode))

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))

(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "ts" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

;; enable typescript - tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)
(flycheck-add-mode 'typescript-tslint 'typescript-mode)

;; NOTE: Sets the ivy thing on top of buffer
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center)))

;; (ivy-posframe-mode 1)

(require 'gud)
(define-key gud-minor-mode-map (kbd "<f5>") 'gud-run)
(define-key gud-minor-mode-map (kbd "<f6>") 'gud-cont)
(define-key gud-minor-mode-map (kbd "<f4>") 'gud-break)
(define-key gud-minor-mode-map (kbd "<f7>") 'gud-step)
