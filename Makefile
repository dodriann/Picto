# --- Automatische Suche nach devkitPro ---
# Standardpfade prüfen
DEVKITPRO ?= /usr/local/devkitPro
ifeq ("$(wildcard $(DEVKITPRO)/3ds_rules)","")
  DEVKITPRO := /opt/devkitpro
endif
ifeq ("$(wildcard $(DEVKITPRO)/3ds_rules)","")
  DEVKITPRO := /opt/devkitPro
endif
ifeq ("$(wildcard $(DEVKITPRO)/devkitARM/3ds_rules)","")
  DEVKITPRO := $(shell dirname $(shell find / -type f -name 3ds_rules 2>/dev/null | head -n 1))
endif

# Wenn alles fehlschlägt: Fehler
ifeq ("$(wildcard $(DEVKITPRO)/3ds_rules)","")
  $(warning ⚠ 3ds_rules nicht automatisch gefunden. Suche manuell...)
  $(shell find / -maxdepth 4 -name 3ds_rules 2>/dev/null)
  $(error ❌ Konnte 3ds_rules nicht finden. Bitte DEVKITPRO setzen oder 3ds-dev installieren.)
endif

include $(DEVKITPRO)/3ds_rules
# --- Ende Automatik ---

TARGET := my3dsapp
BUILD   := build
SOURCES := source
INCLUDES:= include
LIBS    := -lctru -lm

.PHONY: all clean

all: $(TARGET).3dsx

clean:
	@$(RM) -r $(BUILD) $(TARGET).3dsx $(TARGET).smdh
