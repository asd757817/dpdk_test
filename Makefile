#
# Run 'make -f Makefile.dpdk' to compile the DPDK examples
#
# See http://core.dpdk.org/doc/quick-start/ for DPDK installation and setup
#
ifeq ($(RTE_SDK),)
	#$(error "Please define RTE_SDK environment variable")
	RTE_SDK = $(HOME)/DPDK
	RTE_TARGET = build
endif

# Default target, can be overridden by command line or environment
RTE_TARGET ?= x86_64-native-linuxapp-gcc

include $(RTE_SDK)/mk/rte.vars.mk

APP = test
LIBNDPI = $(nDPI_src)/src/lib/libndpi.a

SRCS-y := test.c reader_util.c

CFLAGS += -g
CFLAGS += -Wno-strict-prototypes -Wno-missing-prototypes -Wno-missing-declarations -Wno-unused-parameter -I $(nDPI_src)/src/include -g -O2 -DUSE_DPDK
LDLIBS = $(LIBNDPI) -lpcap -lpthread 

include $(RTE_SDK)/mk/rte.extapp.mk
