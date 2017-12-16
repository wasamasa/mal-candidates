.PHONY: all clean

CURL = curl -sO
POLYML = ./polybuild
MLTON = mlton

SMLC = $(if $(filter polyml,$(sml_MODE)),$(POLYML),\
       $(if $(filter mlton,$(sml_MODE)),$(MLTON),\
       $(error unknown sml_MODE $(sml_MODE))))

all: polybuild test

polybuild: smlbuild-include.sh
	$(CURL) https://raw.githubusercontent.com/cannam/sml-buildscripts/master/polybuild
	chmod +x polybuild

smlbuild-include.sh:
	$(CURL) https://raw.githubusercontent.com/cannam/sml-buildscripts/master/smlbuild-include.sh

test: test.mlb test.sml util.sml
	$(SMLC) $<

clean:
	$(RM) polybuild smlbuild-include.sh test
