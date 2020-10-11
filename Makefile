
# Compiler settings
export CC = g++
export CXXFLAGS=$(CFLAG)
CXXFLAGS += -std=c++11 -O -Wall -g
export LDFLAGS = 

# Makefile settings
export APPNAME = mytest
export EXT = .cpp
export ROOTDIR =  $(CURDIR)
export INCDIR = $(CURDIR)/include
export OUTPUTDIR = $(CURDIR)/out

#test exclude main
export EXCLUDEFILE = main.c

export SHOW = show
export BUILD = build 
export TEST = test


TESTDIR = $(TEST)
SRCDIR = src

# Windows CMD Powershell variables & settings
export DEL = rm
export CLEAN = clean

###############################################################################
$(SHOW):	 

	@echo --------------$(APPNAME):$(SHOW) Makefile-----------------------	 
	@echo CC = $(CC)
	@echo APPNAME = $(APPNAME)
	@echo OSFLAGS = $(OSFLAGS)
	@echo UNAME = $(UNAME) 
	@echo DEL = $(DEL)
	@echo CLEAN = $(CLEAN)
#$(MAKE) $(SHOW) -C $(SRCDIR) 

$(TEST):	
	$(MAKE) $(BUILD) -C $(TESTDIR)

$(BUILD):	
	$(MAKE) $(BUILD) -C $(SRCDIR)

$(CLEAN):
	@echo --------------$(CLEAN) Makefile-----------------------	
	-$(MAKE) $(CLEAN) -C $(SRCDIR)
	-$(MAKE) $(CLEAN) -C $(TESTDIR)

all:
	-$(MAKE) $(BUILD) -C $(TESTDIR)
	-$(MAKE) $(BUILD) -C $(SRCDIR)

 .PHONY: $(SHOW) $(TESTDIR) $(CLEAN) all

#ÅÐ¶Ï²Ù×÷ÏµÍ³
# ifeq ($(OS),Windows_NT)
#     OSFLAGS = WIN32
#     ifeq ($(PROCESSOR_ARCHITEW6432),AMD64)
#         OSFLAGS = AMD64
#     else
#         ifeq ($(PROCESSOR_ARCHITECTURE),AMD64)
#             OSFLAGS = AMD64
#         endif
#         ifeq ($(PROCESSOR_ARCHITECTURE),x86)
#             OSFLAGS = IA32
#         endif
#     endif
# else
#     UNAME_S := $(shell uname -s)
#     ifeq ($(UNAME_S),Linux)
#         OSFLAGS = LINUX
#     endif
#     ifeq ($(UNAME_S),Darwin)
#         OSFLAGS =  OSX
#     endif
#     UNAME_P := $(shell uname -p)
#     ifeq ($(UNAME_P),x86_64)
#         OSFLAGS =   AMD64
#     endif
#     ifneq ($(filter %86,$(UNAME_P)),)
#         OSFLAGS =  IA32
#     endif
#     ifneq ($(filter arm%,$(UNAME_P)),)
#         OSFLAGS =  ARM
#     endif
# endif