#!/bin/bash

# Get the list of modified files in the commit
modified_files=$(git diff --cached --name-only)

# Check if log.org is modified and index.html is NOT modified
if echo "$modified_files" | grep -q "log.org" && ! echo "$modified_files" | grep -q "index.html"; then
    echo "Running org to HTML export for log.org..."

    # Run the org to HTML conversion command
    emacsclient -e '(progn (find-file "log.org") (org-html-export-to-html) (bury-buffer))'
else
    echo "Skipping org to HTML export. Either log.org is not modified or index.html is modified."
fi
