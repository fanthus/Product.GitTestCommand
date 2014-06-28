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

#GIT分支

#####分支基本概念

**GIT的提交其实就是保存一个一个提交对象**包含本次提交的信息和指向对象父对象的指针，还有指向树对象的指针，树对象中包含指向各个目录的指针。	

	GIT将其下管理的这些目录保存为树对象

**GIT分支的本质**仅仅是指向`commit`对象的可变指针。是某个提交对象往回看的历史。


* `git branch <branch name>`命令用来创建一个新的分支。
	
	其实就是在当前的分支的位置重新建一个分支指针。
	注意:git并不会自动切换到这个分支中去。
	master是默认分支。
	
>为了标示当前的分支，引入了HEAD的概念，HEAD是指向当前正在工作的本地分支的指针。

* `git checkout <branch name>`命令用来切换到新的分支。

* `git branch -a` 列出当前的所有分支

* `git branch -d <branch name>` 删除指定的分支

* `git merge <branch name>`  把指定的分支合并到当前分支上。

注意:

	查看当前的分支的状态，是否主分支。
	同时合并的时候一定要有一个主分支去做事情。


* `git branch -v`  列出当前的分支的状态.比git branch -a多了一些信息(提交信息)。

* `git branch --merged` 查看已经合并进入的分支

* `git branch --no-merged` 查看尚未合并的分支


####工作流的实例

#####按照要求新建分支修改一个readme文件，然后将修改并到主线上.
	
**查看当前GIT状态**
	
	localhost:GitTestCommand xiushanfan$ git status
	On branch master
	Your branch is up-to-date with 'origin/master'.

	nothing to commit, working directory clean
	
	
**新建btest分支**

	localhost:GitTestCommand xiushanfan$ git branch btest
	
**列出本地和远端的所有分支**

	localhost:GitTestCommand xiushanfan$ git branch -a
	  btest
	* master	//表明当前分支是master，用git status查看也行
	  remotes/origin/AppleBranch
	  remotes/origin/HEAD -> origin/master
	  remotes/origin/master
	  
**切换到btest分支**

	localhost:GitTestCommand xiushanfan$ git checkout btest
	Switched to branch 'btest'
	
**列出本地和远端所有分支**

	localhost:GitTestCommand xiushanfan$ git branch -a
	* btest
	  master
	  remotes/origin/AppleBranch
	  remotes/origin/HEAD -> origin/master
	  remotes/origin/master
	  
**列出当前目录所有文件**

	localhost:GitTestCommand xiushanfan$ ls
	BuildingCocoaApps.pdf		GitHubCommandTestTests
	GitHubCommandTest		readme.md
	GitHubCommandTest.xcodeproj
	
**对readme.md文件进行修改**
	
	localhost:GitTestCommand xiushanfan$ vi readme.md
	
**修改完之后，查看状态**

	localhost:GitTestCommand xiushanfan$ git status
	On branch btest
	Changes not staged for commit:
	  (use "git add <file>..." to update what will be committed)
	  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   readme.md

	no changes added to commit (use "git add" and/or "git commit -a")
	
**回到主分支，其实切换之前最好在btest分支上做一次提交保证目录的干净.**

	localhost:GitTestCommand xiushanfan$ git checkout master
	M	readme.md	//可以看到一个被修改的文件.
	Switched to branch 'master'
	Your branch is up-to-date with 'origin/master'.
	
	
**再次切换回到btest分支**

	localhost:GitTestCommand xiushanfan$ git checkout btest
	M	readme.md
	Switched to branch 'btest'
	
**提交readme.md文件的修改**

	localhost:GitTestCommand xiushanfan$ git add readme.md 
	localhost:GitTestCommand xiushanfan$ git status
	On branch btest
	Changes to be committed:
	  (use "git reset HEAD <file>..." to unstage)

	modified:   readme.md
	
	localhost:GitTestCommand xiushanfan$ git commit -m "modified readme.md"
	[btest 42285dd] modified readme.md
	 1 file changed, 2 insertions(+), 1 deletion(-)
	 
**切换回到主分支**

	localhost:GitTestCommand xiushanfan$ git checkout master
	Switched to branch 'master'
	Your branch is up-to-date with 'origin/master'.
	
**对btest分支进行合并**

	localhost:GitTestCommand xiushanfan$ git merge btest
	Updating 5585b99..42285dd
	Fast-forward		//这个提示标示，表示只需要将当前分支的指针向后移动，是单线分支，这种合并的过程叫做快进。
	 readme.md | 3 ++-
	 1 file changed, 2 insertions(+), 1 deletion(-)
	 
**查看readme.md文件是否被修改过了.**

	localhost:GitTestCommand xiushanfan$ vi readme.md
	
**删除btest分支，它没有用了**

	localhost:GitTestCommand xiushanfan$ git branch -d btest
	Deleted branch btest (was 42285dd).

发现确实被修改过了。


######然后看下两个分支合并的时候冲突的情况.

* 先建一个`test1`分支
* 建立一个`test2`分支
* 从`master`分支切换到`test1`分支
* 然后对`readme.md`文件进行修改，在文件最后一行增加`test1` 
* 从`master`分支切换到`test2`分支
* 然后对`readme.md`文件进行修改，在文件最后一行增加`test2`
* 然后切换到`master`分支，合并`test1`分支，
* 然后在合并`test2`分支的时候出现如下冲突：

冲突:

	localhost:GitTestCommand xiushanfan$ git merge test2
	Auto-merging readme.md
	CONFLICT (content): Merge conflict in readme.md
	Automatic merge failed; fix conflicts and then commit the result.
然后编辑`readme.md`文件:

	localhost:GitTestCommand xiushanfan$ vi readme.md
	
	在文件末尾出现如下:
	<<<<<<< HEAD
	test1
	=======
	test2
	>>>>>>> test2

	将冲突修改为只剩test.
	test

修改完之后并不代表已经将`test2`merge进去了

	localhost:GitTestCommand xiushanfan$ git status
	On branch master
	Your branch is ahead of 'origin/master' by 2 commits.
	(use "git push" to publish your local commits)

	You have unmerged paths.
	(fix conflicts and run "git commit")

	Unmerged paths:
	(use "git add <file>..." to mark resolution)

	both modified:      readme.md

	no changes added to commit (use "git add" and/or "git commit -a")
	
将修改过的`readme.md`文件`add`进入

	localhost:GitTestCommand xiushanfan$ git add readme.md 
	localhost:GitTestCommand xiushanfan$ git status
	On branch master
	Your branch is ahead of 'origin/master' by 2 commits.
	  (use "git push" to publish your local commits)

	All conflicts fixed but you are still merging.
	  (use "git commit" to conclude merge)

	Changes to be committed:

	modified:   readme.md

列出当前分支

	localhost:GitTestCommand xiushanfan$ git branch -a
	* master
	test1
	test2
	remotes/origin/AppleBranch
	remotes/origin/HEAD -> origin/master
	remotes/origin/master

删除`test1`分支

	localhost:GitTestCommand xiushanfan$ git branch -d test1
	Deleted branch test1 (was 25f36c2).
	
删除`test2`分支,但发现删不掉，因为刚才冲突的原因`test2`并没有被`merge`进去.
	
	localhost:GitTestCommand xiushanfan$ git branch -d test2
	error: The branch 'test2' is not fully merged.
	If you are sure you want to delete it, run 'git branch -D test2'.
	
然后去`merge`发现，还,`merge`不了，因为刚才你解决的冲突还没有提交.

	localhost:GitTestCommand xiushanfan$ git merge test2
	fatal: You have not concluded your merge (MERGE_HEAD exists).
	Please, commit your changes before you can merge.
	
然后去提交.
	
	localhost:GitTestCommand xiushanfan$ git commit 
	[master ac8f90a] Merge branch 'test2'
	
再次`merge`，成功了。
	
	localhost:GitTestCommand xiushanfan$ git merge test2
	Already up-to-date.
	
删除`test2`分支成功了。

	localhost:GitTestCommand xiushanfan$ git branch -d test2
	Deleted branch test2 (was f64b914).
	
再次查看当前的本地`master`分支的状态.
	
	localhost:GitTestCommand xiushanfan$ git status
	On branch master
	Your branch is ahead of 'origin/master' by 4 commits.
	  (use "git push" to publish your local commits)

	nothing to commit, working directory clean

正常了，比远端的分支多了4个`commit`对象.


--------


#####远端服务器交互分支

这些都是本地的操作，其实并不涉及和远端服务器的交互。

远程分支(`remote branch`)是对远程仓库中的分支的索引，用**(远程仓库名)/(分支名)**标示

**注意:这些分支在本地是无法移动的。只有和网络交互时候才会更新。他们像是远端的书签一样。**

执行`branch`命令,查看

	localhost:GitTestCommand xiushanfan$ git branch -a -v
	* master                     ac8f90a [ahead 4] Merge branch 'test2'
	remotes/origin/AppleBranch 33a02d3 	Add readme file
	remotes/origin/HEAD        -> origin/master
	remotes/origin/master      5585b99 Update readme.md
  



