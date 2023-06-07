# Project properties
PROJECT=vera-c-template
SRCDIRS=./src
INCDIRS=./src/vendor
TARGET=./target
BINARY=$(TARGET)/$(PROJECT)

CC=gcc
OPT=-O0
# generate files that encode make rules for the .h dependencies
DEPFLAGS=-MP -MD
CFLAGS=-Wall -g $(foreach D,$(INCDIRS),-I$(D)) $(OPT) $(DEPFLAGS)

CFILES=$(foreach D,$(SRCDIRS),$(wildcard $(D)/*.c))
OBJECTS=$(patsubst %.c,%.o,$(subst ./src,$(TARGET)/src,$(CFILES)))
DEPFILES=$(patsubst %.c,%.d,$(subst ./src,$(TARGET)/src,$(CFILES)))

all: $(BINARY) ; @./$(BINARY)

build: $(BINARY)

init:
	@mkdir target target/src
	@rm README.md
	@git remote remove origin

$(BINARY): $(OBJECTS)
	$(CC) -o $@ $^

# only want the .c file dependency here, thus $< instead of $^.
$(TARGET)/%.o:%.c
	$(CC) $(CFLAGS) -c -o $@ $<

.PHONY : clean
clean:
	rm -rf $(BINARY) $(OBJECTS) $(DEPFILES)

# include the dependencies
-include $(DEPFILES)
