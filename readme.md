#Git

##基本概念

	实际工作目录，暂存区，已经提交的代码

####git本地操作

`git status` 是查看当前文件处于什么状态的.同时列出了你当前的分支.

	xiushanfans-MacBook-Pro:GitHubCommandTest xiushanfan$ git status
	On branch master  //master分支
	Your branch is up-to-date with 'origin/master'.
	
	-----已经被跟踪,自上次提交后又有所修改的文件-----
	
	Changes not staged for commit:
    (use "git add <file>..." to update what will be committed)
    (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   BuildingCocoaApps.pdf
	modified:   GitHubCommandTest.xcodeproj/project.xcworkspace/xcuserdata/xiushanfan.xcuserdatad/UserInterfaceState.xcuserstate
	modified:   GitHubCommandTest/ViewController.swift
	
	-----未跟踪的文件-----
	
	Untracked files:
    (use "git add <file>..." to include in what will be committed)

	undo.txt

	no changes added to commit (use "git add" and/or "git commit -a")
	
`git add` 开始跟踪新的文件.

`.gitignore` 文件默认是不存在的，需要你增加然后在文件里添加需要忽略的文件(不加入版本控制) 注意一些匹配规则就够了。

	注意:.gitignore里的文件必须是还没有加入到暂存区的，如果加入到暂存区，那么这个.gitignore里的设置对这些文件不起作用

`git diff` 是查看工作目录和暂存区的文件差异。

`git commit` 提交对应代码的改动信息，必须要输入信息，并且列出当前的分支.

	# Please enter the commit message for your changes. Lines starting
	# with '#' will be ignored, and an empty message aborts the commit.
	# On branch master
	# Your branch is up-to-date with 'origin/master'.
	# Changes to be committed:
	#       new file:   .gitignore
	#       deleted:    GitHubCommandTest.xcodeproj/project.xcworkspace/xcuserdata/xiushanfan.xcuserdatad/UserInterfaceState.xcuserstate
	# Changes not staged for commit:
	#       modified:   BuildingCocoaApps.pdf
	#       modified:   GitHubCommandTest/ViewController.swift
	
*提交后的信息*

	xiushanfans-MacBook-Pro:GitHubCommandTest xiushanfan$ git commit 
	[master 49377d2] Add .gitignore.	//对应分支的提交,完整提交的SHA-1校验
	2 files changed, 1 insertion(+)
 	create mode 100644 .gitignore		
 	delete mode 100644 GitHubCommandTest.xcodeproj/project.xcworkspace/xcuserdata/xiushanfan.xcuserdatad/UserInterfaceState.xcuserstate
 	
 	
`git rm` 从Git中移除文件,需要将其从已经跟踪文件中删除（将其从暂存区中删除）

	注意:
	git rm -f <file> 选项是将文件不仅从暂存区中删除，而且也在工作目录中删除.
	git rm --cached <file> 只是从暂存区中删除，但不删除文件.
	
`git mv` Git移动文件操作.

	git mv READ.txt README
	
	等价于
	
	mv READ.txt README
	git rm READ.txt
	git add README


`git log` 显示出Git的提交记录.

`git commit --amend` 用`--amend`选项进行重新提交，其实就是修正上一次提交的内容。


`git reset HEAD <file>` 取消已经暂存的文件.

`git checkout <file>` 取消对工作目录中的文件的修改.

####git的远程操作

`git remote add <remote-name> <url>` 直接添加一个远程仓库,name为远程仓库在本地的名字，url为远程仓库的的url.

`git remote -v` 查看远程仓库的的地址.

`git remote` 列出远程仓库在本地的简短的名字 **默认为origin**

`git fetch <remote-name>` 从远程仓库获取数据到本地，但不和本地工作分支进行合并.

`git pull`从远程仓库获取数据，并且和本地分支进行合并.

	注意：git clone命令本质就是自动创建了本地master分支，然后用于跟踪远程仓库的master分支
	
`git push <remote-name> <branch-name>` remote-name默认是origin,branch-name默认是master

	工作流也是先从远端把代码拉回来跟本地合并好之后，然后再把本地的改动提交到远端，和之前SVN的操作类似。
	
`git remote show <remote-name>` 查看某个远程仓库的信息

`git remote rename <old-remote-name> <new-remote-name>` 重命名远端仓库的名字。

	对应远端仓库的分支的写法.
	<remote-name>/<branch-name>
	origin/master

`git remote rm <old-remote-name>` 移除远端仓库
 	


##Git的分支操作
	
####分支的基本概念

参考URL [分支的概念](http://git-scm.com/book/zh/Git-分支-何谓分支)

test1
