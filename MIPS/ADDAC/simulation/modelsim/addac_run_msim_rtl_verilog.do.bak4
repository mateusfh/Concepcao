transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/julio/Programacao/Concepcao/MIPS/ADDAC/flopenr {C:/Users/julio/Programacao/Concepcao/MIPS/ADDAC/flopenr/flopenr.sv}
vlog -sv -work work +incdir+C:/Users/julio/Programacao/Concepcao/MIPS/ADDAC/mux2 {C:/Users/julio/Programacao/Concepcao/MIPS/ADDAC/mux2/mux2.sv}
vlog -sv -work work +incdir+C:/Users/julio/Programacao/Concepcao/MIPS/ADDAC/inv {C:/Users/julio/Programacao/Concepcao/MIPS/ADDAC/inv/inv.sv}
vlog -sv -work work +incdir+C:/Users/julio/Programacao/Concepcao/MIPS/ADDAC/somador {C:/Users/julio/Programacao/Concepcao/MIPS/ADDAC/somador/somador.sv}
vlog -sv -work work +incdir+C:/Users/julio/Programacao/Concepcao/MIPS/ADDAC {C:/Users/julio/Programacao/Concepcao/MIPS/ADDAC/addac.sv}

vlog -sv -work work +incdir+C:/Users/julio/Programacao/Concepcao/MIPS/ADDAC/Testbench {C:/Users/julio/Programacao/Concepcao/MIPS/ADDAC/Testbench/addac_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc" addac_tb

add wave *
view structure
view signals
run -all
