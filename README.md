# logseq_note
  * test5
# termux
  * `apt update && apt upgrade`
  * `apt install git`
  * `termux-setup-storage`
  * `cd ~/storage/shared`
  * `mkdir logseq_note`
  * `echo "export note_github_token=<your token>" >> ~/.bashrc`
  * `source ~/.bashrc`
  * `git config --global http.proxy http://127.0.0.1:7890`
  * `git config --global https.proxy http://127.0.0.1:7890`
  * `git config --global user.email "you@example.com"`
  * `git config --global user.name "Your Name"`
  * `git clone https://github.com/hxse/logseq_note`
  * `dos2unix "./once logseq_note.sh" "./auto logseq_note.sh"`
  * `sh "./auto logseq_note.sh"`
