# ---- devkitPro Pfad festlegen (ohne Auto-Find, damit nichts doppelt wird) ----
DEVKITPRO ?= /c/devkitPro
# Fallbacks für lokale Windows-Installationen:
ifeq ($(wildcard $(DEVKITPRO)/3ds_rules),)
  DEVKITPRO := /opt/devkitpro
endif
ifeq ($(wildcard $(DEVKITPRO)/3ds_rules),)
  DEVKITPRO := /usr/local/devkitPro
endif

# Harte Prüfung (hilfreiche Meldung statt kryptischem Fehler)
ifeq ($(wildcard $(DEVKITPRO)/3ds_rules),)
  $(error Konnte $(DEVKITPRO)/3ds_rules nicht finden. Setze DEVKITPRO korrekt.)
endif

include $(DEVKITPRO)/3ds_rules
# ---- Ende Pfad-Setup ----

TARGET  := my3dsapp
BUILD   := build
SOURCES := source
INCLUDES:= include
LIBS    := -lctru -lm

.PHONY: all clean
all: $(TARGET).3dsx

clean:
	@$(RM) -r $(BUILD) $(TARGET).3dsx $(TARGET).smdh
