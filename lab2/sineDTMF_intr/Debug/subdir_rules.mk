################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
Vectors_intr.obj: ../Vectors_intr.asm $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"c:/ti/ccsv6/tools/compiler/c6000_7.4.12/bin/cl6x" -mv6710 --abi=coffabi -g --include_path="C:/ti/ccsv6/tools/compiler/c6000_7.4.12/include" --include_path="C:/ti/CCStudio/c6000/dsk6713/include" --include_path="C:/ti/C6xCSL/include" --define="CHIP_6713" --display_error_number --diag_wrap=off --mem_model:data=far --preproc_with_compile --preproc_dependency="Vectors_intr.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

c6713dskinit.obj: ../c6713dskinit.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"c:/ti/ccsv6/tools/compiler/c6000_7.4.12/bin/cl6x" -mv6710 --abi=coffabi -g --include_path="C:/ti/ccsv6/tools/compiler/c6000_7.4.12/include" --include_path="C:/ti/CCStudio/c6000/dsk6713/include" --include_path="C:/ti/C6xCSL/include" --define="CHIP_6713" --display_error_number --diag_wrap=off --mem_model:data=far --preproc_with_compile --preproc_dependency="c6713dskinit.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

sinedtmf_intr.obj: ../sinedtmf_intr.c $(GEN_OPTS) $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"c:/ti/ccsv6/tools/compiler/c6000_7.4.12/bin/cl6x" -mv6710 --abi=coffabi -g --include_path="C:/ti/ccsv6/tools/compiler/c6000_7.4.12/include" --include_path="C:/ti/CCStudio/c6000/dsk6713/include" --include_path="C:/ti/C6xCSL/include" --define="CHIP_6713" --display_error_number --diag_wrap=off --mem_model:data=far --preproc_with_compile --preproc_dependency="sinedtmf_intr.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

