DOTFILES_EXCLUDES := .DS_Store .git .gitmodules .travis.yml .config
DOTFILES_TARGET   := $(wildcard .??*) bin
DOTFILES_DIR      := $(PWD)
DOTCONFIG_TARGET  := $(wildcard .config/*)
DOTCONFIG_FILES   := $(filter-out .DS_Store, $(DOTCONFIG_TARGET))
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET)) $(DOTCONFIG_FILES)

all:
	@echo $(DOTFILES_FILES)
deploy:
	@$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
init:
	@$(foreach val, $(wildcard ./etc/init/*.sh), bash $(val);)
