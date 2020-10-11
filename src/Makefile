
SRCDIR =  .
OBJDIR = $(ROOTDIR)/obj


SRC = $(wildcard $(SRCDIR)/*$(EXT))  
SRCFILE= $(notdir $(SRC)) 
OBJ = $(SRCFILE:%$(EXT)=$(OBJDIR)/%.o)
DEP = $(OBJ:$(OBJDIR)/%.o=$(OBJDIR)/%.d)
DELAPP = $(OUTPUTDIR)/$(APPNAME).exe  

WDELOBJ = $(subst /,\,$(OBJ))
WDELDEP = $(subst /,\,$(DEP))
WDELAPP = $(subst /,\, $(OUTPUTDIR)/$(APPNAME).exe)

$(SHOW):
	@echo ++++++++++++++++$(APPNAME):src Makefile++++++++++++++
	@echo this is in src Makefile
	@echo OBJ=$(OBJ)
	@echo DEP = $(DEP)
	@echo DELAPP = $(DELAPP) 
	
$(BUILD): $(APPNAME)  
$(APPNAME): $(OBJ)
	$(CC) $(CXXFLAGS) -o $(OUTPUTDIR)/$@ $^ $(LDFLAGS)

# Creates the dependecy rules
$(OBJDIR)/%.d: $(wildcard $(SRC)) 
	@$(CC) $(CFLAGS)  -I $(INCDIR) $< -MM -MT $(@:%.d=%.o) > $@

# Includes all .h files
-include $(DEP)

# Building rule for .o files and its .c/.cpp in combination with all .h
$(OBJDIR)/%.o: $(SRCDIR)/%$(EXT)
	$(CC) $(CXXFLAGS)  -I $(INCDIR) -o $@ -c $<	

 
.PHONY: $(BUILD) $(SHOW) $(CLEANW)  $(CLEAN)

$(CLEANW):
	@echo -----------------
	@echo -----in src clean
	$(DEL) $(WDELOBJ) $(WDELDEP) $(WDELAPP)

$(CLEAN):   
	@echo -----in src clean
	$(DEL) $(OBJ) $(DEP) $(DELAPP) 
	
