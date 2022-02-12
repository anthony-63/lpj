(defvar proj-name "") 

(defun mkproj (name)
  (format t "Creating project ~S~%" name)
  (uiop:run-program (format nil "tar -xvf /bin/lpj_assets/template.tar"))
  (uiop:run-program (format nil "mv template ~S" name))
  (uiop:run-program (concatenate 'string 
                                 (concatenate 'string "sed -i 's/bin\\/template/bin\\/" name) 
                                 (concatenate 'string 
                                              (concatenate 'string "/g' " name) "/Makefile"))))

(defun nil-name ()
  (format t "Invalid project name provided!~%"))

(defun main() 
  (setf proj-name (nth 1 sb-ext:*posix-argv*))
  (if (string-equal "NIL" proj-name) (nil-name) (mkproj proj-name))) 
 
  
