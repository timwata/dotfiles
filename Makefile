DOT_FILES = zshrc vimrc vim screenrc ghci gitconfig gitignore antigen gitconfig_local local.zsh peco

.PHONY : all clean submodule vim

all: gitconfig_local local.zsh  $(foreach f, $(DOT_FILES), link-dot-file-$(f)) 
	git submodule init
	git submodule update

gitconfig_local:
	touch gitconfig_local

local.zsh:
	touch local.zsh

clean: $(foreach f, $(DOT_FILES), unlink-dot-file-$(f))

link-dot-file-%: %
	@echo "Create Symlink : $(HOME)/.$<"
	@ln -snf $(CURDIR)/$< $(HOME)/.$<

unlink-dot-file-%: %
	@echo "Remove Symlink $(HOME)/.$<"
	@$(RM) -f $(HOME)/.$<
