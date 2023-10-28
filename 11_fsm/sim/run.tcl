#退出之前的仿真 
quit -sim 
#将之前保存的临时文件清除
.main clear
#创建work库
vlib work
#编译 tb文件，./指向当前目录
vlog ./tb_sim.v
#编译 tb文件，../指向上一级目录下的design的所有.v文件
vlog ./../design/*.v
#启动 仿真work库
vsim -voptargs=+acc work.tb_sim
# 创建结构体，abc是结构体名字
virtual type {
	{'b001 IDLE}
	{'b010 ONE}
	{'b100 TWO}
} abc;
# （abc）强制类型转换 new_state新名字
virtual function {(abc)/tb_sim/inst_fsm/state} new_state

add wave /tb_sim/inst_fsm/*

run 1us