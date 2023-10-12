
git remote set-url origin https://hxse:%note_github_token%@github.com/hxse/logseq_note.git
git pull --no-rebase
git add .
git diff-index --quiet HEAD --

if ($?) {
    echo no different
} else {
    echo check different
}