# ---- devkitPro Pfade (support Windows & Linux) ----
DEVKITPRO ?= /opt/devkitpro          # GitHub-Container (Linux)
DEVKITARM  ?= $(DEVKITPRO)/devkitARM

# Windows/MSYS2-Fallbacks
ifeq ($(wildcard $(DEVKITPRO)/3ds_rules),)
  DEVKITPRO := /c/devkitPro
  DEVKITARM := $(DEVKITPRO)/devkitARM
endif
ifeq ($(wildcard $(DEVKITPRO)/3ds_rules),)
  DEVKITPRO := /C:/devkitPro         # falls MSYS so mountet
  DEVKITARM := $(DEVKITPRO)/devkitARM
endif

# 3ds_rules einbinden (erst Wurzel, dann unter devkitARM)
ifneq ($(wildcard $(DEVKITPRO)/3ds_rules),)
  include $(DEVKITPRO)/3ds_rules
else ifneq ($(wildcard $(DEVKITARM)/3ds_rules),)
  include $(DEVKITARM)/3ds_rules
else
  $(error Konnte 3ds_rules nicht finden. Erwartet unter $(DEVKITPRO)/3ds_rules oder $(DEVKITARM)/3ds_rules)
endif
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
