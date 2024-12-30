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
1. zshrc:
     - Importante: Instalar zoxide y starship
     - historial compartido a traves de sesiones
     - manejo de comandos duplicados en historial
2. vimrc
3. gitconfig
4. alias
5. fzf.zsh
6. alacritty
7. vim cheat-sheet
8. bat
9. starship
10. eza
11. tldr
