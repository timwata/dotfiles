DOT_FILES = zshrc vimrc vim screenrc Xresources

.PHONY : clean

all   : $(foreach f, $(DOT_FILES), link-dot-file-$(f))
clean : $(foreach f, $(DOT_FILES), unlink-dot-file-$(f))

link-dot-file-% : %
	@echo "Create Symlink : $(HOME)/.$<"
	@ln -snf $(CURDIR)/$< $(HOME)/.$<

unlink-dot-file-% : %
	@echo "Remove Symlink $(HOME)/.$<"
	@$(RM) -f $(HOME)/.$<
