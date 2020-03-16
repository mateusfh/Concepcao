transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/julio/Programacao/Concepcao/MIPS/Decoder/Decodificador {C:/Users/julio/Programacao/Concepcao/MIPS/Decoder/Decodificador/decoder.sv}
vlog -sv -work work +incdir+C:/Users/julio/Programacao/Concepcao/MIPS/flopenr {C:/Users/julio/Programacao/Concepcao/MIPS/flopenr/flopenr.sv}
vlog -sv -work work +incdir+C:/Users/julio/Programacao/Concepcao/MIPS/mux {C:/Users/julio/Programacao/Concepcao/MIPS/mux/mux.sv}
vlog -sv -work work +incdir+C:/Users/julio/Programacao/Concepcao/MIPS/BankRegister {C:/Users/julio/Programacao/Concepcao/MIPS/BankRegister/BankRegister.sv}

