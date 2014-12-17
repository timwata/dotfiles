DOT_FILES = zshrc vimrc vim screenrc ghci gitconfig gitignore antigen rbenv

.PHONY : all clean submodule vim

all   : $(foreach f, $(DOT_FILES), link-dot-file-$(f)) 
	git submodule init
	git submodule update
	vim -c NeoBundleInstall -c y -c q

clean : $(foreach f, $(DOT_FILES), unlink-dot-file-$(f))

link-dot-file-% : %
	@echo "Create Symlink : $(HOME)/.$<"
	@ln -snf $(CURDIR)/$< $(HOME)/.$<

unlink-dot-file-% : %
	@echo "Remove Symlink $(HOME)/.$<"
	@$(RM) -f $(HOME)/.$<
