param (
    [Alias("d")]
    [string] $dir = $PSScriptRoot,
    [Alias("a")]
    [bool] $auto = $false,
    [Alias("s")]
    [int] $sleep = 10
)

cd $dir

$token=$env:note_github_token
git remote set-url origin https://hxse:$token@github.com/hxse/logseq_note.git

function syncGit {
	$output = git pull --no-rebase
	echo "---- check remote"

	git add .
	git diff-index --quiet HEAD --
	if ($?) {
		if($output.Contains("Already up to date.")){
			echo "---- nothing"
		}
		else{
			echo "---- pull"
		}
	} else {
		
		if($output.Contains("Already up to date.")){
			echo "---- push"
			git commit -m "auto update"
			git push
		}
		else{
			echo "---- merge"
			echo $output
			git commit -m "auto update"

			git pull --no-rebase
			git add .
			git commit -m "auto merge"
			git push
		}
	}
}

if ($auto) {
    while ($true) {
        echo ""
        Get-Date
        echo ""
        syncGit
        echo ""
        echo "sleep..." $sleep
        Start-Sleep -Seconds $sleep
    }
}
else {
    echo ""
    Get-Date
    echo ""
    syncGit
}
