$token=$env:note_github_token
git remote set-url origin https://hxse:$token@github.com/hxse/logseq_note.git

$output = git pull --no-rebase
    
git add .
git diff-index --quiet HEAD --
if ($?) {
    if($output.Contains("Already up to date.")){
        echo "---- nothing to do"
	}
	else{
		echo "---- only pull"
	}
} else {
	echo "---- yes need push"
    
    if($output.Contains("Already up to date.")){
        echo "---- no need merge"
        git commit -m "auto update"
		git push
	}
	else{
		echo "---- yes need merge"
		echo $output
		git commit -m "auto update"

		git pull --no-rebase
		git add .
		git commit -m "auto merge"
		git push
	}
}
