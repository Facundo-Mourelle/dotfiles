# mou-dotfiles

## Requirements

Asegurarse de tener instalado las siguientes aplicaciones:

### Git

```
pacman -S git
```

### Stow

```
pacman -S stow
```

## Installation

Primero, clonar el repo en carpeta $HOME
```
$ git clone git@github.com/dreamsofautonomy/dotfiles.git
$ cd dotfiles
```

Luego, usar stow para crear un link simbolico a los archivos

```
$ stow .
```
Lista de contenido:
- zshrc
- vimrc
- gitconfig
- alias
- fzf.zsh
- alacritty
- vim cheat-sheet
