(defvar proj-name "") 

(defun mkproj (name)
  (format t "Creating project ~S~%" name)
  (sb-ext:run-program "/bin/tar" (list "-xvf" "/bin/lpj_assets/template.tar"))
  (sb-ext:run-program "/bin/mv" (list "template" name))
  (sb-ext:run-program "/bin/sed" (list "-i" (concatenate 'string (concatenate 'string "'s/bin\\/template/bin\\/" name) "/g") (concatenate 'string name "/Makefile")))) 

(defun nil-name ()
  (format t "Invalid project name provided!~%"))

(defun main() 
  (setf proj-name (nth 1 sb-ext:*posix-argv*))
  (if (string-equal "NIL" proj-name) (nil-name) (mkproj proj-name))) 
 
  
