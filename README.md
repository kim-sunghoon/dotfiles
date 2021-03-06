# Vicente's dotfiles [![Build Status](https://travis-ci.org/vicentebolea/dotfiles.svg?branch=master)](https://travis-ci.org/vicentebolea/dotfiles) [![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/vicentebolea/dotfiles?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

![Alt Text](https://raw.github.com/vicentebolea/dotfiles/master/screenshot.gif "My personal configuration for the Linux terminal with 256 colors")



## 1. Features:
 - Only depends on GIT
 - It was designed having in mind being forked so that you can freely modify it.
 - As well if you are not going to modify you can just download it.
 - BASH configuration with a cool prompt and a separated file structure to ease distributing your configuratiom accross different machines.
 - VIM configuration and selection of Plugins focussed in C/C++ development.
 - GDB configuration which support C++ standard library data strutures and more fancy things.
 - SCREEN & TMUX configuration to make it more fancy and to support 256 colors with vim.
 - GIT configuration with several shortcuts, extra tools and many colors.
 - Few extras such as fonts and dircolors.
 - More..

## 2. Install it
    
```sh
# First, make sure you have git installed, if not run the next command if you are in ubuntu:
$ sudo apt-get install git

# Then, clone the repository and install the dotfiles:
$ git clone --recursive https://github.com/kim-sunghoon/dotfiles.git .dotfiles \
    && cd .dotfiles && ./bin/dfm install && vim +PluginUpdate
```

## 3. Required Modules 

```sh
module load vim/8.1
module load anaconda 
```
or put these in your `.tcshrc` in your home directory.
 - *vim 8.1 is required for running YouCompleteMe Plugin.*
 - *vim 8.1 is not working RTL server in CSDL, works fine in other servers (CNN, HDL, etc.)*

## 4. Github Author  
Change `.gitconfig.local` in your home directory. 
The file should contain these lines, but change my name and email for yours:

```sh
[user]
    name = "YOUR GITHUB NAME"
    email = "YOUR GITHUB EMAIL"
```

## 5. YouCompleteMe - Auto Complete Module in Vim
 ```sh 
 cd ~/.vim/bundle/YouCompleteMe 
 python install.py --clang-completer  
 ```

For more info about autocomplete see this blog (https://johngrib.github.io/wiki/vim-auto-completion/)

## 6. Uninstall YouCompleteMe and other plugins
    
1. `open .vimrc` then press `z + r` to unfold markers
2. delete or commmet plugin load line like `Plugin 'Valloric/YouCompleteMe'`
3. save .vimrc and reload it (`:w` and `:so %` in command mode)
4. type `:PluginClean` in command mode!
- other options: `:PluginInstall` , `:PluginList`

## 7. How to update it
```sh
#It will destroy any change in those files, but not in .gitconfig.local. Go to dotfiles directory
$ cd ~/.dotfiles && git fetch --all && git reset --hard origin/master

# This will not delete the .gitconfig.local
```


## Authors
 - [Vicente Adolfo Bolea Sanchez][vicente].
 - modified by [Sunghoon Kim](https://github.com/kim-sunghoon)
## Thanks to
 - [DFM][dfm]:                    a.k.a Dot Files Manager, made possible having the dotfiles in a separated directory.
 - [mathiasbynens/dotfiles][mat]: Some of the ideas are taking from this repository.

<!-- Links -->
[dfm]:     https://github.com/justone/dfm
[mat]:     https://github.com/mathiasbynens/dotfiles
[vicente]: https://github.com/vicentebolea
[dicl]:    http://dicl.unist.ac.kr
[conv]:    https://github.com/vicentebolea/dotfiles/issues/3
