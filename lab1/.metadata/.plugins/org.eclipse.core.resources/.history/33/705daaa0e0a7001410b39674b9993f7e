################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

CG_TOOL_ROOT := c:/ti/ccsv6/tools/compiler/c6000_7.4.12

ORDERED_OBJS += \
$(GEN_CMDS__FLAG) \
"C:/Users/cdaffron/Downloads/C6713/C6713/Support/C6713dsk.cmd" \
"./Sine8_LED.obj" \
"./Vectors_poll.obj" \
"./c6713dskinit.obj" \
"../csl6713.lib" \
"../dsk6713bsl.lib" \
-l"rts6700.lib" \
-l"C:\ti\C6xCSL\lib_3x\csl6713.lib" \
-l"dsk6713bsl.lib" \
-l"csl6713.lib" \

-include ../makefile.init

RM := DEL /F
RMDIR := RMDIR /S/Q

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir_vars.mk
-include subdir_rules.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(S62_DEPS)),)
-include $(S62_DEPS)
endif
ifneq ($(strip $(C64_DEPS)),)
-include $(C64_DEPS)
endif
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(S55_DEPS)),)
-include $(S55_DEPS)
endif
ifneq ($(strip $(C67_DEPS)),)
-include $(C67_DEPS)
endif
ifneq ($(strip $(C??_DEPS)),)
-include $(C??_DEPS)
endif
ifneq ($(strip $(CLA_DEPS)),)
-include $(CLA_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(S??_DEPS)),)
-include $(S??_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(C62_DEPS)),)
-include $(C62_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(ASM_UPPER_DEPS)),)
-include $(ASM_UPPER_DEPS)
endif
ifneq ($(strip $(K_DEPS)),)
-include $(K_DEPS)
endif
ifneq ($(strip $(C43_DEPS)),)
-include $(C43_DEPS)
endif
ifneq ($(strip $(S67_DEPS)),)
-include $(S67_DEPS)
endif
ifneq ($(strip $(SA_DEPS)),)
-include $(SA_DEPS)
endif
ifneq ($(strip $(S43_DEPS)),)
-include $(S43_DEPS)
endif
ifneq ($(strip $(OPT_DEPS)),)
-include $(OPT_DEPS)
endif
ifneq ($(strip $(S64_DEPS)),)
-include $(S64_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
ifneq ($(strip $(C55_DEPS)),)
-include $(C55_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
EXE_OUTPUTS += \
sine8_LED.out \

EXE_OUTPUTS__QUOTED += \
"sine8_LED.out" \

BIN_OUTPUTS += \
sine8_LED.hex \

BIN_OUTPUTS__QUOTED += \
"sine8_LED.hex" \


# All Target
all: sine8_LED.out

# Tool invocations
sine8_LED.out: $(OBJS) $(CMD_SRCS) $(LIB_SRCS) $(GEN_CMDS)
	@echo 'Building target: $@'
	@echo 'Invoking: C6000 Linker'
	"c:/ti/ccsv6/tools/compiler/c6000_7.4.12/bin/cl6x" -mv6710 --abi=coffabi -g --define="CHIP_6713" --display_error_number --diag_wrap=off --mem_model:data=far -z --stack_size=0x1000 -m"sine8_LED.map" -i"c:/ti/ccsv6/tools/compiler/c6000_7.4.12/lib" -i"c:/ti/ccsv6/tools/compiler/c6000_7.4.12/include" -i"C:/Users/cdaffron/git/rtdsp/lab1/sine8_LED" -i"C:/Users/cdaffron/Downloads/C6713/C6713/sine8_LED" -i"/lib" -i"c:/CCStudio_v3.1/C6000/dsk6713/lib" --reread_libs --warn_sections --display_error_number --diag_wrap=off --xml_link_info="sine8_LED_linkInfo.xml" --rom_model -o "sine8_LED.out" $(ORDERED_OBJS)
	@echo 'Finished building target: $@'
	@echo ' '

sine8_LED.hex: $(EXE_OUTPUTS)
	@echo 'Invoking: C6000 Hex Utility'
	"c:/ti/ccsv6/tools/compiler/c6000_7.4.12/bin/hex6x"  -o "sine8_LED.hex" $(EXE_OUTPUTS__QUOTED)
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXE_OUTPUTS__QUOTED)$(BIN_OUTPUTS__QUOTED)
	-$(RM) "Sine8_LED.pp" "c6713dskinit.pp" 
	-$(RM) "Sine8_LED.obj" "Vectors_poll.obj" "c6713dskinit.obj" 
	-$(RM) "Vectors_poll.pp" 
	-@echo 'Finished clean'
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets

