set projDir "H:/Documents/TestCases_v2/work/planAhead"
set projName "TestCases"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "H:/Documents/TestCases_v2/work/verilog/mojo_top_0.v" "H:/Documents/TestCases_v2/work/verilog/xalu_1.v" "H:/Documents/TestCases_v2/work/verilog/reset_conditioner_2.v" "H:/Documents/TestCases_v2/work/verilog/edge_detector_3.v" "H:/Documents/TestCases_v2/work/verilog/multi_seven_seg_4.v" "H:/Documents/TestCases_v2/work/verilog/multi_dec_ctr_5.v" "H:/Documents/TestCases_v2/work/verilog/counter_6.v" "H:/Documents/TestCases_v2/work/verilog/stateCounter_7.v" "H:/Documents/TestCases_v2/work/verilog/xshifter_8.v" "H:/Documents/TestCases_v2/work/verilog/xadder_9.v" "H:/Documents/TestCases_v2/work/verilog/xboole_10.v" "H:/Documents/TestCases_v2/work/verilog/xcompare_11.v" "H:/Documents/TestCases_v2/work/verilog/counter_12.v" "H:/Documents/TestCases_v2/work/verilog/seven_seg_13.v" "H:/Documents/TestCases_v2/work/verilog/decoder_14.v" "H:/Documents/TestCases_v2/work/verilog/dec_ctr_15.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "H:/Documents/TestCases_v2/constraint/own.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
