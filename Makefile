DOT_FILES = zshrc vimrc vim screenrc ghci gitconfig gitignore antigen gitconfig_local local.zsh peco vagrant.d

.PHONY : all centos7 clean 

all: gitconfig_local local.zsh  $(foreach f, $(DOT_FILES), link-dot-file-$(f)) 
	git submodule init
	git submodule update

centos7:
	sudo yum install -y epel-release 
	sudo yum install -y the_silver_searcher

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
