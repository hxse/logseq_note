$token=$env:note_github_token
git remote set-url origin https://hxse:$token@github.com/hxse/logseq_note.git

$output = git pull --no-rebase
    
git add .
git diff-index --quiet HEAD --
if ($?) {
	echo "---- no need push"
	
	if($output.Contains("Already up to date.")){
        echo "---- no need pull"
	}
	else{
		echo "---- yes need pull"
		git commit -m "auto pull"
	}
} else {
	echo "---- yes need push"
    
    if($output.Contains("Already up to date.")){
        echo "---- no need pull"
        git commit -m "auto update"
		git push
	}
	else{
		echo "---- yes need pull"
		echo $output
		git add .
		git commit -m "auto merge"
		git push
	}
}
