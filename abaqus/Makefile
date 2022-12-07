
all: ../../abaqusMacros.py

../../abaqusMacros.py: abaqusMacros.py
	if [ -f  $@ ]; then  rm $@; fi
	ln $< $@

# mklink /H $@ $<


.PHONY: all

