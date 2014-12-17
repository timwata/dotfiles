DOT_FILES = zshrc vimrc vim screenrc ghci

.PHONY : all clean submodule vim

all   : $(foreach f, $(DOT_FILES), link-dot-file-$(f)) submodule vim 
clean : $(foreach f, $(DOT_FILES), unlink-dot-file-$(f))

submodule:
	git submodule init
	git submodule update

vim:
	vim -c NeoBundleInstall -c q

link-dot-file-% : %
	@echo "Create Symlink : $(HOME)/.$<"
	@ln -snf $(CURDIR)/$< $(HOME)/.$<

unlink-dot-file-% : %
	@echo "Remove Symlink $(HOME)/.$<"
	@$(RM) -f $(HOME)/.$<
