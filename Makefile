DOTFILES_EXCLUDES := .DS_Store .git .gitmodules .travis.yml
DOTFILES_TARGET   := $(wildcard .??*) bin
DOTFILES_DIR      := $(PWD)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))

all:

list:
	@echo $(DOTFILES_FILES)
deploy:
	@$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
init:
	@$(foreach val, $(wildcard ./etc/init/*.sh), bash $(val);)
