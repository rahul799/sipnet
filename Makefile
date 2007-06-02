CC=gcc
LD=gcc
CFLAGS=-Wall
LIBLINKS=-lm

ESTIMATE_CFILES=sipnet.c ml-metro5.c ml-metrorun.c paramchange.c runmean.c util.c spatialParams.c namelistInput.c
ESTIMATE_OFILES=$(ESTIMATE_CFILES:.c=.o)

SENSTEST_CFILES=sipnet.c sensTest.c paramchange.c runmean.c util.c spatialParams.c namelistInput.c
SENSTEST_OFILES=$(SENSTEST_CFILES:.c=.o)

SENSTESTFULL_CFILES=sipnet.c sensTestFull.c paramchange.c runmean.c util.c spatialParams.c namelistInput.c
SENSTESTFULL_OFILES=$(SENSTESTFULL_CFILES:.c=.o)

SIPNET_CFILES=sipnet.c frontend.c runmean.c util.c spatialParams.c namelistInput.c
SIPNET_OFILES=$(SIPNET_CFILES:.c=.o)

SIPNETGIRDLE_CFILES=sipnetGirdle.c frontendGirdle.c runmean.c util.c spatialParams.c namelistInput.c
SIPNETGIRDLE_OFILES=$(SIPNETGIRDLE_CFILES:.c=.o)

MAKE_SPATIAL_INPUTS_CFILES=makeSpatialInputs.c util.c namelistInput.c
MAKE_SPATIAL_INPUTS_OFILES=$(MAKE_SPATIAL_INPUTS_CFILES:.c=.o)


all: estimate sensTest sensTestFull sipnet sipnetGirdle makeSpatialInputs

estimate: $(ESTIMATE_OFILES)
	$(LD) $(LIBLINKS) -o estimate $(ESTIMATE_OFILES)

sensTest: $(SENSTEST_OFILES)
	$(LD) $(LIBLINKS) -o sensTest $(SENSTEST_OFILES)

sensTestFull: $(SENSTESTFULL_OFILES)
	$(LD) $(LIBLINKS) -o sensTestFull $(SENSTESTFULL_OFILES)

sipnet: $(SIPNET_OFILES)
	$(LD) $(LIBLINKS) -o sipnet $(SIPNET_OFILES)

sipnetGirdle: $(SIPNETGIRDLE_OFILES)
	$(LD) $(LIBLINKS) -o sipnetGirdle $(SIPNETGIRDLE_OFILES)

makeSpatialInputs: $(MAKE_SPATIAL_INPUTS_OFILES)
	$(LD) $(LIBLINKS) -o makeSpatialInputs $(MAKE_SPATIAL_INPUTS_OFILES)

clean:
	rm -f $(ESTIMATE_OFILES) $(SENSTEST_OFILES) $(SENSTESTFULL_OFILES) $(SIPNET_OFILES) $(SIPNETGIRDLE_OFILES) $(MAKE_SPATIAL_INPUTS_OFILES) estimate sensTest sensTestFull sipnet sipnetGirdle makeSpatialInputs

#This target automatically builds dependencies.
depend::
	makedepend $(CFILES)

# DO NOT DELETE THIS LINE -- make depend depends on it.

