;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Themes
;;
;; The theme is being set here.

;; ====================
;; Ensuring themes and relevant packages are available

(use-package leuven-theme)
(use-package doom-themes)
(use-package all-the-icons)


;; ====================
;; mode-line customization

;; (use-package doom-modeline
;;       :ensure t
;;       :hook (after-init . doom-modeline-mode))

;; ====================
;; Setting themes

(if (display-graphic-p)
    (load-theme 'leuven)
    (load-theme 'doom-molokai)
  )


;; ====================
;; theme customization

;; (add-hook 'text-mode-hook 'turn-on-auto-fill)
