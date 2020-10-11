
SRCDIR =  $(ROOTDIR)/SRC
TESTDIR = .
OBJDIR = obj
TESTAPPNAME = $(APPNAME)_Test

ALLSRC = $(wildcard $(SRCDIR)/*$(EXT))  \
			$(wildcard $(TESTDIR)/*$(EXT))  #添加src查找目录

SRC = $(filter-out $(SRCDIR)/main.cpp, $(ALLSRC)) #删除main.cpp
SRCFILE= $(notdir $(SRC)) 
OBJ = $(SRCFILE:%$(EXT)=$(OBJDIR)/%.o)
DEP = $(OBJ:$(OBJDIR)/%.o=$(OBJDIR)/%.d)

WDELOBJ = $(subst /,\,$(OBJ))
WDELDEP = $(subst /,\,$(DEP))
WDELAPP = $(subst /,\, $(OUTPUTDIR)/$(TESTAPPNAME).exe)

$(SHOW):
	@echo --------------$(APPNAME)_test:$(SHOW) Makefile-----------------------
	@echo this is in test Makefile
	@echo srcdir=$(SRCDIR)/%$(EXT)
	@echo root = $(SRCDIR)
	@echo SRC = $(SRC)
	@echo test = $(TESTDIR)/%$(EXT)


$(BUILD): $(TESTAPPNAME)  
$(TESTAPPNAME): $(OBJ)
	$(CC) $(CXXFLAGS) -o $(OUTPUTDIR)/$@ $^ $(LDFLAGS)

# Creates the dependecy rules
$(OBJDIR)/%.d: $(wildcard $(SRC)) 
	@$(CC) $(CFLAGS)  -I $(INCDIR) $< -MM -MT $(@:%.d=%.o) > $@

# Includes all .h files
-include $(DEP)

# Building rule for .o files and its .c/.cpp in combination with all .h
$(OBJDIR)/%.o: $(SRCDIR)/%$(EXT)
	$(CC) $(CXXFLAGS)  -I $(INCDIR) -o $@ -c $<	

$(OBJDIR)/%.o: $(TESTDIR)/%$(EXT)
	$(CC) $(CXXFLAGS)  -I $(INCDIR) -o $@ -c $<	


$(CLEANW):   
	@echo -----in test clean
	$(DEL) $(WDELOBJ) $(WDELDEP) 
	$(DEL) $(WDELAPP)	

$(CLEAN):   
	@echo -----in test clean
	$(DEL) $(OBJ) $(DEP) 
	$(DEL) $(OUTPUTDIR)/$(TESTAPPNAME).exe


.PHONY: $(BUILD) $(SHOW)  $(CLEANW) $(CLEAN)


	
