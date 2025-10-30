# Automatisch DEVKITPRO finden (funktioniert auch in GitHub Actions)
DEVKITPRO ?= /usr/local/devkitPro
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
