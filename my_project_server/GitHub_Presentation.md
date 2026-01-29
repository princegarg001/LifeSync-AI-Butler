# Complete GitHub Presentation
## A Comprehensive Guide to Version Control & Collaboration

---

# Slide 1: Title Slide

## **GitHub**
### The World's Leading Platform for Version Control & Collaboration

- **Subtitle:** Master the Art of Code Collaboration
- **Tagline:** "Where the world builds software"
- **Logo:** GitHub Octocat

---

# Slide 2: What is GitHub?

## Definition
GitHub is a **web-based platform** for version control and collaboration using **Git**.

### Key Points:
- 🌐 Cloud-based hosting service for Git repositories
- 👥 Enables developers to collaborate on projects
- 📁 Stores and manages code with version history
- 🔄 Tracks every change made to the codebase
- 🌍 Home to **100+ million developers** worldwide
- 📦 Hosts **420+ million repositories**

### Founded:
- **Year:** 2008
- **Founders:** Tom Preston-Werner, Chris Wanstrath, PJ Hyett, Scott Chacon
- **Acquired by:** Microsoft (2018) for $7.5 billion

---

# Slide 3: What is Git vs GitHub?

## Git vs GitHub - Understanding the Difference

| **Git** | **GitHub** |
|---------|------------|
| Version control system | Hosting platform for Git |
| Installed locally on computer | Cloud-based service |
| Command-line tool | Web interface + API |
| Created by Linus Torvalds (2005) | Created in 2008 |
| Open source & free | Free & paid tiers |
| Works offline | Requires internet |
| Tracks code changes | Enables collaboration |

### Simple Analogy:
> **Git** = The engine 🔧
> **GitHub** = The car dealership 🚗

---

# Slide 4: Why Use GitHub?

## Benefits of Using GitHub

### 1. 🤝 Collaboration
- Multiple developers can work simultaneously
- Code review through Pull Requests
- Team communication via Issues & Discussions

### 2. 📜 Version Control
- Complete history of all changes
- Easy rollback to previous versions
- Track who made what changes

### 3. 🔐 Backup & Security
- Cloud storage for your code
- Two-factor authentication
- Code scanning for vulnerabilities

### 4. 🌐 Open Source Community
- Contribute to millions of projects
- Learn from other developers' code
- Build your developer portfolio

### 5. 🔧 Integration & Automation
- GitHub Actions for CI/CD
- Integration with 1000+ tools
- Automated testing & deployment

---

# Slide 5: Key Features of GitHub

## Core Features

```
┌─────────────────────────────────────────────────────────┐
│                    GitHub Features                       │
├─────────────┬─────────────┬─────────────┬───────────────┤
│ Repositories│ Pull        │ Issues      │ GitHub        │
│             │ Requests    │             │ Actions       │
├─────────────┼─────────────┼─────────────┼───────────────┤
│ Branches    │ Code        │ Projects    │ GitHub        │
│             │ Review      │             │ Pages         │
├─────────────┼─────────────┼─────────────┼───────────────┤
│ Forks       │ Wikis       │ Discussions │ GitHub        │
│             │             │             │ Copilot       │
└─────────────┴─────────────┴─────────────┴───────────────┘
```

---

# Slide 6: Understanding Repositories

## What is a Repository?

A **repository (repo)** is a storage space for your project containing:

### Contents of a Repository:
- 📄 **Code files** - All your source code
- 📝 **README.md** - Project documentation
- 📋 **License** - Usage terms
- 🔧 **.gitignore** - Files to exclude from tracking
- 📁 **Folders** - Organized structure

### Types of Repositories:
| **Public** | **Private** |
|------------|-------------|
| Visible to everyone | Only you and collaborators |
| Great for open source | For proprietary projects |
| Free unlimited repos | Free with limitations |
| Community contributions | Controlled access |

### Creating a Repository:
1. Click "New Repository"
2. Add name and description
3. Choose public/private
4. Initialize with README
5. Add .gitignore template
6. Select license

---

# Slide 7: Git Workflow Basics

## The Git Workflow

```
┌──────────┐    ┌──────────┐    ┌──────────┐    ┌──────────┐
│ Working  │───▶│ Staging  │───▶│  Local   │───▶│  Remote  │
│Directory │add │  Area    │commit│  Repo   │push│  Repo    │
└──────────┘    └──────────┘    └──────────┘    └──────────┘
                                      ▲              │
                                      │    pull      │
                                      └──────────────┘
```

### Essential Git Commands:

| Command | Description |
|---------|-------------|
| `git init` | Initialize a new repository |
| `git clone <url>` | Copy a remote repository |
| `git add .` | Stage all changes |
| `git commit -m "message"` | Save changes with message |
| `git push` | Upload to remote repository |
| `git pull` | Download updates from remote |
| `git status` | Check current status |
| `git log` | View commit history |

---

# Slide 8: Branches

## Understanding Branches

### What is a Branch?
A branch is an **independent line of development** that allows you to work on features without affecting the main codebase.

```
        Feature Branch
           ┌───●───●───●───┐
           │               │
    ●──────●───────────────●───────● main
           │               │
           └───●───●───────┘
        Bugfix Branch
```

### Common Branch Types:
- 🌿 **main/master** - Production-ready code
- 🔧 **develop** - Integration branch
- ✨ **feature/** - New feature development
- 🐛 **bugfix/** - Bug corrections
- 🚀 **release/** - Release preparation
- 🔥 **hotfix/** - Urgent production fixes

### Branch Commands:
```bash
git branch                    # List branches
git branch <name>             # Create branch
git checkout <name>           # Switch branch
git checkout -b <name>        # Create & switch
git merge <branch>            # Merge branch
git branch -d <name>          # Delete branch
```

---

# Slide 9: Pull Requests (PRs)

## Pull Requests - The Heart of Collaboration

### What is a Pull Request?
A **Pull Request** is a proposal to merge changes from one branch into another.

### PR Workflow:
1. 🍴 **Fork/Clone** the repository
2. 🌿 **Create** a new branch
3. ✏️ **Make** your changes
4. 📤 **Push** to your branch
5. 🔀 **Open** Pull Request
6. 👀 **Review** by team members
7. 💬 **Discuss** and refine
8. ✅ **Merge** into main branch

### Pull Request Best Practices:
- ✍️ Write clear, descriptive titles
- 📝 Provide detailed description
- 🔗 Link related issues
- 📸 Add screenshots for UI changes
- 🧪 Ensure tests pass
- 👥 Request appropriate reviewers

---

# Slide 10: Issues

## GitHub Issues - Project Management

### What are Issues?
Issues are used to **track tasks, bugs, feature requests**, and more.

### Issue Components:
- 📌 **Title** - Brief summary
- 📝 **Description** - Detailed explanation
- 🏷️ **Labels** - Categorization (bug, feature, etc.)
- 👤 **Assignees** - Responsible person(s)
- 📅 **Milestones** - Target release/deadline
- 📊 **Projects** - Link to project boards

### Common Labels:
| Label | Purpose |
|-------|---------|
| 🐛 `bug` | Something isn't working |
| ✨ `enhancement` | New feature request |
| 📚 `documentation` | Documentation updates |
| 🆘 `help wanted` | Community help needed |
| 👶 `good first issue` | Good for newcomers |
| ⚠️ `priority: high` | Urgent issues |

### Issue Templates:
Create templates for consistent issue reporting!

---

    # Slide 11: GitHub Actions

    ## GitHub Actions - CI/CD Automation

    ### What is GitHub Actions?
    A **powerful automation platform** to build, test, and deploy your code.

    ### Key Concepts:
    - 📋 **Workflow** - Automated process (YAML file)
    - 🎯 **Event** - Trigger (push, PR, schedule)
    - 💼 **Job** - Set of steps
    - 📌 **Step** - Individual task
    - 🔧 **Action** - Reusable command

    ### Example Workflow:
    ```yaml
    name: CI Pipeline
    on: [push, pull_request]

    jobs:
    build:
        runs-on: ubuntu-latest
        steps:
        - uses: actions/checkout@v3
        - name: Install Dependencies
            run: npm install
        - name: Run Tests
            run: npm test
        - name: Build
            run: npm run build
    ```

    ### Popular Use Cases:
    - ✅ Automated testing
    - 🚀 Continuous deployment
    - 📦 Package publishing
    - 🔍 Code scanning
    - 📢 Notifications

    ---

# Slide 12: GitHub Pages

## GitHub Pages - Free Web Hosting

### What is GitHub Pages?
A **free hosting service** for static websites directly from your repository.

### Features:
- 🆓 Completely free hosting
- 🔒 HTTPS enabled by default
- 🎨 Custom domain support
- 📝 Jekyll-powered blogs
- 🔄 Auto-deployment from repo

### Setup Steps:
1. Create repository (or use existing)
2. Add `index.html` to root or `/docs`
3. Go to Settings → Pages
4. Select source branch
5. Your site is live at:
   `https://username.github.io/repository`

### Use Cases:
- 📄 Project documentation
- 💼 Personal portfolio
- 📰 Blogs
- 📚 Technical docs
- 🎨 Landing pages

---

# Slide 13: Forking & Cloning

## Forking vs Cloning

### Forking 🍴
Creating a **personal copy** of someone else's repository in your GitHub account.

```
Original Repo ──────▶ Your Fork (GitHub)
(Their account)       (Your account)
```

**When to Fork:**
- Contributing to open source
- Experimenting with projects
- Creating your own version

### Cloning 📥
Creating a **local copy** of a repository on your computer.

```
Remote Repo ──────▶ Local Copy
(GitHub)           (Your computer)
```

**When to Clone:**
- Working on code locally
- Starting development
- Making changes offline

### Commands:
```bash
# Clone a repository
git clone https://github.com/user/repo.git

# Clone your fork
git clone https://github.com/YOUR-USER/repo.git
```

---

# Slide 14: Code Review Best Practices

## Effective Code Reviews

### Why Code Review?
- 🐛 Catch bugs early
- 📚 Knowledge sharing
- 📈 Improve code quality
- 🎓 Learning opportunity

### For Reviewers:
| Do ✅ | Don't ❌ |
|-------|---------|
| Be constructive | Be harsh or personal |
| Explain why | Just say "wrong" |
| Suggest alternatives | Only criticize |
| Ask questions | Make assumptions |
| Acknowledge good code | Only point out negatives |

### Review Checklist:
- [ ] Code follows style guidelines
- [ ] Logic is correct and efficient
- [ ] Tests are included and passing
- [ ] Documentation is updated
- [ ] No security vulnerabilities
- [ ] Changes match requirements

### Using Review Features:
- 💬 **Comment** - General feedback
- ✅ **Approve** - Ready to merge
- ❌ **Request changes** - Needs work

---

# Slide 15: GitHub Security Features

## Security on GitHub

### Security Features:
| Feature | Description |
|---------|-------------|
| 🔐 **2FA** | Two-factor authentication |
| 🔑 **SSH Keys** | Secure authentication |
| 🛡️ **Dependabot** | Dependency vulnerability alerts |
| 🔍 **Code Scanning** | Find security vulnerabilities |
| 🔒 **Secret Scanning** | Detect exposed credentials |
| 📋 **Security Advisories** | Report vulnerabilities privately |

### Best Practices:
1. ✅ Enable 2FA on your account
2. ✅ Use SSH keys instead of passwords
3. ✅ Never commit secrets/API keys
4. ✅ Use `.gitignore` for sensitive files
5. ✅ Review dependencies regularly
6. ✅ Enable branch protection rules

### Branch Protection:
- Require PR reviews before merging
- Require status checks to pass
- Restrict who can push
- Require signed commits

---

# Slide 16: GitHub Collaboration Tools

## Collaboration Features

### GitHub Discussions 💬
- Community forum for your project
- Q&A format available
- Announcement capabilities
- Categories for organization

### GitHub Projects 📊
- Kanban-style project boards
- Automated workflows
- Custom fields
- Multiple views (Table, Board)

### GitHub Wiki 📚
- Built-in documentation
- Markdown support
- Page hierarchy
- Version history

### Teams & Organizations 👥
- Group developers together
- Fine-grained permissions
- Team discussions
- Audit logs

```
┌─────────────────────────────────────┐
│           Organization              │
│  ┌─────────┐  ┌─────────┐          │
│  │ Team A  │  │ Team B  │          │
│  │ ●●●     │  │ ●●●●    │          │
│  └─────────┘  └─────────┘          │
│       │            │                │
│  ┌────┴────┐  ┌────┴────┐          │
│  │ Repo 1  │  │ Repo 2  │          │
│  └─────────┘  └─────────┘          │
└─────────────────────────────────────┘
```

---

# Slide 17: GitHub Copilot

## GitHub Copilot - AI Pair Programmer

### What is GitHub Copilot?
An **AI-powered code assistant** that suggests code as you type.

### Features:
- 🤖 **Code Suggestions** - Whole lines or functions
- 💬 **Chat Interface** - Ask coding questions
- 📝 **Documentation** - Auto-generate docs
- 🔧 **Debug Help** - Find and fix bugs
- ✍️ **Code Explanation** - Understand complex code

### Supported Editors:
- VS Code
- Visual Studio
- JetBrains IDEs
- Neovim
- GitHub.com

### Best Practices:
1. Write clear comments for better suggestions
2. Review and understand suggested code
3. Use for boilerplate and repetitive code
4. Don't rely on it blindly
5. Verify security of suggestions

### Pricing:
- **Individual:** $10/month
- **Business:** $19/user/month
- **Enterprise:** $39/user/month
- **Free** for students & open source maintainers

---

# Slide 18: GitHub CLI

## GitHub CLI - Command Line Power

### What is GitHub CLI?
Official command-line tool to interact with GitHub without leaving your terminal.

### Installation:
```bash
# Windows
winget install GitHub.cli

# macOS
brew install gh

# Linux
sudo apt install gh
```

### Common Commands:
```bash
# Authentication
gh auth login

# Repository operations
gh repo create
gh repo clone owner/repo
gh repo view

# Pull Requests
gh pr create
gh pr list
gh pr checkout <number>
gh pr merge

# Issues
gh issue create
gh issue list
gh issue view <number>

# Workflows
gh workflow run
gh run list
gh run view
```

### Benefits:
- ⚡ Faster workflow
- 🔄 Scripts & automation
- 📱 Consistent commands across platforms

---

# Slide 19: GitHub Pricing & Plans

## GitHub Plans

### Free Plan 🆓
- Unlimited public repositories
- Unlimited private repositories
- 2,000 CI/CD minutes/month
- 500MB package storage
- Community support
- Copilot (limited)

### Team Plan 💼 ($4/user/month)
- Everything in Free, plus:
- Protected branches
- Code owners
- Draft pull requests
- 3,000 CI/CD minutes/month
- 2GB package storage

### Enterprise Plan 🏢 ($21/user/month)
- Everything in Team, plus:
- SAML single sign-on
- Advanced audit log
- GitHub Connect
- 50,000 CI/CD minutes/month
- 50GB package storage
- Enterprise support

---

# Slide 20: Git Common Commands Cheatsheet

## Essential Git Commands

### Setup & Config
```bash
git config --global user.name "Name"
git config --global user.email "email@example.com"
```

### Daily Workflow
```bash
git status                    # Check status
git add .                     # Stage all changes
git commit -m "message"       # Commit changes
git push origin main          # Push to remote
git pull origin main          # Pull updates
```

### Branching
```bash
git branch                    # List branches
git checkout -b feature       # Create & switch
git merge feature             # Merge branch
git branch -d feature         # Delete branch
```

### History & Undo
```bash
git log --oneline             # View history
git diff                      # See changes
git reset --hard HEAD~1       # Undo last commit
git revert <commit>           # Revert a commit
git stash                     # Save changes temporarily
```

### Remote
```bash
git remote -v                 # List remotes
git remote add origin <url>   # Add remote
git fetch origin              # Download changes
```

---

# Slide 21: Best Practices Summary

## GitHub Best Practices

### Repository Management
- ✅ Write clear README files
- ✅ Use meaningful commit messages
- ✅ Implement proper .gitignore
- ✅ Choose appropriate license
- ✅ Keep repositories organized

### Collaboration
- ✅ Use branches for features
- ✅ Create descriptive PRs
- ✅ Review code thoroughly
- ✅ Communicate via Issues
- ✅ Document decisions

### Security
- ✅ Enable 2FA
- ✅ Use SSH keys
- ✅ Never commit secrets
- ✅ Enable Dependabot
- ✅ Set branch protection

### Commit Message Format:
```
<type>: <short description>

[optional body]

[optional footer]
```

**Types:** feat, fix, docs, style, refactor, test, chore

**Example:**
```
feat: add user authentication

- Implemented JWT token authentication
- Added login/logout endpoints
- Created user session management

Closes #123
```

---

# Slide 22: Getting Started with GitHub

## Quick Start Guide

### Step 1: Create Account
1. Go to github.com
2. Click "Sign Up"
3. Enter email & create password
4. Verify your account
5. Set up your profile

### Step 2: Install Git
```bash
# Download from git-scm.com
# Verify installation
git --version
```

### Step 3: Configure Git
```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

### Step 4: Create First Repository
1. Click "+" → "New repository"
2. Name your repository
3. Add description
4. Initialize with README
5. Click "Create repository"

### Step 5: Clone & Start Coding
```bash
git clone https://github.com/you/repo.git
cd repo
# Make changes
git add .
git commit -m "My first commit"
git push
```

---

# Slide 23: Resources & Learning

## Learn More About GitHub

### Official Resources
- 📚 [GitHub Docs](https://docs.github.com)
- 🎓 [GitHub Skills](https://skills.github.com)
- 📰 [GitHub Blog](https://github.blog)
- 📺 [GitHub YouTube](https://youtube.com/github)

### Courses & Tutorials
- GitHub Learning Lab
- FreeCodeCamp Git Course
- Udemy Git & GitHub Courses
- LinkedIn Learning

### Practice Projects
- Contribute to open source
- Create a personal portfolio
- Build a documentation site
- Start a side project

### Community
- GitHub Community Forum
- Stack Overflow
- Reddit r/github
- Discord servers

### Certifications
- GitHub Foundations
- GitHub Actions
- GitHub Advanced Security
- GitHub Administration

---

# Slide 24: Summary & Key Takeaways

## What We Learned

### Core Concepts ✅
- GitHub is the world's leading code hosting platform
- Git is the version control system; GitHub is the hosting service
- Repositories store your code and its history
- Branches enable parallel development
- Pull Requests facilitate code review and collaboration

### Key Features ✅
- Issues for project management
- GitHub Actions for CI/CD
- GitHub Pages for free hosting
- GitHub Copilot for AI assistance
- Security features for protection

### Best Practices ✅
- Write meaningful commit messages
- Use branches for features
- Review code before merging
- Document your projects
- Enable security features

---

# Slide 25: Thank You

## Questions?

### Connect With GitHub
- 🌐 **Website:** github.com
- 🐦 **Twitter:** @github
- 💼 **LinkedIn:** linkedin.com/company/github
- 📺 **YouTube:** youtube.com/github

### Start Your Journey Today!
> "The best time to start using GitHub was yesterday.
> The second best time is now."

---

## **Thank You!**
### Happy Coding! 🚀

---
*Created with ❤️ for developers everywhere*

---

# APPENDIX: Complete Git Commands Reference

## 📚 All Git Commands with Descriptions

---

## 1. 🔧 Setup & Configuration

| Command | Description |
|---------|-------------|
| `git config --global user.name "Your Name"` | Set your username globally |
| `git config --global user.email "email@example.com"` | Set your email globally |
| `git config --local user.name "Name"` | Set username for current repo only |
| `git config --local user.email "email"` | Set email for current repo only |
| `git config --global core.editor "code --wait"` | Set VS Code as default editor |
| `git config --global core.editor "vim"` | Set Vim as default editor |
| `git config --global init.defaultBranch main` | Set default branch name to 'main' |
| `git config --global color.ui auto` | Enable colored output |
| `git config --global alias.co checkout` | Create shortcut alias 'co' for checkout |
| `git config --global alias.br branch` | Create shortcut alias 'br' for branch |
| `git config --global alias.ci commit` | Create shortcut alias 'ci' for commit |
| `git config --global alias.st status` | Create shortcut alias 'st' for status |
| `git config --list` | List all configuration settings |
| `git config --list --show-origin` | Show config settings with file locations |
| `git config user.name` | Show current username |
| `git config --global --unset <key>` | Remove a global config setting |
| `git config --global credential.helper cache` | Cache credentials temporarily |
| `git config --global credential.helper store` | Store credentials permanently |
| `git config --global pull.rebase true` | Set pull to rebase by default |
| `git config --global merge.ff false` | Disable fast-forward merges |

---

## 2. 📁 Creating Repositories

| Command | Description |
|---------|-------------|
| `git init` | Initialize a new Git repository in current directory |
| `git init <directory>` | Create new repo in specified directory |
| `git init --bare` | Create a bare repository (no working directory) |
| `git clone <url>` | Clone a repository from URL |
| `git clone <url> <directory>` | Clone into a specific directory |
| `git clone --depth 1 <url>` | Shallow clone (only latest commit) |
| `git clone --branch <branch> <url>` | Clone a specific branch |
| `git clone --single-branch <url>` | Clone only one branch |
| `git clone --recursive <url>` | Clone including submodules |
| `git clone --mirror <url>` | Create a mirror clone |

---

## 3. 📄 Basic Snapshotting

### Staging Files
| Command | Description |
|---------|-------------|
| `git add <file>` | Stage a specific file |
| `git add .` | Stage all changes in current directory |
| `git add -A` | Stage all changes (entire repo) |
| `git add --all` | Same as -A, stage everything |
| `git add *.js` | Stage all JavaScript files |
| `git add -p` | Interactively stage parts of files |
| `git add -i` | Interactive staging mode |
| `git add -n <file>` | Dry run - show what would be added |
| `git add -u` | Stage modified and deleted files only |

### Committing
| Command | Description |
|---------|-------------|
| `git commit -m "message"` | Commit with message |
| `git commit` | Open editor for commit message |
| `git commit -a -m "message"` | Stage tracked files and commit |
| `git commit -am "message"` | Shorthand for above |
| `git commit --amend` | Modify the last commit |
| `git commit --amend -m "new message"` | Change last commit message |
| `git commit --amend --no-edit` | Amend without changing message |
| `git commit --allow-empty -m "message"` | Create empty commit |
| `git commit -v` | Show diff in commit message editor |
| `git commit --date="YYYY-MM-DD HH:MM:SS"` | Commit with specific date |
| `git commit -S` | Create signed commit (GPG) |

### Status & Diff
| Command | Description |
|---------|-------------|
| `git status` | Show working tree status |
| `git status -s` | Short status format |
| `git status -b` | Show branch info in short format |
| `git diff` | Show unstaged changes |
| `git diff --staged` | Show staged changes |
| `git diff --cached` | Same as --staged |
| `git diff HEAD` | Show all changes since last commit |
| `git diff <commit1> <commit2>` | Compare two commits |
| `git diff <branch1>..<branch2>` | Compare two branches |
| `git diff --stat` | Show diff statistics |
| `git diff --name-only` | Show only changed file names |
| `git diff --name-status` | Show names and status (A/M/D) |
| `git diff --color-words` | Show word-by-word diff |

---

## 4. 🌿 Branching & Merging

### Branch Management
| Command | Description |
|---------|-------------|
| `git branch` | List local branches |
| `git branch -a` | List all branches (local + remote) |
| `git branch -r` | List remote branches only |
| `git branch <name>` | Create new branch |
| `git branch -d <name>` | Delete branch (safe) |
| `git branch -D <name>` | Force delete branch |
| `git branch -m <old> <new>` | Rename branch |
| `git branch -M <new>` | Rename current branch |
| `git branch -v` | Show last commit on each branch |
| `git branch -vv` | Show branches with tracking info |
| `git branch --merged` | List merged branches |
| `git branch --no-merged` | List unmerged branches |
| `git branch --contains <commit>` | Find branches containing commit |
| `git branch -u origin/<branch>` | Set upstream branch |
| `git branch --set-upstream-to=origin/<branch>` | Set tracking branch |

### Switching Branches
| Command | Description |
|---------|-------------|
| `git checkout <branch>` | Switch to branch |
| `git checkout -b <branch>` | Create and switch to branch |
| `git checkout -b <branch> origin/<branch>` | Create branch from remote |
| `git checkout -` | Switch to previous branch |
| `git checkout <commit>` | Checkout specific commit (detached HEAD) |
| `git switch <branch>` | Switch to branch (newer Git) |
| `git switch -c <branch>` | Create and switch (newer Git) |
| `git switch -` | Switch to previous branch |

### Merging
| Command | Description |
|---------|-------------|
| `git merge <branch>` | Merge branch into current branch |
| `git merge --no-ff <branch>` | Merge with merge commit (no fast-forward) |
| `git merge --squash <branch>` | Squash commits into one |
| `git merge --abort` | Abort merge in progress |
| `git merge --continue` | Continue after resolving conflicts |
| `git merge -X theirs <branch>` | Merge preferring their changes |
| `git merge -X ours <branch>` | Merge preferring our changes |
| `git merge --no-commit <branch>` | Merge but don't auto-commit |

### Rebasing
| Command | Description |
|---------|-------------|
| `git rebase <branch>` | Rebase current branch onto another |
| `git rebase -i <commit>` | Interactive rebase |
| `git rebase -i HEAD~3` | Interactively edit last 3 commits |
| `git rebase --abort` | Abort rebase |
| `git rebase --continue` | Continue after resolving conflicts |
| `git rebase --skip` | Skip current commit during rebase |
| `git rebase --onto <new> <old> <branch>` | Rebase onto specific branch |

---

## 5. 🌐 Remote Operations

### Managing Remotes
| Command | Description |
|---------|-------------|
| `git remote` | List remote names |
| `git remote -v` | List remotes with URLs |
| `git remote add <name> <url>` | Add new remote |
| `git remote remove <name>` | Remove remote |
| `git remote rename <old> <new>` | Rename remote |
| `git remote set-url <name> <url>` | Change remote URL |
| `git remote show <name>` | Show remote details |
| `git remote prune <name>` | Remove stale remote branches |
| `git remote update` | Fetch from all remotes |

### Fetching & Pulling
| Command | Description |
|---------|-------------|
| `git fetch` | Fetch from default remote |
| `git fetch <remote>` | Fetch from specific remote |
| `git fetch --all` | Fetch from all remotes |
| `git fetch --prune` | Fetch and remove deleted branches |
| `git fetch --tags` | Fetch all tags |
| `git pull` | Fetch and merge from upstream |
| `git pull <remote> <branch>` | Pull specific branch |
| `git pull --rebase` | Pull with rebase instead of merge |
| `git pull --no-commit` | Pull but don't auto-commit |
| `git pull --ff-only` | Pull only if fast-forward possible |

### Pushing
| Command | Description |
|---------|-------------|
| `git push` | Push to default remote |
| `git push <remote> <branch>` | Push to specific remote/branch |
| `git push -u origin <branch>` | Push and set upstream |
| `git push --set-upstream origin <branch>` | Same as above |
| `git push origin --delete <branch>` | Delete remote branch |
| `git push --force` | Force push (dangerous!) |
| `git push --force-with-lease` | Safer force push |
| `git push --all` | Push all branches |
| `git push --tags` | Push all tags |
| `git push origin :<branch>` | Delete remote branch (old syntax) |

---

## 6. 📦 Stashing

| Command | Description |
|---------|-------------|
| `git stash` | Stash current changes |
| `git stash save "message"` | Stash with description |
| `git stash push -m "message"` | Same as above (preferred) |
| `git stash list` | List all stashes |
| `git stash show` | Show latest stash changes |
| `git stash show -p` | Show latest stash diff |
| `git stash show stash@{0}` | Show specific stash |
| `git stash pop` | Apply and remove latest stash |
| `git stash apply` | Apply latest stash (keep in list) |
| `git stash apply stash@{2}` | Apply specific stash |
| `git stash drop` | Delete latest stash |
| `git stash drop stash@{1}` | Delete specific stash |
| `git stash clear` | Delete all stashes |
| `git stash branch <branch>` | Create branch from stash |
| `git stash -u` | Stash including untracked files |
| `git stash -a` | Stash including ignored files |
| `git stash --keep-index` | Stash only unstaged changes |

---

## 7. 🏷️ Tagging

| Command | Description |
|---------|-------------|
| `git tag` | List all tags |
| `git tag -l "v1.*"` | List tags matching pattern |
| `git tag <tagname>` | Create lightweight tag |
| `git tag -a <tagname> -m "message"` | Create annotated tag |
| `git tag -a <tagname> <commit>` | Tag a specific commit |
| `git tag -d <tagname>` | Delete local tag |
| `git push origin <tagname>` | Push tag to remote |
| `git push origin --tags` | Push all tags |
| `git push origin --delete <tagname>` | Delete remote tag |
| `git show <tagname>` | Show tag details |
| `git checkout <tagname>` | Checkout tag (detached HEAD) |
| `git describe` | Describe current commit with tag |
| `git describe --tags` | Include lightweight tags |

---

## 8. 🔍 Inspection & Comparison

### Log & History
| Command | Description |
|---------|-------------|
| `git log` | Show commit history |
| `git log --oneline` | One line per commit |
| `git log --graph` | Show branch graph |
| `git log --all` | Show all branches |
| `git log --graph --oneline --all` | Pretty graph view |
| `git log -n 5` | Show last 5 commits |
| `git log -5` | Shorthand for above |
| `git log --author="name"` | Filter by author |
| `git log --since="2024-01-01"` | Commits since date |
| `git log --until="2024-12-31"` | Commits until date |
| `git log --after="1 week ago"` | Commits in last week |
| `git log --grep="feature"` | Search commit messages |
| `git log -S "function"` | Find commits changing string |
| `git log -p` | Show patches (diffs) |
| `git log --stat` | Show file statistics |
| `git log --name-only` | Show changed file names |
| `git log --name-status` | Show names with status |
| `git log <file>` | History of specific file |
| `git log --follow <file>` | Follow file renames |
| `git log <branch1>..<branch2>` | Commits in branch2 not in branch1 |
| `git log --merges` | Show only merge commits |
| `git log --no-merges` | Exclude merge commits |
| `git log --pretty=format:"%h - %an: %s"` | Custom format |
| `git shortlog` | Summarize by author |
| `git shortlog -sn` | Count commits by author |

### Blame & Show
| Command | Description |
|---------|-------------|
| `git blame <file>` | Show who changed each line |
| `git blame -L 10,20 <file>` | Blame specific lines |
| `git blame -w <file>` | Ignore whitespace changes |
| `git show <commit>` | Show commit details |
| `git show <commit>:<file>` | Show file at commit |
| `git show --stat <commit>` | Show commit with stats |

### Other Inspection
| Command | Description |
|---------|-------------|
| `git reflog` | Show reference log |
| `git reflog show <branch>` | Reflog for specific branch |
| `git ls-files` | List tracked files |
| `git ls-tree <branch>` | List files in branch |
| `git rev-parse HEAD` | Show HEAD commit hash |
| `git rev-parse --short HEAD` | Short commit hash |
| `git cat-file -p <hash>` | Show object content |
| `git cat-file -t <hash>` | Show object type |

---

## 9. ↩️ Undoing Changes

### Restoring Files
| Command | Description |
|---------|-------------|
| `git checkout -- <file>` | Discard changes in file |
| `git checkout .` | Discard all changes |
| `git restore <file>` | Restore file (newer Git) |
| `git restore --staged <file>` | Unstage file |
| `git restore --source=<commit> <file>` | Restore from commit |

### Reset
| Command | Description |
|---------|-------------|
| `git reset <file>` | Unstage file |
| `git reset` | Unstage all files |
| `git reset --soft HEAD~1` | Undo commit, keep changes staged |
| `git reset --mixed HEAD~1` | Undo commit, keep changes unstaged |
| `git reset --hard HEAD~1` | Undo commit, discard all changes |
| `git reset --hard <commit>` | Reset to specific commit |
| `git reset --hard origin/<branch>` | Reset to remote branch |

### Revert
| Command | Description |
|---------|-------------|
| `git revert <commit>` | Create new commit undoing changes |
| `git revert HEAD` | Revert last commit |
| `git revert --no-commit <commit>` | Revert without committing |
| `git revert -m 1 <merge-commit>` | Revert a merge commit |

### Clean
| Command | Description |
|---------|-------------|
| `git clean -n` | Dry run - show what would be deleted |
| `git clean -f` | Delete untracked files |
| `git clean -fd` | Delete untracked files and directories |
| `git clean -fx` | Delete untracked and ignored files |
| `git clean -i` | Interactive clean |

---

## 10. 🔀 Cherry-Pick

| Command | Description |
|---------|-------------|
| `git cherry-pick <commit>` | Apply commit to current branch |
| `git cherry-pick <c1> <c2>` | Cherry-pick multiple commits |
| `git cherry-pick <c1>..<c2>` | Cherry-pick range of commits |
| `git cherry-pick --no-commit <commit>` | Apply without committing |
| `git cherry-pick --abort` | Abort cherry-pick |
| `git cherry-pick --continue` | Continue after conflict |
| `git cherry-pick -x <commit>` | Add source commit reference |

---

## 11. 📂 Submodules

| Command | Description |
|---------|-------------|
| `git submodule add <url>` | Add submodule |
| `git submodule add <url> <path>` | Add submodule to specific path |
| `git submodule init` | Initialize submodules |
| `git submodule update` | Update submodules |
| `git submodule update --init` | Init and update |
| `git submodule update --init --recursive` | Include nested submodules |
| `git submodule update --remote` | Update to latest remote |
| `git submodule foreach <command>` | Run command in each submodule |
| `git submodule status` | Show submodule status |
| `git submodule deinit <path>` | Unregister submodule |
| `git rm <submodule-path>` | Remove submodule |

---

## 12. 🔧 Worktrees

| Command | Description |
|---------|-------------|
| `git worktree add <path> <branch>` | Create linked worktree |
| `git worktree add -b <branch> <path>` | Create worktree with new branch |
| `git worktree list` | List all worktrees |
| `git worktree remove <path>` | Remove worktree |
| `git worktree prune` | Clean up stale worktrees |
| `git worktree lock <path>` | Prevent worktree deletion |
| `git worktree unlock <path>` | Allow worktree deletion |

---

## 13. 🔎 Searching

| Command | Description |
|---------|-------------|
| `git grep "pattern"` | Search in tracked files |
| `git grep -n "pattern"` | Show line numbers |
| `git grep -c "pattern"` | Count matches per file |
| `git grep -e "pattern" -- "*.js"` | Search in specific files |
| `git grep "pattern" <branch>` | Search in branch |
| `git log -S "string"` | Find commits adding/removing string |
| `git log -G "regex"` | Search with regex in commits |
| `git bisect start` | Start binary search for bug |
| `git bisect bad` | Mark current commit as bad |
| `git bisect good <commit>` | Mark commit as good |
| `git bisect reset` | End bisect session |

---

## 14. 📊 Archive & Bundle

| Command | Description |
|---------|-------------|
| `git archive --format=zip HEAD > archive.zip` | Create zip archive |
| `git archive --format=tar HEAD \| gzip > archive.tar.gz` | Create tar.gz |
| `git archive --prefix=project/ HEAD > archive.tar` | Archive with prefix |
| `git bundle create repo.bundle --all` | Create bundle with all refs |
| `git bundle create repo.bundle main` | Bundle specific branch |
| `git clone repo.bundle -b main` | Clone from bundle |
| `git bundle verify repo.bundle` | Verify bundle integrity |

---

## 15. 🛠️ Maintenance & Optimization

| Command | Description |
|---------|-------------|
| `git gc` | Garbage collection |
| `git gc --aggressive` | Aggressive cleanup |
| `git prune` | Remove unreachable objects |
| `git fsck` | Check repository integrity |
| `git count-objects -v` | Count objects and disk usage |
| `git repack` | Repack repository |
| `git maintenance start` | Enable background maintenance |
| `git maintenance run` | Run maintenance tasks |

---

## 16. ⚙️ Plumbing Commands (Advanced)

| Command | Description |
|---------|-------------|
| `git hash-object -w <file>` | Store file and get hash |
| `git cat-file -p <hash>` | Print object contents |
| `git ls-files --stage` | Show staged files info |
| `git update-index --add <file>` | Add file to index |
| `git write-tree` | Create tree from index |
| `git commit-tree <tree>` | Create commit from tree |
| `git update-ref refs/heads/<br> <hash>` | Update branch reference |
| `git symbolic-ref HEAD refs/heads/<br>` | Set HEAD |
| `git rev-list --all` | List all commit hashes |
| `git for-each-ref` | List all references |

---

## 17. 🎯 Useful Shortcuts & Tips

### Common Aliases to Set Up
```bash
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'
git config --global alias.visual '!gitk'
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
```

### Useful One-Liners
```bash
# Undo last commit but keep changes
git reset --soft HEAD~1

# See changes in last commit
git show HEAD

# Delete all merged branches
git branch --merged | grep -v "\*\|main\|master" | xargs -n 1 git branch -d

# Find large files in history
git rev-list --objects --all | git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' | awk '/^blob/ {print $3,$4}' | sort -rn | head -20

# Sync fork with upstream
git fetch upstream
git checkout main
git merge upstream/main

# Interactive staging
git add -p

# See who wrote each line
git blame <file>

# Find which commit introduced a bug
git bisect start
git bisect bad HEAD
git bisect good <known-good-commit>

# List files changed between commits
git diff --name-only <commit1> <commit2>
```

---

## Quick Reference Card

```
┌─────────────────────────────────────────────────────────────┐
│                    GIT QUICK REFERENCE                       │
├─────────────────────────────────────────────────────────────┤
│ SETUP                                                        │
│   git init          - Initialize repository                  │
│   git clone <url>   - Clone repository                       │
│   git config        - Configure settings                     │
├─────────────────────────────────────────────────────────────┤
│ BASIC WORKFLOW                                               │
│   git add           - Stage changes                          │
│   git commit        - Save changes                           │
│   git push          - Upload to remote                       │
│   git pull          - Download from remote                   │
├─────────────────────────────────────────────────────────────┤
│ BRANCHING                                                    │
│   git branch        - Manage branches                        │
│   git checkout      - Switch branches                        │
│   git merge         - Combine branches                       │
│   git rebase        - Reapply commits                        │
├─────────────────────────────────────────────────────────────┤
│ INSPECTION                                                   │
│   git status        - Check status                           │
│   git log           - View history                           │
│   git diff          - Show changes                           │
│   git blame         - Line-by-line authorship                │
├─────────────────────────────────────────────────────────────┤
│ UNDO                                                         │
│   git reset         - Unstage/undo commits                   │
│   git revert        - Create undo commit                     │
│   git restore       - Restore files                          │
│   git clean         - Remove untracked files                 │
├─────────────────────────────────────────────────────────────┤
│ REMOTE                                                       │
│   git remote        - Manage remotes                         │
│   git fetch         - Download changes                       │
│   git push          - Upload changes                         │
│   git pull          - Fetch + merge                          │
└─────────────────────────────────────────────────────────────┘
```

---

## 🎓 Git Command Categories Summary

| Category | Commands | Purpose |
|----------|----------|---------|
| **Setup** | config, init, clone | Configure Git and create repos |
| **Basic** | add, commit, status, diff | Daily workflow commands |
| **Branching** | branch, checkout, switch, merge, rebase | Work with branches |
| **Remote** | remote, fetch, pull, push | Collaborate with others |
| **Stashing** | stash | Temporarily save changes |
| **Tagging** | tag | Mark important versions |
| **History** | log, blame, show, reflog | Inspect project history |
| **Undo** | reset, revert, restore, clean | Undo mistakes |
| **Advanced** | cherry-pick, bisect, submodule | Power user features |

---

**Total Commands Covered: 200+**

*Use this reference to master Git! 🚀*
