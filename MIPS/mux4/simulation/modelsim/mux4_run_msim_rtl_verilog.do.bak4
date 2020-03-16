transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/julio/Programacao/Concepcao/MIPS/mux {C:/Users/julio/Programacao/Concepcao/MIPS/mux/mux2.sv}
vlog -sv -work work +incdir+C:/Users/julio/Programacao/Concepcao/MIPS/mux {C:/Users/julio/Programacao/Concepcao/MIPS/mux/mux4.sv}

vlog -sv -work work +incdir+C:/Users/julio/Programacao/Concepcao/MIPS/mux41/Testbench {C:/Users/julio/Programacao/Concepcao/MIPS/mux41/Testbench/mux4_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc" mux4_tb

add wave *
view structure
view signals
run -all
