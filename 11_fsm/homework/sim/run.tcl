#退出之前的仿真 
quit -sim 
#将之前保存的临时文件清除
.main clear
#创建work库
vlib work
#编译 tb文件，./指向当前目录
vlog ./tb_fsm2.v
#编译 tb文件，../指向上一级目录下的design的所有.v文件
vlog ./../design/*.v
#启动 仿真work库
vsim -voptargs=+acc work.tb_fsm2
# 创建结构体，abc是结构体名字
virtual type {
	{'b00001 IDLE}
	{'b00010 M05}
	{'b00100 M1}
	{'b01000 M105}
	{'b10000 M2}
} abc2;
# （abc）强制类型转换 new_state新名字
virtual function {(abc2)/tb_fsm2/inst_fsm_2/state} new_state2

add wave /tb_fsm2/inst_fsm_2/*

run 1us