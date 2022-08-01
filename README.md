## git commands cheatsheet

### Merge Commands
- git diff <__reference1__> <__reference2__> --<__file__>
- git diff _working directory vs staging area_
- git diff HEAD _working directory vs repository_
- git diff --staged HEAD _staging area vs repository_
- git diff HEAD HEAD^ _head vs previous head_
- git diff master origin/master
- diff can be replaced by difftool/merge/mergetool
- [meld](https://www.youtube.com/watch?v=3Qynj8WUwgs&t=244s) difftool and its [setup](https://stackoverflow.com/questions/43317697/setting-up-and-using-meld-as-your-git-difftool-and-mergetool-on-a-mac)
___
### Misc Commands
- git reset <__.\file name__> _resets all but a file_
- git checkout -- .
- git remote -v _display remotes_
- git remote add origin git@github.com:User/UserRepo.git _add a new remote_
- git remote set-url origin git@github.com:User/UserRepo.git _change url of an existing remote_
- git log --online --decorate --graph --all
- git checkout commitHashCode filename ... retrieve previous version of a file
- git rm --cached <__file__> _cached flag only removes from git, not from filesystem_
___
### Branch Commands
- git branch -a _all flag i.e. local&remote_
- git checkout -b <__branch name__> _create new branch and move to it_
- git merge <__branch name__> _branch to merge in the current branch_
- git merge <__branch name__> --no-ff _avoid fastforward merge; preserve branch in the graph_
- git branch -d <__branch name__>
- git push origin --delete <__remote branch name__>
- git push --set-upstream origin dev _link local to remote repo_
___
### Stash related Commands
- git stash save "stash message" _stash uncommited changes_
- git stash list _list stashes_
- git stash apply stash{0}
- git stash pop _stash{1}_
- git stash clear
___
### Basic Commands
- git init
- git status
- git add <__file name__> _move file to stage step_
- git commit -m "commet" _from stage to repo to commit file with comment_
- git commit -ma "comment" _fast commit_
- git push origin master
- git pull origin master _= git fetch + git merge_
- git clone
