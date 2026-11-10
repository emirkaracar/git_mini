# Git Mini Exo

## Part 1: Setup & config

```bash
git --version
git config --global user.name "Emir Karaçar"
git config --global user.email "your-email@example.com"
```

## Part 2: Create your first repository

```bash
mkdir my-first-repo
cd my-first-repo
git init
touch readme.txt
```

## Part 3: Your first commit

1. `git status`
2. `git add readme.txt`
3. `git commit -m "Add readme file"`
4. `git log`

## Part 4: Make changes

```bash
echo "This is my first Git repository." >> readme.txt
git status
```

`git status` shows that `readme.txt` is **modified** and the change is **not staged for commit**. Git knows the file changed since the last commit but it won't be saved until I add it.

```bash
git add readme.txt
git commit -m "Add description line to readme"
```

I now have **2 commits**.

## Part 5: Exploration

- `git diff`: shows the line-by-line changes in my files that are not staged yet (added lines in green with `+`, removed lines in red with `-`).
- `git log --oneline`: shows the commit history in a short form, one commit per line with its short hash and message.

## Part 6: Working with branches

1. `git branch`
2. `git branch feature-script`
3. `git switch feature-script` (or `git checkout feature-script`)
4. `git switch -c dev` (or `git checkout -b dev`)
5. `git switch feature-script`
6. `git branch`: the current branch has a `*` next to it (`git status` also shows it on the first line)

## Part 7: Create a Bash script on a branch

```bash
git branch                    # check I'm on feature-script
touch install.sh              # then add the content below
```

```bash
#!/usr/bin/env bash

echo "Starting installation..."

# Update the list of available packages
sudo apt update

# Install a package (tree: shows folders as a tree)
sudo apt install -y tree

echo "Installation complete!"
```

```bash
chmod +x install.sh
git add install.sh
git commit -m "Add install script"
git log --oneline
```

## Part 8: Merge branches

1. `git switch main`
2. `ls`: `install.sh` is **not** there, because it was only committed on `feature-script`. Each branch has its own version of the files, and `main` doesn't have that commit yet.
3. `git merge feature-script`
4. `ls`: `install.sh` now appears on `main`.
5. `git log --oneline`: the "Add install script" commit is now part of `main`'s history. Since `main` had no new commits, Git did a **fast-forward** merge (it just moved `main` forward, no merge commit).
6. `git branch -d feature-script`

## Part 9: Push to GitHub

Create `my-first-repo` on GitHub **without** a README.

```bash
git remote add origin https://github.com/emirkaracar/my-first-repo.git
git push -u origin main
```

After refreshing the page, I can see my files (`readme.txt`, `install.sh`) and my commit history on GitHub.

## Part 10: Delete and clone

```bash
cd ..
rm -rf my-first-repo
git clone https://github.com/emirkaracar/my-first-repo.git
cd my-first-repo
ls
git log --oneline
```

All the files and commits are back, because they were saved on GitHub.

## Part 11: Full workflow practice

```bash
# 1. Delete the local folder (then delete the repo on GitHub: Settings → Delete this repository)
rm -rf my-first-repo

# 3–4. New project
mkdir bash-installer
cd bash-installer
git init
git branch -M main

# 5–6. README on main
echo "# bash-installer" > README.md
echo "A Bash script that sets up a Python / Jupyter environment on Linux or macOS." >> README.md
git add README.md
git commit -m "Add README"

# 7–9. Feature branch with the install script
git switch -c feature-install
cp ~/path/to/env_install.sh .
chmod +x env_install.sh
git add env_install.sh
git commit -m "Add environment install script"

# 10–12. Merge and clean up
git switch main
git merge feature-install
git branch -d feature-install

# 13–14. Create the "bash-installer" repo on GitHub (empty), then push
git remote add origin https://github.com/emirkaracar/bash-installer.git
git push -u origin main
```
