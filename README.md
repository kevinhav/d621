# DATA 621 -- Business Analytics and Data Mining

Group coursework for DATA 621. Each `hw*/` folder contains that assignment's
requirements (`assignment*.md`), a Quarto scaffold (`hw*.qmd`), and the
`data/` files needed to run it.

## First-Time Setup

You only need to do this once per computer.

1. **Install R** (4.4 or later) from <https://cran.r-project.org/>.
2. **Install RStudio** (recommended) from <https://posit.co/download/rstudio-desktop/>.
3. **Install Quarto** from <https://quarto.org/docs/get-started/> (RStudio
   bundles a copy, but installing it separately avoids version issues).
4. **Clone this repository** and open it:
   - In RStudio: `File > New Project > Version Control > Git`, paste the repo
     URL.
   - Or from a terminal: `git clone <repo-url> && cd d621`, then open the
     folder in RStudio (double-click any `.qmd` file, or `File > Open
     Project` if a `.Rproj` file is added later).
5. **Restore the R packages.** Open an R console in the project folder (this
   happens automatically if you opened it as an RStudio project) and run:

   ```r
   install.packages("renv")  # first time only, if not already installed
   renv::restore()
   ```

   This reads `renv.lock` and installs the exact package versions the rest
   of the group is using (currently the `tidyverse`), into a project-local
   library that won't affect other R projects on your machine. It can take a
   few minutes the first time.

6. **Render an assignment** to check everything works:

   ```r
   quarto::quarto_render("hw1/hw1.qmd")
   ```

   or, from a terminal, `quarto render hw1/hw1.qmd`. This produces a PDF in
   the `hw1/` folder.

If a `.qmd` file uses a package that isn't installed (you'll see an error
like `there is no package called 'X'`), install it and add it to the
lockfile so everyone else picks it up automatically:

```r
renv::install("X")
renv::snapshot()
```

Then commit the updated `renv.lock`.

## Everyday Git Workflow

If you're new to git, this is the loop you'll use most often:

```sh
git pull                     # get everyone else's latest changes
# ... make your edits ...
git add <files you changed>  # stage only the files you meant to change
git commit -m "describe what you changed"
git push
```

A few tips to avoid the most common mistakes:

- Run `git status` before `git add` so you know exactly what you're about to
  stage. Avoid `git add .` unless you've checked the status output first --
  it's easy to accidentally commit data exports, `.Rhistory`, or other files
  that shouldn't be tracked.
- Pull before you push. If `git push` is rejected, run `git pull` first to
  merge in the latest changes, resolve any conflicts, then push again.
- The `.gitignore` in this repo already excludes common problem files
  (R history/session files, the local `renv` package library, Quarto's
  render cache, `.DS_Store`, etc.), so most accidental commits are prevented
  automatically -- but it's still worth checking `git status`.
- If you're ever unsure whether something should be committed, ask in the
  group chat before force-pushing or resetting anything.
