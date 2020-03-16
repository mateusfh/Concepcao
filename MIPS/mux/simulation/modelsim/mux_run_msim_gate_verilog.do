transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {mux.vo}

vlog -sv -work work +incdir+C:/Users/julio/Programacao/Concepcao/MIPS/mux/Testbench {C:/Users/julio/Programacao/Concepcao/MIPS/mux/Testbench/mux_tb.sv}

vsim -t 1ps +transport_int_delays +transport_path_delays -L cycloneii_ver -L gate_work -L work -voptargs="+acc" mux_tb

add wave *
view structure
view signals
run -all
