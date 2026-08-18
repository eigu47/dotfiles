# dotfiles

Personal dotfiles, managed by GNU stow via `install.sh`.

Every top-level directory is a stow package, symlinked into `$HOME`.

## Usage

```sh
./install.sh
```

Prompts for each package and runs `stow -v -t $HOME <dir>`. Any arguments
are passed straight through to stow, so adopting existing configs is:

```sh
./install.sh --adopt
```

`--adopt` takes a conflicting file already in `$HOME` into the matching
package instead of failing on the symlink conflict.

## Per-package custom steps

`install.sh` also runs custom steps where defined:
- `bash`: appends a line to `~/.bashrc` that sources `~/.bashrc.local`
