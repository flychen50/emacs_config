; populate load-path appropriately for prosjekt and its extensions.
(let ((root-path (list (file-name-directory load-file-name) "prosjekt" "prosjekt")))
  (dolist (path '(("") 
		  ("ext" "helm")
		  ( "ext" "dirtree")))
    (add-to-list
     'load-path
     (apply 'kfg-join (append root-path path)))))

(require 'helm-prosjekt)

(defun prosjekt-grin (pattern file-pattern)
  (interactive
   (list (read-string "pattern: ")
         (read-string "file-pattern: ")))
  (grep (concat "grin --emacs -I \"" file-pattern "\" " pattern " " prosjekt-proj-dir)))

(global-set-key [(ctrl x) (p) (s)] 'prosjekt-setup)
(global-set-key [(ctrl x) (p) (c)] 'prosjekt-close)
(global-set-key [(ctrl x) (p) (r)] 'prosjekt-repopulate)
(global-set-key [(ctrl x) (p) (g)] 'prosjekt-grin)



(global-set-key 
 [f2] 
 (lambda () 
   (interactive) 
   (if prosjekt-proj-dir
       (dirtree-in-buffer prosjekt-proj-dir t))))
