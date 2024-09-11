set_property IOSTANDARD LVCMOS33 [get_ports sys_clock]

set_input_delay -clock [get_clocks sys_clock] 0.1 [get_ports InData[*]]
set_input_delay -clock [get_clocks sys_clock] 0.1 [get_ports n[*]]
set_output_delay -clock [get_clocks sys_clock] 0.1 [get_ports Flag]
set_output_delay -clock [get_clocks sys_clock] 0.1 [get_ports OutData[*]]

#Pmod Header JA (XADC)
set_property -dict { PACKAGE_PIN N15   IOSTANDARD LVCMOS33 } [get_ports { InData[0] }]; #IO_L21P_T3_DQS_AD14P_35 Sch=JA1_R_p
set_property -dict { PACKAGE_PIN L14   IOSTANDARD LVCMOS33 } [get_ports { InData[1] }]; #IO_L22P_T3_AD7P_35 Sch=JA2_R_P
set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports { InData[2] }]; #IO_L24P_T3_AD15P_35 Sch=JA3_R_P
set_property -dict { PACKAGE_PIN K14   IOSTANDARD LVCMOS33 } [get_ports { InData[3] }]; #IO_L20P_T3_AD6P_35 Sch=JA4_R_P
set_property -dict { PACKAGE_PIN N16   IOSTANDARD LVCMOS33 } [get_ports { InData[4] }]; #IO_L21N_T3_DQS_AD14N_35 Sch=JA1_R_N
set_property -dict { PACKAGE_PIN L15   IOSTANDARD LVCMOS33 } [get_ports { InData[5] }]; #IO_L22N_T3_AD7N_35 Sch=JA2_R_N
set_property -dict { PACKAGE_PIN J16   IOSTANDARD LVCMOS33 } [get_ports { InData[6] }]; #IO_L24N_T3_AD15N_35 Sch=JA3_R_N
set_property -dict { PACKAGE_PIN J14   IOSTANDARD LVCMOS33 } [get_ports { InData[7] }]; #IO_L20N_T3_AD6N_35 Sch=JA4_R_N


#Pmod Header JB
set_property -dict { PACKAGE_PIN T20   IOSTANDARD LVCMOS33 } [get_ports { OutData[0] }]; #IO_L15P_T2_DQS_34 Sch=JB1_p
set_property -dict { PACKAGE_PIN U20   IOSTANDARD LVCMOS33 } [get_ports { OutData[1] }]; #IO_L15N_T2_DQS_34 Sch=JB1_N
set_property -dict { PACKAGE_PIN V20   IOSTANDARD LVCMOS33 } [get_ports { OutData[2] }]; #IO_L16P_T2_34 Sch=JB2_P
set_property -dict { PACKAGE_PIN W20   IOSTANDARD LVCMOS33 } [get_ports { OutData[3] }]; #IO_L16N_T2_34 Sch=JB2_N
set_property -dict { PACKAGE_PIN Y18   IOSTANDARD LVCMOS33 } [get_ports { OutData[4] }]; #IO_L17P_T2_34 Sch=JB3_P
set_property -dict { PACKAGE_PIN Y19   IOSTANDARD LVCMOS33 } [get_ports { OutData[5] }]; #IO_L17N_T2_34 Sch=JB3_N
set_property -dict { PACKAGE_PIN W18   IOSTANDARD LVCMOS33 } [get_ports { OutData[6] }]; #IO_L22P_T3_34 Sch=JB4_P
set_property -dict { PACKAGE_PIN W19   IOSTANDARD LVCMOS33 } [get_ports { OutData[7] }]; #IO_L22N_T3_34 Sch=JB4_N


#Pmod Header JC
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { n[0] }]; #IO_L10P_T1_34 Sch=JC1_P
set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS33 } [get_ports { n[1] }]; #IO_L10N_T1_34 Sch=JC1_N
set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33 } [get_ports { n[2] }]; #IO_L1P_T0_34 Sch=JC2_P
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { n[3] }]; #IO_L1N_T0_34 Sch=JC2_N

set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports { Flag }]; #IO_L1N_T0_34 Sch=JC2_N
set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS33 } [get_ports { PRBSEq }]; #IO_L5N_T0_34 Sch=JD1_N