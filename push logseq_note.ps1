
git remote set-url origin https://hxse:%note_github_token%@github.com/hxse/logseq_note.git

$output = git pull --no-rebase
if($output.Contains("Already up to date.")){
    echo "---- no need pull"
}
else{
    echo "---- yes need pull"
}
    
git add .
git diff-index --quiet HEAD --
if ($?) {
	echo "---- no need push"
} else {
	echo "---- yes need push"
    git commit -m "auto update"
    git push
}
