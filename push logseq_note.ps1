$token=$env:note_github_token
git remote set-url origin https://hxse:$token@github.com/hxse/logseq_note.git

$output = git pull --no-rebase
echo $output
    
git add .
git diff-index --quiet HEAD --
if ($?) {
	echo "---- no need push"
} else {
	echo "---- yes need push"
    git commit -m "auto update"
    
    if($output.Contains("Already up to date.")){
        echo "---- no need pull"
	}
	else{
		echo "---- yes need pull"
		echo $output
        git pull
	}
	
    git push
}
