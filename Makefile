INSTALL_DIR := $(PWD)/rpkgs
BIN_DIR     := bin
DATA_DIR    := data
MKDIR       := mkdir -p
RM          := rm -rf

.PHONY: installpkgs clean cleanpkgs

Rplots.pdf: export R_LIBS = $(INSTALL_DIR)
Rplots.pdf: $(BIN_DIR)/analysis.r
	export R_LIBS=$(INSTALL_DIR)
	$(BIN_DIR)/analysis.r

installpkgs: export R_LIBS = $(INSTALL_DIR)
installpkgs:
	@echo "Installing R pkgs into: " $(R_LIBS)
	test -d $(R_LIBS) || $(MKDIR) $(R_LIBS)
	CPPFLAGS="-I /opt/X11/include" Rscript $(BIN_DIR)/install-pkgs.r

clean: $(INSTALL_DIR)
	$(RM) Rplots.pdf

cleanpkgs:
	$(RM) $(INSTALL_DIR)
