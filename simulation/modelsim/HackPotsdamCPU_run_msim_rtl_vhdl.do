transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/ulab/Documents/HackPotsdam/SevSegDisplay.vhd}
vcom -93 -work work {C:/Users/ulab/Documents/HackPotsdam/ALU_Control.vhd}
vcom -93 -work work {C:/Users/ulab/Documents/HackPotsdam/DE2_Wrapper_UnMod.vhd}

