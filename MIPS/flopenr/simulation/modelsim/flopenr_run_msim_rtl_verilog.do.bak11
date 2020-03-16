transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/julio/Programacao/Concepcao/MIPS/flopenr {C:/Users/julio/Programacao/Concepcao/MIPS/flopenr/flopenr.sv}

vlog -sv -work work +incdir+C:/Users/julio/Programacao/Concepcao/MIPS/flopenr/TestBench {C:/Users/julio/Programacao/Concepcao/MIPS/flopenr/TestBench/flopenr_rb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc" flopenr_rb

add wave *
view structure
view signals
run -all
