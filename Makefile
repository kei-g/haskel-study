GHC = ghc
GHCFLAGS = -O2 -dynamic -msse4.2
RM = rm -fr
TARGET_SOURCES = currying.hs factorize.hs graph.hs prime.hs prime2.hs sieve.hs test.hs xxx.hs zzz.hs
TARGET_INTERFACES = $(TARGET_SOURCES:%.hs=%.hi)
TARGET_OBJECTS = $(TARGET_SOURCES:%.hs=%.o)
TARGET_BINARIES = $(TARGET_OBJECTS:%.o=%)

all: $(TARGET_BINARIES)

clean:
	$(RM) $(TARGET_BINARIES) $(TARGET_INTERFACES) $(TARGET_OBJECTS)

currying: currying.hs
	$(GHC) $(GHCFLAGS) -o $@ $^

factorize: factorize.hs
	$(GHC) $(GHCFLAGS) -o $@ $^

graph: graph.hs
	$(GHC) $(GHCFLAGS) -o $@ $^

prime: prime.hs
	$(GHC) $(GHCFLAGS) -o $@ $^

prime2: prime2.hs
	$(GHC) $(GHCFLAGS) -o $@ $^

sieve: sieve.hs
	$(GHC) $(GHCFLAGS) -o $@ $^

test: test.hs
	$(GHC) $(GHCFLAGS) -o $@ $^

xxx: xxx.hs
	$(GHC) $(GHCFLAGS) -o $@ $^

zzz: zzz.hs
	$(GHC) $(GHCFLAGS) -o $@ $^

.PHONY: clean
