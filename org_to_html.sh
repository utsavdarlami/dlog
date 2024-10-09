#!/bin/bash

echo "org to html"

emacsclient -e '(progn (find-file "log.org") (org-html-export-to-html) (bury-buffer))'
