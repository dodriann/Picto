# --- DEVKITPRO automatisch finden ---
# 1) Standard im GitHub-Container
DEVKITPRO ?= /usr/local/devkitPro
# 2) Häufige Alternativen
ifeq ("$(wildcard $(DEVKITPRO)/3ds_rules)","")
  DEVKITPRO := /opt/devkitpro
endif
ifeq ("$(wildcard $(DEVKITPRO)/3ds_rules)","")
  DEVKITPRO := /opt/devkitPro
endif

# 3) Letzter Versuch: von der Umgebung übernehmen (falls gesetzt)
ifneq ("$(origin DEVKITPRO)","undefined")
  # nichts
endif

# 4) Harte Fehlermeldung, falls 3ds_rules nirgends liegt
ifeq ("$(wildcard $(DEVKITPRO)/3ds_rules)","")
  $(error Konnte 3ds_rules nicht finden. Bitte DEVKITPRO setzen oder 3ds-dev installieren.)
endif

include $(DEVKITPRO)/3ds_rules
# --- Ende Auto-Detection ---
include $(DEVKITPRO)/3ds_rules

TARGET := my3dsapp
BUILD   := build
SOURCES := source
INCLUDES:= include
LIBS := -lctru -lm

.PHONY: all
all: $(TARGET).3dsx

clean:
	@$(RM) -r $(BUILD) $(TARGET).3dsx $(TARGET).smdh
