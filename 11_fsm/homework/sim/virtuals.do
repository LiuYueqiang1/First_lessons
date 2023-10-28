virtual type { \
{0x1 IDLE}\
{0x2 M05}\
{0x4 M1}\
{0x8 M105}\
{0x10 M2}\
} abc2
virtual type { \
{0x1 IDLE}\
{0x2 ONE}\
{0x4 TWO}\
} abc
virtual function -install /tb_fsm2/inst_fsm_2 -env /tb_fsm2 { (abc2)/tb_fsm2/inst_fsm_2/state} new_state2
