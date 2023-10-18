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
  * 一行启动
    * `yes | termux-setup-storage;cd ~/storage/shared/logseq_note;bash "./auto logseq_note.sh";`
# logseq的问题
  * 有两种冲突模式
    * 1. 手机本地改动上传云端时,和电脑本地改动上传云端时的冲突
      * 注意把手机和电脑都同步到最新就能避免同步冲突, 不过冲突了也无妨, 手动处理即可
    * 2. 一个本地正在编辑时, 和从云端同步时造成的本地改动, 之间的冲突
      * 注意编辑器用完就要失焦, 不要一直激活光标, 同一时间手机和电脑保证只有一个光标在激活状态, 就能避免同步冲突, 如果冲突了可能会被覆盖回去, 造成数据丢失
    * 第一种冲突用git merger, 然后手动处理差异就行, 但是第二种冲突logseq并不能很好的处理, 应该有个类似notepad的提示就好了
      * 提示比如, "检测到本地文件变动,是否重新加载", 然后有三个选项, 1.舍弃编辑区 2.舍弃本地区 3.对比处理差异
