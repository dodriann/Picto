# ---- devkitPro Pfad-Setup ----
DEVKITPRO ?= /opt/devkitpro
DEVKITARM  ?= $(DEVKITPRO)/devkitARM

# 3ds_rules einbinden (immer unter devkitARM)
ifeq ($(wildcard $(DEVKITARM)/3ds_rules),)
  $(error Konnte $(DEVKITARM)/3ds_rules nicht finden. Bitte devkitARM prüfen!)
endif

include $(DEVKITARM)/3ds_rules
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
