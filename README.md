# logseq_note
  * test6
# termux
  * `apt update && apt upgrade`
  * `apt install git`
  * `termux-setup-storage`
  * `cd ~/storage/shared`
  
  * `echo "export note_github_token=<your token>" >> ~/.bashrc`
  * `source ~/.bashrc`
  
  * `git config --global http.proxy http://127.0.0.1:7890`
  * `git config --global https.proxy http://127.0.0.1:7890`
  * `git config --global user.email "you@example.com"`
  * `git config --global user.name "Your Name"`
  
  * `git clone https://github.com/hxse/logseq_note`
  * `cd logseq_note`
  * `git config --global --add safe.directory "*"`
  * `dos2unix "./once logseq_note.sh" "./auto logseq_note.sh"`
  * `bash "./auto logseq_note.sh"`
# logseq的问题
  * 有两种冲突模式
    * 1. 一个本地改动上传云端时,和另一个本地改动上传云端时的冲突
    * 2. 一个本地正在编辑时, 和从云端同步时造成的本地改动, 之间的冲突