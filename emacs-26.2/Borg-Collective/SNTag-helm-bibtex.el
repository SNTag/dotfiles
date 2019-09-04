;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm-bibtex
;;
;; https://github.com/tmalsburg/helm-bibtex
;; helps in interacting with zotero
;;
;; To make zotero bibliography:
;; 
;;
;; keys of note:
;; C-c f        -  activates helm-bibtex search
;; C-u C-c f    -  Refresh helm-bibtex

(use-package helm-bibtex
  :ensure t)
;;  bibtex-completion-notes-path "~/Dropbox/OrgMode/Papers.org"
(setq   bibtex-completion-bibliography '("/media/iDropbox/Dropbox/latex journal/resources/Greg-Tucker-Kellogg.bib")
        bibtex-completion-library-path '("~/Zotero/"))

(setq bibtex-completion-pdf-field "file")  ; Uses lower case "file" to work with better-bibtex zotero plugin

;; ;; ====================
;; ;; For opening PDFs

;; ;; Needs to be edited for linux
;; (setq   helm-bibtex-open-pdf-function
;;         (lambda (fpath)
;;           (call-process "open" nil 0 nil "-a" "C:/Program Files (x86)/Foxit Software/Foxit Reader" fpath)))

(setq bibtex-completion-format-citation-functions
  '((org-mode      . bibtex-completion-format-citation-org-link-to-PDF)
    (latex-mode    . bibtex-completion-format-citation-cite)
    (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
    (default       . bibtex-completion-format-citation-default)))


;; ;; ====================
;; ;; Switching bibtex files

;; ;; Create a BibTeX file containing only specific entries
;; (progn
;;   (switch-to-buffer (generate-new-buffer "my_new_bibliography.bib"))
;;   (--map (insert (bibtex-completion-make-bibtex it)) (-distinct '("Key1" "Key2"))))


;; ====================
;; keybindings

(global-set-key (kbd "C-c f") 'helm-bibtex-with-local-bibliography)  ; allows paper searching rapidly. For refreshing, C-u C-c f


;; ====================
;; zotxt
;;
;; details on using zotxt with emacs:
;; http://www.mkbehr.com/posts/a-research-workflow-with-zotero-and-org-mode/

(use-package zotxt)