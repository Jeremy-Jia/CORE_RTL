/*Copyright 2019-2021 T-Head Semiconductor Co., Ltd.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

// &ModuleBeg; @27
module ct_idu_ir_ctrl(
  aiq0_ctrl_entry_cnt_updt_val,
  aiq0_ctrl_entry_cnt_updt_vld,
  aiq1_ctrl_entry_cnt_updt_val,
  aiq1_ctrl_entry_cnt_updt_vld,
  cp0_idu_dlb_disable,
  cp0_idu_icg_en,
  cp0_idu_rob_fold_disable,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_dp_ir_inst0_vld,
  ctrl_fence_ir_pipe_empty,
  ctrl_id_pipedown_gateclk,
  ctrl_id_pipedown_inst0_vld,
  ctrl_id_pipedown_inst1_vld,
  ctrl_id_pipedown_inst2_vld,
  ctrl_id_pipedown_inst3_vld,
  ctrl_id_pipedown_inst4_vld,  //add uop4 vld signal //add by xlx
  ctrl_ir_pipedown,
  ctrl_ir_pipedown_gateclk,
  ctrl_ir_pipedown_inst0_vld,
  ctrl_ir_pipedown_inst1_vld,
  ctrl_ir_pipedown_inst2_vld,
  ctrl_ir_pipedown_inst3_vld,
  ctrl_ir_pipedown_inst4_vld,//add uop5 vld signal //add by xlx
  ctrl_ir_pre_dis_aiq0_create0_en,
  ctrl_ir_pre_dis_aiq0_create0_sel,
  ctrl_ir_pre_dis_aiq0_create1_en,
  ctrl_ir_pre_dis_aiq0_create1_sel,
  ctrl_ir_pre_dis_aiq1_create0_en,
  ctrl_ir_pre_dis_aiq1_create0_sel,
  ctrl_ir_pre_dis_aiq1_create1_en,
  ctrl_ir_pre_dis_aiq1_create1_sel,
  ctrl_ir_pre_dis_biq_create0_en,
  ctrl_ir_pre_dis_biq_create0_sel,
  ctrl_ir_pre_dis_biq_create1_en,
  ctrl_ir_pre_dis_biq_create1_sel,

  ctrl_ir_pre_dis_inst0_vld,
  ctrl_ir_pre_dis_inst1_vld,
  ctrl_ir_pre_dis_inst2_vld,
  ctrl_ir_pre_dis_inst3_vld,
  ctrl_ir_pre_dis_inst4_vld,//add inst4 pre dispatch signal //add by xlx

  ctrl_ir_pre_dis_lsiq_create0_en,
  ctrl_ir_pre_dis_lsiq_create0_sel,
  ctrl_ir_pre_dis_lsiq_create1_en,
  ctrl_ir_pre_dis_lsiq_create1_sel,
  ctrl_ir_pre_dis_pipedown2,//tudo
  ctrl_ir_pre_dis_pst_create1_iid_sel,
  ctrl_ir_pre_dis_pst_create2_iid_sel,
  ctrl_ir_pre_dis_pst_create3_iid_sel,
  ctrl_ir_pre_dis_pst_create4_iid_sel,//add new logic by xlx
  ctrl_ir_pre_dis_rob_create0_sel,
  ctrl_ir_pre_dis_rob_create1_en,
  ctrl_ir_pre_dis_rob_create1_sel,
  ctrl_ir_pre_dis_rob_create2_en,
  ctrl_ir_pre_dis_rob_create2_sel,
  ctrl_ir_pre_dis_rob_create3_en,
  ctrl_ir_pre_dis_rob_create3_sel,//add new signal by xlx

  ctrl_ir_pre_dis_rob_create4_en,
  ctrl_ir_pre_dis_rob_create4_sel,//add new signal by xlx

  ctrl_ir_pre_dis_sdiq_create0_en,
  ctrl_ir_pre_dis_sdiq_create0_sel,
  ctrl_ir_pre_dis_sdiq_create1_en,
  ctrl_ir_pre_dis_sdiq_create1_sel,
  ctrl_ir_pre_dis_viq0_create0_en,
  ctrl_ir_pre_dis_viq0_create0_sel,
  ctrl_ir_pre_dis_viq0_create1_en,
  ctrl_ir_pre_dis_viq0_create1_sel,
  ctrl_ir_pre_dis_viq1_create0_en,
  ctrl_ir_pre_dis_viq1_create0_sel,
  ctrl_ir_pre_dis_viq1_create1_en,
  ctrl_ir_pre_dis_viq1_create1_sel,
  ctrl_ir_pre_dis_vmb_create0_en,
  ctrl_ir_pre_dis_vmb_create0_sel,
  ctrl_ir_pre_dis_vmb_create1_en,
  ctrl_ir_pre_dis_vmb_create1_sel,

  ctrl_ir_stage_stall,
  ctrl_ir_stall,
  ctrl_ir_type_stall_inst2_vld,
  ctrl_ir_type_stall_inst3_vld,
//need  tudo
  
  ctrl_is_dis_type_stall,

  ctrl_is_inst2_vld,
  ctrl_is_inst3_vld,
  ctrl_is_inst4_vld,//add new logic byxlx
  ctrl_is_stall,
  ctrl_lsiq_ir_bar_inst_vld,
  ctrl_rt_inst0_vld,
  ctrl_rt_inst1_vld,
  ctrl_rt_inst2_vld,
  ctrl_rt_inst3_vld,
  ctrl_rt_inst4_vld,//add new logic by xlx

  ctrl_top_ir_ereg_not_vld,
  ctrl_top_ir_freg_not_vld,
  ctrl_top_ir_inst0_vld,
  ctrl_top_ir_inst1_vld,
  ctrl_top_ir_inst2_vld,
  ctrl_top_ir_inst3_vld,
  ctrl_top_ir_inst4_vld,//add new logic by xlx
  ctrl_top_ir_mispred_stall,
  ctrl_top_ir_preg_not_vld,
  ctrl_top_ir_vreg_not_vld,
  ctrl_xx_is_inst0_sel,
  ctrl_xx_is_inst_sel,
  dp_ctrl_ir_inst0_bar,
  dp_ctrl_ir_inst0_ctrl_info,
  dp_ctrl_ir_inst0_dst_vld,
  dp_ctrl_ir_inst0_dst_x0,
  dp_ctrl_ir_inst0_dste_vld,
  dp_ctrl_ir_inst0_dstf_vld,
  dp_ctrl_ir_inst0_dstv_vld,
  dp_ctrl_ir_inst0_hpcp_type,
  dp_ctrl_ir_inst1_bar,
  dp_ctrl_ir_inst1_ctrl_info,
  dp_ctrl_ir_inst1_dst_vld,
  dp_ctrl_ir_inst1_dst_x0,
  dp_ctrl_ir_inst1_dste_vld,
  dp_ctrl_ir_inst1_dstf_vld,
  dp_ctrl_ir_inst1_dstv_vld,
  dp_ctrl_ir_inst1_hpcp_type,
  dp_ctrl_ir_inst2_bar,
  dp_ctrl_ir_inst2_ctrl_info,
  dp_ctrl_ir_inst2_dst_vld,
  dp_ctrl_ir_inst2_dst_x0,
  dp_ctrl_ir_inst2_dste_vld,
  dp_ctrl_ir_inst2_dstf_vld,
  dp_ctrl_ir_inst2_dstv_vld,
  dp_ctrl_ir_inst2_hpcp_type,

    dp_ctrl_ir_inst3_hpcp_type,
  dp_ctrl_ir_inst3_bar,
  dp_ctrl_ir_inst3_ctrl_info,
  dp_ctrl_ir_inst3_dst_vld,
  dp_ctrl_ir_inst3_dst_x0,
  dp_ctrl_ir_inst3_dste_vld,
  dp_ctrl_ir_inst3_dstf_vld,
  dp_ctrl_ir_inst3_dstv_vld,

  dp_ctrl_ir_inst4_ctrl_info,
  dp_ctrl_ir_inst4_bar,
  dp_ctrl_ir_inst4_dst_vld,
  dp_ctrl_ir_inst4_dst_x0,
  dp_ctrl_ir_inst4_dste_vld,
  dp_ctrl_ir_inst4_dstf_vld,
  dp_ctrl_ir_inst4_dstv_vld,
  dp_ctrl_ir_inst4_hpcp_type,
  dp_ctrl_is_dis_inst2_ctrl_info,
  dp_ctrl_is_dis_inst3_ctrl_info,
  dp_ctrl_is_dis_inst4_ctrl_info,//add new logic by xlx
  forever_cpuclk,
  hpcp_idu_cnt_en,
  idu_hpcp_ir_inst0_type,
  idu_hpcp_ir_inst0_vld,
  idu_hpcp_ir_inst1_type,
  idu_hpcp_ir_inst1_vld,
  idu_hpcp_ir_inst2_type,
  idu_hpcp_ir_inst2_vld,
  idu_hpcp_ir_inst3_type,
  idu_hpcp_ir_inst3_vld,
  idu_rtu_ir_ereg0_alloc_vld,
  idu_rtu_ir_ereg1_alloc_vld,
  idu_rtu_ir_ereg2_alloc_vld,
  idu_rtu_ir_ereg3_alloc_vld,
  idu_rtu_ir_ereg4_alloc_vld,//add new logic by xlx

  idu_rtu_ir_ereg_alloc_gateclk_vld,
  idu_rtu_ir_freg0_alloc_vld,
  idu_rtu_ir_freg1_alloc_vld,
  idu_rtu_ir_freg2_alloc_vld,
  idu_rtu_ir_freg3_alloc_vld,
  idu_rtu_ir_freg4_alloc_vld,//add new logic byxlx
  idu_rtu_ir_freg_alloc_gateclk_vld,
  idu_rtu_ir_preg0_alloc_vld,
  idu_rtu_ir_preg1_alloc_vld,
  idu_rtu_ir_preg2_alloc_vld,
  idu_rtu_ir_preg3_alloc_vld,
  idu_rtu_ir_preg4_alloc_vld,//add new logic byxlx
  idu_rtu_ir_preg_alloc_gateclk_vld,
  idu_rtu_ir_vreg0_alloc_vld,
  idu_rtu_ir_vreg1_alloc_vld,
  idu_rtu_ir_vreg2_alloc_vld,
  idu_rtu_ir_vreg3_alloc_vld,
  idu_rtu_ir_vreg4_alloc_vld,//add new logic by xlx

  idu_rtu_ir_vreg_alloc_gateclk_vld,
  iu_idu_mispred_stall,
  iu_yy_xx_cancel,
  pad_yy_icg_scan_en,
  rtu_idu_alloc_ereg0_vld,
  rtu_idu_alloc_ereg1_vld,
  rtu_idu_alloc_ereg2_vld,
  rtu_idu_alloc_ereg3_vld,
  rtu_idu_alloc_ereg4_vld,//add new logic by xlx
  rtu_idu_alloc_freg0_vld,
  rtu_idu_alloc_freg1_vld,
  rtu_idu_alloc_freg2_vld,
  rtu_idu_alloc_freg3_vld,
  rtu_idu_alloc_freg4_vld,//add new logic by xlx
  rtu_idu_alloc_preg0_vld,
  rtu_idu_alloc_preg1_vld,
  rtu_idu_alloc_preg2_vld,
  rtu_idu_alloc_preg3_vld,
  rtu_idu_alloc_preg4_vld,//add new logic by xlx
  rtu_idu_alloc_vreg0_vld,
  rtu_idu_alloc_vreg1_vld,
  rtu_idu_alloc_vreg2_vld,
  rtu_idu_alloc_vreg3_vld,
  rtu_idu_alloc_vreg4_vld,//add new logic by xlx
  rtu_idu_flush_fe,
  rtu_idu_flush_is,
  rtu_idu_flush_stall,
  rtu_idu_srt_en,
  rtu_yy_xx_flush,
  viq0_ctrl_entry_cnt_updt_val,
  viq0_ctrl_entry_cnt_updt_vld,
  viq1_ctrl_entry_cnt_updt_val,
  viq1_ctrl_entry_cnt_updt_vld
);

// &Ports; @28
input   [3 :0]  aiq0_ctrl_entry_cnt_updt_val;          
input           aiq0_ctrl_entry_cnt_updt_vld;          
input   [3 :0]  aiq1_ctrl_entry_cnt_updt_val;          
input           aiq1_ctrl_entry_cnt_updt_vld;          
input           cp0_idu_dlb_disable;                   
input           cp0_idu_icg_en;                        
input           cp0_idu_rob_fold_disable;              
input           cp0_yy_clk_en;                         
input           cpurst_b;                              
input           ctrl_id_pipedown_gateclk;              
input           ctrl_id_pipedown_inst0_vld;            
input           ctrl_id_pipedown_inst1_vld;            
input           ctrl_id_pipedown_inst2_vld;            
input           ctrl_id_pipedown_inst3_vld;     
input           ctrl_id_pipedown_inst4_vld;//add by xlx             
input           ctrl_is_dis_type_stall;                
input           ctrl_is_inst2_vld;                     
input           ctrl_is_inst3_vld;   
input           ctrl_is_inst4_vld;//add new logic by xlx                        
input           ctrl_is_stall;                         
input   [1 :0]  ctrl_xx_is_inst0_sel;                  
input   [2 :0]  ctrl_xx_is_inst_sel;                   
input           dp_ctrl_ir_inst0_bar;                  
input   [12:0]  dp_ctrl_ir_inst0_ctrl_info;            
input           dp_ctrl_ir_inst0_dst_vld;              
input           dp_ctrl_ir_inst0_dst_x0;               
input           dp_ctrl_ir_inst0_dste_vld;             
input           dp_ctrl_ir_inst0_dstf_vld;             
input           dp_ctrl_ir_inst0_dstv_vld;             
input   [6 :0]  dp_ctrl_ir_inst0_hpcp_type;            
input           dp_ctrl_ir_inst1_bar;                  
input   [12:0]  dp_ctrl_ir_inst1_ctrl_info;            
input           dp_ctrl_ir_inst1_dst_vld;              
input           dp_ctrl_ir_inst1_dst_x0;               
input           dp_ctrl_ir_inst1_dste_vld;             
input           dp_ctrl_ir_inst1_dstf_vld;             
input           dp_ctrl_ir_inst1_dstv_vld;             
input   [6 :0]  dp_ctrl_ir_inst1_hpcp_type;            
input           dp_ctrl_ir_inst2_bar;                  
input   [12:0]  dp_ctrl_ir_inst2_ctrl_info;            
input           dp_ctrl_ir_inst2_dst_vld;              
input           dp_ctrl_ir_inst2_dst_x0;               
input           dp_ctrl_ir_inst2_dste_vld;             
input           dp_ctrl_ir_inst2_dstf_vld;             
input           dp_ctrl_ir_inst2_dstv_vld;             
input   [6 :0]  dp_ctrl_ir_inst2_hpcp_type;       
input   [6 :0]  dp_ctrl_ir_inst3_hpcp_type;              
input           dp_ctrl_ir_inst3_bar;                  
input   [12:0]  dp_ctrl_ir_inst3_ctrl_info;            
input           dp_ctrl_ir_inst3_dst_vld;              
input           dp_ctrl_ir_inst3_dst_x0;               
input           dp_ctrl_ir_inst3_dste_vld;             
input           dp_ctrl_ir_inst3_dstf_vld;             
input           dp_ctrl_ir_inst3_dstv_vld;       
//add uop5 logic by xlx

input   [6 :0]  dp_ctrl_ir_inst4_hpcp_type;              
input           dp_ctrl_ir_inst4_bar;     
input   [12:0]  dp_ctrl_ir_inst4_ctrl_info;            
input           dp_ctrl_ir_inst4_dst_vld;              
input           dp_ctrl_ir_inst4_dst_x0;               
input           dp_ctrl_ir_inst4_dste_vld;             
input           dp_ctrl_ir_inst4_dstf_vld;             
input           dp_ctrl_ir_inst4_dstv_vld;       


     
input   [12:0]  dp_ctrl_is_dis_inst2_ctrl_info;        
input   [12:0]  dp_ctrl_is_dis_inst3_ctrl_info;
input   [12:0]  dp_ctrl_is_dis_inst4_ctrl_info;   //add uop5 logic by xlx      
input           forever_cpuclk;                        
input           hpcp_idu_cnt_en;                       
input           iu_idu_mispred_stall;                  
input           iu_yy_xx_cancel;                       
input           pad_yy_icg_scan_en;                    
input           rtu_idu_alloc_ereg0_vld;               
input           rtu_idu_alloc_ereg1_vld;               
input           rtu_idu_alloc_ereg2_vld;               
input           rtu_idu_alloc_ereg3_vld;        
input           rtu_idu_alloc_ereg4_vld;    //add uop5 logic by xlx   
input           rtu_idu_alloc_freg0_vld;               
input           rtu_idu_alloc_freg1_vld;               
input           rtu_idu_alloc_freg2_vld;               
input           rtu_idu_alloc_freg3_vld;
input           rtu_idu_alloc_freg4_vld;    //add uop5 logic by xlx            
input           rtu_idu_alloc_preg0_vld;               
input           rtu_idu_alloc_preg1_vld;               
input           rtu_idu_alloc_preg2_vld;               
input           rtu_idu_alloc_preg3_vld;
input           rtu_idu_alloc_preg4_vld;   //add uop5 logic by xlx                      
input           rtu_idu_alloc_vreg0_vld;               
input           rtu_idu_alloc_vreg1_vld;               
input           rtu_idu_alloc_vreg2_vld;               
input           rtu_idu_alloc_vreg3_vld;   
input           rtu_idu_alloc_vreg4_vld;       //add uop5 logic by xlx                   
input           rtu_idu_flush_fe;                      
input           rtu_idu_flush_is;                      
input           rtu_idu_flush_stall;                   
input           rtu_idu_srt_en;                        
input           rtu_yy_xx_flush;                       
input   [3 :0]  viq0_ctrl_entry_cnt_updt_val;          
input           viq0_ctrl_entry_cnt_updt_vld;          
input   [3 :0]  viq1_ctrl_entry_cnt_updt_val;          
input           viq1_ctrl_entry_cnt_updt_vld;          
output          ctrl_dp_ir_inst0_vld;                  
output          ctrl_fence_ir_pipe_empty;              
output          ctrl_ir_pipedown;                      
output          ctrl_ir_pipedown_gateclk;              
output          ctrl_ir_pipedown_inst0_vld;            
output          ctrl_ir_pipedown_inst1_vld;            
output          ctrl_ir_pipedown_inst2_vld;            
output          ctrl_ir_pipedown_inst3_vld;
output          ctrl_ir_pipedown_inst4_vld;     //add uop5 logic by xlx                    
output          ctrl_ir_pre_dis_aiq0_create0_en;       
output  [1 :0]  ctrl_ir_pre_dis_aiq0_create0_sel;      
output          ctrl_ir_pre_dis_aiq0_create1_en;       
output  [1 :0]  ctrl_ir_pre_dis_aiq0_create1_sel;      
output          ctrl_ir_pre_dis_aiq1_create0_en;       
output  [1 :0]  ctrl_ir_pre_dis_aiq1_create0_sel;      
output          ctrl_ir_pre_dis_aiq1_create1_en;       
output  [1 :0]  ctrl_ir_pre_dis_aiq1_create1_sel;      
output          ctrl_ir_pre_dis_biq_create0_en;        
output  [1 :0]  ctrl_ir_pre_dis_biq_create0_sel;       
output          ctrl_ir_pre_dis_biq_create1_en;        
output  [1 :0]  ctrl_ir_pre_dis_biq_create1_sel;       
output          ctrl_ir_pre_dis_inst0_vld;             
output          ctrl_ir_pre_dis_inst1_vld;             
output          ctrl_ir_pre_dis_inst2_vld;             
output          ctrl_ir_pre_dis_inst3_vld; 
output          ctrl_ir_pre_dis_inst4_vld;   //add new logic by xlx            
output          ctrl_ir_pre_dis_lsiq_create0_en;       
output  [1 :0]  ctrl_ir_pre_dis_lsiq_create0_sel;      
output          ctrl_ir_pre_dis_lsiq_create1_en;       
output  [1 :0]  ctrl_ir_pre_dis_lsiq_create1_sel;      
output          ctrl_ir_pre_dis_pipedown2;             
output          ctrl_ir_pre_dis_pst_create1_iid_sel;   
output  [2 :0]  ctrl_ir_pre_dis_pst_create2_iid_sel;   
output  [2 :0]  ctrl_ir_pre_dis_pst_create3_iid_sel;   
output  [2 :0]  ctrl_ir_pre_dis_pst_create4_iid_sel;   //add by xl x
output  [1 :0]  ctrl_ir_pre_dis_rob_create0_sel;       
output          ctrl_ir_pre_dis_rob_create1_en;        
output  [2 :0]  ctrl_ir_pre_dis_rob_create1_sel;       
output          ctrl_ir_pre_dis_rob_create2_en;        
output  [1 :0]  ctrl_ir_pre_dis_rob_create2_sel;       
output          ctrl_ir_pre_dis_rob_create3_en;
output  [1 :0]  ctrl_ir_pre_dis_rob_create3_sel;  //add new signal by xlx 

output          ctrl_ir_pre_dis_rob_create4_en;
output  [1 :0]  ctrl_ir_pre_dis_rob_create4_sel;  //add new signal by xlx 

output          ctrl_ir_pre_dis_sdiq_create0_en;       
output  [1 :0]  ctrl_ir_pre_dis_sdiq_create0_sel;      
output          ctrl_ir_pre_dis_sdiq_create1_en;       
output  [1 :0]  ctrl_ir_pre_dis_sdiq_create1_sel;      
output          ctrl_ir_pre_dis_viq0_create0_en;       
output  [1 :0]  ctrl_ir_pre_dis_viq0_create0_sel;      
output          ctrl_ir_pre_dis_viq0_create1_en;       
output  [1 :0]  ctrl_ir_pre_dis_viq0_create1_sel;      
output          ctrl_ir_pre_dis_viq1_create0_en;       
output  [1 :0]  ctrl_ir_pre_dis_viq1_create0_sel;      
output          ctrl_ir_pre_dis_viq1_create1_en;       
output  [1 :0]  ctrl_ir_pre_dis_viq1_create1_sel;      
output          ctrl_ir_pre_dis_vmb_create0_en;        
output  [1 :0]  ctrl_ir_pre_dis_vmb_create0_sel;       
output          ctrl_ir_pre_dis_vmb_create1_en;        
output  [1 :0]  ctrl_ir_pre_dis_vmb_create1_sel;       
output          ctrl_ir_stage_stall;                   
output          ctrl_ir_stall;                         
output          ctrl_ir_type_stall_inst2_vld;          
output          ctrl_ir_type_stall_inst3_vld;          
output          ctrl_lsiq_ir_bar_inst_vld;             
output          ctrl_rt_inst0_vld;                     
output          ctrl_rt_inst1_vld;                     
output          ctrl_rt_inst2_vld;                     
output          ctrl_rt_inst3_vld;
output          ctrl_rt_inst4_vld;         //add new logic by xlx            
output          ctrl_top_ir_ereg_not_vld;              
output          ctrl_top_ir_freg_not_vld;              
output          ctrl_top_ir_inst0_vld;                 
output          ctrl_top_ir_inst1_vld;                 
output          ctrl_top_ir_inst2_vld;                 
output          ctrl_top_ir_inst3_vld; 
output          ctrl_top_ir_inst4_vld;       // add new logic by xlx               
output          ctrl_top_ir_mispred_stall;             
output          ctrl_top_ir_preg_not_vld;              
output          ctrl_top_ir_vreg_not_vld;              
output  [6 :0]  idu_hpcp_ir_inst0_type;                
output          idu_hpcp_ir_inst0_vld;                 
output  [6 :0]  idu_hpcp_ir_inst1_type;                
output          idu_hpcp_ir_inst1_vld;                 
output  [6 :0]  idu_hpcp_ir_inst2_type;                
output          idu_hpcp_ir_inst2_vld;                 
output  [6 :0]  idu_hpcp_ir_inst3_type;                
output          idu_hpcp_ir_inst3_vld;                 
output          idu_rtu_ir_ereg0_alloc_vld;            
output          idu_rtu_ir_ereg1_alloc_vld;            
output          idu_rtu_ir_ereg2_alloc_vld;            
output          idu_rtu_ir_ereg3_alloc_vld;     
output          idu_rtu_ir_ereg4_alloc_vld;    //add by xlx

output          idu_rtu_ir_ereg_alloc_gateclk_vld;     
output          idu_rtu_ir_freg0_alloc_vld;            
output          idu_rtu_ir_freg1_alloc_vld;            
output          idu_rtu_ir_freg2_alloc_vld;            
output          idu_rtu_ir_freg3_alloc_vld;     
output          idu_rtu_ir_freg4_alloc_vld;           //add by xlx  
output          idu_rtu_ir_freg_alloc_gateclk_vld;     
output          idu_rtu_ir_preg0_alloc_vld;            
output          idu_rtu_ir_preg1_alloc_vld;            
output          idu_rtu_ir_preg2_alloc_vld;            
output          idu_rtu_ir_preg3_alloc_vld;    
output          idu_rtu_ir_preg4_alloc_vld;    //add by xlx               
output          idu_rtu_ir_preg_alloc_gateclk_vld;     
output          idu_rtu_ir_vreg0_alloc_vld;            
output          idu_rtu_ir_vreg1_alloc_vld;            
output          idu_rtu_ir_vreg2_alloc_vld;            
output          idu_rtu_ir_vreg3_alloc_vld;      
output          idu_rtu_ir_vreg4_alloc_vld;       //add by xlx
output          idu_rtu_ir_vreg_alloc_gateclk_vld;     

// &Regs; @29
reg             ctrl_aiq_dlb_en;                       
reg     [6 :0]  ctrl_ir_hpcp_inst0_type;               
reg             ctrl_ir_hpcp_inst0_vld_ff;             
reg     [6 :0]  ctrl_ir_hpcp_inst1_type;               
reg             ctrl_ir_hpcp_inst1_vld_ff;             
reg     [6 :0]  ctrl_ir_hpcp_inst2_type;               
reg             ctrl_ir_hpcp_inst2_vld_ff;             
reg     [6 :0]  ctrl_ir_hpcp_inst3_type;               
reg             ctrl_ir_hpcp_inst3_vld_ff;             
reg     [2 :0]  ctrl_ir_pre_dis_aiq0_create0_sel;  //增加uop需要扩展一位     //add by xlx
reg     [2 :0]  ctrl_ir_pre_dis_aiq0_create1_sel;      //增加uop需要扩展一位     
reg     [2 :0]  ctrl_ir_pre_dis_aiq1_create0_sel;      //增加uop需要扩展一位    
reg     [2 :0]  ctrl_ir_pre_dis_aiq1_create1_sel;      //增加uop需要扩展一位    
reg     [2 :0]  ctrl_ir_pre_dis_biq_create0_sel;       //增加uop需要扩展一位    
reg     [2 :0]  ctrl_ir_pre_dis_biq_create1_sel;       //增加uop需要扩展一位    
reg     [2 :0]  ctrl_ir_pre_dis_lsiq_create0_sel;      //增加uop需要扩展一位    
reg     [2 :0]  ctrl_ir_pre_dis_lsiq_create1_sel;      //增加uop需要扩展一位     //add by xlx
reg             ctrl_ir_pre_dis_rob_create1_en;        
reg     [2 :0]  ctrl_ir_pre_dis_sdiq_create0_sel;      //增加uop需要扩展一位     //add by xlx
reg     [2 :0]  ctrl_ir_pre_dis_sdiq_create1_sel;      //增加uop需要扩展一位     //add by xlx
reg     [2 :0]  ctrl_ir_pre_dis_viq0_create0_sel;      //增加uop需要扩展一位     //add by xlx
reg     [2 :0]  ctrl_ir_pre_dis_viq0_create1_sel;      //增加uop需要扩展一位     //add by xlx
reg     [2 :0]  ctrl_ir_pre_dis_viq1_create0_sel;      //增加uop需要扩展一位     //add by xlx
reg     [2 :0]  ctrl_ir_pre_dis_viq1_create1_sel;      //增加uop需要扩展一位     //add by xlx
reg             ctrl_ir_pre_dis_vmb_create0_en;        
reg     [2 :0]  ctrl_ir_pre_dis_vmb_create0_sel;       ///增加uop需要扩展一位     //add by xlx
reg             ctrl_ir_pre_dis_vmb_create1_en;        
reg     [2 :0]  ctrl_ir_pre_dis_vmb_create1_sel;       //增加uop需要扩展一位     //add by xlx
reg             ctrl_viq_dlb_en;                       
reg             ir_inst0_vld;                          
reg             ir_inst1_vld;                          
reg             ir_inst2_vld;                          
reg             ir_inst3_vld;                          
reg             ir_inst4_vld;    //add new logic by xlx
// &Wires; @30
wire    [3 :0]  aiq0_ctrl_entry_cnt_updt_val;          
wire            aiq0_ctrl_entry_cnt_updt_vld;          
wire    [3 :0]  aiq1_ctrl_entry_cnt_updt_val;          
wire            aiq1_ctrl_entry_cnt_updt_vld;          
wire            cp0_idu_dlb_disable;                   
wire            cp0_idu_icg_en;                        
wire            cp0_idu_rob_fold_disable;              
wire            cp0_yy_clk_en;                         
wire            cpurst_b;                              
wire            ctrl_aiq_dlb_updt_vld;                 
wire    [3 :0]  ctrl_aiq_entry_cnt_diff;               
wire            ctrl_aiq_entry_cnt_diff_7_2;           
wire            ctrl_aiq_entry_cnt_diff_8;             
wire            ctrl_dp_ir_inst0_vld;                  
wire            ctrl_fence_ir_pipe_empty;              
wire            ctrl_id_pipedown_gateclk;              
wire            ctrl_id_pipedown_inst0_vld;            
wire            ctrl_id_pipedown_inst1_vld;            
wire            ctrl_id_pipedown_inst2_vld;            
wire            ctrl_id_pipedown_inst3_vld;     
wire            ctrl_id_pipedown_inst4_vld;//add new logic by xlx       
wire            ctrl_ir_ereg_stall;                    
wire            ctrl_ir_freg_stall;                    
wire            ctrl_ir_hpcp_inst_vld;                 
wire            ctrl_ir_inst0_aiq0;                    
wire            ctrl_ir_inst0_aiq01;                   
wire            ctrl_ir_inst0_aiq01_bef_dlb;           
wire            ctrl_ir_inst0_aiq0_vld;                
wire            ctrl_ir_inst0_aiq1;                    
wire            ctrl_ir_inst0_aiq1_bef_dlb;            
wire            ctrl_ir_inst0_aiq1_vld;                
wire            ctrl_ir_inst0_biq;                     
wire            ctrl_ir_inst0_biq_vld;                 
wire            ctrl_ir_inst0_fold;                    
wire            ctrl_ir_inst0_intmask;                 
wire            ctrl_ir_inst0_lsiq;                    
wire            ctrl_ir_inst0_lsiq_vld;                
wire            ctrl_ir_inst0_sdiq;                    
wire            ctrl_ir_inst0_special;                 
wire            ctrl_ir_inst0_split;                   
wire            ctrl_ir_inst0_viq0;                    
wire            ctrl_ir_inst0_viq01;                   
wire            ctrl_ir_inst0_viq01_bef_dlb;           
wire            ctrl_ir_inst0_viq0_vld;                
wire            ctrl_ir_inst0_viq1;                    
wire            ctrl_ir_inst0_viq1_bef_dlb;            
wire            ctrl_ir_inst0_viq1_vld;                
wire            ctrl_ir_inst0_vmb;                     
wire            ctrl_ir_inst1_aiq0;                    
wire            ctrl_ir_inst1_aiq01;                   
wire            ctrl_ir_inst1_aiq01_bef_dlb;           
wire            ctrl_ir_inst1_aiq0_vld;                
wire            ctrl_ir_inst1_aiq1;                    
wire            ctrl_ir_inst1_aiq1_bef_dlb;            
wire            ctrl_ir_inst1_aiq1_vld;                
wire            ctrl_ir_inst1_biq;                     
wire            ctrl_ir_inst1_biq_vld;                 
wire            ctrl_ir_inst1_fold;                    
wire            ctrl_ir_inst1_intmask;                 
wire            ctrl_ir_inst1_lsiq;                    
wire            ctrl_ir_inst1_lsiq_vld;                
wire            ctrl_ir_inst1_sdiq;                    
wire            ctrl_ir_inst1_special;                 
wire            ctrl_ir_inst1_split;                   
wire            ctrl_ir_inst1_viq0;                    
wire            ctrl_ir_inst1_viq01;                   
wire            ctrl_ir_inst1_viq01_bef_dlb;           
wire            ctrl_ir_inst1_viq0_vld;                
wire            ctrl_ir_inst1_viq1;                    
wire            ctrl_ir_inst1_viq1_bef_dlb;            
wire            ctrl_ir_inst1_viq1_vld;                
wire            ctrl_ir_inst1_vmb;                     
wire            ctrl_ir_inst2_aiq0;                    
wire            ctrl_ir_inst2_aiq01;                   
wire            ctrl_ir_inst2_aiq01_bef_dlb;           
wire            ctrl_ir_inst2_aiq0_vld;                
wire            ctrl_ir_inst2_aiq1;                    
wire            ctrl_ir_inst2_aiq1_bef_dlb;            
wire            ctrl_ir_inst2_aiq1_vld;                
wire            ctrl_ir_inst2_biq;                     
wire            ctrl_ir_inst2_biq_vld;                 
wire            ctrl_ir_inst2_fold;                    
wire            ctrl_ir_inst2_intmask;                 
wire            ctrl_ir_inst2_lsiq;                    
wire            ctrl_ir_inst2_lsiq_vld;                
wire            ctrl_ir_inst2_sdiq;                    
wire            ctrl_ir_inst2_special;                 
wire            ctrl_ir_inst2_split;                   
wire            ctrl_ir_inst2_viq0;                    
wire            ctrl_ir_inst2_viq01;                   
wire            ctrl_ir_inst2_viq01_bef_dlb;           
wire            ctrl_ir_inst2_viq0_vld;                
wire            ctrl_ir_inst2_viq1;                    
wire            ctrl_ir_inst2_viq1_bef_dlb;            
wire            ctrl_ir_inst2_viq1_vld;                
wire            ctrl_ir_inst2_vmb;                     
wire            ctrl_ir_inst3_aiq0;                    
wire            ctrl_ir_inst3_aiq01;                   
wire            ctrl_ir_inst3_aiq01_bef_dlb;           
wire            ctrl_ir_inst3_aiq0_vld;                
wire            ctrl_ir_inst3_aiq1;                    
wire            ctrl_ir_inst3_aiq1_bef_dlb;            
wire            ctrl_ir_inst3_aiq1_vld;                
wire            ctrl_ir_inst3_biq;                     
wire            ctrl_ir_inst3_biq_vld;                 
wire            ctrl_ir_inst3_fold;                    
wire            ctrl_ir_inst3_intmask;                 
wire            ctrl_ir_inst3_lsiq;                    
wire            ctrl_ir_inst3_lsiq_vld;                
wire            ctrl_ir_inst3_sdiq;                    
wire            ctrl_ir_inst3_special;                 
wire            ctrl_ir_inst3_split;                   
wire            ctrl_ir_inst3_viq0;                    
wire            ctrl_ir_inst3_viq01;                   
wire            ctrl_ir_inst3_viq01_bef_dlb;           
wire            ctrl_ir_inst3_viq0_vld;                
wire            ctrl_ir_inst3_viq1;                    
wire            ctrl_ir_inst3_viq1_bef_dlb;            
wire            ctrl_ir_inst3_viq1_vld;                
wire            ctrl_ir_inst3_vmb;                     
wire            ctrl_ir_pipedown;                      
wire            ctrl_ir_pipedown_gateclk;              
wire            ctrl_ir_pipedown_inst0_vld;            
wire            ctrl_ir_pipedown_inst1_vld;            
wire            ctrl_ir_pipedown_inst2_vld;            
wire            ctrl_ir_pipedown_inst3_vld;    
wire            ctrl_ir_pipedown_inst4_vld;    //add by xlx
wire            ctrl_ir_pipedown_stall;                
wire            ctrl_ir_pre_dis_3_aiq0_inst;           
wire            ctrl_ir_pre_dis_3_aiq1_inst;           
wire            ctrl_ir_pre_dis_3_biq_inst;            
wire            ctrl_ir_pre_dis_3_lsiq_inst;           
wire            ctrl_ir_pre_dis_3_viq0_inst;           
wire            ctrl_ir_pre_dis_3_viq1_inst;           
wire            ctrl_ir_pre_dis_aiq0_create0_en;       
wire            ctrl_ir_pre_dis_aiq0_create0_sel_inst0; 
wire            ctrl_ir_pre_dis_aiq0_create0_sel_inst1; 
wire            ctrl_ir_pre_dis_aiq0_create0_sel_inst2; 

wire            ctrl_ir_pre_dis_aiq0_create1_en;       
wire            ctrl_ir_pre_dis_aiq0_create1_sel_inst0; 
wire            ctrl_ir_pre_dis_aiq0_create1_sel_inst1; 
wire            ctrl_ir_pre_dis_aiq0_create1_sel_inst2; 
wire            ctrl_ir_pre_dis_aiq1_create0_en;       
wire            ctrl_ir_pre_dis_aiq1_create0_sel_inst0; 
wire            ctrl_ir_pre_dis_aiq1_create0_sel_inst1; 
wire            ctrl_ir_pre_dis_aiq1_create0_sel_inst2; 
wire            ctrl_ir_pre_dis_aiq1_create0_sel_inst3; //add new logic by xlx
wire            ctrl_ir_pre_dis_aiq1_create1_en;       
wire            ctrl_ir_pre_dis_aiq1_create1_sel_inst0; 
wire            ctrl_ir_pre_dis_aiq1_create1_sel_inst1; 
wire            ctrl_ir_pre_dis_aiq1_create1_sel_inst2; 
wire            ctrl_ir_pre_dis_al_1_aiq01_inst;       
wire            ctrl_ir_pre_dis_al_1_aiq0_inst;        
wire            ctrl_ir_pre_dis_al_1_aiq1_inst;        
wire            ctrl_ir_pre_dis_al_1_viq01_inst;       
wire            ctrl_ir_pre_dis_al_1_viq0_inst;        
wire            ctrl_ir_pre_dis_al_1_viq1_inst;        
wire            ctrl_ir_pre_dis_al_2_aiq01_inst;       
wire            ctrl_ir_pre_dis_al_2_aiq0_inst;        
wire            ctrl_ir_pre_dis_al_2_aiq1_inst;        
wire            ctrl_ir_pre_dis_al_2_viq01_inst;       
wire            ctrl_ir_pre_dis_al_2_viq0_inst;        
wire            ctrl_ir_pre_dis_al_2_viq1_inst;        
wire            ctrl_ir_pre_dis_al_3_aiq01_inst;       
wire            ctrl_ir_pre_dis_al_3_viq01_inst;       
wire            ctrl_ir_pre_dis_al_4_aiq01_inst;       
wire            ctrl_ir_pre_dis_al_4_viq01_inst;       
wire            ctrl_ir_pre_dis_biq_create0_en;        
wire            ctrl_ir_pre_dis_biq_create1_en;        
wire            ctrl_ir_pre_dis_biq_create1_sel_inst1; 
wire            ctrl_ir_pre_dis_biq_create1_sel_inst2; 
wire            ctrl_ir_pre_dis_inst012_fold;          
wire            ctrl_ir_pre_dis_inst013_2_aiq0;        
wire            ctrl_ir_pre_dis_inst013_2_aiq1;        
wire            ctrl_ir_pre_dis_inst013_2_viq0;        
wire            ctrl_ir_pre_dis_inst013_2_viq1;        
wire            ctrl_ir_pre_dis_inst013_aiq0;          
wire            ctrl_ir_pre_dis_inst013_aiq1;          
wire            ctrl_ir_pre_dis_inst013_viq0;          
wire            ctrl_ir_pre_dis_inst013_viq1;          
wire            ctrl_ir_pre_dis_inst01_fold;           
wire            ctrl_ir_pre_dis_inst023_2_aiq0;        
wire            ctrl_ir_pre_dis_inst023_2_viq0;        
wire            ctrl_ir_pre_dis_inst023_aiq0;          
wire            ctrl_ir_pre_dis_inst023_aiq1;          
wire            ctrl_ir_pre_dis_inst023_viq0;          
wire            ctrl_ir_pre_dis_inst023_viq1;          
wire            ctrl_ir_pre_dis_inst0_aiq0;            
wire            ctrl_ir_pre_dis_inst0_aiq01;           
wire            ctrl_ir_pre_dis_inst0_aiq1;            
wire            ctrl_ir_pre_dis_inst0_biq;             
wire            ctrl_ir_pre_dis_inst0_fold;            
wire            ctrl_ir_pre_dis_inst0_lsiq;            
wire            ctrl_ir_pre_dis_inst0_sdiq;            
wire            ctrl_ir_pre_dis_inst0_viq0;            
wire            ctrl_ir_pre_dis_inst0_viq01;           
wire            ctrl_ir_pre_dis_inst0_viq1;            
wire            ctrl_ir_pre_dis_inst0_vld;             
wire            ctrl_ir_pre_dis_inst0_vmb;             
wire            ctrl_ir_pre_dis_inst123_2_aiq0;        
wire            ctrl_ir_pre_dis_inst123_2_viq0;        
wire            ctrl_ir_pre_dis_inst123_aiq0;          
wire            ctrl_ir_pre_dis_inst123_aiq1;          
wire            ctrl_ir_pre_dis_inst123_fold;          
wire            ctrl_ir_pre_dis_inst123_viq0;          
wire            ctrl_ir_pre_dis_inst123_viq1;          
wire            ctrl_ir_pre_dis_inst12_fold;           
wire            ctrl_ir_pre_dis_inst1_aiq0;            
wire            ctrl_ir_pre_dis_inst1_aiq01;           
wire            ctrl_ir_pre_dis_inst1_aiq1;            
wire            ctrl_ir_pre_dis_inst1_biq;             
wire            ctrl_ir_pre_dis_inst1_fold;            
wire            ctrl_ir_pre_dis_inst1_lsiq;            
wire            ctrl_ir_pre_dis_inst1_sdiq;            
wire            ctrl_ir_pre_dis_inst1_viq0;            
wire            ctrl_ir_pre_dis_inst1_viq01;           
wire            ctrl_ir_pre_dis_inst1_viq1;            
wire            ctrl_ir_pre_dis_inst1_vld;             
wire            ctrl_ir_pre_dis_inst1_vmb;             
wire            ctrl_ir_pre_dis_inst23_aiq0;           
wire            ctrl_ir_pre_dis_inst23_aiq1;           
wire            ctrl_ir_pre_dis_inst23_fold;           
wire            ctrl_ir_pre_dis_inst23_viq0;           
wire            ctrl_ir_pre_dis_inst23_viq1;           
wire            ctrl_ir_pre_dis_inst2_aiq0;            
wire            ctrl_ir_pre_dis_inst2_aiq01;           
wire            ctrl_ir_pre_dis_inst2_aiq1;            
wire            ctrl_ir_pre_dis_inst2_biq;             
wire            ctrl_ir_pre_dis_inst2_fold;            
wire            ctrl_ir_pre_dis_inst2_lsiq;            
wire            ctrl_ir_pre_dis_inst2_sdiq;            
wire            ctrl_ir_pre_dis_inst2_viq0;            
wire            ctrl_ir_pre_dis_inst2_viq01;           
wire            ctrl_ir_pre_dis_inst2_viq1;            
wire            ctrl_ir_pre_dis_inst2_vld;             
wire            ctrl_ir_pre_dis_inst2_vmb;             
wire            ctrl_ir_pre_dis_inst3_aiq0;            
wire            ctrl_ir_pre_dis_inst3_aiq01;           
wire            ctrl_ir_pre_dis_inst3_aiq1;            
wire            ctrl_ir_pre_dis_inst3_biq;             
wire            ctrl_ir_pre_dis_inst3_fold;            
wire            ctrl_ir_pre_dis_inst3_lsiq;            
wire            ctrl_ir_pre_dis_inst3_sdiq;            
wire            ctrl_ir_pre_dis_inst3_viq0;            
wire            ctrl_ir_pre_dis_inst3_viq01;           
wire            ctrl_ir_pre_dis_inst3_viq1;            
wire            ctrl_ir_pre_dis_inst3_vld;             
wire            ctrl_ir_pre_dis_inst3_vmb;   
//add uop4 logic by xlx 
wire            ctrl_ir_pre_dis_inst4_aiq0;            
wire            ctrl_ir_pre_dis_inst4_aiq01;           
wire            ctrl_ir_pre_dis_inst4_aiq1;            
wire            ctrl_ir_pre_dis_inst4_biq;             
wire            ctrl_ir_pre_dis_inst4_fold;            
wire            ctrl_ir_pre_dis_inst4_lsiq;            
wire            ctrl_ir_pre_dis_inst4_sdiq;            
wire            ctrl_ir_pre_dis_inst4_viq0;            
wire            ctrl_ir_pre_dis_inst4_viq01;           
wire            ctrl_ir_pre_dis_inst4_viq1;            
wire            ctrl_ir_pre_dis_inst4_vld;             
wire            ctrl_ir_pre_dis_inst4_vmb;   

wire            ctrl_ir_pre_dis_lsiq_create0_en;       
wire            ctrl_ir_pre_dis_lsiq_create1_en;       
wire            ctrl_ir_pre_dis_lsiq_create1_sel_inst1; 
wire            ctrl_ir_pre_dis_lsiq_create1_sel_inst2; 
wire            ctrl_ir_pre_dis_lsiq_create1_sel_inst3; 
wire            ctrl_ir_pre_dis_pipedown2;             
wire            ctrl_ir_pre_dis_pst_create1_iid_sel;   
wire    [2 :0]  ctrl_ir_pre_dis_pst_create2_iid_sel;   
wire    [2 :0]  ctrl_ir_pre_dis_pst_create3_iid_sel;   
wire    [2 :0]  ctrl_ir_pre_dis_pst_create4_iid_sel;   //add by xlx
wire    [1 :0]  ctrl_ir_pre_dis_rob_create0_sel;       
wire    [2 :0]  ctrl_ir_pre_dis_rob_create1_sel;       
wire            ctrl_ir_pre_dis_rob_create2_en;        
wire    [1 :0]  ctrl_ir_pre_dis_rob_create2_sel;       
wire            ctrl_ir_pre_dis_rob_create3_en;
wire    [1 :0]  ctrl_ir_pre_dis_rob_create3_sel;  //add new signal by xlx          
wire            ctrl_ir_pre_dis_sdiq_create0_en;       
wire            ctrl_ir_pre_dis_sdiq_create1_en;       
wire            ctrl_ir_pre_dis_sdiq_create1_sel_inst1; 
wire            ctrl_ir_pre_dis_sdiq_create1_sel_inst2; 
wire            ctrl_ir_pre_dis_type_stall_pipedown2;  
wire            ctrl_ir_pre_dis_viq0_create0_en;       
wire            ctrl_ir_pre_dis_viq0_create0_sel_inst0; 
wire            ctrl_ir_pre_dis_viq0_create0_sel_inst1; 
wire            ctrl_ir_pre_dis_viq0_create0_sel_inst2; 
wire            ctrl_ir_pre_dis_viq0_create1_en;       
wire            ctrl_ir_pre_dis_viq0_create1_sel_inst0; 
wire            ctrl_ir_pre_dis_viq0_create1_sel_inst1; 
wire            ctrl_ir_pre_dis_viq0_create1_sel_inst2; 
wire            ctrl_ir_pre_dis_viq0_create1_sel_inst3; //add new logic by xlx
wire            ctrl_ir_pre_dis_viq1_create0_en;       
wire            ctrl_ir_pre_dis_viq1_create0_sel_inst0; 
wire            ctrl_ir_pre_dis_viq1_create0_sel_inst1; 
wire            ctrl_ir_pre_dis_viq1_create0_sel_inst2;
 wire            ctrl_ir_pre_dis_viq1_create0_sel_inst3;//add new logic by xlx
wire            ctrl_ir_pre_dis_viq1_create1_en;       
wire            ctrl_ir_pre_dis_viq1_create1_sel_inst0; 
wire            ctrl_ir_pre_dis_viq1_create1_sel_inst1; 
wire            ctrl_ir_pre_dis_viq1_create1_sel_inst2; 
wire            ctrl_ir_preg_stall;                    
wire            ctrl_ir_stage_stall;                   
wire            ctrl_ir_stall;                         
wire            ctrl_ir_type_stall_inst2_vld;          
wire            ctrl_ir_type_stall_inst3_vld;          
wire            ctrl_ir_vreg_stall;                    
wire            ctrl_is_dis_type_stall;                
wire            ctrl_is_inst2_vld;                     
wire            ctrl_is_inst3_vld; 
wire            ctrl_is_inst4_vld; //add new logic by xlx           
wire            ctrl_is_stall;                         
wire            ctrl_lsiq_ir_bar_inst_vld;             
wire            ctrl_rt_inst0_vld;                     
wire            ctrl_rt_inst1_vld;                     
wire            ctrl_rt_inst2_vld;                     
wire            ctrl_rt_inst3_vld;      
wire            ctrl_rt_inst4_vld;      //add new logic by xlx
               
wire            ctrl_top_ir_ereg_not_vld;              
wire            ctrl_top_ir_freg_not_vld;              
wire            ctrl_top_ir_inst0_vld;                 
wire            ctrl_top_ir_inst1_vld;                 
wire            ctrl_top_ir_inst2_vld;                 
wire            ctrl_top_ir_inst3_vld;                 
wire            ctrl_top_ir_mispred_stall;             
wire            ctrl_top_ir_preg_not_vld;              
wire            ctrl_top_ir_vreg_not_vld;              
wire            ctrl_viq_dlb_updt_vld;                 
wire    [3 :0]  ctrl_viq_entry_cnt_diff;               
wire            ctrl_viq_entry_cnt_diff_7_2;           
wire            ctrl_viq_entry_cnt_diff_8;             
wire    [1 :0]  ctrl_xx_is_inst0_sel;                  
wire    [2 :0]  ctrl_xx_is_inst_sel;                   
wire            dlb_clk;                               
wire            dlb_clk_en;                            
wire            dp_ctrl_ir_inst0_bar;                  
wire    [12:0]  dp_ctrl_ir_inst0_ctrl_info;            
wire            dp_ctrl_ir_inst0_dst_vld;              
wire            dp_ctrl_ir_inst0_dst_x0;               
wire            dp_ctrl_ir_inst0_dste_vld;             
wire            dp_ctrl_ir_inst0_dstf_vld;             
wire            dp_ctrl_ir_inst0_dstv_vld;             
wire    [6 :0]  dp_ctrl_ir_inst0_hpcp_type;            
wire            dp_ctrl_ir_inst1_bar;                  
wire    [12:0]  dp_ctrl_ir_inst1_ctrl_info;            
wire            dp_ctrl_ir_inst1_dst_vld;              
wire            dp_ctrl_ir_inst1_dst_x0;               
wire            dp_ctrl_ir_inst1_dste_vld;             
wire            dp_ctrl_ir_inst1_dstf_vld;             
wire            dp_ctrl_ir_inst1_dstv_vld;             
wire    [6 :0]  dp_ctrl_ir_inst1_hpcp_type;            
wire            dp_ctrl_ir_inst2_bar;                  
wire    [12:0]  dp_ctrl_ir_inst2_ctrl_info;            
wire            dp_ctrl_ir_inst2_dst_vld;              
wire            dp_ctrl_ir_inst2_dst_x0;               
wire            dp_ctrl_ir_inst2_dste_vld;             
wire            dp_ctrl_ir_inst2_dstf_vld;             
wire            dp_ctrl_ir_inst2_dstv_vld;             
wire    [6 :0]  dp_ctrl_ir_inst2_hpcp_type;            
wire            dp_ctrl_ir_inst3_bar;     
wire            dp_ctrl_ir_inst4_bar;     //add new logic by xlx
wire    [12:0]  dp_ctrl_ir_inst3_ctrl_info;            
wire            dp_ctrl_ir_inst3_dst_vld;              
wire            dp_ctrl_ir_inst3_dst_x0;               
wire            dp_ctrl_ir_inst3_dste_vld;             
wire            dp_ctrl_ir_inst3_dstf_vld;             
wire            dp_ctrl_ir_inst3_dstv_vld;      

//add uop 5logic
wire    [12:0]  dp_ctrl_ir_inst4_ctrl_info;            
wire            dp_ctrl_ir_inst4_dst_vld;              
wire            dp_ctrl_ir_inst4_dst_x0;               
wire            dp_ctrl_ir_inst4_dste_vld;             
wire            dp_ctrl_ir_inst4_dstf_vld;             
wire            dp_ctrl_ir_inst4_dstv_vld;      



wire    [6 :0]  dp_ctrl_ir_inst3_hpcp_type;            
wire    [12:0]  dp_ctrl_is_dis_inst2_ctrl_info;        
wire    [12:0]  dp_ctrl_is_dis_inst3_ctrl_info;        
wire    [12:0]  dp_ctrl_is_dis_inst4_ctrl_info;       //add new logic by xlx
wire            forever_cpuclk;                        
wire            hpcp_clk;                              
wire            hpcp_clk_en;                           
wire            hpcp_idu_cnt_en;                       
wire    [6 :0]  idu_hpcp_ir_inst0_type;                
wire            idu_hpcp_ir_inst0_vld;                 
wire    [6 :0]  idu_hpcp_ir_inst1_type;                
wire            idu_hpcp_ir_inst1_vld;                 
wire    [6 :0]  idu_hpcp_ir_inst2_type;                
wire            idu_hpcp_ir_inst2_vld;                 
wire    [6 :0]  idu_hpcp_ir_inst3_type;                
wire            idu_hpcp_ir_inst3_vld;                 
wire            idu_rtu_ir_ereg0_alloc_vld;            
wire            idu_rtu_ir_ereg1_alloc_vld;            
wire            idu_rtu_ir_ereg2_alloc_vld;            
wire            idu_rtu_ir_ereg3_alloc_vld;          
 wire            idu_rtu_ir_ereg4_alloc_vld;    //add by xlx      

wire            idu_rtu_ir_ereg_alloc_gateclk_vld;     
wire            idu_rtu_ir_freg0_alloc_vld;            
wire            idu_rtu_ir_freg1_alloc_vld;            
wire            idu_rtu_ir_freg2_alloc_vld;            
wire            idu_rtu_ir_freg3_alloc_vld;       
wire            idu_rtu_ir_freg4_alloc_vld;    //addby xlx        
wire            idu_rtu_ir_freg_alloc_gateclk_vld;     
wire            idu_rtu_ir_preg0_alloc_vld;            
wire            idu_rtu_ir_preg1_alloc_vld;            
wire            idu_rtu_ir_preg2_alloc_vld;            
wire            idu_rtu_ir_preg3_alloc_vld;            
wire            idu_rtu_ir_preg_alloc_gateclk_vld;     
wire            idu_rtu_ir_vreg0_alloc_vld;            
wire            idu_rtu_ir_vreg1_alloc_vld;            
wire            idu_rtu_ir_vreg2_alloc_vld;            
wire            idu_rtu_ir_vreg3_alloc_vld;            
wire            idu_rtu_ir_vreg_alloc_gateclk_vld;     
wire            ir_inst_clk;                           
wire            ir_inst_clk_en;                        
wire    [12:0]  ir_pipedown_inst0_ctrl_info;           
wire            ir_pipedown_inst0_vld;                 
wire    [12:0]  ir_pipedown_inst1_ctrl_info;           
wire            ir_pipedown_inst1_vld;                 
wire    [12:0]  ir_pipedown_inst2_ctrl_info;           
wire            ir_pipedown_inst2_vld;                 
wire    [12:0]  ir_pipedown_inst3_ctrl_info;    
wire            ir_pipedown_inst3_vld;    
wire    [12:0]  ir_pipedown_inst4_ctrl_info;    //add new logic by xlx
wire            ir_pipedown_inst4_vld; //add new logic by xlx

wire            iu_idu_mispred_stall;                  
wire            iu_yy_xx_cancel;                       
wire            pad_yy_icg_scan_en;                    
wire            rtu_idu_alloc_ereg0_vld;               
wire            rtu_idu_alloc_ereg1_vld;               
wire            rtu_idu_alloc_ereg2_vld;               
wire            rtu_idu_alloc_ereg3_vld;     
wire            rtu_idu_alloc_ereg4_vld;     //add new logic by xlx
wire            rtu_idu_alloc_freg0_vld;               
wire            rtu_idu_alloc_freg1_vld;               
wire            rtu_idu_alloc_freg2_vld;               
wire            rtu_idu_alloc_freg3_vld;    
wire            rtu_idu_alloc_freg4_vld;   //add new logic by xlx
wire            rtu_idu_alloc_preg0_vld;               
wire            rtu_idu_alloc_preg1_vld;               
wire            rtu_idu_alloc_preg2_vld;               
wire            rtu_idu_alloc_preg3_vld; 
wire            rtu_idu_alloc_preg4_vld;   //add new logic by xlx
wire            rtu_idu_alloc_vreg0_vld;               
wire            rtu_idu_alloc_vreg1_vld;               
wire            rtu_idu_alloc_vreg2_vld;               
wire            rtu_idu_alloc_vreg3_vld;  
wire            rtu_idu_alloc_vreg4_vld;   //add new logic by xlx      
wire            rtu_idu_flush_fe;                      
wire            rtu_idu_flush_is;                      
wire            rtu_idu_flush_stall;                   
wire            rtu_idu_srt_en;                        
wire            rtu_yy_xx_flush;                       
wire    [3 :0]  viq0_ctrl_entry_cnt_updt_val;          
wire            viq0_ctrl_entry_cnt_updt_vld;          
wire    [3 :0]  viq1_ctrl_entry_cnt_updt_val;          
wire            viq1_ctrl_entry_cnt_updt_vld;          

//add new signal by xlx
wire ctrl_ir_pre_dis_inst2_viq0_or_viq1_or_viq01;

//==========================================================
//                       Parameters
//==========================================================
//----------------------------------------------------------
//                 IS ctrl path parameters
//----------------------------------------------------------
parameter IS_CTRL_WIDTH       = 13;

parameter IS_CTRL_VMB         = 12;
parameter IS_CTRL_PIPE7       = 11;
parameter IS_CTRL_PIPE6       = 10;
parameter IS_CTRL_PIPE67      = 9;
parameter IS_CTRL_SPECIAL     = 8;
parameter IS_CTRL_STADDR      = 7;
parameter IS_CTRL_INTMASK     = 6;
parameter IS_CTRL_SPLIT       = 5;
parameter IS_CTRL_LSU         = 4;
parameter IS_CTRL_BJU         = 3;
parameter IS_CTRL_DIV         = 2;
parameter IS_CTRL_MULT        = 1;
parameter IS_CTRL_ALU         = 0;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign ir_inst_clk_en = ctrl_id_pipedown_gateclk
                        || ir_inst0_vld
                        || ir_inst1_vld
                        || ir_inst2_vld
                        || ir_inst3_vld
                        || ir_inst4_vld //add uop5  add by xlx
                        ;
// &Instance("gated_clk_cell", "x_ir_inst_gated_clk"); @63
gated_clk_cell  x_ir_inst_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ir_inst_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ir_inst_clk_en    ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @64
//          .external_en (1'b0), @65
//          .global_en   (cp0_yy_clk_en), @66
//          .module_en   (cp0_idu_icg_en), @67
//          .local_en    (ir_inst_clk_en), @68
//          .clk_out     (ir_inst_clk)); @69

//==========================================================
//                 IR pipeline registers
//==========================================================
//----------------------------------------------------------
//               Pipeline register implement    id -- ir 
//----------------------------------------------------------
always @(posedge ir_inst_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    ir_inst0_vld <= 1'b0;
    ir_inst1_vld <= 1'b0;
    ir_inst2_vld <= 1'b0;
    ir_inst3_vld <= 1'b0;
    ir_inst4_vld <= 1'b0;//add uop5 //add by xlx
  end
  else if(rtu_idu_flush_fe || iu_yy_xx_cancel) begin
    ir_inst0_vld <= 1'b0;
    ir_inst1_vld <= 1'b0;
    ir_inst2_vld <= 1'b0;
    ir_inst3_vld <= 1'b0;
    ir_inst4_vld <= 1'b0;//add uop5 //add by xlx
  end
  else if(!ctrl_ir_stall) begin
    ir_inst0_vld <= ctrl_id_pipedown_inst0_vld;
    ir_inst1_vld <= ctrl_id_pipedown_inst1_vld;
    ir_inst2_vld <= ctrl_id_pipedown_inst2_vld;
    ir_inst3_vld <= ctrl_id_pipedown_inst3_vld;
    ir_inst4_vld <= ctrl_id_pipedown_inst4_vld;//add uop5 //add by xlx
  end
  else begin
    ir_inst0_vld <= ir_inst0_vld;
    ir_inst1_vld <= ir_inst1_vld;
    ir_inst2_vld <= ir_inst2_vld;
    ir_inst3_vld <= ir_inst3_vld; 
    ir_inst3_vld <= ir_inst3_vld;//add uop5 //add by xlx
  end
end

assign ctrl_dp_ir_inst0_vld = ir_inst0_vld;

//for is type stall, ignore type stall
assign ctrl_ir_type_stall_inst2_vld = ir_inst2_vld;
assign ctrl_ir_type_stall_inst3_vld = ir_inst3_vld;

assign ctrl_top_ir_inst0_vld = ir_inst0_vld;
assign ctrl_top_ir_inst1_vld = ir_inst1_vld;
assign ctrl_top_ir_inst2_vld = ir_inst2_vld;
assign ctrl_top_ir_inst3_vld = ir_inst3_vld;
assign ctrl_top_ir_inst4_vld = ir_inst4_vld;//add uop5 //add by xlx

//----------------------------------------------------------
//             IR pipedown inst valid signals
//----------------------------------------------------------
//to reduce dispatch stall timing, IR and IS stage use delicate
//stall and inst valid design:

//there are two IS stall sources: dispatch stall and type stall
//1.if there is dispatch stall, IS stage contrl registers does
//  not receive new inst predispatch information  发射队列满了  is不写入了
//2.if there is type stall, is_dis_inst_sel will select IS stage
//  inst valid and datapath
  //发生了type stall
//there is one IR stall source: creg stall
//3.if ther is creg stall, cannot pipe IR inst to IS stage.
//  however creg stall does not affect IS stage shift inst
//so pipedown inst valid can ignore both dispatch stall and type
//stall, but should consider creg stall.
  //

/*影响ir -- is pipedown 的两种stall 
区别：typestall时  第一个周期先不阻塞，能派遣的就派遣 ，派遣不了的卡在is
下一周期根据ir接收到的指令判断 有没有发生 两级加起来 超过5条 ，超过了就stall id和ir
没超过的话 就放一起 is级派遣出去
*/
assign ctrl_ir_pipedown_stall = ctrl_ir_stage_stall || ctrl_is_dis_type_stall;


//origin logic
/*
//ir级pipedown的inst0 vld信号
//当触发了typestall 只能pipedown2个时 且inst2 有效时 
//或者 没触发pipestall 时 inst0 vld
assign ir_pipedown_inst0_vld =
            ctrl_xx_is_inst0_sel[0] && ctrl_is_inst2_vld

//assign ctrl_xx_is_inst0_sel[0] = is_dis_pipedown2;
//如果上一周期的指令在is只pipedown了2条，且第三条有效（说明inst2，inst3 typestall了） ，那么这周期ir pipedown inst0 有效
           || ctrl_xx_is_inst0_sel[1] && ir_inst0_vld && !ctrl_ir_pipedown_stall;
//如果上一周期的指令在is不是只pipedown两条 ， 那么需要这周期的ir的inst0 vld 且ir级没发生typestall
*/

//inst0的sel逻辑 add by xlx
assign ir_pipedown_inst0_vld =
            (ctrl_xx_is_inst0_sel[0]||ctrl_xx_is_inst0_sel[1]) && ctrl_is_inst2_vld
           || ctrl_xx_is_inst0_sel[2] && ir_inst0_vld && !ctrl_ir_pipedown_stall
           || ctrl_xx_is_inst0_sel[3] && ir_inst0_vld && !ctrl_ir_pipedown_stall
           ;

/*
//IR级pipedown的inst1 vld信号
//1.当is触发了typestall  is只能pipedown2个时 且is级的inst3有效时(说明 is级剩了两条  ir级可以补充两条)   //疑问，为什么要重复&is inst3 vld
//2.ir没触发pipestall时，is只能pipedown2个，且is级的inst3不vld（说明is级只剩了一条，ir可以补充最多三条），且inst0 vld(此时ir级补充了两条)
//3，ir没触发pipestall，is没发生typestall，此时is无剩余， ir直接pipedown
assign ir_pipedown_inst1_vld =
            ctrl_xx_is_inst_sel[0] && ctrl_is_inst3_vld
         || ctrl_xx_is_inst_sel[1] && ir_inst0_vld && !ctrl_ir_pipedown_stall
         || ctrl_xx_is_inst_sel[2] && ir_inst1_vld && !ctrl_ir_pipedown_stall;
*/

//inst1的逻辑
assign ir_pipedown_inst1_vld =
            (ctrl_xx_is_inst_sel[0]||ctrl_xx_is_inst0_sel[1])&& ctrl_is_inst3_vld
         || ctrl_xx_is_inst_sel[2] && ir_inst0_vld && !ctrl_ir_pipedown_stall
         || ctrl_xx_is_inst_sel[3] && ir_inst1_vld && !ctrl_ir_pipedown_stall;

//IR级pipedown的inst2 vld信号
//1.当is触发了typestall  is只能pipedown2个时 且is级的inst3有效时(说明 is级剩了两条  ir级可以补充两条) ,不能发生pipestall  //疑问，为什么要重复&is inst3 vld
//2.ir没触发pipestall时，is只能pipedown2个，且is级的inst3不vld（说明is级只剩了一条，ir可以补充最多三条），且inst0 vld(此时ir级补充了两条)
//3，ir没触发pipestall，is没发生typestall，此时is无剩余， ir直接pipedown


//is inst3vld且type stall ，ir 的inst0选 is的inst2 ，inst1选is的inst3 ，inst2选ir的inst0

//new logic add by xlx  
assign ir_pipedown_inst2_vld =
//is 2 3 4 
//is 23  +ir 0
//is 2  +ir 01
//ir 012  ctrl_is_inst3_vld
            ctrl_xx_is_inst_sel[0] && ctrl_is_inst4_vld
          ||  ctrl_xx_is_inst_sel[1] && ir_inst0_vld && !ctrl_ir_pipedown_stall
         || ctrl_xx_is_inst_sel[2] && ir_inst1_vld && !ctrl_ir_pipedown_stall
         || ctrl_xx_is_inst_sel[3] && ir_inst2_vld && !ctrl_ir_pipedown_stall;


//new logic add by xlx  l
//is 234 +ir 0
//is 23+ ir 01
//is 2+ir 012
//ir 0123
assign ir_pipedown_inst3_vld =
            ctrl_xx_is_inst_sel[0] && ir_inst0_vld && !ctrl_ir_pipedown_stall
         || ctrl_xx_is_inst_sel[1] && ir_inst1_vld && !ctrl_ir_pipedown_stall
         || ctrl_xx_is_inst_sel[2] && ir_inst2_vld && !ctrl_ir_pipedown_stall
         || ctrl_xx_is_inst_sel[3] && ir_inst3_vld && !ctrl_ir_pipedown_stall
         ;


//add uop5 logic by xlx
//is 234 +ir 01
//is 23+ ir 012
//is 2+ir 0123
//ir 01234
assign ir_pipedown_inst4_vld =
            ctrl_xx_is_inst_sel[0] && ir_inst1_vld && !ctrl_ir_pipedown_stall
         || ctrl_xx_is_inst_sel[1] && ir_inst2_vld && !ctrl_ir_pipedown_stall
         || ctrl_xx_is_inst_sel[2] && ir_inst3_vld && !ctrl_ir_pipedown_stall
         || ctrl_xx_is_inst_sel[3] && ir_inst4_vld && !ctrl_ir_pipedown_stall
         ;

//----------------------------------------------------------
//            Rename Table inst valid signals
//----------------------------------------------------------
//rename table inst can only be from IR pipeline inst,
//their inst valid signals are from ir inst valid,
//and consider is stall signal (including dispatch stall
//and type stall). the is stall logic is in rt module.
assign ctrl_rt_inst0_vld = ir_inst0_vld;
assign ctrl_rt_inst1_vld = ir_inst1_vld;
assign ctrl_rt_inst2_vld = ir_inst2_vld;
assign ctrl_rt_inst3_vld = ir_inst3_vld;
assign ctrl_rt_inst4_vld = ir_inst4_vld;//add uop5 logic //add by xlx
//----------------------------------------------------------
//            Fence pipeline emtry signal
//----------------------------------------------------------
assign ctrl_fence_ir_pipe_empty = !ir_inst0_vld;

//----------------------------------------------------------
//               Barrier inst valid signal
//----------------------------------------------------------
//ignore stall signals
assign ctrl_lsiq_ir_bar_inst_vld = ir_inst0_vld && dp_ctrl_ir_inst0_bar
                                || ir_inst1_vld && dp_ctrl_ir_inst1_bar
                                || ir_inst2_vld && dp_ctrl_ir_inst2_bar
                                || ir_inst3_vld && dp_ctrl_ir_inst3_bar
                                || ir_inst4_vld && dp_ctrl_ir_inst4_bar;//add uop 5 //add by xlx

//----------------------------------------------------------
//            Rename pipedown inst valid signals
//----------------------------------------------------------
assign ctrl_ir_pipedown_inst0_vld = ir_pipedown_inst0_vld;
assign ctrl_ir_pipedown_inst1_vld = ir_pipedown_inst1_vld;
assign ctrl_ir_pipedown_inst2_vld = ir_pipedown_inst2_vld;
assign ctrl_ir_pipedown_inst3_vld = ir_pipedown_inst3_vld;
assign ctrl_ir_pipedown_inst4_vld = ir_pipedown_inst4_vld;//add  uop5 //add by xlx


//==========================================================
//                IR stage pipedown signals
//==========================================================
//pipedown signal is used to update IS stage data path
assign ctrl_ir_pipedown         = (ir_pipedown_inst0_vld
                                || ir_pipedown_inst1_vld
                                || ir_pipedown_inst2_vld
                                || ir_pipedown_inst3_vld
                                || ir_pipedown_inst4_vld//add uop5 //add by xlx
                                );
assign ctrl_ir_pipedown_gateclk = (ctrl_is_inst2_vld
                                || ctrl_is_inst3_vld
                                || ctrl_is_inst4_vld//add is uop5
                                || ir_inst0_vld
                                || ir_inst1_vld
                                || ir_inst2_vld
                                || ir_inst3_vld
                                || ir_inst4_vld//add uop5 //add by xlx
                                );

//==========================================================
//                  IR stage stall signals
//==========================================================
//preg stall siganls
assign ctrl_ir_preg_stall = 
     ir_inst0_vld && dp_ctrl_ir_inst0_dst_vld && !rtu_idu_alloc_preg0_vld
  || ir_inst1_vld && dp_ctrl_ir_inst1_dst_vld && !rtu_idu_alloc_preg1_vld
  || ir_inst2_vld && dp_ctrl_ir_inst2_dst_vld && !rtu_idu_alloc_preg2_vld
  || ir_inst3_vld && dp_ctrl_ir_inst3_dst_vld && !rtu_idu_alloc_preg3_vld
  || ir_inst4_vld && dp_ctrl_ir_inst4_dst_vld && !rtu_idu_alloc_preg4_vld;//add uop5 //add by xlx
//vreg stall siganls
assign ctrl_ir_vreg_stall =
     ir_inst0_vld && dp_ctrl_ir_inst0_dstv_vld && !rtu_idu_alloc_vreg0_vld
  || ir_inst1_vld && dp_ctrl_ir_inst1_dstv_vld && !rtu_idu_alloc_vreg1_vld
  || ir_inst2_vld && dp_ctrl_ir_inst2_dstv_vld && !rtu_idu_alloc_vreg2_vld
  || ir_inst3_vld && dp_ctrl_ir_inst3_dstv_vld && !rtu_idu_alloc_vreg3_vld
  || ir_inst4_vld && dp_ctrl_ir_inst4_dstv_vld && !rtu_idu_alloc_vreg4_vld;//add uop5 //add by xlx
//freg stall siganls
assign ctrl_ir_freg_stall =
     ir_inst0_vld && dp_ctrl_ir_inst0_dstf_vld && !rtu_idu_alloc_freg0_vld
  || ir_inst1_vld && dp_ctrl_ir_inst1_dstf_vld && !rtu_idu_alloc_freg1_vld
  || ir_inst2_vld && dp_ctrl_ir_inst2_dstf_vld && !rtu_idu_alloc_freg2_vld
  || ir_inst3_vld && dp_ctrl_ir_inst3_dstf_vld && !rtu_idu_alloc_freg3_vld
  || ir_inst4_vld && dp_ctrl_ir_inst4_dstf_vld && !rtu_idu_alloc_freg4_vld;//add uop5 //add by xlx
//ereg stall siganls
assign ctrl_ir_ereg_stall =
     ir_inst0_vld && dp_ctrl_ir_inst0_dste_vld && !rtu_idu_alloc_ereg0_vld
  || ir_inst1_vld && dp_ctrl_ir_inst1_dste_vld && !rtu_idu_alloc_ereg1_vld
  || ir_inst2_vld && dp_ctrl_ir_inst2_dste_vld && !rtu_idu_alloc_ereg2_vld
  || ir_inst3_vld && dp_ctrl_ir_inst3_dste_vld && !rtu_idu_alloc_ereg3_vld
  || ir_inst3_vld && dp_ctrl_ir_inst3_dste_vld && !rtu_idu_alloc_ereg3_vld;//add uop5 //add by xlx

assign ctrl_top_ir_preg_not_vld = !(rtu_idu_alloc_preg0_vld
                                 && rtu_idu_alloc_preg1_vld
                                 && rtu_idu_alloc_preg2_vld
                                 && rtu_idu_alloc_preg3_vld
                                 && rtu_idu_alloc_preg4_vld);//add uop5 //add by xlx
assign ctrl_top_ir_vreg_not_vld = !(rtu_idu_alloc_vreg0_vld
                                 && rtu_idu_alloc_vreg1_vld
                                 && rtu_idu_alloc_vreg2_vld
                                 && rtu_idu_alloc_vreg3_vld
                                 && rtu_idu_alloc_vreg4_vld);//add uop5 //add by xlx
assign ctrl_top_ir_freg_not_vld = !(rtu_idu_alloc_freg0_vld
                                 && rtu_idu_alloc_freg1_vld
                                 && rtu_idu_alloc_freg2_vld
                                 && rtu_idu_alloc_freg3_vld
                                 && rtu_idu_alloc_freg4_vld//add uop5 //add by xlx
                                 );
assign ctrl_top_ir_ereg_not_vld = !(rtu_idu_alloc_ereg0_vld
                                 && rtu_idu_alloc_ereg1_vld
                                 && rtu_idu_alloc_ereg2_vld
                                 && rtu_idu_alloc_ereg3_vld
                                 && rtu_idu_alloc_ereg4_vld//add uop5 //add by xlx
                                 );

//ir stage stall signal
// &Force("output","ctrl_ir_stage_stall"); @244
assign ctrl_ir_stage_stall  = ctrl_ir_preg_stall
                              || ctrl_ir_vreg_stall
                              || ctrl_ir_freg_stall
                              || ctrl_ir_ereg_stall
                              || rtu_idu_flush_stall
                              || iu_idu_mispred_stall;

assign ctrl_top_ir_mispred_stall    = iu_idu_mispred_stall;

//ir stall include preg stall and is stall
// &Force("output","ctrl_ir_stall"); @255
assign ctrl_ir_stall = ir_inst0_vld && (ctrl_is_stall || ctrl_ir_stage_stall);

//==========================================================
//  Allocate signal for Ptag pool / PST preg / LSU pcfifo
//==========================================================
assign idu_rtu_ir_preg0_alloc_vld = ir_inst0_vld
                                    && !ctrl_ir_stall
                                    && dp_ctrl_ir_inst0_dst_vld
                                    && !dp_ctrl_ir_inst0_dst_x0;
assign idu_rtu_ir_preg1_alloc_vld = ir_inst1_vld
                                    && !ctrl_ir_stall
                                    && dp_ctrl_ir_inst1_dst_vld
                                    && !dp_ctrl_ir_inst1_dst_x0;
assign idu_rtu_ir_preg2_alloc_vld = ir_inst2_vld
                                    && !ctrl_ir_stall
                                    && dp_ctrl_ir_inst2_dst_vld
                                    && !dp_ctrl_ir_inst2_dst_x0;
assign idu_rtu_ir_preg3_alloc_vld = ir_inst3_vld
                                    && !ctrl_ir_stall
                                    && dp_ctrl_ir_inst3_dst_vld
                                    && !dp_ctrl_ir_inst3_dst_x0;

assign idu_rtu_ir_preg4_alloc_vld = ir_inst4_vld //add uop5 //add by xlx
                                    && !ctrl_ir_stall
                                    && dp_ctrl_ir_inst4_dst_vld
                                    && !dp_ctrl_ir_inst4_dst_x0;
                                  

assign idu_rtu_ir_vreg0_alloc_vld = ir_inst0_vld
                                    && !ctrl_ir_stall
                                    && dp_ctrl_ir_inst0_dstv_vld;
assign idu_rtu_ir_vreg1_alloc_vld = ir_inst1_vld
                                    && !ctrl_ir_stall
                                    && dp_ctrl_ir_inst1_dstv_vld;
assign idu_rtu_ir_vreg2_alloc_vld = ir_inst2_vld
                                    && !ctrl_ir_stall
                                    && dp_ctrl_ir_inst2_dstv_vld;
assign idu_rtu_ir_vreg3_alloc_vld = ir_inst3_vld
                                    && !ctrl_ir_stall
                                    && dp_ctrl_ir_inst3_dstv_vld;
assign idu_rtu_ir_vreg4_alloc_vld = ir_inst4_vld//add uop5 //add by xlx
                                    && !ctrl_ir_stall
                                    && dp_ctrl_ir_inst4_dstv_vld;                               

assign idu_rtu_ir_freg0_alloc_vld = ir_inst0_vld
                                    && !ctrl_ir_stall
                                    && dp_ctrl_ir_inst0_dstf_vld;
assign idu_rtu_ir_freg1_alloc_vld = ir_inst1_vld
                                    && !ctrl_ir_stall
                                    && dp_ctrl_ir_inst1_dstf_vld;
assign idu_rtu_ir_freg2_alloc_vld = ir_inst2_vld
                                    && !ctrl_ir_stall
                                    && dp_ctrl_ir_inst2_dstf_vld;
assign idu_rtu_ir_freg3_alloc_vld = ir_inst3_vld
                                    && !ctrl_ir_stall
                                    && dp_ctrl_ir_inst3_dstf_vld;
assign idu_rtu_ir_freg4_alloc_vld = ir_inst4_vld
                                    && !ctrl_ir_stall
                                    && dp_ctrl_ir_inst4_dstf_vld;//add uop5 //add by xlx


assign idu_rtu_ir_ereg0_alloc_vld = ir_inst0_vld
                                    && !ctrl_ir_stall
                                    && dp_ctrl_ir_inst0_dste_vld;
assign idu_rtu_ir_ereg1_alloc_vld = ir_inst1_vld
                                    && !ctrl_ir_stall
                                    && dp_ctrl_ir_inst1_dste_vld;
assign idu_rtu_ir_ereg2_alloc_vld = ir_inst2_vld
                                    && !ctrl_ir_stall
                                    && dp_ctrl_ir_inst2_dste_vld;
assign idu_rtu_ir_ereg3_alloc_vld = ir_inst3_vld
                                    && !ctrl_ir_stall
                                    && dp_ctrl_ir_inst3_dste_vld;
assign idu_rtu_ir_ereg4_alloc_vld = ir_inst4_vld
                                    && !ctrl_ir_stall
                                    && dp_ctrl_ir_inst4_dste_vld;//add uop5 //add by xlx
                                                                       

assign idu_rtu_ir_preg_alloc_gateclk_vld =
            ir_inst0_vld && dp_ctrl_ir_inst0_dst_vld
         || ir_inst1_vld && dp_ctrl_ir_inst1_dst_vld
         || ir_inst2_vld && dp_ctrl_ir_inst2_dst_vld
         || ir_inst3_vld && dp_ctrl_ir_inst3_dst_vld
          || ir_inst4_vld && dp_ctrl_ir_inst4_dst_vld//add uop5  //add by xlx
                  ;

assign idu_rtu_ir_vreg_alloc_gateclk_vld =
            ir_inst0_vld && dp_ctrl_ir_inst0_dstv_vld
         || ir_inst1_vld && dp_ctrl_ir_inst1_dstv_vld
         || ir_inst2_vld && dp_ctrl_ir_inst2_dstv_vld
         || ir_inst3_vld && dp_ctrl_ir_inst3_dstv_vld
         || ir_inst4_vld && dp_ctrl_ir_inst4_dstv_vld//add uop5 //add by xlx
         ;

assign idu_rtu_ir_freg_alloc_gateclk_vld =
            ir_inst0_vld && dp_ctrl_ir_inst0_dstf_vld
         || ir_inst1_vld && dp_ctrl_ir_inst1_dstf_vld
         || ir_inst2_vld && dp_ctrl_ir_inst2_dstf_vld
         || ir_inst3_vld && dp_ctrl_ir_inst3_dstf_vld
         || ir_inst4_vld && dp_ctrl_ir_inst4_dstf_vld//add uop5 //add by xlx
         ;

assign idu_rtu_ir_ereg_alloc_gateclk_vld =
            ir_inst0_vld && dp_ctrl_ir_inst0_dste_vld
         || ir_inst1_vld && dp_ctrl_ir_inst1_dste_vld
         || ir_inst2_vld && dp_ctrl_ir_inst2_dste_vld
         || ir_inst3_vld && dp_ctrl_ir_inst3_dste_vld
         || ir_inst4_vld && dp_ctrl_ir_inst4_dste_vld //add uop5 //add by xlx
         ;

//==========================================================
//                 Prepare Dispatch Signals
//==========================================================
//----------------------------------------------------------
//            MUX between IR inst and IS shift inst
//----------------------------------------------------------

//IS_CTRL_WIDTH=13
//origin logic
/*
assign ir_pipedown_inst0_ctrl_info[IS_CTRL_WIDTH-1:0] = 
    {IS_CTRL_WIDTH{ctrl_xx_is_inst0_sel[0]}} & dp_ctrl_is_dis_inst2_ctrl_info[IS_CTRL_WIDTH-1:0]
  | {IS_CTRL_WIDTH{ctrl_xx_is_inst0_sel[1]}} & dp_ctrl_ir_inst0_ctrl_info[IS_CTRL_WIDTH-1:0];
assign ir_pipedown_inst1_ctrl_info[IS_CTRL_WIDTH-1:0] = 
    {IS_CTRL_WIDTH{ctrl_xx_is_inst_sel[0]}} & dp_ctrl_is_dis_inst3_ctrl_info[IS_CTRL_WIDTH-1:0]
  | {IS_CTRL_WIDTH{ctrl_xx_is_inst_sel[1]}} & dp_ctrl_ir_inst0_ctrl_info[IS_CTRL_WIDTH-1:0]
  | {IS_CTRL_WIDTH{ctrl_xx_is_inst_sel[2]}} & dp_ctrl_ir_inst1_ctrl_info[IS_CTRL_WIDTH-1:0];
//if sel is inst2, is inst2 should not be valid
assign ir_pipedown_inst2_ctrl_info[IS_CTRL_WIDTH-1:0] = 
    {IS_CTRL_WIDTH{ctrl_xx_is_inst_sel[0]}} & dp_ctrl_ir_inst0_ctrl_info[IS_CTRL_WIDTH-1:0]
  | {IS_CTRL_WIDTH{ctrl_xx_is_inst_sel[1]}} & dp_ctrl_ir_inst1_ctrl_info[IS_CTRL_WIDTH-1:0]
  | {IS_CTRL_WIDTH{ctrl_xx_is_inst_sel[2]}} & dp_ctrl_ir_inst2_ctrl_info[IS_CTRL_WIDTH-1:0];
//if sel is inst3, is inst3 should not be valid
assign ir_pipedown_inst3_ctrl_info[IS_CTRL_WIDTH-1:0] = 
    {IS_CTRL_WIDTH{ctrl_xx_is_inst_sel[0]}} & dp_ctrl_ir_inst1_ctrl_info[IS_CTRL_WIDTH-1:0]
  | {IS_CTRL_WIDTH{ctrl_xx_is_inst_sel[1]}} & dp_ctrl_ir_inst2_ctrl_info[IS_CTRL_WIDTH-1:0]
  | {IS_CTRL_WIDTH{ctrl_xx_is_inst_sel[2]}} & dp_ctrl_ir_inst3_ctrl_info[IS_CTRL_WIDTH-1:0];
*/

//new logic add by xlx
//
assign ir_pipedown_inst0_ctrl_info[IS_CTRL_WIDTH-1:0] = 
    {IS_CTRL_WIDTH{ctrl_xx_is_inst0_sel[0]}} & dp_ctrl_is_dis_inst2_ctrl_info[IS_CTRL_WIDTH-1:0]
  | {IS_CTRL_WIDTH{ctrl_xx_is_inst0_sel[1]}} & dp_ctrl_is_dis_inst2_ctrl_info[IS_CTRL_WIDTH-1:0]
  | {IS_CTRL_WIDTH{ctrl_xx_is_inst0_sel[2]}} & dp_ctrl_is_dis_inst2_ctrl_info[IS_CTRL_WIDTH-1:0]
  | {IS_CTRL_WIDTH{ctrl_xx_is_inst0_sel[3]}} & dp_ctrl_ir_inst0_ctrl_info[IS_CTRL_WIDTH-1:0];

assign ir_pipedown_inst1_ctrl_info[IS_CTRL_WIDTH-1:0] = 
    {IS_CTRL_WIDTH{ctrl_xx_is_inst_sel[0]}} & dp_ctrl_is_dis_inst3_ctrl_info[IS_CTRL_WIDTH-1:0]
  | {IS_CTRL_WIDTH{ctrl_xx_is_inst_sel[1]}} & dp_ctrl_is_dis_inst3_ctrl_info[IS_CTRL_WIDTH-1:0]
  | {IS_CTRL_WIDTH{ctrl_xx_is_inst_sel[2]}} & dp_ctrl_ir_inst0_ctrl_info[IS_CTRL_WIDTH-1:0]
  | {IS_CTRL_WIDTH{ctrl_xx_is_inst_sel[3]}} & dp_ctrl_ir_inst1_ctrl_info[IS_CTRL_WIDTH-1:0];

assign ir_pipedown_inst2_ctrl_info[IS_CTRL_WIDTH-1:0] = 
    {IS_CTRL_WIDTH{ctrl_xx_is_inst_sel[0]}} & dp_ctrl_is_dis_inst4_ctrl_info[IS_CTRL_WIDTH-1:0]
  |  {IS_CTRL_WIDTH{ctrl_xx_is_inst_sel[1]}} & dp_ctrl_ir_inst0_ctrl_info[IS_CTRL_WIDTH-1:0]
  | {IS_CTRL_WIDTH{ctrl_xx_is_inst_sel[2]}} & dp_ctrl_ir_inst1_ctrl_info[IS_CTRL_WIDTH-1:0]
  | {IS_CTRL_WIDTH{ctrl_xx_is_inst_sel[3]}} & dp_ctrl_ir_inst2_ctrl_info[IS_CTRL_WIDTH-1:0];

assign ir_pipedown_inst3_ctrl_info[IS_CTRL_WIDTH-1:0] = 
    {IS_CTRL_WIDTH{ctrl_xx_is_inst_sel[0]}} & dp_ctrl_ir_inst0_ctrl_info[IS_CTRL_WIDTH-1:0]
  | {IS_CTRL_WIDTH{ctrl_xx_is_inst_sel[1]}} & dp_ctrl_ir_inst1_ctrl_info[IS_CTRL_WIDTH-1:0]
  | {IS_CTRL_WIDTH{ctrl_xx_is_inst_sel[2]}} & dp_ctrl_ir_inst2_ctrl_info[IS_CTRL_WIDTH-1:0]
  | {IS_CTRL_WIDTH{ctrl_xx_is_inst_sel[2]}} & dp_ctrl_ir_inst3_ctrl_info[IS_CTRL_WIDTH-1:0]
  ;

assign ir_pipedown_inst4_ctrl_info[IS_CTRL_WIDTH-1:0] = 
    {IS_CTRL_WIDTH{ctrl_xx_is_inst_sel[0]}} & dp_ctrl_ir_inst1_ctrl_info[IS_CTRL_WIDTH-1:0]
  | {IS_CTRL_WIDTH{ctrl_xx_is_inst_sel[1]}} & dp_ctrl_ir_inst2_ctrl_info[IS_CTRL_WIDTH-1:0]
  | {IS_CTRL_WIDTH{ctrl_xx_is_inst_sel[2]}} & dp_ctrl_ir_inst3_ctrl_info[IS_CTRL_WIDTH-1:0]
  | {IS_CTRL_WIDTH{ctrl_xx_is_inst_sel[3]}} & dp_ctrl_ir_inst4_ctrl_info[IS_CTRL_WIDTH-1:0]
  ;


//rename for pre dispatch
assign ctrl_ir_inst0_aiq0          = ir_pipedown_inst0_ctrl_info[IS_CTRL_DIV] 
                                  || ir_pipedown_inst0_ctrl_info[IS_CTRL_SPECIAL];
assign ctrl_ir_inst1_aiq0          = ir_pipedown_inst1_ctrl_info[IS_CTRL_DIV] 
                                  || ir_pipedown_inst1_ctrl_info[IS_CTRL_SPECIAL];
assign ctrl_ir_inst2_aiq0          = ir_pipedown_inst2_ctrl_info[IS_CTRL_DIV] 
                                  || ir_pipedown_inst2_ctrl_info[IS_CTRL_SPECIAL];
assign ctrl_ir_inst3_aiq0          = ir_pipedown_inst3_ctrl_info[IS_CTRL_DIV] 
                                  || ir_pipedown_inst3_ctrl_info[IS_CTRL_SPECIAL];
assign ctrl_ir_inst4_aiq0          = ir_pipedown_inst4_ctrl_info[IS_CTRL_DIV] //add uop5 //add by xlx
                                  || ir_pipedown_inst4_ctrl_info[IS_CTRL_SPECIAL];                                  

assign ctrl_ir_inst0_aiq1_bef_dlb  = ir_pipedown_inst0_ctrl_info[IS_CTRL_MULT];
assign ctrl_ir_inst1_aiq1_bef_dlb  = ir_pipedown_inst1_ctrl_info[IS_CTRL_MULT];
assign ctrl_ir_inst2_aiq1_bef_dlb  = ir_pipedown_inst2_ctrl_info[IS_CTRL_MULT];
assign ctrl_ir_inst3_aiq1_bef_dlb  = ir_pipedown_inst3_ctrl_info[IS_CTRL_MULT];
assign ctrl_ir_inst4_aiq1_bef_dlb  = ir_pipedown_inst4_ctrl_info[IS_CTRL_MULT];//add uop5 //add by xlx

assign ctrl_ir_inst0_aiq01_bef_dlb = ir_pipedown_inst0_ctrl_info[IS_CTRL_ALU];
assign ctrl_ir_inst1_aiq01_bef_dlb = ir_pipedown_inst1_ctrl_info[IS_CTRL_ALU];
assign ctrl_ir_inst2_aiq01_bef_dlb = ir_pipedown_inst2_ctrl_info[IS_CTRL_ALU];
assign ctrl_ir_inst3_aiq01_bef_dlb = ir_pipedown_inst3_ctrl_info[IS_CTRL_ALU];
assign ctrl_ir_inst4_aiq01_bef_dlb = ir_pipedown_inst4_ctrl_info[IS_CTRL_ALU];//add uop5 //add by xlx
//tudo bef logic

assign ctrl_ir_inst0_biq           = ir_pipedown_inst0_ctrl_info[IS_CTRL_BJU];
assign ctrl_ir_inst1_biq           = ir_pipedown_inst1_ctrl_info[IS_CTRL_BJU];
assign ctrl_ir_inst2_biq           = ir_pipedown_inst2_ctrl_info[IS_CTRL_BJU];
assign ctrl_ir_inst3_biq           = ir_pipedown_inst3_ctrl_info[IS_CTRL_BJU];
assign ctrl_ir_inst4_biq           = ir_pipedown_inst4_ctrl_info[IS_CTRL_BJU];//add uop5 //add by xlx

assign ctrl_ir_inst0_lsiq          = ir_pipedown_inst0_ctrl_info[IS_CTRL_LSU];
assign ctrl_ir_inst1_lsiq          = ir_pipedown_inst1_ctrl_info[IS_CTRL_LSU];
assign ctrl_ir_inst2_lsiq          = ir_pipedown_inst2_ctrl_info[IS_CTRL_LSU];
assign ctrl_ir_inst3_lsiq          = ir_pipedown_inst3_ctrl_info[IS_CTRL_LSU];
assign ctrl_ir_inst4_lsiq          = ir_pipedown_inst3_ctrl_info[IS_CTRL_LSU];//uop5 //add by xlx

assign ctrl_ir_inst0_split         = ir_pipedown_inst0_ctrl_info[IS_CTRL_SPLIT];
assign ctrl_ir_inst1_split         = ir_pipedown_inst1_ctrl_info[IS_CTRL_SPLIT];
assign ctrl_ir_inst2_split         = ir_pipedown_inst2_ctrl_info[IS_CTRL_SPLIT];
assign ctrl_ir_inst3_split         = ir_pipedown_inst3_ctrl_info[IS_CTRL_SPLIT];
assign ctrl_ir_inst4_split         = ir_pipedown_inst4_ctrl_info[IS_CTRL_SPLIT];//add uop5 //add by xlx

assign ctrl_ir_inst0_intmask       = ir_pipedown_inst0_ctrl_info[IS_CTRL_INTMASK];
assign ctrl_ir_inst1_intmask       = ir_pipedown_inst1_ctrl_info[IS_CTRL_INTMASK];
assign ctrl_ir_inst2_intmask       = ir_pipedown_inst2_ctrl_info[IS_CTRL_INTMASK];
assign ctrl_ir_inst3_intmask       = ir_pipedown_inst3_ctrl_info[IS_CTRL_INTMASK];
assign ctrl_ir_inst4_intmask       = ir_pipedown_inst4_ctrl_info[IS_CTRL_INTMASK];//add uop5 //add by xlx


assign ctrl_ir_inst0_sdiq          = ir_pipedown_inst0_ctrl_info[IS_CTRL_STADDR];
assign ctrl_ir_inst1_sdiq          = ir_pipedown_inst1_ctrl_info[IS_CTRL_STADDR];
assign ctrl_ir_inst2_sdiq          = ir_pipedown_inst2_ctrl_info[IS_CTRL_STADDR];
assign ctrl_ir_inst3_sdiq          = ir_pipedown_inst3_ctrl_info[IS_CTRL_STADDR];
assign ctrl_ir_inst4_sdiq          = ir_pipedown_inst4_ctrl_info[IS_CTRL_STADDR];//add uop5 //add by xlx
 
assign ctrl_ir_inst0_special       = ir_pipedown_inst0_ctrl_info[IS_CTRL_SPECIAL];
assign ctrl_ir_inst1_special       = ir_pipedown_inst1_ctrl_info[IS_CTRL_SPECIAL];
assign ctrl_ir_inst2_special       = ir_pipedown_inst2_ctrl_info[IS_CTRL_SPECIAL];
assign ctrl_ir_inst3_special       = ir_pipedown_inst3_ctrl_info[IS_CTRL_SPECIAL];
assign ctrl_ir_inst4_special       = ir_pipedown_inst4_ctrl_info[IS_CTRL_SPECIAL];//add uop5 //add by xlx

assign ctrl_ir_inst0_viq0          = ir_pipedown_inst0_ctrl_info[IS_CTRL_PIPE6];
assign ctrl_ir_inst1_viq0          = ir_pipedown_inst1_ctrl_info[IS_CTRL_PIPE6];
assign ctrl_ir_inst2_viq0          = ir_pipedown_inst2_ctrl_info[IS_CTRL_PIPE6];
assign ctrl_ir_inst3_viq0          = ir_pipedown_inst3_ctrl_info[IS_CTRL_PIPE6];
assign ctrl_ir_inst4_viq0          = ir_pipedown_inst4_ctrl_info[IS_CTRL_PIPE6];//add uop5 //add by xlx

//tudo
assign ctrl_ir_inst0_viq1_bef_dlb  = ir_pipedown_inst0_ctrl_info[IS_CTRL_PIPE7];
assign ctrl_ir_inst1_viq1_bef_dlb  = ir_pipedown_inst1_ctrl_info[IS_CTRL_PIPE7];
assign ctrl_ir_inst2_viq1_bef_dlb  = ir_pipedown_inst2_ctrl_info[IS_CTRL_PIPE7];
assign ctrl_ir_inst3_viq1_bef_dlb  = ir_pipedown_inst3_ctrl_info[IS_CTRL_PIPE7];
assign ctrl_ir_inst4_viq1_bef_dlb  = ir_pipedown_inst4_ctrl_info[IS_CTRL_PIPE7];//add uop5 //add by xlx

assign ctrl_ir_inst0_viq01_bef_dlb = ir_pipedown_inst0_ctrl_info[IS_CTRL_PIPE67];
assign ctrl_ir_inst1_viq01_bef_dlb = ir_pipedown_inst1_ctrl_info[IS_CTRL_PIPE67];
assign ctrl_ir_inst2_viq01_bef_dlb = ir_pipedown_inst2_ctrl_info[IS_CTRL_PIPE67];
assign ctrl_ir_inst3_viq01_bef_dlb = ir_pipedown_inst3_ctrl_info[IS_CTRL_PIPE67];
assign ctrl_ir_inst4_viq01_bef_dlb = ir_pipedown_inst4_ctrl_info[IS_CTRL_PIPE67];//add uop5 //add by xlx
//未查询到有相关指令信息 可能删减了
assign ctrl_ir_inst0_vmb           = ir_pipedown_inst0_ctrl_info[IS_CTRL_VMB];
assign ctrl_ir_inst1_vmb           = ir_pipedown_inst1_ctrl_info[IS_CTRL_VMB];
assign ctrl_ir_inst2_vmb           = ir_pipedown_inst2_ctrl_info[IS_CTRL_VMB];
assign ctrl_ir_inst3_vmb           = ir_pipedown_inst3_ctrl_info[IS_CTRL_VMB];
assign ctrl_ir_inst4_vmb           = ir_pipedown_inst4_ctrl_info[IS_CTRL_VMB];//add uop5 //add by xlx
//----------------------------------------------------------
//             Dynamic Load Balance (DLB) of AIQ
//----------------------------------------------------------
//tudo
assign dlb_clk_en = ctrl_aiq_dlb_en
                    || aiq0_ctrl_entry_cnt_updt_vld
                    || aiq1_ctrl_entry_cnt_updt_vld
                    || ctrl_viq_dlb_en
                    || viq0_ctrl_entry_cnt_updt_vld
                    || viq1_ctrl_entry_cnt_updt_vld;
// &Instance("gated_clk_cell", "x_dlb_gated_clk"); @444
gated_clk_cell  x_dlb_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (dlb_clk           ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (dlb_clk_en        ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @445
//          .external_en (1'b0), @446
//          .global_en   (cp0_yy_clk_en), @447
//          .module_en   (cp0_idu_icg_en), @448
//          .local_en    (dlb_clk_en), @449
//          .clk_out     (dlb_clk)); @450

//diff aiq0 - aiq1      dlb enable logic
assign ctrl_aiq_entry_cnt_diff[3:0] = aiq0_ctrl_entry_cnt_updt_val[3:0]
                                      - aiq1_ctrl_entry_cnt_updt_val[3:0];
assign ctrl_aiq_entry_cnt_diff_8    = (aiq0_ctrl_entry_cnt_updt_val[3:0] == 4'd8)
                                      && (aiq1_ctrl_entry_cnt_updt_val[3:0] == 4'd0);
assign ctrl_aiq_entry_cnt_diff_7_2  = !ctrl_aiq_entry_cnt_diff[3]
                                      && (|ctrl_aiq_entry_cnt_diff[2:1]);
//if aiq0 entry number - aiq1 entry number >= 2, enable dlb
assign ctrl_aiq_dlb_updt_vld        = !cp0_idu_dlb_disable
                                      && (ctrl_aiq_entry_cnt_diff_8
                                       || ctrl_aiq_entry_cnt_diff_7_2);

//implement dlb enable
always @(posedge dlb_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_aiq_dlb_en <= 1'b0;
  //after flush fe/is, the rf may wrongly pop before rtu_yy_xx_flush
  //need flush also when rtu_yy_xx_flush
  else if(rtu_idu_flush_fe || rtu_idu_flush_is || rtu_yy_xx_flush)
    ctrl_aiq_dlb_en <= 1'b0;
  else if(aiq0_ctrl_entry_cnt_updt_vld || aiq1_ctrl_entry_cnt_updt_vld)
    ctrl_aiq_dlb_en <= ctrl_aiq_dlb_updt_vld;
  else
    ctrl_aiq_dlb_en <= ctrl_aiq_dlb_en;
end

//----------------------------------------------------------
//             Dynamic Load Balance (DLB) of VIQ
//----------------------------------------------------------
assign ctrl_viq_entry_cnt_diff[3:0] = viq0_ctrl_entry_cnt_updt_val[3:0]
                                      - viq1_ctrl_entry_cnt_updt_val[3:0];
assign ctrl_viq_entry_cnt_diff_8    = (viq0_ctrl_entry_cnt_updt_val[3:0] == 4'd8)
                                      && (viq1_ctrl_entry_cnt_updt_val[3:0] == 4'd0);
assign ctrl_viq_entry_cnt_diff_7_2  = !ctrl_viq_entry_cnt_diff[3]
                                      && (|ctrl_viq_entry_cnt_diff[2:1]);
//if viq0 entry number - viq1 entry number >= 2, enable dlb
assign ctrl_viq_dlb_updt_vld        = !cp0_idu_dlb_disable
                                      && (ctrl_viq_entry_cnt_diff_8
                                       || ctrl_viq_entry_cnt_diff_7_2);

//implement dlb enable
always @(posedge dlb_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_viq_dlb_en <= 1'b0;
  //after flush fe/is, the rf may wrongly pop before rtu_yy_xx_flush
  //need flush also when rtu_yy_xx_flush
  else if(rtu_idu_flush_fe || rtu_idu_flush_is || rtu_yy_xx_flush)
    ctrl_viq_dlb_en <= 1'b0;
  else if(viq0_ctrl_entry_cnt_updt_vld || viq1_ctrl_entry_cnt_updt_vld)
    ctrl_viq_dlb_en <= ctrl_viq_dlb_updt_vld;
  else
    ctrl_viq_dlb_en <= ctrl_viq_dlb_en;
end

//----------------------------------------------------------
//                   DLB change inst type
//----------------------------------------------------------
//when dynamic load balance enable, change inst type from aiq01 to aiq1
//if inst0 and inst1 is both changed, do not change inst2 and inst3

//tudo 5uop logic

//inst0是aiq1类型， 或者inst0是aiq01类型，且dlb开启，此时inst0从aiq01类型变成aiq1类型
assign ctrl_ir_inst0_aiq1  = 
            ctrl_ir_inst0_aiq1_bef_dlb
         || ctrl_ir_inst0_aiq01_bef_dlb && ctrl_aiq_dlb_en;


assign ctrl_ir_inst0_aiq01 =
            ctrl_ir_inst0_aiq01_bef_dlb && !ctrl_aiq_dlb_en;

assign ctrl_ir_inst1_aiq1  =
            ctrl_ir_inst1_aiq1_bef_dlb
         || ctrl_ir_inst1_aiq01_bef_dlb && ctrl_aiq_dlb_en;
assign ctrl_ir_inst1_aiq01 = 
            ctrl_ir_inst1_aiq01_bef_dlb && !ctrl_aiq_dlb_en;

//
assign ctrl_ir_inst2_aiq1  =
            ctrl_ir_inst2_aiq1_bef_dlb
         || ctrl_ir_inst2_aiq01_bef_dlb
            && !(ctrl_ir_inst0_aiq01_bef_dlb && ctrl_ir_inst1_aiq01_bef_dlb)
            && ctrl_aiq_dlb_en;
      
assign ctrl_ir_inst2_aiq01 =
            ctrl_ir_inst2_aiq01_bef_dlb
            && (ctrl_ir_inst0_aiq01_bef_dlb && ctrl_ir_inst1_aiq01_bef_dlb
               || !ctrl_aiq_dlb_en);

assign ctrl_ir_inst3_aiq1  =
            ctrl_ir_inst3_aiq1_bef_dlb
         || ctrl_ir_inst3_aiq01_bef_dlb
            && !(ctrl_ir_inst0_aiq01_bef_dlb && ctrl_ir_inst1_aiq01_bef_dlb)
            && ctrl_aiq_dlb_en;
assign ctrl_ir_inst3_aiq01 =
            ctrl_ir_inst3_aiq01_bef_dlb
            && (ctrl_ir_inst0_aiq01_bef_dlb && ctrl_ir_inst1_aiq01_bef_dlb
               || !ctrl_aiq_dlb_en);
//add uop5 logic by xlx
assign ctrl_ir_inst4_aiq1  = 
            ctrl_ir_inst4_aiq1_bef_dlb
         || ctrl_ir_inst4_aiq01_bef_dlb
            && !(ctrl_ir_inst0_aiq01_bef_dlb && ctrl_ir_inst1_aiq01_bef_dlb)
            && ctrl_aiq_dlb_en;
assign ctrl_ir_inst4_aiq01 =
            ctrl_ir_inst4_aiq01_bef_dlb
            && (ctrl_ir_inst0_aiq01_bef_dlb && ctrl_ir_inst1_aiq01_bef_dlb
               || !ctrl_aiq_dlb_en);




//when dynamic load balance enable, change inst type from viq01 to viq1
//if inst0 and inst1 is both changed, do not change inst2 and inst3
assign ctrl_ir_inst0_viq1  = 
            ctrl_ir_inst0_viq1_bef_dlb
         || ctrl_ir_inst0_viq01_bef_dlb && ctrl_viq_dlb_en;            
assign ctrl_ir_inst0_viq01 = 
            ctrl_ir_inst0_viq01_bef_dlb && !ctrl_viq_dlb_en;        

assign ctrl_ir_inst1_viq1  = 
            ctrl_ir_inst1_viq1_bef_dlb
         || ctrl_ir_inst1_viq01_bef_dlb && ctrl_viq_dlb_en;            
assign ctrl_ir_inst1_viq01 = 
            ctrl_ir_inst1_viq01_bef_dlb && !ctrl_viq_dlb_en;        

assign ctrl_ir_inst2_viq1  = 
            ctrl_ir_inst2_viq1_bef_dlb
         || ctrl_ir_inst2_viq01_bef_dlb
            && !(ctrl_ir_inst0_viq01_bef_dlb && ctrl_ir_inst1_viq01_bef_dlb)
            && ctrl_viq_dlb_en; 
assign ctrl_ir_inst2_viq01 = 
            ctrl_ir_inst2_viq01_bef_dlb
            && (ctrl_ir_inst0_viq01_bef_dlb && ctrl_ir_inst1_viq01_bef_dlb
               || !ctrl_viq_dlb_en);

assign ctrl_ir_inst3_viq1  = 
            ctrl_ir_inst3_viq1_bef_dlb
         || ctrl_ir_inst3_viq01_bef_dlb
            && !(ctrl_ir_inst0_viq01_bef_dlb && ctrl_ir_inst1_viq01_bef_dlb)
            && ctrl_viq_dlb_en; 
assign ctrl_ir_inst3_viq01 = 
            ctrl_ir_inst3_viq01_bef_dlb
            && (ctrl_ir_inst0_viq01_bef_dlb && ctrl_ir_inst1_viq01_bef_dlb
               || !ctrl_viq_dlb_en);

//add uop5 logic by xlx
assign ctrl_ir_inst4_viq1  = 
            ctrl_ir_inst4_viq1_bef_dlb
         || ctrl_ir_inst4_viq01_bef_dlb
            && !(ctrl_ir_inst0_viq01_bef_dlb && ctrl_ir_inst1_viq01_bef_dlb)
            && ctrl_viq_dlb_en;
assign ctrl_ir_inst4_viq01 =
            ctrl_ir_inst4_viq01_bef_dlb
            && (ctrl_ir_inst0_viq01_bef_dlb && ctrl_ir_inst1_viq01_bef_dlb
               || !ctrl_viq_dlb_en);

//----------------------------------------------------------
//                  prepare IS inst valid
//----------------------------------------------------------
// &Force("output", "ctrl_ir_pre_dis_inst0_vld"); @582
// &Force("output", "ctrl_ir_pre_dis_inst1_vld"); @583
// &Force("output", "ctrl_ir_pre_dis_inst2_vld"); @584
// &Force("output", "ctrl_ir_pre_dis_inst3_vld"); @585
//prepare is inst valid
assign ctrl_ir_pre_dis_inst0_vld = ir_pipedown_inst0_vld;
assign ctrl_ir_pre_dis_inst1_vld = ir_pipedown_inst1_vld;
assign ctrl_ir_pre_dis_inst2_vld = ir_pipedown_inst2_vld
                                   && !ctrl_ir_pre_dis_type_stall_pipedown2;
assign ctrl_ir_pre_dis_inst3_vld = ir_pipedown_inst3_vld
                                   && !ctrl_ir_pre_dis_type_stall_pipedown2;
assign ctrl_ir_pre_dis_inst4_vld = ir_pipedown_inst4_vld
                                   && !ctrl_ir_pre_dis_type_stall_pipedown2;  //add uop5   //add by xlx                        

//----------------------------------------------------------
//             prepare IS dispatch type stall
//----------------------------------------------------------

//add uop 5 dispatch

assign ctrl_ir_inst0_aiq0_vld = ir_pipedown_inst0_vld && ctrl_ir_inst0_aiq0;
assign ctrl_ir_inst1_aiq0_vld = ir_pipedown_inst1_vld && ctrl_ir_inst1_aiq0;
assign ctrl_ir_inst2_aiq0_vld = ir_pipedown_inst2_vld && ctrl_ir_inst2_aiq0;
assign ctrl_ir_inst3_aiq0_vld = ir_pipedown_inst3_vld && ctrl_ir_inst3_aiq0;
assign ctrl_ir_inst4_aiq0_vld = ir_pipedown_inst4_vld && ctrl_ir_inst4_aiq0;//add uop5 //add by xlx

assign ctrl_ir_inst0_aiq1_vld = ir_pipedown_inst0_vld && ctrl_ir_inst0_aiq1;
assign ctrl_ir_inst1_aiq1_vld = ir_pipedown_inst1_vld && ctrl_ir_inst1_aiq1;
assign ctrl_ir_inst2_aiq1_vld = ir_pipedown_inst2_vld && ctrl_ir_inst2_aiq1;
assign ctrl_ir_inst3_aiq1_vld = ir_pipedown_inst3_vld && ctrl_ir_inst3_aiq1;
assign ctrl_ir_inst4_aiq1_vld = ir_pipedown_inst4_vld && ctrl_ir_inst4_aiq1;//add uop5 //add by xlx

assign ctrl_ir_inst0_biq_vld = ir_pipedown_inst0_vld && ctrl_ir_inst0_biq;
assign ctrl_ir_inst1_biq_vld = ir_pipedown_inst1_vld && ctrl_ir_inst1_biq;
assign ctrl_ir_inst2_biq_vld = ir_pipedown_inst2_vld && ctrl_ir_inst2_biq;
assign ctrl_ir_inst3_biq_vld = ir_pipedown_inst3_vld && ctrl_ir_inst3_biq;
assign ctrl_ir_inst4_biq_vld = ir_pipedown_inst4_vld && ctrl_ir_inst4_biq;//add uop5 //add by xlx

assign ctrl_ir_inst0_lsiq_vld = ir_pipedown_inst0_vld && ctrl_ir_inst0_lsiq;
assign ctrl_ir_inst1_lsiq_vld = ir_pipedown_inst1_vld && ctrl_ir_inst1_lsiq;
assign ctrl_ir_inst2_lsiq_vld = ir_pipedown_inst2_vld && ctrl_ir_inst2_lsiq;
assign ctrl_ir_inst3_lsiq_vld = ir_pipedown_inst3_vld && ctrl_ir_inst3_lsiq; 
assign ctrl_ir_inst4_lsiq_vld = ir_pipedown_inst4_vld && ctrl_ir_inst4_lsiq;//add uop5 //add by xlx

assign ctrl_ir_inst0_viq0_vld = ir_pipedown_inst0_vld && ctrl_ir_inst0_viq0;
assign ctrl_ir_inst1_viq0_vld = ir_pipedown_inst1_vld && ctrl_ir_inst1_viq0;
assign ctrl_ir_inst2_viq0_vld = ir_pipedown_inst2_vld && ctrl_ir_inst2_viq0;
assign ctrl_ir_inst3_viq0_vld = ir_pipedown_inst3_vld && ctrl_ir_inst3_viq0;
assign ctrl_ir_inst4_viq0_vld = ir_pipedown_inst4_vld && ctrl_ir_inst4_viq0;//add uop5 //add by xlx

assign ctrl_ir_inst0_viq1_vld = ir_pipedown_inst0_vld && ctrl_ir_inst0_viq1;
assign ctrl_ir_inst1_viq1_vld = ir_pipedown_inst1_vld && ctrl_ir_inst1_viq1;
assign ctrl_ir_inst2_viq1_vld = ir_pipedown_inst2_vld && ctrl_ir_inst2_viq1;
assign ctrl_ir_inst3_viq1_vld = ir_pipedown_inst3_vld && ctrl_ir_inst3_viq1;
assign ctrl_ir_inst4_viq1_vld = ir_pipedown_inst4_vld && ctrl_ir_inst4_viq1;//add uop5 //add by xlx

// 
/*assign ctrl_ir_pre_dis_3_biq_inst =
            ctrl_ir_inst0_biq_vld && ctrl_ir_inst1_biq_vld && ctrl_ir_inst2_biq_vld
         || ctrl_ir_inst0_biq_vld && ctrl_ir_inst1_biq_vld && ctrl_ir_inst3_biq_vld
         || ctrl_ir_inst0_biq_vld && ctrl_ir_inst2_biq_vld && ctrl_ir_inst3_biq_vld
         || ctrl_ir_inst1_biq_vld && ctrl_ir_inst2_biq_vld && ctrl_ir_inst3_biq_vld;
*/ 
//new logic  //add by xlx
assign ctrl_ir_pre_dis_3_biq_inst =
            ctrl_ir_inst0_biq_vld && ctrl_ir_inst1_biq_vld && ctrl_ir_inst2_biq_vld
         || ctrl_ir_inst0_biq_vld && ctrl_ir_inst1_biq_vld && ctrl_ir_inst3_biq_vld
         || ctrl_ir_inst0_biq_vld && ctrl_ir_inst1_biq_vld && ctrl_ir_inst4_biq_vld
         || ctrl_ir_inst0_biq_vld && ctrl_ir_inst2_biq_vld && ctrl_ir_inst3_biq_vld
         || ctrl_ir_inst0_biq_vld && ctrl_ir_inst2_biq_vld && ctrl_ir_inst4_biq_vld
         || ctrl_ir_inst0_biq_vld && ctrl_ir_inst3_biq_vld && ctrl_ir_inst4_biq_vld                           
         || ctrl_ir_inst1_biq_vld && ctrl_ir_inst2_biq_vld && ctrl_ir_inst3_biq_vld
         || ctrl_ir_inst1_biq_vld && ctrl_ir_inst2_biq_vld && ctrl_ir_inst4_biq_vld
         || ctrl_ir_inst1_biq_vld && ctrl_ir_inst3_biq_vld && ctrl_ir_inst4_biq_vld
         || ctrl_ir_inst2_biq_vld && ctrl_ir_inst3_biq_vld && ctrl_ir_inst4_biq_vld ;
/*
assign ctrl_ir_pre_dis_3_aiq0_inst =
            ctrl_ir_inst0_aiq0_vld && ctrl_ir_inst1_aiq0_vld && ctrl_ir_inst2_aiq0_vld
         || ctrl_ir_inst0_aiq0_vld && ctrl_ir_inst1_aiq0_vld && ctrl_ir_inst3_aiq0_vld
         || ctrl_ir_inst0_aiq0_vld && ctrl_ir_inst2_aiq0_vld && ctrl_ir_inst3_aiq0_vld
         || ctrl_ir_inst1_aiq0_vld && ctrl_ir_inst2_aiq0_vld && ctrl_ir_inst3_aiq0_vld;*/
//add by xlx
assign ctrl_ir_pre_dis_3_aiq0_inst =
            ctrl_ir_inst0_aiq0_vld && ctrl_ir_inst1_aiq0_vld && ctrl_ir_inst2_aiq0_vld
         || ctrl_ir_inst0_aiq0_vld && ctrl_ir_inst1_aiq0_vld && ctrl_ir_inst3_aiq0_vld
         || ctrl_ir_inst0_aiq0_vld && ctrl_ir_inst1_aiq0_vld && ctrl_ir_inst4_aiq0_vld
         || ctrl_ir_inst0_aiq0_vld && ctrl_ir_inst2_aiq0_vld && ctrl_ir_inst3_aiq0_vld
         || ctrl_ir_inst0_aiq0_vld && ctrl_ir_inst2_aiq0_vld && ctrl_ir_inst4_aiq0_vld
         || ctrl_ir_inst0_aiq0_vld && ctrl_ir_inst3_aiq0_vld && ctrl_ir_inst4_aiq0_vld                           
         || ctrl_ir_inst1_aiq0_vld && ctrl_ir_inst2_aiq0_vld && ctrl_ir_inst3_aiq0_vld
         || ctrl_ir_inst1_aiq0_vld && ctrl_ir_inst2_aiq0_vld && ctrl_ir_inst4_aiq0_vld
         || ctrl_ir_inst1_aiq0_vld && ctrl_ir_inst3_aiq0_vld && ctrl_ir_inst4_aiq0_vld
         || ctrl_ir_inst2_aiq0_vld && ctrl_ir_inst3_aiq0_vld && ctrl_ir_inst4_aiq0_vld ;

/*
assign ctrl_ir_pre_dis_3_aiq1_inst =
            ctrl_ir_inst0_aiq1_vld && ctrl_ir_inst1_aiq1_vld && ctrl_ir_inst2_aiq1_vld
         || ctrl_ir_inst0_aiq1_vld && ctrl_ir_inst1_aiq1_vld && ctrl_ir_inst3_aiq1_vld
         || ctrl_ir_inst0_aiq1_vld && ctrl_ir_inst2_aiq1_vld && ctrl_ir_inst3_aiq1_vld
         || ctrl_ir_inst1_aiq1_vld && ctrl_ir_inst2_aiq1_vld && ctrl_ir_inst3_aiq1_vld;*/
//add by xlx
assign ctrl_ir_pre_dis_3_aiq1_inst =
            ctrl_ir_inst0_aiq1_vld && ctrl_ir_inst1_aiq1_vld && ctrl_ir_inst2_aiq1_vld
         || ctrl_ir_inst0_aiq1_vld && ctrl_ir_inst1_aiq1_vld && ctrl_ir_inst3_aiq1_vld
         || ctrl_ir_inst0_aiq1_vld && ctrl_ir_inst1_aiq1_vld && ctrl_ir_inst4_aiq1_vld
         || ctrl_ir_inst0_aiq1_vld && ctrl_ir_inst2_aiq1_vld && ctrl_ir_inst3_aiq1_vld
         || ctrl_ir_inst0_aiq1_vld && ctrl_ir_inst2_aiq1_vld && ctrl_ir_inst4_aiq1_vld
         || ctrl_ir_inst0_aiq1_vld && ctrl_ir_inst3_aiq1_vld && ctrl_ir_inst4_aiq1_vld                           
         || ctrl_ir_inst1_aiq1_vld && ctrl_ir_inst2_aiq1_vld && ctrl_ir_inst3_aiq1_vld
         || ctrl_ir_inst1_aiq1_vld && ctrl_ir_inst2_aiq1_vld && ctrl_ir_inst4_aiq1_vld
         || ctrl_ir_inst1_aiq1_vld && ctrl_ir_inst3_aiq1_vld && ctrl_ir_inst4_aiq1_vld
         || ctrl_ir_inst2_aiq1_vld && ctrl_ir_inst3_aiq1_vld && ctrl_ir_inst4_aiq1_vld ;
/*        
assign ctrl_ir_pre_dis_3_lsiq_inst =
            ctrl_ir_inst0_lsiq_vld && ctrl_ir_inst1_lsiq_vld && ctrl_ir_inst2_lsiq_vld
         || ctrl_ir_inst0_lsiq_vld && ctrl_ir_inst1_lsiq_vld && ctrl_ir_inst3_lsiq_vld
         || ctrl_ir_inst0_lsiq_vld && ctrl_ir_inst2_lsiq_vld && ctrl_ir_inst3_lsiq_vld
         || ctrl_ir_inst1_lsiq_vld && ctrl_ir_inst2_lsiq_vld && ctrl_ir_inst3_lsiq_vld;
*/
//add by xlx
assign ctrl_ir_pre_dis_3_lsiq_inst =
            ctrl_ir_inst0_lsiq_vld && ctrl_ir_inst1_lsiq_vld && ctrl_ir_inst2_lsiq_vld
         || ctrl_ir_inst0_lsiq_vld && ctrl_ir_inst1_lsiq_vld && ctrl_ir_inst3_lsiq_vld
         || ctrl_ir_inst0_lsiq_vld && ctrl_ir_inst1_lsiq_vld && ctrl_ir_inst4_lsiq_vld
         || ctrl_ir_inst0_lsiq_vld && ctrl_ir_inst2_lsiq_vld && ctrl_ir_inst3_lsiq_vld
         || ctrl_ir_inst0_lsiq_vld && ctrl_ir_inst2_lsiq_vld && ctrl_ir_inst4_lsiq_vld
         || ctrl_ir_inst0_lsiq_vld && ctrl_ir_inst3_lsiq_vld && ctrl_ir_inst4_lsiq_vld                           
         || ctrl_ir_inst1_lsiq_vld && ctrl_ir_inst2_lsiq_vld && ctrl_ir_inst3_lsiq_vld
         || ctrl_ir_inst1_lsiq_vld && ctrl_ir_inst2_lsiq_vld && ctrl_ir_inst4_lsiq_vld
         || ctrl_ir_inst1_lsiq_vld && ctrl_ir_inst3_lsiq_vld && ctrl_ir_inst4_lsiq_vld
         || ctrl_ir_inst2_lsiq_vld && ctrl_ir_inst3_lsiq_vld && ctrl_ir_inst4_lsiq_vld; 
/*
assign ctrl_ir_pre_dis_3_viq0_inst =
            ctrl_ir_inst0_viq0_vld && ctrl_ir_inst1_viq0_vld && ctrl_ir_inst2_viq0_vld
         || ctrl_ir_inst0_viq0_vld && ctrl_ir_inst1_viq0_vld && ctrl_ir_inst3_viq0_vld
         || ctrl_ir_inst0_viq0_vld && ctrl_ir_inst2_viq0_vld && ctrl_ir_inst3_viq0_vld
         || ctrl_ir_inst1_viq0_vld && ctrl_ir_inst2_viq0_vld && ctrl_ir_inst3_viq0_vld;
*/
//add by xlx
assign ctrl_ir_pre_dis_3_viq0_inst =
            ctrl_ir_inst0_viq0_vld && ctrl_ir_inst1_viq0_vld && ctrl_ir_inst2_viq0_vld
         || ctrl_ir_inst0_viq0_vld && ctrl_ir_inst1_viq0_vld && ctrl_ir_inst3_viq0_vld
         || ctrl_ir_inst0_viq0_vld && ctrl_ir_inst1_viq0_vld && ctrl_ir_inst4_viq0_vld
         || ctrl_ir_inst0_viq0_vld && ctrl_ir_inst2_viq0_vld && ctrl_ir_inst3_viq0_vld
         || ctrl_ir_inst0_viq0_vld && ctrl_ir_inst2_viq0_vld && ctrl_ir_inst4_viq0_vld
         || ctrl_ir_inst0_viq0_vld && ctrl_ir_inst3_viq0_vld && ctrl_ir_inst4_viq0_vld                           
         || ctrl_ir_inst1_viq0_vld && ctrl_ir_inst2_viq0_vld && ctrl_ir_inst3_viq0_vld
         || ctrl_ir_inst1_viq0_vld && ctrl_ir_inst2_viq0_vld && ctrl_ir_inst4_viq0_vld
         || ctrl_ir_inst1_viq0_vld && ctrl_ir_inst3_viq0_vld && ctrl_ir_inst4_viq0_vld
         || ctrl_ir_inst2_viq0_vld && ctrl_ir_inst3_viq0_vld && ctrl_ir_inst4_viq0_vld ;
/*
assign ctrl_ir_pre_dis_3_viq1_inst =
            ctrl_ir_inst0_viq1_vld && ctrl_ir_inst1_viq1_vld && ctrl_ir_inst2_viq1_vld
         || ctrl_ir_inst0_viq1_vld && ctrl_ir_inst1_viq1_vld && ctrl_ir_inst3_viq1_vld
         || ctrl_ir_inst0_viq1_vld && ctrl_ir_inst2_viq1_vld && ctrl_ir_inst3_viq1_vld
         || ctrl_ir_inst1_viq1_vld && ctrl_ir_inst2_viq1_vld && ctrl_ir_inst3_viq1_vld;
*/
//add by xlx
assign ctrl_ir_pre_dis_3_viq1_inst =
            ctrl_ir_inst0_viq1_vld && ctrl_ir_inst1_viq1_vld && ctrl_ir_inst2_viq1_vld
         || ctrl_ir_inst0_viq1_vld && ctrl_ir_inst1_viq1_vld && ctrl_ir_inst3_viq1_vld
         || ctrl_ir_inst0_viq1_vld && ctrl_ir_inst1_viq1_vld && ctrl_ir_inst4_viq1_vld
         || ctrl_ir_inst0_viq1_vld && ctrl_ir_inst2_viq1_vld && ctrl_ir_inst3_viq1_vld
         || ctrl_ir_inst0_viq1_vld && ctrl_ir_inst2_viq1_vld && ctrl_ir_inst4_viq1_vld
         || ctrl_ir_inst0_viq1_vld && ctrl_ir_inst3_viq1_vld && ctrl_ir_inst4_viq1_vld                           
         || ctrl_ir_inst1_viq1_vld && ctrl_ir_inst2_viq1_vld && ctrl_ir_inst3_viq1_vld
         || ctrl_ir_inst1_viq1_vld && ctrl_ir_inst2_viq1_vld && ctrl_ir_inst4_viq1_vld
         || ctrl_ir_inst1_viq1_vld && ctrl_ir_inst3_viq1_vld && ctrl_ir_inst4_viq1_vld
         || ctrl_ir_inst2_viq1_vld && ctrl_ir_inst3_viq1_vld && ctrl_ir_inst4_viq1_vld ;


assign ctrl_ir_pre_dis_type_stall_pipedown2 = ctrl_ir_pre_dis_3_biq_inst
                                           || ctrl_ir_pre_dis_3_aiq0_inst
                                           || ctrl_ir_pre_dis_3_aiq1_inst
                                           || ctrl_ir_pre_dis_3_lsiq_inst
                                           || ctrl_ir_pre_dis_3_viq0_inst
                                           || ctrl_ir_pre_dis_3_viq1_inst;
//sdiq 为什么不会发生type stall？



assign ctrl_ir_pre_dis_pipedown2  = ir_pipedown_inst2_vld
                                    && ctrl_ir_pre_dis_type_stall_pipedown2;

//----------------------------------------------------------
//           prepare dispatch IQ create signals
//----------------------------------------------------------
assign ctrl_ir_pre_dis_inst0_aiq0       = ctrl_ir_pre_dis_inst0_vld
                                          && ctrl_ir_inst0_aiq0;
assign ctrl_ir_pre_dis_inst1_aiq0       = ctrl_ir_pre_dis_inst1_vld
                                          && ctrl_ir_inst1_aiq0;
assign ctrl_ir_pre_dis_inst2_aiq0       = ctrl_ir_pre_dis_inst2_vld
                                          && ctrl_ir_inst2_aiq0;
assign ctrl_ir_pre_dis_inst3_aiq0       = ctrl_ir_pre_dis_inst3_vld
                                          && ctrl_ir_inst3_aiq0;
assign ctrl_ir_pre_dis_inst4_aiq0       = ctrl_ir_pre_dis_inst4_vld
                                          && ctrl_ir_inst4_aiq0;//add uop5 //add by xlx

assign ctrl_ir_pre_dis_inst0_aiq01      = ctrl_ir_pre_dis_inst0_vld
                                          && ctrl_ir_inst0_aiq01;
assign ctrl_ir_pre_dis_inst1_aiq01      = ctrl_ir_pre_dis_inst1_vld
                                          && ctrl_ir_inst1_aiq01;
assign ctrl_ir_pre_dis_inst2_aiq01      = ctrl_ir_pre_dis_inst2_vld
                                          && ctrl_ir_inst2_aiq01;
assign ctrl_ir_pre_dis_inst3_aiq01      = ctrl_ir_pre_dis_inst3_vld
                                          && ctrl_ir_inst3_aiq01;
assign ctrl_ir_pre_dis_inst4_aiq01       = ctrl_ir_pre_dis_inst4_vld
                                          && ctrl_ir_inst4_aiq01;//add uop5 //add by xlx


assign ctrl_ir_pre_dis_inst0_aiq1       = ctrl_ir_pre_dis_inst0_vld
                                          && ctrl_ir_inst0_aiq1;
assign ctrl_ir_pre_dis_inst1_aiq1       = ctrl_ir_pre_dis_inst1_vld
                                          && ctrl_ir_inst1_aiq1;
assign ctrl_ir_pre_dis_inst2_aiq1       = ctrl_ir_pre_dis_inst2_vld
                                          && ctrl_ir_inst2_aiq1;
assign ctrl_ir_pre_dis_inst3_aiq1       = ctrl_ir_pre_dis_inst3_vld
                                          && ctrl_ir_inst3_aiq1;
assign ctrl_ir_pre_dis_inst4_aiq1       = ctrl_ir_pre_dis_inst4_vld
                                          && ctrl_ir_inst4_aiq1;//add uop5 //add by xlx
 
assign ctrl_ir_pre_dis_inst0_biq        = ctrl_ir_pre_dis_inst0_vld
                                          && ctrl_ir_inst0_biq;
assign ctrl_ir_pre_dis_inst1_biq        = ctrl_ir_pre_dis_inst1_vld
                                          && ctrl_ir_inst1_biq;
assign ctrl_ir_pre_dis_inst2_biq        = ctrl_ir_pre_dis_inst2_vld
                                          && ctrl_ir_inst2_biq;
assign ctrl_ir_pre_dis_inst3_biq        = ctrl_ir_pre_dis_inst3_vld
                                          && ctrl_ir_inst3_biq;
assign ctrl_ir_pre_dis_inst4_biq        = ctrl_ir_pre_dis_inst4_vld//add uop5 //add by xlx
                                          && ctrl_ir_inst4_biq;

assign ctrl_ir_pre_dis_inst0_lsiq       = ctrl_ir_pre_dis_inst0_vld
                                          && ctrl_ir_inst0_lsiq;
assign ctrl_ir_pre_dis_inst1_lsiq       = ctrl_ir_pre_dis_inst1_vld
                                          && ctrl_ir_inst1_lsiq;
assign ctrl_ir_pre_dis_inst2_lsiq       = ctrl_ir_pre_dis_inst2_vld
                                          && ctrl_ir_inst2_lsiq;
assign ctrl_ir_pre_dis_inst3_lsiq       = ctrl_ir_pre_dis_inst3_vld
                                          && ctrl_ir_inst3_lsiq;
assign ctrl_ir_pre_dis_inst4_lsiq       = ctrl_ir_pre_dis_inst4_vld//add uop5 //add by xlx
                                          && ctrl_ir_inst4_lsiq;

assign ctrl_ir_pre_dis_inst0_sdiq       = ctrl_ir_pre_dis_inst0_vld
                                          && ctrl_ir_inst0_sdiq;
assign ctrl_ir_pre_dis_inst1_sdiq       = ctrl_ir_pre_dis_inst1_vld
                                          && ctrl_ir_inst1_sdiq;
assign ctrl_ir_pre_dis_inst2_sdiq       = ctrl_ir_pre_dis_inst2_vld
                                          && ctrl_ir_inst2_sdiq;
assign ctrl_ir_pre_dis_inst3_sdiq       = ctrl_ir_pre_dis_inst3_vld
                                          && ctrl_ir_inst3_sdiq;
assign ctrl_ir_pre_dis_inst4_sdiq       = ctrl_ir_pre_dis_inst4_vld//add uop5 //add by xlx
                                          && ctrl_ir_inst4_sdiq;

assign ctrl_ir_pre_dis_inst0_viq0       = ctrl_ir_pre_dis_inst0_vld
                                          && ctrl_ir_inst0_viq0;
assign ctrl_ir_pre_dis_inst1_viq0       = ctrl_ir_pre_dis_inst1_vld
                                          && ctrl_ir_inst1_viq0;
assign ctrl_ir_pre_dis_inst2_viq0       = ctrl_ir_pre_dis_inst2_vld
                                          && ctrl_ir_inst2_viq0;
assign ctrl_ir_pre_dis_inst3_viq0       = ctrl_ir_pre_dis_inst3_vld
                                          && ctrl_ir_inst3_viq0;
assign ctrl_ir_pre_dis_inst4_sdiq       = ctrl_ir_pre_dis_inst4_vld//add uop5 //add by xlx
                                          && ctrl_ir_inst4_sdiq;


assign ctrl_ir_pre_dis_inst0_viq01      = ctrl_ir_pre_dis_inst0_vld
                                          && ctrl_ir_inst0_viq01;
assign ctrl_ir_pre_dis_inst1_viq01      = ctrl_ir_pre_dis_inst1_vld
                                          && ctrl_ir_inst1_viq01;
assign ctrl_ir_pre_dis_inst2_viq01      = ctrl_ir_pre_dis_inst2_vld
                                          && ctrl_ir_inst2_viq01;
assign ctrl_ir_pre_dis_inst3_viq01      = ctrl_ir_pre_dis_inst3_vld
                                          && ctrl_ir_inst3_viq01;
assign ctrl_ir_pre_dis_inst4_viq01      = ctrl_ir_pre_dis_inst4_vld//add uop5 //add by xlx
                                          && ctrl_ir_inst4_viq01;

assign ctrl_ir_pre_dis_inst0_viq1       = ctrl_ir_pre_dis_inst0_vld
                                          && ctrl_ir_inst0_viq1;
assign ctrl_ir_pre_dis_inst1_viq1       = ctrl_ir_pre_dis_inst1_vld
                                          && ctrl_ir_inst1_viq1;
assign ctrl_ir_pre_dis_inst2_viq1       = ctrl_ir_pre_dis_inst2_vld
                                          && ctrl_ir_inst2_viq1;
assign ctrl_ir_pre_dis_inst3_viq1       = ctrl_ir_pre_dis_inst3_vld
                                          && ctrl_ir_inst3_viq1;
assign ctrl_ir_pre_dis_inst4_viq1       = ctrl_ir_pre_dis_inst4_vld//add uop5 //add by xlx
                                          && ctrl_ir_inst4_viq1;

assign ctrl_ir_pre_dis_inst0_vmb        = ctrl_ir_pre_dis_inst0_vld
                                          && ctrl_ir_inst0_vmb;
assign ctrl_ir_pre_dis_inst1_vmb        = ctrl_ir_pre_dis_inst1_vld
                                          && ctrl_ir_inst1_vmb;
assign ctrl_ir_pre_dis_inst2_vmb        = ctrl_ir_pre_dis_inst2_vld
                                          && ctrl_ir_inst2_vmb;
assign ctrl_ir_pre_dis_inst3_vmb        = ctrl_ir_pre_dis_inst3_vld
                                          && ctrl_ir_inst3_vmb;
assign ctrl_ir_pre_dis_inst4_vmb        = ctrl_ir_pre_dis_inst4_vld//add uop5 //add by xlx
                                          && ctrl_ir_inst4_vmb;//vmb maybe vec? xlx
                                      
//----------------------------------------------------------
//           AIQ0 and AIQ1 create enable prepare
//----------------------------------------------------------
//aiq0 inst number
assign ctrl_ir_pre_dis_al_1_aiq0_inst = ctrl_ir_pre_dis_inst0_aiq0
                                     || ctrl_ir_pre_dis_inst1_aiq0
                                     || ctrl_ir_pre_dis_inst2_aiq0
                                     || ctrl_ir_pre_dis_inst3_aiq0
                                     || ctrl_ir_pre_dis_inst4_aiq0; //add uop5 //add by xlx
//origin logic
/*
assign ctrl_ir_pre_dis_al_2_aiq0_inst = 
            ctrl_ir_pre_dis_inst0_aiq0 && ctrl_ir_pre_dis_inst1_aiq0
         || ctrl_ir_pre_dis_inst0_aiq0 && ctrl_ir_pre_dis_inst2_aiq0
         || ctrl_ir_pre_dis_inst0_aiq0 && ctrl_ir_pre_dis_inst3_aiq0
         || ctrl_ir_pre_dis_inst1_aiq0 && ctrl_ir_pre_dis_inst2_aiq0
         || ctrl_ir_pre_dis_inst1_aiq0 && ctrl_ir_pre_dis_inst3_aiq0
         || ctrl_ir_pre_dis_inst2_aiq0 && ctrl_ir_pre_dis_inst3_aiq0;*/
//new logic //add by xlx
assign ctrl_ir_pre_dis_al_2_aiq0_inst = 
            ctrl_ir_pre_dis_inst0_aiq0 && ctrl_ir_pre_dis_inst1_aiq0
         || ctrl_ir_pre_dis_inst0_aiq0 && ctrl_ir_pre_dis_inst2_aiq0
         || ctrl_ir_pre_dis_inst0_aiq0 && ctrl_ir_pre_dis_inst3_aiq0
         || ctrl_ir_pre_dis_inst0_aiq0 && ctrl_ir_pre_dis_inst4_aiq0        
         || ctrl_ir_pre_dis_inst1_aiq0 && ctrl_ir_pre_dis_inst2_aiq0
         || ctrl_ir_pre_dis_inst1_aiq0 && ctrl_ir_pre_dis_inst3_aiq0
         || ctrl_ir_pre_dis_inst1_aiq0 && ctrl_ir_pre_dis_inst4_aiq0         
         || ctrl_ir_pre_dis_inst2_aiq0 && ctrl_ir_pre_dis_inst3_aiq0
         || ctrl_ir_pre_dis_inst2_aiq0 && ctrl_ir_pre_dis_inst4_aiq0  
         || ctrl_ir_pre_dis_inst3_aiq0 && ctrl_ir_pre_dis_inst4_aiq0;                 
//aiq1 inst number
assign ctrl_ir_pre_dis_al_1_aiq1_inst = ctrl_ir_pre_dis_inst0_aiq1
                                     || ctrl_ir_pre_dis_inst1_aiq1
                                     || ctrl_ir_pre_dis_inst2_aiq1
                                     || ctrl_ir_pre_dis_inst3_aiq1
                                     || ctrl_ir_pre_dis_inst4_aiq1;//add uop5 //add by xlx
/*origin logic
assign ctrl_ir_pre_dis_al_2_aiq1_inst = 
            ctrl_ir_pre_dis_inst0_aiq1 && ctrl_ir_pre_dis_inst1_aiq1
         || ctrl_ir_pre_dis_inst0_aiq1 && ctrl_ir_pre_dis_inst2_aiq1
         || ctrl_ir_pre_dis_inst0_aiq1 && ctrl_ir_pre_dis_inst3_aiq1
         || ctrl_ir_pre_dis_inst1_aiq1 && ctrl_ir_pre_dis_inst2_aiq1
         || ctrl_ir_pre_dis_inst1_aiq1 && ctrl_ir_pre_dis_inst3_aiq1
         || ctrl_ir_pre_dis_inst2_aiq1 && ctrl_ir_pre_dis_inst3_aiq1;*/
//add by xlx
assign ctrl_ir_pre_dis_al_2_aiq1_inst = 
            ctrl_ir_pre_dis_inst0_aiq1 && ctrl_ir_pre_dis_inst1_aiq1
         || ctrl_ir_pre_dis_inst0_aiq1 && ctrl_ir_pre_dis_inst2_aiq1
         || ctrl_ir_pre_dis_inst0_aiq1 && ctrl_ir_pre_dis_inst3_aiq1
         || ctrl_ir_pre_dis_inst0_aiq1 && ctrl_ir_pre_dis_inst4_aiq1        
         || ctrl_ir_pre_dis_inst1_aiq1 && ctrl_ir_pre_dis_inst2_aiq1
         || ctrl_ir_pre_dis_inst1_aiq1 && ctrl_ir_pre_dis_inst3_aiq1
         || ctrl_ir_pre_dis_inst1_aiq1 && ctrl_ir_pre_dis_inst4_aiq1         
         || ctrl_ir_pre_dis_inst2_aiq1 && ctrl_ir_pre_dis_inst3_aiq1
         || ctrl_ir_pre_dis_inst2_aiq1 && ctrl_ir_pre_dis_inst4_aiq1  
         || ctrl_ir_pre_dis_inst3_aiq1 && ctrl_ir_pre_dis_inst4_aiq1;      

//aiq01 inst number
assign ctrl_ir_pre_dis_al_1_aiq01_inst = ctrl_ir_pre_dis_inst0_aiq01
                                      || ctrl_ir_pre_dis_inst1_aiq01
                                      || ctrl_ir_pre_dis_inst2_aiq01
                                      || ctrl_ir_pre_dis_inst3_aiq01
                                      || ctrl_ir_pre_dis_inst4_aiq01;//add uop5 //add by xlx
/* origin logic
assign ctrl_ir_pre_dis_al_2_aiq01_inst = 
            ctrl_ir_pre_dis_inst0_aiq01 && ctrl_ir_pre_dis_inst1_aiq01
         || ctrl_ir_pre_dis_inst0_aiq01 && ctrl_ir_pre_dis_inst2_aiq01
         || ctrl_ir_pre_dis_inst0_aiq01 && ctrl_ir_pre_dis_inst3_aiq01
         || ctrl_ir_pre_dis_inst1_aiq01 && ctrl_ir_pre_dis_inst2_aiq01
         || ctrl_ir_pre_dis_inst1_aiq01 && ctrl_ir_pre_dis_inst3_aiq01
         || ctrl_ir_pre_dis_inst2_aiq01 && ctrl_ir_pre_dis_inst3_aiq01;*/
//add by xlx
assign ctrl_ir_pre_dis_al_2_aiq01_inst = 
            ctrl_ir_pre_dis_inst0_aiq01 && ctrl_ir_pre_dis_inst1_aiq01
         || ctrl_ir_pre_dis_inst0_aiq01 && ctrl_ir_pre_dis_inst2_aiq01
         || ctrl_ir_pre_dis_inst0_aiq01 && ctrl_ir_pre_dis_inst3_aiq01
         || ctrl_ir_pre_dis_inst0_aiq01 && ctrl_ir_pre_dis_inst4_aiq01        
         || ctrl_ir_pre_dis_inst1_aiq01 && ctrl_ir_pre_dis_inst2_aiq01
         || ctrl_ir_pre_dis_inst1_aiq01 && ctrl_ir_pre_dis_inst3_aiq01
         || ctrl_ir_pre_dis_inst1_aiq01 && ctrl_ir_pre_dis_inst4_aiq01         
         || ctrl_ir_pre_dis_inst2_aiq01 && ctrl_ir_pre_dis_inst3_aiq01
         || ctrl_ir_pre_dis_inst2_aiq01 && ctrl_ir_pre_dis_inst4_aiq01  
         || ctrl_ir_pre_dis_inst3_aiq01 && ctrl_ir_pre_dis_inst4_aiq01;      
//add new condition //add by xlx
assign ctrl_ir_pre_dis_al_3_aiq01_inst =
               ctrl_ir_pre_dis_inst0_aiq01
            && ctrl_ir_pre_dis_inst1_aiq01
            && ctrl_ir_pre_dis_inst2_aiq01
         ||    ctrl_ir_pre_dis_inst0_aiq01
            && ctrl_ir_pre_dis_inst1_aiq01
            && ctrl_ir_pre_dis_inst3_aiq01

         ||    ctrl_ir_pre_dis_inst0_aiq01//add logic //add by xlx
            && ctrl_ir_pre_dis_inst1_aiq01
            && ctrl_ir_pre_dis_inst4_aiq01

         ||    ctrl_ir_pre_dis_inst0_aiq01
            && ctrl_ir_pre_dis_inst2_aiq01
            && ctrl_ir_pre_dis_inst3_aiq01
            
         ||    ctrl_ir_pre_dis_inst0_aiq01//add new logic //add by xlx
            && ctrl_ir_pre_dis_inst2_aiq01
            && ctrl_ir_pre_dis_inst4_aiq01

         ||    ctrl_ir_pre_dis_inst0_aiq01//add new logic //add by xlx
            && ctrl_ir_pre_dis_inst3_aiq01
            && ctrl_ir_pre_dis_inst4_aiq01

         ||    ctrl_ir_pre_dis_inst1_aiq01
            && ctrl_ir_pre_dis_inst2_aiq01
            && ctrl_ir_pre_dis_inst3_aiq01

         ||    ctrl_ir_pre_dis_inst1_aiq01//add new logic //add by xlx
            && ctrl_ir_pre_dis_inst2_aiq01
            && ctrl_ir_pre_dis_inst4_aiq01

         ||    ctrl_ir_pre_dis_inst1_aiq01//add new logic //add by xlx
            && ctrl_ir_pre_dis_inst3_aiq01
            && ctrl_ir_pre_dis_inst4_aiq01

         ||    ctrl_ir_pre_dis_inst2_aiq01//add new logic //add by xlx
            && ctrl_ir_pre_dis_inst3_aiq01
            && ctrl_ir_pre_dis_inst4_aiq01;


assign ctrl_ir_pre_dis_al_4_aiq01_inst = ctrl_ir_pre_dis_inst0_aiq01
                                      && ctrl_ir_pre_dis_inst1_aiq01
                                      && ctrl_ir_pre_dis_inst2_aiq01
                                      && ctrl_ir_pre_dis_inst3_aiq01;

//----------------------------------------------------------
//               AIQ0 and AIQ1 create enable
//----------------------------------------------------------
//aiq01 inst create use priority: aiq0_c0 > aiq1_c0 > aiq0_c1 > aiq1_c1
//aiq0 create0 enable aiq01
assign ctrl_ir_pre_dis_aiq0_create0_en = 
            ctrl_ir_pre_dis_al_1_aiq0_inst
         || ctrl_ir_pre_dis_al_1_aiq01_inst;
//aiq0 create1 enable
assign ctrl_ir_pre_dis_aiq0_create1_en =
            ctrl_ir_pre_dis_al_2_aiq0_inst

         || ctrl_ir_pre_dis_al_1_aiq01_inst
            && (ctrl_ir_pre_dis_al_1_aiq0_inst && ctrl_ir_pre_dis_al_1_aiq1_inst)

         || ctrl_ir_pre_dis_al_2_aiq01_inst
            && (ctrl_ir_pre_dis_al_1_aiq0_inst || ctrl_ir_pre_dis_al_1_aiq1_inst)

         || ctrl_ir_pre_dis_al_3_aiq01_inst;
//aiq1 create0 enable
assign ctrl_ir_pre_dis_aiq1_create0_en =
            ctrl_ir_pre_dis_al_1_aiq1_inst
         || ctrl_ir_pre_dis_al_1_aiq0_inst
            && ctrl_ir_pre_dis_al_1_aiq01_inst//1个aiq0 一个aiq01 ，aiq01会分配给aiq1
         || ctrl_ir_pre_dis_al_2_aiq01_inst;
//aiq1 create1 enable1
assign ctrl_ir_pre_dis_aiq1_create1_en =
            ctrl_ir_pre_dis_al_2_aiq1_inst
         || ctrl_ir_pre_dis_al_1_aiq01_inst
            && ctrl_ir_pre_dis_al_2_aiq0_inst && ctrl_ir_pre_dis_al_1_aiq1_inst
         || ctrl_ir_pre_dis_al_2_aiq01_inst
            && (ctrl_ir_pre_dis_al_2_aiq0_inst
             || ctrl_ir_pre_dis_al_1_aiq0_inst && ctrl_ir_pre_dis_al_1_aiq1_inst)
         || ctrl_ir_pre_dis_al_3_aiq01_inst
            && (ctrl_ir_pre_dis_al_1_aiq0_inst || ctrl_ir_pre_dis_al_1_aiq1_inst)
         || ctrl_ir_pre_dis_al_4_aiq01_inst;

//----------------------------------------------------------
//                  AIQ0 create 0 select
//----------------------------------------------------------
//AIQ0 create0 select

//add uop5 logic //add by xlx
assign ctrl_ir_pre_dis_aiq0_create0_sel_inst0 =
              ctrl_ir_pre_dis_inst0_aiq0
           || ctrl_ir_pre_dis_inst0_aiq01
              && !(ctrl_ir_pre_dis_inst1_aiq0
                || ctrl_ir_pre_dis_inst2_aiq0
                || ctrl_ir_pre_dis_inst3_aiq0
                || ctrl_ir_pre_dis_inst4_aiq0//add uop5 //add by xlx
                );
assign ctrl_ir_pre_dis_aiq0_create0_sel_inst1 =
              ctrl_ir_pre_dis_inst1_aiq0
           || ctrl_ir_pre_dis_inst1_aiq01
              && !(ctrl_ir_pre_dis_inst2_aiq0
                || ctrl_ir_pre_dis_inst3_aiq0
                || ctrl_ir_pre_dis_inst4_aiq0//add uop5 //add by xlx
                );
assign ctrl_ir_pre_dis_aiq0_create0_sel_inst2 =
              ctrl_ir_pre_dis_inst2_aiq0
           || ctrl_ir_pre_dis_inst2_aiq01
              && !ctrl_ir_pre_dis_inst3_aiq0
              && !ctrl_ir_pre_dis_inst4_aiq0//add uop5 //add by xlx
              ;
//add sel uop4 logic //add by xlx
assign ctrl_ir_pre_dis_aiq0_create0_sel_inst3 =
              ctrl_ir_pre_dis_inst3_aiq0
           || ctrl_ir_pre_dis_inst3_aiq01
              && !ctrl_ir_pre_dis_inst4_aiq0//add uop5 //add by xlx
              ;

// &CombBeg; @862

//add new logic 扩展标志位
always @( ctrl_ir_pre_dis_aiq0_create0_sel_inst0
       or ctrl_ir_pre_dis_aiq0_create0_sel_inst2
       or ctrl_ir_pre_dis_aiq0_create0_sel_inst1
       or ctrl_ir_pre_dis_aiq0_create0_sel_inst3)
begin
  if(ctrl_ir_pre_dis_aiq0_create0_sel_inst0)
    ctrl_ir_pre_dis_aiq0_create0_sel[2:0] = 2'd0; //sel inst 0 
  else if(ctrl_ir_pre_dis_aiq0_create0_sel_inst1)
    ctrl_ir_pre_dis_aiq0_create0_sel[2:0] = 2'd1; //sel inst 1
  else if(ctrl_ir_pre_dis_aiq0_create0_sel_inst2)
    ctrl_ir_pre_dis_aiq0_create0_sel[2:0] = 2'd2; //sel inst 2
  else if (ctrl_ir_pre_dis_aiq0_create0_sel_inst3)//add new logic       //sel inst 3  //add by xlx
    ctrl_ir_pre_dis_aiq0_create0_sel[2:0] = 2'd3;
  else
    ctrl_ir_pre_dis_aiq0_create0_sel[2:0] = 2'd4;//sel inst 4 //add by xlx
// &CombEnd; @871
end

//----------------------------------------------------------
//                  AIQ0 create 1 select
//----------------------------------------------------------
//origin logic
/*assign ctrl_ir_pre_dis_inst123_aiq0 = ctrl_ir_pre_dis_inst1_aiq0
                                   || ctrl_ir_pre_dis_inst2_aiq0
                                   || ctrl_ir_pre_dis_inst3_aiq0;*/
//判断1234中有无 aiq0类型的
//add by xlx
assign ctrl_ir_pre_dis_inst1234_aiq0 = ctrl_ir_pre_dis_inst1_aiq0
                                   || ctrl_ir_pre_dis_inst2_aiq0
                                   || ctrl_ir_pre_dis_inst3_aiq0
                                   || ctrl_ir_pre_dis_inst4_aiq0;
/*
assign ctrl_ir_pre_dis_inst123_aiq1 = ctrl_ir_pre_dis_inst1_aiq1
                                   || ctrl_ir_pre_dis_inst2_aiq1
                                   || ctrl_ir_pre_dis_inst3_aiq1;*/
//判断1234中有无 aiq1类型的
//add by xlx
assign ctrl_ir_pre_dis_inst1234_aiq1 = ctrl_ir_pre_dis_inst1_aiq1
                                    || ctrl_ir_pre_dis_inst2_aiq1
                                    || ctrl_ir_pre_dis_inst3_aiq1
                                    || ctrl_ir_pre_dis_inst4_aiq1;
/*origin logic
assign ctrl_ir_pre_dis_inst023_aiq0 = ctrl_ir_pre_dis_inst0_aiq0
                                   || ctrl_ir_pre_dis_inst2_aiq0
                                   || ctrl_ir_pre_dis_inst3_aiq0;*/
//new logic
//add by xlx
assign ctrl_ir_pre_dis_inst0234_aiq0 = ctrl_ir_pre_dis_inst0_aiq0
                                   || ctrl_ir_pre_dis_inst2_aiq0
                                   || ctrl_ir_pre_dis_inst3_aiq0
                                   || ctrl_ir_pre_dis_inst4_aiq0;
/*origin logic
assign ctrl_ir_pre_dis_inst023_aiq1 = ctrl_ir_pre_dis_inst0_aiq1
                                   || ctrl_ir_pre_dis_inst2_aiq1
                                   || ctrl_ir_pre_dis_inst3_aiq1;*/
//new logic
//add by xlx
assign ctrl_ir_pre_dis_inst0234_aiq1 = ctrl_ir_pre_dis_inst0_aiq1
                                   || ctrl_ir_pre_dis_inst2_aiq1
                                   || ctrl_ir_pre_dis_inst3_aiq1
                                   || ctrl_ir_pre_dis_inst4_aiq1;
//add uop5 logic
//origin logic
/*
assign ctrl_ir_pre_dis_inst013_aiq0 = ctrl_ir_pre_dis_inst0_aiq0
                                    || ctrl_ir_pre_dis_inst1_aiq0
                                    || ctrl_ir_pre_dis_inst3_aiq0;
*/
//add by xlx
assign ctrl_ir_pre_dis_inst0134_aiq0 = ctrl_ir_pre_dis_inst0_aiq0
                                    || ctrl_ir_pre_dis_inst1_aiq0
                                    || ctrl_ir_pre_dis_inst3_aiq0
                                    || ctrl_ir_pre_dis_inst4_aiq0;
//add by xlx
assign ctrl_ir_pre_dis_inst0124_aiq0 = ctrl_ir_pre_dis_inst0_aiq0
                                    || ctrl_ir_pre_dis_inst1_aiq0
                                    || ctrl_ir_pre_dis_inst2_aiq0
                                    || ctrl_ir_pre_dis_inst4_aiq0;
//add uop5 logic
//origin logic 
/*assign ctrl_ir_pre_dis_inst0134_aiq1 = ctrl_ir_pre_dis_inst0_aiq1
                                   || ctrl_ir_pre_dis_inst1_aiq1
                                   || ctrl_ir_pre_dis_inst3_aiq1;*/
//add by xlx
assign ctrl_ir_pre_dis_inst0134_aiq1 = ctrl_ir_pre_dis_inst0_aiq1
                                   || ctrl_ir_pre_dis_inst1_aiq1
                                   || ctrl_ir_pre_dis_inst3_aiq1
                                   || ctrl_ir_pre_dis_inst4_aiq1;
//add by xlx
assign ctrl_ir_pre_dis_inst0124_aiq1 = ctrl_ir_pre_dis_inst0_aiq1
                                   || ctrl_ir_pre_dis_inst1_aiq1
                                   || ctrl_ir_pre_dis_inst2_aiq1
                                   || ctrl_ir_pre_dis_inst4_aiq1;
                                   
//origin logic                                  
/*assign ctrl_ir_pre_dis_inst123_2_aiq0 =
            ctrl_ir_pre_dis_inst1_aiq0 && ctrl_ir_pre_dis_inst2_aiq0
         || ctrl_ir_pre_dis_inst1_aiq0 && ctrl_ir_pre_dis_inst3_aiq0
         || ctrl_ir_pre_dis_inst2_aiq0 && ctrl_ir_pre_dis_inst3_aiq0;*/

//add by xlx
 assign ctrl_ir_pre_dis_inst1234_2_aiq0 =
            ctrl_ir_pre_dis_inst1_aiq0 && ctrl_ir_pre_dis_inst2_aiq0
         || ctrl_ir_pre_dis_inst1_aiq0 && ctrl_ir_pre_dis_inst3_aiq0
         || ctrl_ir_pre_dis_inst1_aiq0 && ctrl_ir_pre_dis_inst4_aiq0        
         || ctrl_ir_pre_dis_inst2_aiq0 && ctrl_ir_pre_dis_inst3_aiq0
         || ctrl_ir_pre_dis_inst2_aiq0 && ctrl_ir_pre_dis_inst4_aiq0
         || ctrl_ir_pre_dis_inst3_aiq0 && ctrl_ir_pre_dis_inst4_aiq0;
/*
assign ctrl_ir_pre_dis_inst023_2_aiq0 =
            ctrl_ir_pre_dis_inst0_aiq0 && ctrl_ir_pre_dis_inst2_aiq0
         || ctrl_ir_pre_dis_inst0_aiq0 && ctrl_ir_pre_dis_inst3_aiq0
         || ctrl_ir_pre_dis_inst2_aiq0 && ctrl_ir_pre_dis_inst3_aiq0;*/
//new logic 0234里面有两条aiq0类型的
//add by xlx
assign ctrl_ir_pre_dis_inst0234_2_aiq0 =
            ctrl_ir_pre_dis_inst0_aiq0 && ctrl_ir_pre_dis_inst2_aiq0
         || ctrl_ir_pre_dis_inst0_aiq0 && ctrl_ir_pre_dis_inst3_aiq0
         || ctrl_ir_pre_dis_inst0_aiq0 && ctrl_ir_pre_dis_inst4_aiq0
         || ctrl_ir_pre_dis_inst2_aiq0 && ctrl_ir_pre_dis_inst3_aiq0
         || ctrl_ir_pre_dis_inst2_aiq0 && ctrl_ir_pre_dis_inst4_aiq0
         || ctrl_ir_pre_dis_inst3_aiq0 && ctrl_ir_pre_dis_inst4_aiq0;

//origin logic
/*
assign ctrl_ir_pre_dis_inst013_2_aiq0 =
            ctrl_ir_pre_dis_inst0_aiq0 && ctrl_ir_pre_dis_inst1_aiq0
         || ctrl_ir_pre_dis_inst0_aiq0 && ctrl_ir_pre_dis_inst3_aiq0
         || ctrl_ir_pre_dis_inst1_aiq0 && ctrl_ir_pre_dis_inst3_aiq0;*/
//new logic
//add by xlx
assign ctrl_ir_pre_dis_inst0134_2_aiq0 =
            ctrl_ir_pre_dis_inst0_aiq0 && ctrl_ir_pre_dis_inst1_aiq0
         || ctrl_ir_pre_dis_inst0_aiq0 && ctrl_ir_pre_dis_inst3_aiq0
         || ctrl_ir_pre_dis_inst0_aiq0 && ctrl_ir_pre_dis_inst4_aiq0
         || ctrl_ir_pre_dis_inst1_aiq0 && ctrl_ir_pre_dis_inst3_aiq0
         || ctrl_ir_pre_dis_inst1_aiq0 && ctrl_ir_pre_dis_inst4_aiq0
         || ctrl_ir_pre_dis_inst3_aiq0 && ctrl_ir_pre_dis_inst4_aiq0;
//add new logic
//add by xlx
assign ctrl_ir_pre_dis_inst0124_2_aiq0 =
            ctrl_ir_pre_dis_inst0_aiq0 && ctrl_ir_pre_dis_inst1_aiq0
         || ctrl_ir_pre_dis_inst0_aiq0 && ctrl_ir_pre_dis_inst2_aiq0
         || ctrl_ir_pre_dis_inst0_aiq0 && ctrl_ir_pre_dis_inst4_aiq0
         || ctrl_ir_pre_dis_inst1_aiq0 && ctrl_ir_pre_dis_inst2_aiq0
         || ctrl_ir_pre_dis_inst1_aiq0 && ctrl_ir_pre_dis_inst4_aiq0
         || ctrl_ir_pre_dis_inst1_aiq0 && ctrl_ir_pre_dis_inst4_aiq0 ;

//AIQ0 create1 select
/*
assign ctrl_ir_pre_dis_aiq0_create1_sel_inst0 =
              ctrl_ir_pre_dis_inst0_aiq01
              && ctrl_ir_pre_dis_inst123_aiq0 && ctrl_ir_pre_dis_inst123_aiq1
              && !ctrl_ir_pre_dis_inst123_2_aiq0;*/
//a0c0 >a1c0> a0c1>a1c1
//原逻辑：aiq0 c1如果是inst0 ，需要：
//inst0是aiq01类型的且 inst123中有aiq0和aiq1类型的
//如果没有inst1类型的那inst0会分配给aiq1
//且123中不能有两条aiq0类型的

//新逻辑 
//add by xlx
assign ctrl_ir_pre_dis_aiq0_create1_sel_inst0 =
              ctrl_ir_pre_dis_inst0_aiq01
              && ctrl_ir_pre_dis_inst1234_aiq0 && ctrl_ir_pre_dis_inst1234_aiq1
              && !ctrl_ir_pre_dis_inst1234_2_aiq0;
//原逻辑: aiq0 create1 sel inst1 需要：
//1.uop0和uop1 都是aiq0类型的
//2.uop1是 aiq01类型时，
  //023中有aiq0和aiq1
  // ||023中有aiq0 且inst0是aiq01
  // ||023中有aiq1 且inst0是aiq01
  //  且 023中没有两个aiq0
  /*
assign ctrl_ir_pre_dis_aiq0_create1_sel_inst1 =
              ctrl_ir_pre_dis_inst1_aiq0
              && ctrl_ir_pre_dis_inst0_aiq0
           || ctrl_ir_pre_dis_inst1_aiq01
              && (ctrl_ir_pre_dis_inst023_aiq0 && ctrl_ir_pre_dis_inst023_aiq1
               || ctrl_ir_pre_dis_inst023_aiq0 && ctrl_ir_pre_dis_inst0_aiq01
               || ctrl_ir_pre_dis_inst023_aiq1 && ctrl_ir_pre_dis_inst0_aiq01)
              && !ctrl_ir_pre_dis_inst023_2_aiq0;*/
//修改的新逻辑为
//1.uop0和uop1 都是aiq0类型的
//2.uop1是 aiq01类型时，
  //0234中有aiq0且0234中有inst1
  // || 0234中有aiq0且uop0是aiq01
  // || 0234中有aiq1且uop0是aiq01
  //且inst0234中没有两个aiq0
//add by xlx
  assign ctrl_ir_pre_dis_aiq0_create1_sel_inst1 =
              ctrl_ir_pre_dis_inst1_aiq0
              && ctrl_ir_pre_dis_inst0_aiq0
           || ctrl_ir_pre_dis_inst1_aiq01
              && (ctrl_ir_pre_dis_inst0234_aiq0 && ctrl_ir_pre_dis_inst0234_aiq1
               || ctrl_ir_pre_dis_inst0234_aiq0 && ctrl_ir_pre_dis_inst0_aiq01
               || ctrl_ir_pre_dis_inst0234_aiq1 && ctrl_ir_pre_dis_inst0_aiq01)
              && !ctrl_ir_pre_dis_inst0234_2_aiq0;  


//原逻辑： aiq0 c1 sel uop3时逻辑为
//1.inst2 是aiq0 且inst0或者inst1是 aiq0类型的
//2.inst2 是aiq01类型的 且inst013中没有两个aiq0类型的
//   inst013 有aiq0且有aiq1类型的
//   ||inst013有aiq0类型的或者013有aiq1类型的 且inst0或者inst1是aiq01类型的
//   ||inst0是aiq01且inst1是aiq01 
//也就是说
//分配优先级
// aiq0 c0 >aiq1c0 >aiq0c1>aiq1c1
/*
assign ctrl_ir_pre_dis_aiq0_create1_sel_inst2 =
              ctrl_ir_pre_dis_inst2_aiq0
              && (ctrl_ir_pre_dis_inst1_aiq0
               || ctrl_ir_pre_dis_inst0_aiq0)
           || ctrl_ir_pre_dis_inst2_aiq01  
              && (ctrl_ir_pre_dis_inst013_aiq0 && ctrl_ir_pre_dis_inst013_aiq1
              || (ctrl_ir_pre_dis_inst013_aiq0 || ctrl_ir_pre_dis_inst013_aiq1)
               && (ctrl_ir_pre_dis_inst0_aiq01 || ctrl_ir_pre_dis_inst1_aiq01)
              || (ctrl_ir_pre_dis_inst0_aiq01 && ctrl_ir_pre_dis_inst1_aiq01))
           && !ctrl_ir_pre_dis_inst013_2_aiq0;*/
//new logic
//1.inst2 是aiq0 且inst0或者inst1是 aiq0类型的
//2.inst2 是aiq01类型的 且inst0134中没有两个aiq0类型的
//   inst0134 有aiq0且有aiq1类型的
//   ||inst0134有aiq0类型的或者0134有aiq1类型的 且inst0或者inst1是aiq01类型的
//   ||inst0是aiq01且inst1是aiq01 
//add by xlx
assign ctrl_ir_pre_dis_aiq0_create1_sel_inst2 =
              ctrl_ir_pre_dis_inst2_aiq0
              && (ctrl_ir_pre_dis_inst1_aiq0
               || ctrl_ir_pre_dis_inst0_aiq0)
           || ctrl_ir_pre_dis_inst2_aiq01  
              && (ctrl_ir_pre_dis_inst0134_aiq0 && ctrl_ir_pre_dis_inst0134_aiq1
              || (ctrl_ir_pre_dis_inst0134_aiq0 || ctrl_ir_pre_dis_inst0134_aiq1)
               && (ctrl_ir_pre_dis_inst0_aiq01 || ctrl_ir_pre_dis_inst1_aiq01)
              || (ctrl_ir_pre_dis_inst0_aiq01 && ctrl_ir_pre_dis_inst1_aiq01))
           && !ctrl_ir_pre_dis_inst0134_2_aiq0;


//add sel inst3 logic
//1.inst3是aiq0且inst0 1 2 有aiq0类型的
//2.inst3 是aiq01类型的且 inst0124中没有两个aiq0类型的
//    且inst0124中有 一个aiq0类型的且有aiq1类型的
//    ||0124中有一个aiq0类型或者0124有aiq1类型 且inst0或者inst1或者inst2中有aiq01类型的
//    ||inst012中有两个是aiq01类型的
//    且不是aiq01类型的uop 不是aiq0类型的
//add by xlx
assign ctrl_ir_pre_dis_aiq0_create1_sel_inst3 =
            ctrl_ir_pre_dis_inst3_aiq0
             && (ctrl_ir_pre_dis_inst1_aiq0
               || ctrl_ir_pre_dis_inst0_aiq0
               || ctrl_ir_pre_dis_inst2_aiq0)
            ||ctrl_ir_pre_dis_inst3_aiq01
              &&(ctrl_ir_pre_dis_inst0124_aiq0 && ctrl_ir_pre_dis_inst0124_aiq1
                || (ctrl_ir_pre_dis_inst0134_aiq0 || ctrl_ir_pre_dis_inst0134_aiq1)
                &&(ctrl_ir_pre_dis_inst0_aiq01 || ctrl_ir_pre_dis_inst1_aiq01 ||ctrl_ir_pre_dis_inst2_aiq01))
                &&(ctrl_ir_pre_dis_inst0_aiq01 && ctrl_ir_pre_dis_inst1_aiq01 && !ctrl_ir_pre_dis_inst2_aiq0
                   ||ctrl_ir_pre_dis_inst0_aiq01 && ctrl_ir_pre_dis_inst2_aiq01 && !ctrl_ir_pre_dis_inst1_aiq0
                   ||ctrl_ir_pre_dis_inst1_aiq01 && ctrl_ir_pre_dis_inst2_aiq01 && !ctrl_ir_pre_dis_inst0_aiq0)
             && !ctrl_ir_pre_dis_inst0124_2_aiq0;

// &CombBeg; @930
always @( ctrl_ir_pre_dis_aiq0_create1_sel_inst1
       or ctrl_ir_pre_dis_aiq0_create1_sel_inst2
       or ctrl_ir_pre_dis_aiq0_create1_sel_inst0
       or ctrl_ir_pre_dis_aiq0_create1_sel_inst3//add uop4 logic //add by xlx
       )
begin
  if(ctrl_ir_pre_dis_aiq0_create1_sel_inst0)
    ctrl_ir_pre_dis_aiq0_create1_sel[2:0] = 2'd0; //sel inst 0
  else if(ctrl_ir_pre_dis_aiq0_create1_sel_inst1)
    ctrl_ir_pre_dis_aiq0_create1_sel[2:0] = 2'd1; //sel inst 1
  else if(ctrl_ir_pre_dis_aiq0_create1_sel_inst2)
    ctrl_ir_pre_dis_aiq0_create1_sel[2:0] = 2'd2; //sel inst 2
  else if(ctrl_ir_pre_dis_aiq0_create1_sel_inst3)
    ctrl_ir_pre_dis_aiq0_create1_sel[2:0] = 2'd3; //sel inst 3
  else 
    ctrl_ir_pre_dis_aiq0_create1_sel[2:0] = 2'd4; //sel inst 4    add uop4 //add by xlx
// &CombEnd; @939
end

//----------------------------------------------------------
//                  AIQ1 create 0 select
//----------------------------------------------------------
//AIQ1 create0 select
// origin logic
//inst0是aiq1类型
//或者inst0是aiq01类型
//   且inst123中有aiq0类型
//   且inst123中没有aiq1类型
assign ctrl_ir_pre_dis_aiq1_create0_sel_inst0 =
              ctrl_ir_pre_dis_inst0_aiq1
           || ctrl_ir_pre_dis_inst0_aiq01
              && (ctrl_ir_pre_dis_inst1_aiq0
               || ctrl_ir_pre_dis_inst2_aiq0
               || ctrl_ir_pre_dis_inst3_aiq0
               || ctrl_ir_pre_dis_inst4_aiq0//add  uop4 logic //add by xlx
               )
              && !(ctrl_ir_pre_dis_inst1_aiq1
                || ctrl_ir_pre_dis_inst2_aiq1
                || ctrl_ir_pre_dis_inst3_aiq1
                || ctrl_ir_pre_dis_inst4_aiq1//add uop4 logic //add by xlx
                );
//sel inst1 logic
//inst1是aiq1类型的
//或者 inst1 是aiq01类型的且（inst023中有aiq0或者inst0是aiq01类型)且 inst2,3不是aiq1类型的
//
//add by xlx                
assign ctrl_ir_pre_dis_aiq1_create0_sel_inst1 =
              ctrl_ir_pre_dis_inst1_aiq1
           || ctrl_ir_pre_dis_inst1_aiq01
              && (ctrl_ir_pre_dis_inst0_aiq0
               || ctrl_ir_pre_dis_inst2_aiq0
               || ctrl_ir_pre_dis_inst3_aiq0
               || ctrl_ir_pre_dis_inst4_aiq0//add uop5 //add by xlx
               || ctrl_ir_pre_dis_inst0_aiq01)

              && !(ctrl_ir_pre_dis_inst2_aiq1
                || ctrl_ir_pre_dis_inst3_aiq1
                || ctrl_ir_pre_dis_inst4_aiq1//add uop5 //add by xlx
                
                  );
//sel inst2的逻辑
//origin logic
//inst2 是aiq1 
//或者inst2 是aiq01 且(inst0 1 3 中有inst0 或者 01是aiq01)且inst3不是aiq1、
/*
assign ctrl_ir_pre_dis_aiq1_create0_sel_inst2 =
              ctrl_ir_pre_dis_inst2_aiq1
           || ctrl_ir_pre_dis_inst2_aiq01
              && (ctrl_ir_pre_dis_inst0_aiq0
               || ctrl_ir_pre_dis_inst1_aiq0
               || ctrl_ir_pre_dis_inst3_aiq0
               || ctrl_ir_pre_dis_inst0_aiq01
               || ctrl_ir_pre_dis_inst1_aiq01)
              && !ctrl_ir_pre_dis_inst3_aiq1;*/
//new logic
//inst2 是aiq1 
//或者inst2 是aiq01 且(inst0 1 3  4 中有aiq0 或者 01是aiq01)且inst3 ,4不是aiq1
//add by xlx
assign ctrl_ir_pre_dis_aiq1_create0_sel_inst2 =
              ctrl_ir_pre_dis_inst2_aiq1
           || ctrl_ir_pre_dis_inst2_aiq01
              && (ctrl_ir_pre_dis_inst0_aiq0
               || ctrl_ir_pre_dis_inst1_aiq0
               || ctrl_ir_pre_dis_inst3_aiq0
               || ctrl_ir_pre_dis_inst4_aiq0
               || ctrl_ir_pre_dis_inst0_aiq01
               || ctrl_ir_pre_dis_inst1_aiq01)
              && !ctrl_ir_pre_dis_inst3_aiq1
              && !ctrl_ir_pre_dis_inst4_aiq1;

//add sel inst3 logic
//inst3是aiq1类型
//或者 inst3是aiq01类型 且(inst0124中有aiq0或者inst012中有aiq01类型的)且inst4不是aiq1
//add by xlx
assign ctrl_ir_pre_dis_aiq1_create0_sel_inst2 =
             ctrl_ir_pre_dis_inst3_aiq1
           || ctrl_ir_pre_dis_inst3_aiq01
              && (ctrl_ir_pre_dis_inst0_aiq0
               || ctrl_ir_pre_dis_inst1_aiq0
               || ctrl_ir_pre_dis_inst2_aiq0
               || ctrl_ir_pre_dis_inst4_aiq0
               || ctrl_ir_pre_dis_inst0_aiq01
               || ctrl_ir_pre_dis_inst1_aiq01
               || ctrl_ir_pre_dis_inst1_aiq01)
              && !ctrl_ir_pre_dis_inst4_aiq1;

// &CombBeg; @973
always @( ctrl_ir_pre_dis_aiq1_create0_sel_inst1
       or ctrl_ir_pre_dis_aiq1_create0_sel_inst2
       or ctrl_ir_pre_dis_aiq1_create0_sel_inst0
       or ctrl_ir_pre_dis_aiq1_create0_sel_inst3)//add  new logic //add by xlx
begin
  if(ctrl_ir_pre_dis_aiq1_create0_sel_inst0)
    ctrl_ir_pre_dis_aiq1_create0_sel[2:0] = 2'd0; //sel inst 0
  else if(ctrl_ir_pre_dis_aiq1_create0_sel_inst1)
    ctrl_ir_pre_dis_aiq1_create0_sel[2:0] = 2'd1; //sel inst 1
  else if(ctrl_ir_pre_dis_aiq1_create0_sel_inst2)
    ctrl_ir_pre_dis_aiq1_create0_sel[2:0] = 2'd2; //sel inst 2
  else if (ctrl_ir_pre_dis_aiq1_create0_sel_inst3)
    ctrl_ir_pre_dis_aiq1_create0_sel[2:0] = 2'd3; //sel inst 3
  else 
    ctrl_ir_pre_dis_aiq1_create0_sel[2:0] = 2'd4; //sel inst 4
// &CombEnd; @982
end

//----------------------------------------------------------
//                  AIQ1 create 1 select
//----------------------------------------------------------
assign ctrl_ir_pre_dis_inst23_aiq0 = 
            ctrl_ir_pre_dis_inst2_aiq0 || ctrl_ir_pre_dis_inst3_aiq0;
assign ctrl_ir_pre_dis_inst23_aiq1 = 
            ctrl_ir_pre_dis_inst2_aiq1 || ctrl_ir_pre_dis_inst3_aiq1;
assign ctrl_ir_pre_dis_inst013_2_aiq1 =
            ctrl_ir_pre_dis_inst0_aiq1 && ctrl_ir_pre_dis_inst1_aiq1
         || ctrl_ir_pre_dis_inst0_aiq1 && ctrl_ir_pre_dis_inst3_aiq1
         || ctrl_ir_pre_dis_inst1_aiq1 && ctrl_ir_pre_dis_inst3_aiq1;

//AIQ1 create1 select
//sel inst0 logic  
//origin logic
/*inst0是aiq01类型且 123中两个是aiq0 1个是aiq1
assign ctrl_ir_pre_dis_aiq1_create1_sel_inst0 =
              ctrl_ir_pre_dis_inst0_aiq01
              && ctrl_ir_pre_dis_inst123_2_aiq0 && ctrl_ir_pre_dis_inst123_aiq1;*/
//new logic
//inst0是aiq01类型且1234 中两个是aiq0 1个是aiq1  一个不是aiq0也不是aiq1
//add by xlx
assign ctrl_ir_pre_dis_inst0_aiq0_or_aiq1 =  ctrl_ir_pre_dis_inst0_aiq0||ctrl_ir_pre_dis_inst0_aiq1;
assign ctrl_ir_pre_dis_inst1_aiq0_or_aiq1 =  ctrl_ir_pre_dis_inst1_aiq0||ctrl_ir_pre_dis_inst1_aiq1;
assign ctrl_ir_pre_dis_inst2_aiq0_or_aiq1 =  ctrl_ir_pre_dis_inst2_aiq0||ctrl_ir_pre_dis_inst2_aiq1;
assign ctrl_ir_pre_dis_inst3_aiq0_or_aiq1 =  ctrl_ir_pre_dis_inst3_aiq0||ctrl_ir_pre_dis_inst3_aiq1;
assign ctrl_ir_pre_dis_inst4_aiq0_or_aiq1 =  ctrl_ir_pre_dis_inst4_aiq0||ctrl_ir_pre_dis_inst4_aiq1;

assign ctrl_ir_pre_dis_inst1234_1_not_aiq0_or_aiq1= !ctrl_ir_pre_dis_inst1_aiq0_or_aiq1    
                                              ||!ctrl_ir_pre_dis_inst2_aiq0_or_aiq1
                                              ||!ctrl_ir_pre_dis_inst3_aiq0_or_aiq1
                                              ||!ctrl_ir_pre_dis_inst4_aiq0_or_aiq1;

assign ctrl_ir_pre_dis_aiq1_create1_sel_inst0 =
              ctrl_ir_pre_dis_inst0_aiq01
              && ctrl_ir_pre_dis_inst1234_2_aiq0 && ctrl_ir_pre_dis_inst1234_aiq1
              && ctrl_ir_pre_dis_inst1234_1_not_aiq0_or_aiq1;
//sel inst 1 logic
//origin logic 
//inst1是aiq1类型且inst0也是aiq1类型
// || inst1是aiq01类型且
//       inst023中有两个aiq0且023中有一个aiq1
//       ||inst0是aiq01且inst23中有一个aiq0且inst23中有一个aiq1
//       ||inst0是aiq01类型 且ints2和inst3都是aiq0类型
/*
assign ctrl_ir_pre_dis_aiq1_create1_sel_inst1 =
              ctrl_ir_pre_dis_inst1_aiq1
              && ctrl_ir_pre_dis_inst0_aiq1
           || ctrl_ir_pre_dis_inst1_aiq01
              && (ctrl_ir_pre_dis_inst023_2_aiq0 && ctrl_ir_pre_dis_inst023_aiq1
               || ctrl_ir_pre_dis_inst0_aiq01 && ctrl_ir_pre_dis_inst23_aiq0
                                              && ctrl_ir_pre_dis_inst23_aiq1
               || ctrl_ir_pre_dis_inst0_aiq01 && ctrl_ir_pre_dis_inst2_aiq0
                                              && ctrl_ir_pre_dis_inst3_aiq0);*/
//new logic
//inst1是aiq1类型且inst0是aiq1类型
// inst1是aiq01类型时
    //inst0234中有两个aiq0类型的且 0234中有一个aiq1类型的且 另一个不是aiq0类型的也不是aiq1类型的
    //inst0是aiq01且inst234中有aiq0类型的也有aiq1类型的，另外一个不是aiq0类型的也不是aiq1类型的
    //inst0是aiq01类型的 且inst234中有两条aiq0类型，另外一条不是aiq1类型的
//add by xlx
assign ctrl_ir_pre_dis_inst0234_1_not_aiq0_or_aiq1= !ctrl_ir_pre_dis_inst0_aiq0_or_aiq1    
                                              ||!ctrl_ir_pre_dis_inst2_aiq0_or_aiq1
                                              ||!ctrl_ir_pre_dis_inst3_aiq0_or_aiq1
                                              ||!ctrl_ir_pre_dis_inst4_aiq0_or_aiq1;
assign ctrl_ir_pre_dis_inst234_2_aiq0_1not_aiq1 = 
            ctrl_ir_pre_dis_inst2_aiq0 && ctrl_ir_pre_dis_inst3_aiq0 
                                       && !ctrl_ir_pre_dis_inst4_aiq0 && !ctrl_ir_pre_dis_inst4_aiq1
         || ctrl_ir_pre_dis_inst2_aiq0 && ctrl_ir_pre_dis_inst4_aiq0 
                                       && !ctrl_ir_pre_dis_inst3_aiq0 && !ctrl_ir_pre_dis_inst3_aiq1
         || ctrl_ir_pre_dis_inst3_aiq0 && ctrl_ir_pre_dis_inst4_aiq0
                                       && !ctrl_ir_pre_dis_inst3_aiq0 && !ctrl_ir_pre_dis_inst3_aiq1;
                                             

assign ctrl_ir_pre_dis_aiq1_create1_sel_inst1 =
              ctrl_ir_pre_dis_inst1_aiq1
              && ctrl_ir_pre_dis_inst0_aiq1
           || ctrl_ir_pre_dis_inst1_aiq01
              && (ctrl_ir_pre_dis_inst0234_2_aiq0 && ctrl_ir_pre_dis_inst023_aiq1 && ctrl_ir_pre_dis_inst0234_1_not_aiq0_or_aiq1
               || ctrl_ir_pre_dis_inst0_aiq01 && ctrl_ir_pre_dis_inst23_aiq0
                                              && ctrl_ir_pre_dis_inst23_aiq1
                                              && ctrl_ir_pre_dis_inst0234_1_not_aiq0_or_aiq1
               || ctrl_ir_pre_dis_inst0_aiq01 && ctrl_ir_pre_dis_inst234_2_aiq0_1not_aiq1);


assign ctrl_ir_pre_dis_inst34_aiq0 = 
            ctrl_ir_pre_dis_inst2_aiq0 || ctrl_ir_pre_dis_inst3_aiq0;

assign ctrl_ir_pre_dis_inst34_aiq1 = 
            ctrl_ir_pre_dis_inst2_aiq1 || ctrl_ir_pre_dis_inst3_aiq1;

assign ctrl_ir_pre_dis_inst34_2_aiq0_or_aiq1 =
            ctrl_ir_pre_dis_inst34_aiq0 && ctrl_ir_pre_dis_inst34_aiq1;

assign ctrl_ir_pre_dis_inst34_1_aiq0 =
            ctrl_ir_pre_dis_inst3_aiq0 & !ctrl_ir_pre_dis_inst4_aiq0 
          ||!ctrl_ir_pre_dis_inst3_aiq0 & ctrl_ir_pre_dis_inst4_aiq0 ;


assign ctrl_ir_pre_dis_inst34_1_aiq1 =
            ctrl_ir_pre_dis_inst3_aiq1 & !ctrl_ir_pre_dis_inst4_aiq1 
          ||!ctrl_ir_pre_dis_inst3_aiq1 & ctrl_ir_pre_dis_inst4_aiq1 ;

assign ctrl_ir_pre_dis_inst34_1_aiq0_or_aiq1 =
            ctrl_ir_pre_dis_inst34_1_aiq0 && !ctrl_ir_pre_dis_inst34_1_aiq1
            ||!ctrl_ir_pre_dis_inst34_1_aiq0 && ctrl_ir_pre_dis_inst34_1_aiq1;

assign ctrl_ir_pre_dis_inst0_aiq0_1_01 = ctrl_ir_pre_dis_inst0_aiq0 || ctrl_ir_pre_dis_inst0_aiq1
                                             || ctrl_ir_pre_dis_inst0_aiq01;
assign ctrl_ir_pre_dis_inst1_aiq0_1_01 =  ctrl_ir_pre_dis_inst1_aiq0 || ctrl_ir_pre_dis_inst1_aiq1
                                             || ctrl_ir_pre_dis_inst1_aiq01;
//origin logic
/*
assign ctrl_ir_pre_dis_aiq1_create1_sel_inst2 =
              ctrl_ir_pre_dis_inst2_aiq1
              && (ctrl_ir_pre_dis_inst1_aiq1
               || ctrl_ir_pre_dis_inst0_aiq1)
           || ctrl_ir_pre_dis_inst2_aiq01
              && (ctrl_ir_pre_dis_inst3_aiq0 || ctrl_ir_pre_dis_inst3_aiq1)
              && (ctrl_ir_pre_dis_inst0_aiq0 || ctrl_ir_pre_dis_inst0_aiq1
                                             || ctrl_ir_pre_dis_inst0_aiq01)
              && (ctrl_ir_pre_dis_inst1_aiq0 || ctrl_ir_pre_dis_inst1_aiq1
                                             || ctrl_ir_pre_dis_inst1_aiq01)
              && !ctrl_ir_pre_dis_inst013_2_aiq1;
              */
//new logic
//inst2是aiq1类型的且 inst0或者1里有aiq1类型的
//inst2是aiq01类型的
      //3,4中有一个aiq0类型的或者aiq1类型的
        //且 0是aiq0 aiq1 或者aiq01类型的
        //且 1是aiq0 aiq1 或者aiq01类型的
      //3,4中有两个aiq0 或者aiq1类型的
        //且01中只有一个是aiq0或者aiq1或者aiq01类型的
//add by xlx
assign ctrl_ir_pre_dis_aiq1_create1_sel_inst2 =
              ctrl_ir_pre_dis_inst2_aiq1
              && (ctrl_ir_pre_dis_inst1_aiq1
               || ctrl_ir_pre_dis_inst0_aiq1)
           || ctrl_ir_pre_dis_inst2_aiq01
              && (ctrl_ir_pre_dis_inst34_1_aiq0 && ctrl_ir_pre_dis_inst34_1_aiq0_or_aiq1
              && (ctrl_ir_pre_dis_inst0_aiq0 || ctrl_ir_pre_dis_inst0_aiq1
                                             || ctrl_ir_pre_dis_inst0_aiq01)
              && (ctrl_ir_pre_dis_inst1_aiq0 || ctrl_ir_pre_dis_inst1_aiq1
                                             || ctrl_ir_pre_dis_inst1_aiq01))
              || ctrl_ir_pre_dis_inst34_2_aiq0_or_aiq1
                && (ctrl_ir_pre_dis_inst0_aiq0_1_01 && !ctrl_ir_pre_dis_inst1_aiq0_1_01
                || !ctrl_ir_pre_dis_inst0_aiq0_1_01 && ctrl_ir_pre_dis_inst1_aiq0_1_01) ;
// add sel inst3 logic
// 1.inst3是aiq1类型的，需要inst012中有aiq1类型的
// 2.inst3是aiq01类型的，
      //inst4 是aiq1类型的且012中有两个是aiq0或者aiq1 或者aiq01类型
      //inst4 不是aiq1类型的 ，且012全是aiq0或者aiq1或者aiq01类型的
//add by xlx
assign ctrl_ir_pre_dis_inst012_aiq1 = 
            ctrl_ir_pre_dis_inst0_aiq1 || ctrl_ir_pre_dis_inst1_aiq1 || ctrl_ir_pre_dis_inst2_aiq1;

assign ctrl_ir_pre_dis_inst0_aiq0_or_aiq1_or_aiq01 =  ctrl_ir_pre_dis_inst0_aiq0
                                                      ||ctrl_ir_pre_dis_inst0_aiq1
                                                      ||ctrl_ir_pre_dis_inst0_aiq01;

assign ctrl_ir_pre_dis_inst1_aiq0_or_aiq1_or_aiq01 =  ctrl_ir_pre_dis_inst1_aiq0
                                                      ||ctrl_ir_pre_dis_inst1_aiq1
                                                      ||ctrl_ir_pre_dis_inst1_aiq01;

assign ctrl_ir_pre_dis_inst2_aiq0_or_aiq1_or_aiq01 =  ctrl_ir_pre_dis_inst2_aiq0
                                                      ||ctrl_ir_pre_dis_inst2_aiq1
                                                      ||ctrl_ir_pre_dis_inst2_aiq01; 

assign ctrl_ir_pre_dis_inst012_2_aiq0_or_aiq1_or_aiq01 = 
                       ctrl_ir_pre_dis_inst0_aiq0_or_aiq1_or_aiq01 &&  ctrl_ir_pre_dis_inst1_aiq0_or_aiq1_or_aiq01
                      || ctrl_ir_pre_dis_inst0_aiq0_or_aiq1_or_aiq01 && ctrl_ir_pre_dis_inst2_aiq0_or_aiq1_or_aiq01
                      || ctrl_ir_pre_dis_inst1_aiq0_or_aiq1_or_aiq01 && ctrl_ir_pre_dis_inst2_aiq0_or_aiq1_or_aiq01;

assign ctrl_ir_pre_dis_inst012_3_aiq0_or_aiq1_or_aiq01 = 
                        ctrl_ir_pre_dis_inst0_aiq0_or_aiq1_or_aiq01
                      &&ctrl_ir_pre_dis_inst1_aiq0_or_aiq1_or_aiq01
                      &&ctrl_ir_pre_dis_inst2_aiq0_or_aiq1_or_aiq01;

assign ctrl_ir_pre_dis_aiq1_create1_sel_inst3 =
                ctrl_ir_pre_dis_inst3_aiq1 && ctrl_ir_pre_dis_inst012_aiq1
              || ctrl_ir_pre_dis_inst3_aiq01
                && (ctrl_ir_pre_dis_inst4_aiq1 && ctrl_ir_pre_dis_inst012_2_aiq0_or_aiq1_or_aiq01
                || !ctrl_ir_pre_dis_inst4_aiq1 && ctrl_ir_pre_dis_inst012_3_aiq0_or_aiq1_or_aiq01);



// &CombBeg; @1020
always @( ctrl_ir_pre_dis_aiq1_create1_sel_inst0
       or ctrl_ir_pre_dis_aiq1_create1_sel_inst2
       or ctrl_ir_pre_dis_aiq1_create1_sel_inst1
       or ctrl_ir_pre_dis_aiq1_create1_sel_inst3)
begin
  if(ctrl_ir_pre_dis_aiq1_create1_sel_inst0)
    ctrl_ir_pre_dis_aiq1_create1_sel[2:0] = 3'd0; //sel inst 0
  else if(ctrl_ir_pre_dis_aiq1_create1_sel_inst1)
    ctrl_ir_pre_dis_aiq1_create1_sel[2:0] = 3'd1; //sel inst 1
  else if(ctrl_ir_pre_dis_aiq1_create1_sel_inst2)
    ctrl_ir_pre_dis_aiq1_create1_sel[2:0] = 3'd2; //sel inst 2
  else if(ctrl_ir_pre_dis_aiq1_create1_sel_inst3)
    ctrl_ir_pre_dis_aiq1_create1_sel[2:0] = 3'd3;//sel inst 3
  else 
    ctrl_ir_pre_dis_aiq1_create1_sel[2:0] = 3'd4;//sel inst 4
// &CombEnd; @1029
end

//----------------------------------------------------------
//               BIQ create enable and Select
//----------------------------------------------------------
//BIQ create0 enable
assign ctrl_ir_pre_dis_biq_create0_en = ctrl_ir_pre_dis_inst0_biq
                                         || ctrl_ir_pre_dis_inst1_biq
                                         || ctrl_ir_pre_dis_inst2_biq
                                         || ctrl_ir_pre_dis_inst3_biq
                                         || ctrl_ir_pre_dis_inst4_biq;//add uop5 //add by xlx

//BIQ create0 select
// &CombBeg; @1041
always @( ctrl_ir_pre_dis_inst2_biq
       or ctrl_ir_pre_dis_inst0_biq
       or ctrl_ir_pre_dis_inst1_biq
       or ctrl_ir_pre_dis_inst3_biq)//add uop5 logic //add by xlx
begin
  if(ctrl_ir_pre_dis_inst0_biq)
    ctrl_ir_pre_dis_biq_create0_sel[2:0] = 3'd0; //sel inst 0
  else if(ctrl_ir_pre_dis_inst1_biq)
    ctrl_ir_pre_dis_biq_create0_sel[2:0] = 3'd1; //sel inst 1
  else if(ctrl_ir_pre_dis_inst2_biq)
    ctrl_ir_pre_dis_biq_create0_sel[2:0] = 3'd2; //sel inst 2
  else if (ctrl_ir_pre_dis_inst3_biq)
    ctrl_ir_pre_dis_biq_create0_sel[2:0] = 3'd3; //sel inst 3
    else
    ctrl_ir_pre_dis_biq_create0_sel[2:0] = 3'd4; //add uop5 logic //add by xlx
// &CombEnd; @1050
end

//BIQ create1 enable
assign ctrl_ir_pre_dis_biq_create1_en =
              ctrl_ir_pre_dis_inst0_biq
              && (ctrl_ir_pre_dis_inst1_biq
                  || ctrl_ir_pre_dis_inst2_biq
                  || ctrl_ir_pre_dis_inst3_biq)
           || ctrl_ir_pre_dis_inst1_biq
              && (ctrl_ir_pre_dis_inst2_biq
                  || ctrl_ir_pre_dis_inst3_biq)
           || ctrl_ir_pre_dis_inst2_biq
              && ctrl_ir_pre_dis_inst3_biq
           || ctrl_ir_pre_dis_inst3_biq //add uop4 logic //add by xlx
              && ctrl_ir_pre_dis_inst4_biq;
            

//BIQ create1 select
assign ctrl_ir_pre_dis_biq_create1_sel_inst1 =
               ctrl_ir_pre_dis_inst1_biq
            && ctrl_ir_pre_dis_inst0_biq;

assign ctrl_ir_pre_dis_biq_create1_sel_inst2 =
               ctrl_ir_pre_dis_inst2_biq
            && (ctrl_ir_pre_dis_inst1_biq
                || ctrl_ir_pre_dis_inst0_biq);

assign ctrl_ir_pre_dis_biq_create1_sel_inst3 =
               ctrl_ir_pre_dis_inst3_biq
            && (ctrl_ir_pre_dis_inst1_biq
                || ctrl_ir_pre_dis_inst0_biq
               || ctrl_ir_pre_dis_inst0_biq);



// &CombBeg; @1072
always @( ctrl_ir_pre_dis_biq_create1_sel_inst2
       or ctrl_ir_pre_dis_biq_create1_sel_inst1
       or ctrl_ir_pre_dis_biq_create1_sel_inst3)
begin
  if(ctrl_ir_pre_dis_biq_create1_sel_inst1)
    ctrl_ir_pre_dis_biq_create1_sel[2:0] = 3'd1; //sel inst 1
  else if(ctrl_ir_pre_dis_biq_create1_sel_inst2)
    ctrl_ir_pre_dis_biq_create1_sel[2:0] = 3'd2; //sel inst 2
  else if(ctrl_ir_pre_dis_biq_create1_sel_inst3)
    ctrl_ir_pre_dis_biq_create1_sel[2:0] = 3'd3; //sel inst 3
  else 
    ctrl_ir_pre_dis_biq_create1_sel[2:0] = 3'd4; //sel inst 4
// &CombEnd; @1079
end

//----------------------------------------------------------
//              LSIQ create enable and Select
//----------------------------------------------------------
//LSIQ create0 enable
assign ctrl_ir_pre_dis_lsiq_create0_en = ctrl_ir_pre_dis_inst0_lsiq
                                         || ctrl_ir_pre_dis_inst1_lsiq
                                         || ctrl_ir_pre_dis_inst2_lsiq
                                         || ctrl_ir_pre_dis_inst3_lsiq
                                         || ctrl_ir_pre_dis_inst4_lsiq;//add uop5 logic //add by xlx

//LSIQ create0 select
// &CombBeg; @1091
always @( ctrl_ir_pre_dis_inst3_lsiq
       or ctrl_ir_pre_dis_inst2_lsiq
       or ctrl_ir_pre_dis_inst0_vmb
       or ctrl_ir_pre_dis_inst1_vmb
       or ctrl_ir_pre_dis_inst2_vmb
       or ctrl_ir_pre_dis_inst0_lsiq
       or ctrl_ir_pre_dis_inst1_lsiq
       or ctrl_ir_pre_dis_inst3_vmb
       or ctrl_ir_pre_dis_inst4_lsiq//add uop5 signal //add by xlx
       or ctrl_ir_pre_dis_inst4_vmb)
begin
  if(ctrl_ir_pre_dis_inst0_lsiq) begin
    ctrl_ir_pre_dis_lsiq_create0_sel[2:0] = 3'd0; //sel inst 0
    ctrl_ir_pre_dis_vmb_create0_sel[2:0]  = 3'd0; //sel inst 0
    ctrl_ir_pre_dis_vmb_create0_en        = ctrl_ir_pre_dis_inst0_vmb;
  end
  else if(ctrl_ir_pre_dis_inst1_lsiq) begin
    ctrl_ir_pre_dis_lsiq_create0_sel[2:0] = 3'd1; //sel inst 1
    ctrl_ir_pre_dis_vmb_create0_sel[2:0]  = 3'd1; //sel inst 1
    ctrl_ir_pre_dis_vmb_create0_en        = ctrl_ir_pre_dis_inst1_vmb;
  end
  else if(ctrl_ir_pre_dis_inst2_lsiq) begin
    ctrl_ir_pre_dis_lsiq_create0_sel[2:0] = 3'd2; //sel inst 2
    ctrl_ir_pre_dis_vmb_create0_sel[2:0]  = 3'd2; //sel inst 2
    ctrl_ir_pre_dis_vmb_create0_en        = ctrl_ir_pre_dis_inst2_vmb;
  end
  else if(ctrl_ir_pre_dis_inst3_lsiq)  begin
    ctrl_ir_pre_dis_lsiq_create0_sel[2:0] = 3'd3; //sel inst 3
    ctrl_ir_pre_dis_vmb_create0_sel[2:0]  = 3'd3; //sel inst 3
    ctrl_ir_pre_dis_vmb_create0_en        = ctrl_ir_pre_dis_inst3_lsiq
                                            && ctrl_ir_pre_dis_inst3_vmb;
  end
  else begin
    ctrl_ir_pre_dis_lsiq_create0_sel[2:0] = 3'd4; //sel inst 3
    ctrl_ir_pre_dis_vmb_create0_sel[2:0]  = 3'd4; //sel inst 3
    ctrl_ir_pre_dis_vmb_create0_en        = ctrl_ir_pre_dis_inst4_vmb;//add uop5 logic //add by xlx
    end

  end
// &CombEnd; @1113


//LSIQ create1 enable
assign ctrl_ir_pre_dis_lsiq_create1_en =
              ctrl_ir_pre_dis_inst0_lsiq
              && (ctrl_ir_pre_dis_inst1_lsiq
                  || ctrl_ir_pre_dis_inst2_lsiq
                  || ctrl_ir_pre_dis_inst3_lsiq
                  || ctrl_ir_pre_dis_inst4_lsiq)//add uop5 logic //add by xlx
           || ctrl_ir_pre_dis_inst1_lsiq
              && (ctrl_ir_pre_dis_inst2_lsiq
                  || ctrl_ir_pre_dis_inst3_lsiq
                  || ctrl_ir_pre_dis_inst4_lsiq)//add uop5 logic //add by xlx
           || ctrl_ir_pre_dis_inst2_lsiq
              && (ctrl_ir_pre_dis_inst3_lsiq
                 ||ctrl_ir_pre_dis_inst4_lsiq)//add uop5 logic //add by xlx
           || ctrl_ir_pre_dis_inst3_lsiq
              && ctrl_ir_pre_dis_inst4_lsiq;//add uop5 logic //add by xlx
            
          

//LSIQ create1 select
assign ctrl_ir_pre_dis_lsiq_create1_sel_inst1 = 
               ctrl_ir_pre_dis_inst1_lsiq
            && ctrl_ir_pre_dis_inst0_lsiq;
assign ctrl_ir_pre_dis_lsiq_create1_sel_inst2 = 
               ctrl_ir_pre_dis_inst2_lsiq
            && (ctrl_ir_pre_dis_inst1_lsiq
                || ctrl_ir_pre_dis_inst0_lsiq);
assign ctrl_ir_pre_dis_lsiq_create1_sel_inst3 = 
               ctrl_ir_pre_dis_inst3_lsiq
            && (ctrl_ir_pre_dis_inst2_lsiq
                || ctrl_ir_pre_dis_inst1_lsiq
                || ctrl_ir_pre_dis_inst0_lsiq);

//add sel inst 5 logic //add by xlx
assign ctrl_ir_pre_dis_lsiq_create1_sel_inst4 = 
               ctrl_ir_pre_dis_inst4_lsiq
            && (ctrl_ir_pre_dis_inst3_lsiq
                || ctrl_ir_pre_dis_inst1_lsiq
                || ctrl_ir_pre_dis_inst0_lsiq);
                
// &CombBeg; @1140
always @( ctrl_ir_pre_dis_lsiq_create1_sel_inst1
       or ctrl_ir_pre_dis_inst1_vmb
       or ctrl_ir_pre_dis_inst2_vmb
       or ctrl_ir_pre_dis_lsiq_create1_sel_inst2
       or ctrl_ir_pre_dis_lsiq_create1_sel_inst3
       or ctrl_ir_pre_dis_inst3_vmb
       or ctrl_ir_pre_dis_lsiq_create1_sel_inst4)
begin
  if(ctrl_ir_pre_dis_lsiq_create1_sel_inst1) begin
    ctrl_ir_pre_dis_lsiq_create1_sel[2:0] = 3'd1; //sel inst 1
    ctrl_ir_pre_dis_vmb_create1_sel[2:0]  = 3'd1; //sel inst 1
    ctrl_ir_pre_dis_vmb_create1_en        = ctrl_ir_pre_dis_inst1_vmb;
  end
  else if(ctrl_ir_pre_dis_lsiq_create1_sel_inst2) begin
    ctrl_ir_pre_dis_lsiq_create1_sel[2:0] = 3'd2; //sel inst 2
    ctrl_ir_pre_dis_vmb_create1_sel[2:0]  = 3'd2; //sel inst 2
    ctrl_ir_pre_dis_vmb_create1_en        = ctrl_ir_pre_dis_inst2_vmb;
  end
  else if(ctrl_ir_pre_dis_lsiq_create1_sel_inst3)begin // add new
    ctrl_ir_pre_dis_lsiq_create1_sel[2:0] = 3'd3; //sel inst 3
    ctrl_ir_pre_dis_vmb_create1_sel[2:0]  = 3'd3; //sel inst 3
    ctrl_ir_pre_dis_vmb_create1_en        = ctrl_ir_pre_dis_lsiq_create1_sel_inst3
                                            && ctrl_ir_pre_dis_inst3_vmb;
  end
  else begin      //add new logic //add by xlx
    ctrl_ir_pre_dis_lsiq_create1_sel[2:0] = 3'd4; //sel inst 4
    ctrl_ir_pre_dis_vmb_create1_sel[2:0]  = 3'd4; //sel inst 4
    ctrl_ir_pre_dis_vmb_create1_en        = ctrl_ir_pre_dis_lsiq_create1_sel_inst4
                                            && ctrl_ir_pre_dis_inst4_vmb;                                
  end
// &CombEnd; @1157
end

//----------------------------------------------------------
//              SDIQ create enable and Select
//----------------------------------------------------------
//SDIQ create0 enable
assign ctrl_ir_pre_dis_sdiq_create0_en = ctrl_ir_pre_dis_inst0_sdiq
                                         || ctrl_ir_pre_dis_inst1_sdiq
                                         || ctrl_ir_pre_dis_inst2_sdiq
                                         || ctrl_ir_pre_dis_inst3_sdiq
                                         || ctrl_ir_pre_dis_inst4_sdiq;//add uop5 //add by xlx

//SDIQ create0 select
// &CombBeg; @1169
always @( ctrl_ir_pre_dis_inst0_sdiq
       or ctrl_ir_pre_dis_inst2_sdiq
       or ctrl_ir_pre_dis_inst1_sdiq
       or ctrl_ir_pre_dis_inst3_sdiq)//add uop5 //add by xlx
begin
  if(ctrl_ir_pre_dis_inst0_sdiq)
    ctrl_ir_pre_dis_sdiq_create0_sel[2:0] = 3'd0; //sel inst 0
  else if(ctrl_ir_pre_dis_inst1_sdiq)
    ctrl_ir_pre_dis_sdiq_create0_sel[2:0] = 3'd1; //sel inst 1
  else if(ctrl_ir_pre_dis_inst2_sdiq)
    ctrl_ir_pre_dis_sdiq_create0_sel[2:0] = 3'd2; //sel inst 2
  else if(ctrl_ir_pre_dis_inst3_sdiq)
    ctrl_ir_pre_dis_sdiq_create0_sel[2:0] = 3'd3; //sel inst 3
  else 
    ctrl_ir_pre_dis_sdiq_create0_sel[2:0] = 3'd4; //sel inst 4 //add by xlx

// &CombEnd; @1178
end

//SDIQ create1 enable
assign ctrl_ir_pre_dis_sdiq_create1_en =
              ctrl_ir_pre_dis_inst0_sdiq
              && (ctrl_ir_pre_dis_inst1_sdiq
                  || ctrl_ir_pre_dis_inst2_sdiq
                  || ctrl_ir_pre_dis_inst3_sdiq
                  || ctrl_ir_pre_dis_inst4_sdiq)//add uop5 //add by xlx
           || ctrl_ir_pre_dis_inst1_sdiq
              && (ctrl_ir_pre_dis_inst2_sdiq
                  || ctrl_ir_pre_dis_inst3_sdiq
                  || ctrl_ir_pre_dis_inst4_sdiq)//add uop5 //add by xlx
           || ctrl_ir_pre_dis_inst2_sdiq
              && (ctrl_ir_pre_dis_inst3_sdiq
              || ctrl_ir_pre_dis_inst4_sdiq);//add uop5 //add by xlx

//SDIQ create1 select
assign ctrl_ir_pre_dis_sdiq_create1_sel_inst1 = 
               ctrl_ir_pre_dis_inst1_sdiq
            && ctrl_ir_pre_dis_inst0_sdiq;
assign ctrl_ir_pre_dis_sdiq_create1_sel_inst2 = 
               ctrl_ir_pre_dis_inst2_sdiq
            && (ctrl_ir_pre_dis_inst1_sdiq
                || ctrl_ir_pre_dis_inst0_sdiq);
//add new logic //add by xlx
assign ctrl_ir_pre_dis_sdiq_create1_sel_inst3 = 
               ctrl_ir_pre_dis_inst3_sdiq
            && (ctrl_ir_pre_dis_inst1_sdiq
                || ctrl_ir_pre_dis_inst0_sdiq
                || ctrl_ir_pre_dis_inst2_sdiq);


// &CombBeg; @1200
always @( ctrl_ir_pre_dis_sdiq_create1_sel_inst2
       or ctrl_ir_pre_dis_sdiq_create1_sel_inst1
       or ctrl_ir_pre_dis_sdiq_create1_sel_inst3)
begin
  if(ctrl_ir_pre_dis_sdiq_create1_sel_inst1)
    ctrl_ir_pre_dis_sdiq_create1_sel[2:0] = 3'd1; //sel inst 1
  else if(ctrl_ir_pre_dis_sdiq_create1_sel_inst2)
    ctrl_ir_pre_dis_sdiq_create1_sel[2:0] = 3'd2; //sel inst 2
  else if(ctrl_ir_pre_dis_sdiq_create1_sel_inst3)
    ctrl_ir_pre_dis_sdiq_create1_sel[2:0] = 3'd3; //sel inst 3 
  else 
    ctrl_ir_pre_dis_sdiq_create1_sel[2:0] = 3'd4; //sel inst 4 //add by xlx
// &CombEnd; @1207
end

//----------------------------------------------------------
//           VIQ0 and VIQ1 create enable prepare
//----------------------------------------------------------
//viq0 inst number

assign ctrl_ir_pre_dis_al_1_viq0_inst = ctrl_ir_pre_dis_inst0_viq0
                                     || ctrl_ir_pre_dis_inst1_viq0
                                     || ctrl_ir_pre_dis_inst2_viq0
                                     || ctrl_ir_pre_dis_inst3_viq0
                                     || ctrl_ir_pre_dis_inst4_viq0;//add uop5 //add by xlx

assign ctrl_ir_pre_dis_al_2_viq0_inst = 
            ctrl_ir_pre_dis_inst0_viq0 && ctrl_ir_pre_dis_inst1_viq0
         || ctrl_ir_pre_dis_inst0_viq0 && ctrl_ir_pre_dis_inst2_viq0
         || ctrl_ir_pre_dis_inst0_viq0 && ctrl_ir_pre_dis_inst3_viq0
         || ctrl_ir_pre_dis_inst0_viq0 && ctrl_ir_pre_dis_inst3_viq0//add uop5  //add by xlx
         || ctrl_ir_pre_dis_inst1_viq0 && ctrl_ir_pre_dis_inst2_viq0
         || ctrl_ir_pre_dis_inst1_viq0 && ctrl_ir_pre_dis_inst3_viq0
         || ctrl_ir_pre_dis_inst1_viq0 && ctrl_ir_pre_dis_inst4_viq0//add uop5 //add by xlx
         || ctrl_ir_pre_dis_inst2_viq0 && ctrl_ir_pre_dis_inst3_viq0
         || ctrl_ir_pre_dis_inst2_viq0 && ctrl_ir_pre_dis_inst4_viq0//add uop5 //add by xlx
         || ctrl_ir_pre_dis_inst3_viq0 && ctrl_ir_pre_dis_inst4_viq0//add uop5 //add by xlx
         ;

//viq1 inst number
assign ctrl_ir_pre_dis_al_1_viq1_inst = ctrl_ir_pre_dis_inst0_viq1
                                     || ctrl_ir_pre_dis_inst1_viq1
                                     || ctrl_ir_pre_dis_inst2_viq1
                                     || ctrl_ir_pre_dis_inst3_viq1
                                     || ctrl_ir_pre_dis_inst4_viq1;//add uop5 //add by xlx

assign ctrl_ir_pre_dis_al_2_viq1_inst = 
            ctrl_ir_pre_dis_inst0_viq1 && ctrl_ir_pre_dis_inst1_viq1
         || ctrl_ir_pre_dis_inst0_viq1 && ctrl_ir_pre_dis_inst2_viq1
         || ctrl_ir_pre_dis_inst0_viq1 && ctrl_ir_pre_dis_inst3_viq1
         || ctrl_ir_pre_dis_inst0_viq1 && ctrl_ir_pre_dis_inst4_viq1//add uop5 //add by xlx
         || ctrl_ir_pre_dis_inst1_viq1 && ctrl_ir_pre_dis_inst2_viq1
         || ctrl_ir_pre_dis_inst1_viq1 && ctrl_ir_pre_dis_inst3_viq1
         || ctrl_ir_pre_dis_inst1_viq1 && ctrl_ir_pre_dis_inst4_viq1//add uop5 //add by xlx
         || ctrl_ir_pre_dis_inst2_viq1 && ctrl_ir_pre_dis_inst3_viq1
         || ctrl_ir_pre_dis_inst2_viq1 && ctrl_ir_pre_dis_inst4_viq1//add uop5 //add by xlx
         || ctrl_ir_pre_dis_inst2_viq1 && ctrl_ir_pre_dis_inst4_viq1//add uop5 //add by xlx
         ;
//viq01 inst number
assign ctrl_ir_pre_dis_al_1_viq01_inst = ctrl_ir_pre_dis_inst0_viq01
                                      || ctrl_ir_pre_dis_inst1_viq01
                                      || ctrl_ir_pre_dis_inst2_viq01
                                      || ctrl_ir_pre_dis_inst3_viq01
                                      || ctrl_ir_pre_dis_inst4_viq01;//add uop5 //add by xlx

assign ctrl_ir_pre_dis_al_2_viq01_inst = 
            ctrl_ir_pre_dis_inst0_viq01 && ctrl_ir_pre_dis_inst1_viq01
         || ctrl_ir_pre_dis_inst0_viq01 && ctrl_ir_pre_dis_inst2_viq01
         || ctrl_ir_pre_dis_inst0_viq01 && ctrl_ir_pre_dis_inst3_viq01
         || ctrl_ir_pre_dis_inst0_viq01 && ctrl_ir_pre_dis_inst4_viq01//add uop5 //add by xlx
         || ctrl_ir_pre_dis_inst1_viq01 && ctrl_ir_pre_dis_inst2_viq01
         || ctrl_ir_pre_dis_inst1_viq01 && ctrl_ir_pre_dis_inst3_viq01
         || ctrl_ir_pre_dis_inst1_viq01 && ctrl_ir_pre_dis_inst4_viq01//add uop5  //add by xlx
         || ctrl_ir_pre_dis_inst2_viq01 && ctrl_ir_pre_dis_inst3_viq01
         || ctrl_ir_pre_dis_inst2_viq01 && ctrl_ir_pre_dis_inst4_viq01//add uop5 //add by xlx
         || ctrl_ir_pre_dis_inst3_viq01 && ctrl_ir_pre_dis_inst4_viq01//adduop5 //add by xlx
         ;
assign ctrl_ir_pre_dis_al_3_viq01_inst =
               ctrl_ir_pre_dis_inst0_viq01
            && ctrl_ir_pre_dis_inst1_viq01
            && ctrl_ir_pre_dis_inst2_viq01
         ||    ctrl_ir_pre_dis_inst0_viq01
            && ctrl_ir_pre_dis_inst1_viq01
            && ctrl_ir_pre_dis_inst3_viq01
            //add uop5 logic//add by xlx
         ||    ctrl_ir_pre_dis_inst0_viq01
            && ctrl_ir_pre_dis_inst1_viq01
            && ctrl_ir_pre_dis_inst4_viq01

         ||    ctrl_ir_pre_dis_inst0_viq01
            && ctrl_ir_pre_dis_inst2_viq01
            && ctrl_ir_pre_dis_inst3_viq01
            //add uop5 logic//add by xlx
         ||    ctrl_ir_pre_dis_inst0_viq01
            && ctrl_ir_pre_dis_inst2_viq01
            && ctrl_ir_pre_dis_inst4_viq01
            //add uop5 logic //add by xlx
         ||    ctrl_ir_pre_dis_inst0_viq01
            && ctrl_ir_pre_dis_inst3_viq01
            && ctrl_ir_pre_dis_inst4_viq01

         ||    ctrl_ir_pre_dis_inst1_viq01
            && ctrl_ir_pre_dis_inst2_viq01
            && ctrl_ir_pre_dis_inst3_viq01
                     //add uop5 logic //add by xlx
         ||    ctrl_ir_pre_dis_inst1_viq01
            && ctrl_ir_pre_dis_inst2_viq01
            && ctrl_ir_pre_dis_inst4_viq01   
                     //add uop5 logic //add by xlx
         ||    ctrl_ir_pre_dis_inst1_viq01
            && ctrl_ir_pre_dis_inst3_viq01
            && ctrl_ir_pre_dis_inst4_viq01   
                     //add uop5 logic //add by xlx
         ||    ctrl_ir_pre_dis_inst2_viq01
            && ctrl_ir_pre_dis_inst3_viq01
            && ctrl_ir_pre_dis_inst4_viq01;

/*origin logic
assign ctrl_ir_pre_dis_al_4_viq01_inst = ctrl_ir_pre_dis_inst0_viq01
                                      && ctrl_ir_pre_dis_inst1_viq01
                                      && ctrl_ir_pre_dis_inst2_viq01
                                      && ctrl_ir_pre_dis_inst3_viq01;*/
//new logic
//add by xlx
assign ctrl_ir_pre_dis_al_4_viq01_inst = 
            ctrl_ir_pre_dis_inst0_viq01 && ctrl_ir_pre_dis_inst1_viq01
         && ctrl_ir_pre_dis_inst2_viq01 && ctrl_ir_pre_dis_inst3_viq01
         ||ctrl_ir_pre_dis_inst0_viq01 && ctrl_ir_pre_dis_inst1_viq01
         && ctrl_ir_pre_dis_inst2_viq01 && ctrl_ir_pre_dis_inst4_viq01
         ||ctrl_ir_pre_dis_inst0_viq01 && ctrl_ir_pre_dis_inst1_viq01
         && ctrl_ir_pre_dis_inst3_viq01 && ctrl_ir_pre_dis_inst4_viq01
         ||ctrl_ir_pre_dis_inst0_viq01 && ctrl_ir_pre_dis_inst2_viq01
         && ctrl_ir_pre_dis_inst3_viq01 && ctrl_ir_pre_dis_inst4_viq01
         ||ctrl_ir_pre_dis_inst1_viq01 && ctrl_ir_pre_dis_inst2_viq01
         && ctrl_ir_pre_dis_inst3_viq01 && ctrl_ir_pre_dis_inst4_viq01;

//----------------------------------------------------------
//               VIQ0 and VIQ1 create enable
//----------------------------------------------------------

//viq01 inst create use priority: viq0_c0 > viq1_c0 > viq0_c1 > viq1_c1

//viq0 create0 enable
assign ctrl_ir_pre_dis_viq0_create0_en = 
            ctrl_ir_pre_dis_al_1_viq0_inst
         || ctrl_ir_pre_dis_al_1_viq01_inst;
         
//viq0 create1 enable
//origin logic
//有2viq0
//或 1个viq01 一个viq0 一个viq1
//或 2个viq01.有一个viq0或者一个viq1类型
//或者 3个viq01类型的
//add by xlx
assign ctrl_ir_pre_dis_viq0_create1_en =
            ctrl_ir_pre_dis_al_2_viq0_inst
         || ctrl_ir_pre_dis_al_1_viq01_inst
            && (ctrl_ir_pre_dis_al_1_viq0_inst && ctrl_ir_pre_dis_al_1_viq1_inst)
         || ctrl_ir_pre_dis_al_2_viq01_inst
            && (ctrl_ir_pre_dis_al_1_viq0_inst || ctrl_ir_pre_dis_al_1_viq1_inst)
         || ctrl_ir_pre_dis_al_3_viq01_inst;


//viq1 create0 enable
assign ctrl_ir_pre_dis_viq1_create0_en =
            ctrl_ir_pre_dis_al_1_viq1_inst
         || ctrl_ir_pre_dis_al_1_viq0_inst
            && ctrl_ir_pre_dis_al_1_viq01_inst
         || ctrl_ir_pre_dis_al_2_viq01_inst;


//viq1 create1 enable1
//origin logic
assign ctrl_ir_pre_dis_viq1_create1_en =
            ctrl_ir_pre_dis_al_2_viq1_inst
         || ctrl_ir_pre_dis_al_1_viq01_inst
            && ctrl_ir_pre_dis_al_2_viq0_inst && ctrl_ir_pre_dis_al_1_viq1_inst
         || ctrl_ir_pre_dis_al_2_viq01_inst
            && (ctrl_ir_pre_dis_al_2_viq0_inst
             || ctrl_ir_pre_dis_al_1_viq0_inst && ctrl_ir_pre_dis_al_1_viq1_inst)
         || ctrl_ir_pre_dis_al_3_viq01_inst
            && (ctrl_ir_pre_dis_al_1_viq0_inst || ctrl_ir_pre_dis_al_1_viq1_inst)
         || ctrl_ir_pre_dis_al_4_viq01_inst;

//----------------------------------------------------------
//                  VIQ0 create 0 select
//----------------------------------------------------------
//VIQ0 create0 select
assign ctrl_ir_pre_dis_viq0_create0_sel_inst0 =
              ctrl_ir_pre_dis_inst0_viq0
           || ctrl_ir_pre_dis_inst0_viq01
              && !(ctrl_ir_pre_dis_inst1_viq0
                || ctrl_ir_pre_dis_inst2_viq0
                || ctrl_ir_pre_dis_inst3_viq0
                || ctrl_ir_pre_dis_inst3_viq0);//add uop5 //add by xlx
assign ctrl_ir_pre_dis_viq0_create0_sel_inst1 =
              ctrl_ir_pre_dis_inst1_viq0
           || ctrl_ir_pre_dis_inst1_viq01
              && !(ctrl_ir_pre_dis_inst2_viq0
                || ctrl_ir_pre_dis_inst3_viq0
                || ctrl_ir_pre_dis_inst4_viq0);//add uop5 //add by xlx
assign ctrl_ir_pre_dis_viq0_create0_sel_inst2 =
              ctrl_ir_pre_dis_inst2_viq0
           || ctrl_ir_pre_dis_inst2_viq01
              && !ctrl_ir_pre_dis_inst3_viq0
              && !ctrl_ir_pre_dis_inst4_viq0;//add uop5 //add by xlx

//add sel uop4 logic
assign ctrl_ir_pre_dis_viq0_create0_sel_inst3 =
              ctrl_ir_pre_dis_inst3_viq0
           || ctrl_ir_pre_dis_inst3_viq01
              && !ctrl_ir_pre_dis_inst4_viq0//add uop5 //add by xlx
              ;

// &CombBeg; @1319
always @( ctrl_ir_pre_dis_viq0_create0_sel_inst1
       or ctrl_ir_pre_dis_viq0_create0_sel_inst2
       or ctrl_ir_pre_dis_viq0_create0_sel_inst0
       or ctrl_ir_pre_dis_viq0_create0_sel_inst3)
begin
  if(ctrl_ir_pre_dis_viq0_create0_sel_inst0)
    ctrl_ir_pre_dis_viq0_create0_sel[2:0] = 2'd0; //sel inst 0
  else if(ctrl_ir_pre_dis_viq0_create0_sel_inst1)
    ctrl_ir_pre_dis_viq0_create0_sel[2:0] = 2'd1; //sel inst 1
  else if(ctrl_ir_pre_dis_viq0_create0_sel_inst2)
    ctrl_ir_pre_dis_viq0_create0_sel[2:0] = 2'd2; //sel inst 2
  else if (ctrl_ir_pre_dis_viq0_create0_sel_inst3)//add new logic  //add by xlx
    ctrl_ir_pre_dis_viq0_create0_sel[2:0] = 2'd3; //sel inst 3
   else
    ctrl_ir_pre_dis_viq0_create0_sel[2:0] = 2'd4;
// &CombEnd; @1328
end

//----------------------------------------------------------
//                  VIQ0 create 1 select
//----------------------------------------------------------
//origin logic
/*
assign ctrl_ir_pre_dis_inst123_viq0 = ctrl_ir_pre_dis_inst1_viq0
                                   || ctrl_ir_pre_dis_inst2_viq0
                                   || ctrl_ir_pre_dis_inst3_viq0;
assign ctrl_ir_pre_dis_inst123_viq1 = ctrl_ir_pre_dis_inst1_viq1
                                   || ctrl_ir_pre_dis_inst2_viq1
                                   || ctrl_ir_pre_dis_inst3_viq1;
assign ctrl_ir_pre_dis_inst023_viq0 = ctrl_ir_pre_dis_inst0_viq0
                                   || ctrl_ir_pre_dis_inst2_viq0
                                   || ctrl_ir_pre_dis_inst3_viq0;
assign ctrl_ir_pre_dis_inst023_viq1 = ctrl_ir_pre_dis_inst0_viq1
                                   || ctrl_ir_pre_dis_inst2_viq1
                                   || ctrl_ir_pre_dis_inst3_viq1;
assign ctrl_ir_pre_dis_inst013_viq0 = ctrl_ir_pre_dis_inst0_viq0
                                   || ctrl_ir_pre_dis_inst1_viq0
                                   || ctrl_ir_pre_dis_inst3_viq0;
assign ctrl_ir_pre_dis_inst013_viq1 = ctrl_ir_pre_dis_inst0_viq1
                                   || ctrl_ir_pre_dis_inst1_viq1
                                   || ctrl_ir_pre_dis_inst3_viq1;
assign ctrl_ir_pre_dis_inst123_2_viq0 =
            ctrl_ir_pre_dis_inst1_viq0 && ctrl_ir_pre_dis_inst2_viq0
         || ctrl_ir_pre_dis_inst1_viq0 && ctrl_ir_pre_dis_inst3_viq0
         || ctrl_ir_pre_dis_inst2_viq0 && ctrl_ir_pre_dis_inst3_viq0;
assign ctrl_ir_pre_dis_inst023_2_viq0 =
            ctrl_ir_pre_dis_inst0_viq0 && ctrl_ir_pre_dis_inst2_viq0
         || ctrl_ir_pre_dis_inst0_viq0 && ctrl_ir_pre_dis_inst3_viq0
         || ctrl_ir_pre_dis_inst2_viq0 && ctrl_ir_pre_dis_inst3_viq0;
assign ctrl_ir_pre_dis_inst013_2_viq0 =
            ctrl_ir_pre_dis_inst0_viq0 && ctrl_ir_pre_dis_inst1_viq0
         || ctrl_ir_pre_dis_inst0_viq0 && ctrl_ir_pre_dis_inst3_viq0
         || ctrl_ir_pre_dis_inst1_viq0 && ctrl_ir_pre_dis_inst3_viq0;
*/

//----------------------------------------------------------
//----------------------------------------------------------

//判断1234中有无 viq0类型的 //add by xlx 
assign ctrl_ir_pre_dis_inst1234_viq0 = ctrl_ir_pre_dis_inst1_viq0
                                    || ctrl_ir_pre_dis_inst2_viq0
                                    || ctrl_ir_pre_dis_inst3_viq0
                                    || ctrl_ir_pre_dis_inst4_viq0;
//判断1234中有无 viq1类型的//add by xlx
assign ctrl_ir_pre_dis_inst1234_viq1 = ctrl_ir_pre_dis_inst1_viq1
                                    || ctrl_ir_pre_dis_inst2_viq1
                                    || ctrl_ir_pre_dis_inst3_viq1
                                    || ctrl_ir_pre_dis_inst4_viq1;
//new logic //add by xlx
assign ctrl_ir_pre_dis_inst0234_viq0 = ctrl_ir_pre_dis_inst0_viq0
                                    || ctrl_ir_pre_dis_inst2_viq0
                                    || ctrl_ir_pre_dis_inst3_viq0
                                    || ctrl_ir_pre_dis_inst4_viq0;
//new logic //add by xlx
assign ctrl_ir_pre_dis_inst0234_viq1 = ctrl_ir_pre_dis_inst0_viq1
                                    || ctrl_ir_pre_dis_inst2_viq1
                                    || ctrl_ir_pre_dis_inst3_viq1
                                    || ctrl_ir_pre_dis_inst4_viq1;

assign ctrl_ir_pre_dis_inst0134_viq0 = ctrl_ir_pre_dis_inst0_viq0
                                    || ctrl_ir_pre_dis_inst1_viq0
                                    || ctrl_ir_pre_dis_inst3_viq0
                                    || ctrl_ir_pre_dis_inst4_viq0;


assign ctrl_ir_pre_dis_inst0134_viq1 = ctrl_ir_pre_dis_inst0_viq1
                                    || ctrl_ir_pre_dis_inst1_viq1
                                    || ctrl_ir_pre_dis_inst3_viq1
                                    || ctrl_ir_pre_dis_inst4_viq1;

 assign ctrl_ir_pre_dis_inst1234_2_aiq0 =
            ctrl_ir_pre_dis_inst1_aiq0 && ctrl_ir_pre_dis_inst2_aiq0
         || ctrl_ir_pre_dis_inst1_aiq0 && ctrl_ir_pre_dis_inst3_aiq0
         || ctrl_ir_pre_dis_inst1_aiq0 && ctrl_ir_pre_dis_inst4_aiq0        
         || ctrl_ir_pre_dis_inst2_aiq0 && ctrl_ir_pre_dis_inst3_aiq0
         || ctrl_ir_pre_dis_inst2_aiq0 && ctrl_ir_pre_dis_inst4_aiq0
         || ctrl_ir_pre_dis_inst3_aiq0 && ctrl_ir_pre_dis_inst4_aiq0;

//new logic 0234里面有两条aiq0类型的 //add by xlx
assign ctrl_ir_pre_dis_inst0234_2_viq0 =
            ctrl_ir_pre_dis_inst0_viq0 && ctrl_ir_pre_dis_inst2_viq0
         || ctrl_ir_pre_dis_inst0_viq0 && ctrl_ir_pre_dis_inst3_viq0
         || ctrl_ir_pre_dis_inst0_viq0 && ctrl_ir_pre_dis_inst4_viq0
         || ctrl_ir_pre_dis_inst2_viq0 && ctrl_ir_pre_dis_inst3_viq0
         || ctrl_ir_pre_dis_inst2_viq0 && ctrl_ir_pre_dis_inst4_viq0
         || ctrl_ir_pre_dis_inst3_viq0 && ctrl_ir_pre_dis_inst4_viq0;

//new logic //add by xlx
assign ctrl_ir_pre_dis_inst0134_2_viq0 =
            ctrl_ir_pre_dis_inst0_viq0 && ctrl_ir_pre_dis_inst1_viq0
         || ctrl_ir_pre_dis_inst0_viq0 && ctrl_ir_pre_dis_inst3_viq0
         || ctrl_ir_pre_dis_inst0_viq0 && ctrl_ir_pre_dis_inst4_viq0
         || ctrl_ir_pre_dis_inst1_viq0 && ctrl_ir_pre_dis_inst3_viq0
         || ctrl_ir_pre_dis_inst1_viq0 && ctrl_ir_pre_dis_inst4_viq0
         || ctrl_ir_pre_dis_inst3_viq0 && ctrl_ir_pre_dis_inst4_viq0;
//add new logic //add by xlx
assign ctrl_ir_pre_dis_inst0124_2_viq0 =
            ctrl_ir_pre_dis_inst0_viq0 && ctrl_ir_pre_dis_inst1_viq0
         || ctrl_ir_pre_dis_inst0_viq0 && ctrl_ir_pre_dis_inst2_viq0
         || ctrl_ir_pre_dis_inst0_viq0 && ctrl_ir_pre_dis_inst4_viq0
         || ctrl_ir_pre_dis_inst1_viq0 && ctrl_ir_pre_dis_inst2_viq0
         || ctrl_ir_pre_dis_inst1_viq0 && ctrl_ir_pre_dis_inst4_viq0
         || ctrl_ir_pre_dis_inst2_viq0 && ctrl_ir_pre_dis_inst4_viq0 ;


//add newlogic by xlx
assign ctrl_ir_pre_dis_inst1234_2_viq0 =
            ctrl_ir_pre_dis_inst1_viq0 && ctrl_ir_pre_dis_inst2_viq0
         || ctrl_ir_pre_dis_inst1_viq0 && ctrl_ir_pre_dis_inst3_viq0
         || ctrl_ir_pre_dis_inst1_viq0 && ctrl_ir_pre_dis_inst4_viq0
         || ctrl_ir_pre_dis_inst2_viq0 && ctrl_ir_pre_dis_inst3_viq0
         || ctrl_ir_pre_dis_inst2_viq0 && ctrl_ir_pre_dis_inst4_viq0
         || ctrl_ir_pre_dis_inst3_viq0 && ctrl_ir_pre_dis_inst4_viq0 ;
//VIQ0 create1 select
//origin logic
/*
assign ctrl_ir_pre_dis_viq0_create1_sel_inst0 =
              ctrl_ir_pre_dis_inst0_viq01
              && ctrl_ir_pre_dis_inst123_viq0 && ctrl_ir_pre_dis_inst123_viq1
              && !ctrl_ir_pre_dis_inst123_2_viq0;*/

//new logic   //add by xlx
assign ctrl_ir_pre_dis_viq0_create1_sel_inst0 =
              ctrl_ir_pre_dis_inst0_viq01
              && ctrl_ir_pre_dis_inst1234_viq0 && ctrl_ir_pre_dis_inst1234_viq1
              && !ctrl_ir_pre_dis_inst1234_2_viq0;
/*origin logic
assign ctrl_ir_pre_dis_viq0_create1_sel_inst1 =
              ctrl_ir_pre_dis_inst1_viq0
              && ctrl_ir_pre_dis_inst0_viq0
           || ctrl_ir_pre_dis_inst1_viq01
              && (ctrl_ir_pre_dis_inst023_viq0 && ctrl_ir_pre_dis_inst023_viq1
               || ctrl_ir_pre_dis_inst023_viq0 && ctrl_ir_pre_dis_inst0_viq01
               || ctrl_ir_pre_dis_inst023_viq1 && ctrl_ir_pre_dis_inst0_viq01)
              && !ctrl_ir_pre_dis_inst023_2_viq0;*/
//new logic   //add by xlx
  assign ctrl_ir_pre_dis_viq0_create1_sel_inst1 =
              ctrl_ir_pre_dis_inst1_viq0
              && ctrl_ir_pre_dis_inst0_viq0
           || ctrl_ir_pre_dis_inst1_viq01
              && (ctrl_ir_pre_dis_inst0234_viq0 && ctrl_ir_pre_dis_inst0234_viq1
               || ctrl_ir_pre_dis_inst0234_viq0 && ctrl_ir_pre_dis_inst0_viq01
               || ctrl_ir_pre_dis_inst0234_viq1 && ctrl_ir_pre_dis_inst0_viq01)
              && !ctrl_ir_pre_dis_inst0234_2_viq0;  

/*origin logic
assign ctrl_ir_pre_dis_viq0_create1_sel_inst2 =
              ctrl_ir_pre_dis_inst2_viq0
              && (ctrl_ir_pre_dis_inst1_viq0
               || ctrl_ir_pre_dis_inst0_viq0)
           || ctrl_ir_pre_dis_inst2_viq01
              && (ctrl_ir_pre_dis_inst013_viq0 && ctrl_ir_pre_dis_inst013_viq1
              || (ctrl_ir_pre_dis_inst013_viq0 || ctrl_ir_pre_dis_inst013_viq1)
                 && (ctrl_ir_pre_dis_inst0_viq01 || ctrl_ir_pre_dis_inst1_viq01)
              || (ctrl_ir_pre_dis_inst0_viq01 && ctrl_ir_pre_dis_inst1_viq01))
              && !ctrl_ir_pre_dis_inst013_2_viq0; */

//new logic   //add by xlx
assign ctrl_ir_pre_dis_viq0_create1_sel_inst2 =
              ctrl_ir_pre_dis_inst2_viq0
              && (ctrl_ir_pre_dis_inst1_viq0
               || ctrl_ir_pre_dis_inst0_viq0)
           || ctrl_ir_pre_dis_inst2_viq01  
              && (ctrl_ir_pre_dis_inst0134_viq0 && ctrl_ir_pre_dis_inst0134_viq1
              || (ctrl_ir_pre_dis_inst0134_viq0 || ctrl_ir_pre_dis_inst0134_viq1)
               && (ctrl_ir_pre_dis_inst0_viq01 || ctrl_ir_pre_dis_inst1_viq01)
              || (ctrl_ir_pre_dis_inst0_viq01 && ctrl_ir_pre_dis_inst1_viq01))
           && !ctrl_ir_pre_dis_inst0134_2_viq0;

//add sel inst3 logic
//1.inst3是viq0且inst0 1 2 有viq0类型的
//2.inst3 是viq01类型的且 inst0124中没有两个viq0类型的
//    且inst0124中有 一个viq0类型的且有viq1类型的
//    ||0124中有一个viq0类型或者0124有viq1类型 且inst0或者inst1或者inst2中有viq01类型的
//    ||inst012中有两个是viq01类型的
//    且不是viq01类型的uop 不是viq0类型的
//add by xlx
assign ctrl_ir_pre_dis_inst0124_viq0 = ctrl_ir_pre_dis_inst0_viq0
                                    || ctrl_ir_pre_dis_inst1_viq0
                                    || ctrl_ir_pre_dis_inst2_viq0
                                    || ctrl_ir_pre_dis_inst4_viq0;

assign ctrl_ir_pre_dis_inst0124_viq1 = ctrl_ir_pre_dis_inst0_viq1
                                    || ctrl_ir_pre_dis_inst1_viq1
                                    || ctrl_ir_pre_dis_inst2_viq1
                                    || ctrl_ir_pre_dis_inst4_viq1;

assign ctrl_ir_pre_dis_viq0_create1_sel_inst3 =
            ctrl_ir_pre_dis_inst3_viq0
             && (ctrl_ir_pre_dis_inst1_viq0
               || ctrl_ir_pre_dis_inst0_viq0
               || ctrl_ir_pre_dis_inst2_viq0)
            ||ctrl_ir_pre_dis_inst3_viq01
              &&(ctrl_ir_pre_dis_inst0124_viq0 && ctrl_ir_pre_dis_inst0124_viq1
                || (ctrl_ir_pre_dis_inst0134_viq0 || ctrl_ir_pre_dis_inst0134_viq1)
                &&(ctrl_ir_pre_dis_inst0_viq01 || ctrl_ir_pre_dis_inst1_viq01 ||ctrl_ir_pre_dis_inst2_viq01))
                &&(ctrl_ir_pre_dis_inst0_viq01 && ctrl_ir_pre_dis_inst1_viq01 && !ctrl_ir_pre_dis_inst2_viq0
                   ||ctrl_ir_pre_dis_inst0_viq01 && ctrl_ir_pre_dis_inst2_viq01 && !ctrl_ir_pre_dis_inst1_viq0
                   ||ctrl_ir_pre_dis_inst1_viq01 && ctrl_ir_pre_dis_inst2_viq01 && !ctrl_ir_pre_dis_inst0_viq0)
             && !ctrl_ir_pre_dis_inst0124_2_viq0;

// &CombBeg; @1387
always @( ctrl_ir_pre_dis_viq0_create1_sel_inst0
       or ctrl_ir_pre_dis_viq0_create1_sel_inst1
       or ctrl_ir_pre_dis_viq0_create1_sel_inst2
       or ctrl_ir_pre_dis_viq0_create1_sel_inst3)//add uop4 logic //add by xlx)
begin
  if(ctrl_ir_pre_dis_viq0_create1_sel_inst0)
    ctrl_ir_pre_dis_viq0_create1_sel[2:0] = 3'd0; //sel inst 0
  else if(ctrl_ir_pre_dis_viq0_create1_sel_inst1)
    ctrl_ir_pre_dis_viq0_create1_sel[2:0] = 3'd1; //sel inst 1
  else if(ctrl_ir_pre_dis_viq0_create1_sel_inst2)
    ctrl_ir_pre_dis_viq0_create1_sel[2:0] = 3'd2; //sel inst 2
  else if(ctrl_ir_pre_dis_viq0_create1_sel_inst3)
    ctrl_ir_pre_dis_viq0_create1_sel[2:0] = 3'd3; //sel inst 3
  else 
    ctrl_ir_pre_dis_viq0_create1_sel[2:0] = 3'd4; //sel inst 4    add uop4 //add by xlx
// &CombEnd; @1396
end

//----------------------------------------------------------
//                  VIQ1 create 0 select
//----------------------------------------------------------
//VIQ1 create0 select

// origin logic
//inst0是viq1类型
//或者inst0是viq01类型
//   且inst123中有viq0类型
//   且inst123中没有viq1类型
assign ctrl_ir_pre_dis_viq1_create0_sel_inst0 =
              ctrl_ir_pre_dis_inst0_viq1
           || ctrl_ir_pre_dis_inst0_viq01
              && (ctrl_ir_pre_dis_inst1_viq0
               || ctrl_ir_pre_dis_inst2_viq0
               || ctrl_ir_pre_dis_inst3_viq0
               || ctrl_ir_pre_dis_inst4_viq0)//add  uop4 logic //add by xlx)
              && !(ctrl_ir_pre_dis_inst1_viq1
                || ctrl_ir_pre_dis_inst2_viq1
                || ctrl_ir_pre_dis_inst3_viq1
                || ctrl_ir_pre_dis_inst4_viq1//add uop4 logic //add by xlx
                );
//sel inst1 logic
//inst1是viq1类型的
//或者 inst1 是viq01类型的且（inst023中有aiq0或者inst0是aiq01类型)且 inst2,3不是aiq1类型的
//
//add by xlx          
assign ctrl_ir_pre_dis_viq1_create0_sel_inst1 =
              ctrl_ir_pre_dis_inst1_viq1
           || ctrl_ir_pre_dis_inst1_viq01
              && (ctrl_ir_pre_dis_inst0_viq0
               || ctrl_ir_pre_dis_inst2_viq0
               || ctrl_ir_pre_dis_inst3_viq0
               || ctrl_ir_pre_dis_inst4_viq0//add uop5 //add by xlx
               || ctrl_ir_pre_dis_inst0_viq01)
              && !(ctrl_ir_pre_dis_inst2_viq1
                || ctrl_ir_pre_dis_inst3_viq1
                || ctrl_ir_pre_dis_inst4_viq1//add uop5 //add by xlx
                );
//origin logic
/*
assign ctrl_ir_pre_dis_viq1_create0_sel_inst2 =
              ctrl_ir_pre_dis_inst2_viq1
           || ctrl_ir_pre_dis_inst2_viq01
              && (ctrl_ir_pre_dis_inst0_viq0
               || ctrl_ir_pre_dis_inst1_viq0
               || ctrl_ir_pre_dis_inst3_viq0
               || ctrl_ir_pre_dis_inst0_viq01
               || ctrl_ir_pre_dis_inst1_viq01)
              && !ctrl_ir_pre_dis_inst3_viq1;*/
//new logic
//inst2 是viq1 
//或者inst2 是viq01 且(inst0 1 3  4 中有viq0 或者 01是viq01)且inst3 ,4不是viq1
//add by xlx
assign ctrl_ir_pre_dis_viq1_create0_sel_inst2 =
              ctrl_ir_pre_dis_inst2_viq1
           || ctrl_ir_pre_dis_inst2_viq01
              && (ctrl_ir_pre_dis_inst0_viq0
               || ctrl_ir_pre_dis_inst1_viq0
               || ctrl_ir_pre_dis_inst3_viq0
               || ctrl_ir_pre_dis_inst4_viq0
               || ctrl_ir_pre_dis_inst0_viq01
               || ctrl_ir_pre_dis_inst1_viq01)
              && !ctrl_ir_pre_dis_inst3_viq1
              && !ctrl_ir_pre_dis_inst4_viq1;

//new logic
//inst2 是viq1 
//或者inst2 是viq01 且(inst0 1 3  4 中有viq0 或者 01是viq01)且inst3 ,4不是viq1
//add by xlx
assign ctrl_ir_pre_dis_viq1_create0_sel_inst2 =
              ctrl_ir_pre_dis_inst2_viq1
           || ctrl_ir_pre_dis_inst2_viq01
              && (ctrl_ir_pre_dis_inst0_viq0
               || ctrl_ir_pre_dis_inst1_viq0
               || ctrl_ir_pre_dis_inst3_viq0
               || ctrl_ir_pre_dis_inst4_viq0
               || ctrl_ir_pre_dis_inst0_viq01
               || ctrl_ir_pre_dis_inst1_viq01)
              && !ctrl_ir_pre_dis_inst3_viq1
              && !ctrl_ir_pre_dis_inst4_viq1;

// &CombBeg; @1430
always @( ctrl_ir_pre_dis_viq1_create0_sel_inst0
       or ctrl_ir_pre_dis_viq1_create0_sel_inst1
       or ctrl_ir_pre_dis_viq1_create0_sel_inst2
       or ctrl_ir_pre_dis_viq1_create0_sel_inst3)//add  new logic //add by xlx
begin
  if(ctrl_ir_pre_dis_viq1_create0_sel_inst0)
    ctrl_ir_pre_dis_viq1_create0_sel[2:0] = 3'd0; //sel inst 0
  else if(ctrl_ir_pre_dis_viq1_create0_sel_inst1)
    ctrl_ir_pre_dis_viq1_create0_sel[2:0] = 3'd1; //sel inst 1
  else if(ctrl_ir_pre_dis_viq1_create0_sel_inst2)
    ctrl_ir_pre_dis_viq1_create0_sel[2:0] = 3'd2; //sel inst 2
  else if(ctrl_ir_pre_dis_viq1_create0_sel_inst3)//add by xlx
    ctrl_ir_pre_dis_viq1_create0_sel[2:0] = 3'd3; //sel inst 3
  else 
    ctrl_ir_pre_dis_aiq1_create0_sel[2:0] = 2'd4; //sel inst 4 add by xlx
// &CombEnd; @1439
end

//----------------------------------------------------------
//                  VIQ1 create 1 select
//----------------------------------------------------------
assign ctrl_ir_pre_dis_inst23_viq0 = 
            ctrl_ir_pre_dis_inst2_viq0 || ctrl_ir_pre_dis_inst3_viq0;
assign ctrl_ir_pre_dis_inst23_viq1 = 
            ctrl_ir_pre_dis_inst2_viq1 || ctrl_ir_pre_dis_inst3_viq1;
assign ctrl_ir_pre_dis_inst013_2_viq1 =
            ctrl_ir_pre_dis_inst0_viq1 && ctrl_ir_pre_dis_inst1_viq1
         || ctrl_ir_pre_dis_inst0_viq1 && ctrl_ir_pre_dis_inst3_viq1
         || ctrl_ir_pre_dis_inst1_viq1 && ctrl_ir_pre_dis_inst3_viq1;

//VIQ1 create1 select
//sel inst0 logic  
//origin logic
//inst0是viq01类型且 123中两个是viq0 1个是viq1
//new logic
//inst0是viq01类型且1234 中两个是viq0 1个是viq1  一个不是viq0也不是viq1
//add by xlx

assign ctrl_ir_pre_dis_inst0_viq0_or_viq1 =  ctrl_ir_pre_dis_inst0_viq0||ctrl_ir_pre_dis_inst0_viq1;
assign ctrl_ir_pre_dis_inst1_viq0_or_viq1 =  ctrl_ir_pre_dis_inst1_viq0||ctrl_ir_pre_dis_inst1_viq1;
assign ctrl_ir_pre_dis_inst2_viq0_or_viq1 =  ctrl_ir_pre_dis_inst2_viq0||ctrl_ir_pre_dis_inst2_viq1;
assign ctrl_ir_pre_dis_inst3_viq0_or_viq1 =  ctrl_ir_pre_dis_inst3_viq0||ctrl_ir_pre_dis_inst3_viq1;
assign ctrl_ir_pre_dis_inst4_viq0_or_viq1 =  ctrl_ir_pre_dis_inst4_viq0||ctrl_ir_pre_dis_inst4_viq1;

assign ctrl_ir_pre_dis_inst1234_1_not_viq0_or_viq1= !ctrl_ir_pre_dis_inst1_viq0_or_viq1    
                                              ||!ctrl_ir_pre_dis_inst2_viq0_or_viq1
                                              ||!ctrl_ir_pre_dis_inst3_viq0_or_viq1
                                              ||!ctrl_ir_pre_dis_inst4_viq0_or_viq1;
/*
assign ctrl_ir_pre_dis_viq1_create1_sel_inst0 =
              ctrl_ir_pre_dis_inst0_viq01
              && ctrl_ir_pre_dis_inst123_2_viq0 && ctrl_ir_pre_dis_inst123_viq1;
assign ctrl_ir_pre_dis_viq1_create1_sel_inst1 =
              ctrl_ir_pre_dis_inst1_viq1
              && ctrl_ir_pre_dis_inst0_viq1
           || ctrl_ir_pre_dis_inst1_viq01
              && (ctrl_ir_pre_dis_inst023_2_viq0 && ctrl_ir_pre_dis_inst023_viq1
               || ctrl_ir_pre_dis_inst0_viq01 && ctrl_ir_pre_dis_inst23_viq0
                                              && ctrl_ir_pre_dis_inst23_viq1
               || ctrl_ir_pre_dis_inst0_viq01 && ctrl_ir_pre_dis_inst2_viq0
                                              && ctrl_ir_pre_dis_inst3_viq0);
assign ctrl_ir_pre_dis_viq1_create1_sel_inst2 =
              ctrl_ir_pre_dis_inst2_viq1
              && (ctrl_ir_pre_dis_inst1_viq1
               || ctrl_ir_pre_dis_inst0_viq1)
           || ctrl_ir_pre_dis_inst2_viq01
              && (ctrl_ir_pre_dis_inst3_viq0 || ctrl_ir_pre_dis_inst3_viq1)
              && (ctrl_ir_pre_dis_inst0_viq0 || ctrl_ir_pre_dis_inst0_viq1
                                             || ctrl_ir_pre_dis_inst0_viq01)
              && (ctrl_ir_pre_dis_inst1_viq0 || ctrl_ir_pre_dis_inst1_viq1
                                             || ctrl_ir_pre_dis_inst1_viq01)
              && !ctrl_ir_pre_dis_inst013_2_viq1;*/
//new logic add by xlx
assign ctrl_ir_pre_dis_viq1_create1_sel_inst0 =
              ctrl_ir_pre_dis_inst0_viq01
              && ctrl_ir_pre_dis_inst1234_2_viq0 && ctrl_ir_pre_dis_inst1234_viq1
              && ctrl_ir_pre_dis_inst1234_1_not_viq0_or_viq1;

assign ctrl_ir_pre_dis_inst0234_1_not_viq0_or_viq1= !ctrl_ir_pre_dis_inst0_viq0_or_viq1    
                                              ||!ctrl_ir_pre_dis_inst2_viq0_or_viq1
                                              ||!ctrl_ir_pre_dis_inst3_viq0_or_viq1
                                              ||!ctrl_ir_pre_dis_inst4_viq0_or_viq1;
assign ctrl_ir_pre_dis_inst234_2_viq0_1not_viq1 = 
            ctrl_ir_pre_dis_inst2_viq0 && ctrl_ir_pre_dis_inst3_viq0 
                                       && !ctrl_ir_pre_dis_inst4_viq0 && !ctrl_ir_pre_dis_inst4_viq1
         || ctrl_ir_pre_dis_inst2_viq0 && ctrl_ir_pre_dis_inst4_viq0 
                                       && !ctrl_ir_pre_dis_inst3_viq0 && !ctrl_ir_pre_dis_inst3_viq1
         || ctrl_ir_pre_dis_inst3_viq0 && ctrl_ir_pre_dis_inst4_viq0
                                       && !ctrl_ir_pre_dis_inst3_viq0 && !ctrl_ir_pre_dis_inst3_viq1;

assign ctrl_ir_pre_dis_viq1_create1_sel_inst1 =
              ctrl_ir_pre_dis_inst1_viq1
              && ctrl_ir_pre_dis_inst0_viq1
           || ctrl_ir_pre_dis_inst1_viq01
              && (ctrl_ir_pre_dis_inst0234_2_viq0 && ctrl_ir_pre_dis_inst023_viq1 && ctrl_ir_pre_dis_inst0234_1_not_viq0_or_viq1
               || ctrl_ir_pre_dis_inst0_viq01 && ctrl_ir_pre_dis_inst23_viq0
                                              && ctrl_ir_pre_dis_inst23_viq1
                                              && ctrl_ir_pre_dis_inst0234_1_not_viq0_or_viq1
               || ctrl_ir_pre_dis_inst0_viq01 && ctrl_ir_pre_dis_inst234_2_viq0_1not_viq1);

assign ctrl_ir_pre_dis_inst34_viq0 = 
            ctrl_ir_pre_dis_inst2_viq0 || ctrl_ir_pre_dis_inst3_viq0;

assign ctrl_ir_pre_dis_inst34_viq1 = 
            ctrl_ir_pre_dis_inst2_viq1 || ctrl_ir_pre_dis_inst3_viq1;

assign ctrl_ir_pre_dis_inst34_2_viq0_or_viq1 =
            ctrl_ir_pre_dis_inst34_viq0 && ctrl_ir_pre_dis_inst34_viq1;

assign ctrl_ir_pre_dis_inst34_1_viq0 =
            ctrl_ir_pre_dis_inst3_viq0 & !ctrl_ir_pre_dis_inst4_viq0 
          ||!ctrl_ir_pre_dis_inst3_viq0 & ctrl_ir_pre_dis_inst4_viq0 ;


assign ctrl_ir_pre_dis_inst34_1_viq1 =
            ctrl_ir_pre_dis_inst3_viq1 & !ctrl_ir_pre_dis_inst4_viq1 
          ||!ctrl_ir_pre_dis_inst3_viq1 & ctrl_ir_pre_dis_inst4_viq1 ;

assign ctrl_ir_pre_dis_inst34_1_viq0_or_viq1 =
            ctrl_ir_pre_dis_inst34_1_viq0 && !ctrl_ir_pre_dis_inst34_1_viq1
            ||!ctrl_ir_pre_dis_inst34_1_viq0 && ctrl_ir_pre_dis_inst34_1_viq1;

assign ctrl_ir_pre_dis_inst0_viq0_1_01 = ctrl_ir_pre_dis_inst0_viq0 || ctrl_ir_pre_dis_inst0_viq1
                                             || ctrl_ir_pre_dis_inst0_viq01;
assign ctrl_ir_pre_dis_inst1_viq0_1_01 =  ctrl_ir_pre_dis_inst1_viq0 || ctrl_ir_pre_dis_inst1_viq1
                                             || ctrl_ir_pre_dis_inst1_viq01;

//add by xlx
assign ctrl_ir_pre_dis_viq1_create1_sel_inst2 =
              ctrl_ir_pre_dis_inst2_viq1
              && (ctrl_ir_pre_dis_inst1_viq1
               || ctrl_ir_pre_dis_inst0_viq1)
           || ctrl_ir_pre_dis_inst2_viq01
              && (ctrl_ir_pre_dis_inst34_1_viq0 && ctrl_ir_pre_dis_inst34_1_viq0_or_viq1
              && (ctrl_ir_pre_dis_inst0_viq0 || ctrl_ir_pre_dis_inst0_viq1
                                             || ctrl_ir_pre_dis_inst0_viq01)
              && (ctrl_ir_pre_dis_inst1_viq0 || ctrl_ir_pre_dis_inst1_viq1
                                             || ctrl_ir_pre_dis_inst1_viq01))
              || ctrl_ir_pre_dis_inst34_2_viq0_or_viq1
                && (ctrl_ir_pre_dis_inst0_viq0_1_01 && !ctrl_ir_pre_dis_inst1_viq0_1_01
                || !ctrl_ir_pre_dis_inst0_viq0_1_01 && ctrl_ir_pre_dis_inst1_viq0_1_01) ;

//sel inst3 logic add by xlx
assign ctrl_ir_pre_dis_inst012_viq1 = 
            ctrl_ir_pre_dis_inst0_viq1 || ctrl_ir_pre_dis_inst1_viq1 || ctrl_ir_pre_dis_inst2_viq1;

assign ctrl_ir_pre_dis_inst0_viq0_or_viq1_or_viq01 =  ctrl_ir_pre_dis_inst0_viq0
                                                      ||ctrl_ir_pre_dis_inst0_viq1
                                                      ||ctrl_ir_pre_dis_inst0_viq01;

assign ctrl_ir_pre_dis_inst1_viq0_or_viq1_or_viq01 =  ctrl_ir_pre_dis_inst1_viq0
                                                      ||ctrl_ir_pre_dis_inst1_viq1
                                                      ||ctrl_ir_pre_dis_inst1_viq01;

assign ctrl_ir_pre_dis_inst2_aiq0_or_viq1_or_viq01 =  ctrl_ir_pre_dis_inst2_viq0
                                                      ||ctrl_ir_pre_dis_inst2_viq1
                                                      ||ctrl_ir_pre_dis_inst2_viq01; 

assign ctrl_ir_pre_dis_inst012_2_viq0_or_viq1_or_viq01 = 
                       ctrl_ir_pre_dis_inst0_viq0_or_viq1_or_viq01 &&  ctrl_ir_pre_dis_inst1_viq0_or_viq1_or_viq01
                      || ctrl_ir_pre_dis_inst0_viq0_or_viq1_or_viq01 && ctrl_ir_pre_dis_inst2_viq0_or_viq1_or_viq01
                      || ctrl_ir_pre_dis_inst1_viq0_or_viq1_or_viq01 && ctrl_ir_pre_dis_inst2_viq0_or_viq1_or_viq01;

assign ctrl_ir_pre_dis_inst012_3_viq0_or_viq1_or_viq01 = 
                        ctrl_ir_pre_dis_inst0_viq0_or_viq1_or_viq01
                      &&ctrl_ir_pre_dis_inst1_viq0_or_viq1_or_viq01
                      &&ctrl_ir_pre_dis_inst2_viq0_or_viq1_or_viq01;

assign ctrl_ir_pre_dis_viq1_create1_sel_inst3 =
                ctrl_ir_pre_dis_inst3_viq1 && ctrl_ir_pre_dis_inst012_viq1
              || ctrl_ir_pre_dis_inst3_viq01
                && (ctrl_ir_pre_dis_inst4_viq1 && ctrl_ir_pre_dis_inst012_2_viq0_or_viq1_or_viq01
                || !ctrl_ir_pre_dis_inst4_viq1 && ctrl_ir_pre_dis_inst012_3_viq0_or_viq1_or_viq01);

// &CombBeg; @1477
always @( ctrl_ir_pre_dis_viq1_create1_sel_inst2
       or ctrl_ir_pre_dis_viq1_create1_sel_inst0
       or ctrl_ir_pre_dis_viq1_create1_sel_inst1
       or ctrl_ir_pre_dis_viq1_create1_sel_inst3)//sel inst add by xlx 
begin
  if(ctrl_ir_pre_dis_viq1_create1_sel_inst0)
    ctrl_ir_pre_dis_viq1_create1_sel[2:0] = 3'd0; //sel inst 0
  else if(ctrl_ir_pre_dis_viq1_create1_sel_inst1)
    ctrl_ir_pre_dis_viq1_create1_sel[2:0] = 3'd1; //sel inst 1
  else if(ctrl_ir_pre_dis_viq1_create1_sel_inst2)
    ctrl_ir_pre_dis_viq1_create1_sel[2:0] = 3'd2; //sel inst 2
  else if(ctrl_ir_pre_dis_aiq1_create1_sel_inst3)
    ctrl_ir_pre_dis_viq1_create1_sel[2:0] = 3'd3; //sel inst 3
  else 
    ctrl_ir_pre_dis_viq1_create1_sel[2:0] = 3'd4;//sel inst 4 add by xlx
// &CombEnd; @1486
end

//----------------------------------------------------------
//         prepare dispatch ROB/PST create signals
//----------------------------------------------------------
//inst can be fold if:
//1.inst is aiq01 or aiq1 or aiq0 (expt inst will be fence of type aiq0)
//  or inst is vdsp
//  or inst is vfpu
//2.inst is not split
//3.inst is not intmask

//可以fold的逻辑
assign ctrl_ir_inst0_fold =
            (ctrl_ir_inst0_aiq01 || ctrl_ir_inst0_aiq0 || ctrl_ir_inst0_aiq1)
            && !ctrl_ir_inst0_special
         || (ctrl_ir_inst0_viq0 || ctrl_ir_inst0_viq1 || ctrl_ir_inst0_viq01);
assign ctrl_ir_inst1_fold =
            (ctrl_ir_inst1_aiq01 || ctrl_ir_inst1_aiq0 || ctrl_ir_inst1_aiq1)
            && !ctrl_ir_inst1_special
         || (ctrl_ir_inst1_viq0 || ctrl_ir_inst1_viq1 || ctrl_ir_inst1_viq01);
assign ctrl_ir_inst2_fold =
            (ctrl_ir_inst2_aiq01 || ctrl_ir_inst2_aiq0 || ctrl_ir_inst2_aiq1)
            && !ctrl_ir_inst2_special
         || (ctrl_ir_inst2_viq0 || ctrl_ir_inst2_viq1 || ctrl_ir_inst2_viq01);
assign ctrl_ir_inst3_fold =
            (ctrl_ir_inst3_aiq01 || ctrl_ir_inst3_aiq0 || ctrl_ir_inst3_aiq1)
            && !ctrl_ir_inst3_special
         || (ctrl_ir_inst3_viq0 || ctrl_ir_inst3_viq1 || ctrl_ir_inst3_viq01);
assign ctrl_ir_inst4_fold = //add uop5 logic by xlx
            (ctrl_ir_inst4_aiq01 || ctrl_ir_inst4_aiq0 || ctrl_ir_inst4_aiq1)
            && !ctrl_ir_inst4_special
         || (ctrl_ir_inst4_viq0 || ctrl_ir_inst4_viq1 || ctrl_ir_inst4_viq01);



assign ctrl_ir_pre_dis_inst0_fold  = ctrl_ir_pre_dis_inst0_vld
                                     && ctrl_ir_inst0_fold
                                     && !ctrl_ir_inst0_split
                                     && !ctrl_ir_inst0_intmask
                                     && !rtu_idu_srt_en
                                     && !cp0_idu_rob_fold_disable;
assign ctrl_ir_pre_dis_inst1_fold  = ctrl_ir_pre_dis_inst1_vld
                                     && ctrl_ir_inst1_fold
                                     && !ctrl_ir_inst1_split
                                     && !ctrl_ir_inst1_intmask
                                     && !rtu_idu_srt_en
                                     && !cp0_idu_rob_fold_disable;
assign ctrl_ir_pre_dis_inst2_fold  = ctrl_ir_pre_dis_inst2_vld
                                     && ctrl_ir_inst2_fold
                                     && !ctrl_ir_inst2_split
                                     && !ctrl_ir_inst2_intmask
                                     && !rtu_idu_srt_en
                                     && !cp0_idu_rob_fold_disable;
assign ctrl_ir_pre_dis_inst3_fold  = ctrl_ir_pre_dis_inst3_vld
                                     && ctrl_ir_inst3_fold
                                     && !ctrl_ir_inst3_split
                                     && !ctrl_ir_inst3_intmask
                                     && !rtu_idu_srt_en
                                     && !cp0_idu_rob_fold_disable;
assign ctrl_ir_pre_dis_inst4_fold  = ctrl_ir_pre_dis_inst4_vld//add uop5 logic by xlx
                                     && ctrl_ir_inst4_fold
                                     && !ctrl_ir_inst4_split
                                     && !ctrl_ir_inst4_intmask
                                     && !rtu_idu_srt_en
                                     && !cp0_idu_rob_fold_disable;


assign ctrl_ir_pre_dis_inst01_fold  = ctrl_ir_pre_dis_inst0_fold
                                      && ctrl_ir_pre_dis_inst1_fold
                                      && !ctrl_ir_pre_dis_inst2_fold;
assign ctrl_ir_pre_dis_inst12_fold  = !ctrl_ir_pre_dis_inst0_fold
                                      && ctrl_ir_pre_dis_inst1_fold
                                      && ctrl_ir_pre_dis_inst2_fold
                                      && !ctrl_ir_pre_dis_inst3_fold;
assign ctrl_ir_pre_dis_inst23_fold  = !ctrl_ir_pre_dis_inst1_fold
                                      && ctrl_ir_pre_dis_inst2_fold
                                      && ctrl_ir_pre_dis_inst3_fold
                                      && !ctrl_ir_pre_dis_inst4_fold;//add new logic by xlx

assign ctrl_ir_pre_dis_inst34_fold  =                             //add uop5 logic by xlx
                                             !ctrl_ir_pre_dis_inst2_fold
                                      && ctrl_ir_pre_dis_inst3_fold
                                      && ctrl_ir_pre_dis_inst4_fold;

assign ctrl_ir_pre_dis_inst012_fold = ctrl_ir_pre_dis_inst0_fold
                                      && ctrl_ir_pre_dis_inst1_fold
                                      && ctrl_ir_pre_dis_inst2_fold
                                      && !ctrl_ir_pre_dis_inst3_fold//add new logic by xlx
                                      ;

assign ctrl_ir_pre_dis_inst123_fold = !ctrl_ir_pre_dis_inst0_fold
                                      && ctrl_ir_pre_dis_inst1_fold
                                      && ctrl_ir_pre_dis_inst2_fold
                                      && ctrl_ir_pre_dis_inst3_fold
                                      && !ctrl_ir_pre_dis_inst4_fold ;//add new logic by xlx

assign ctrl_ir_pre_dis_inst234_fold = !ctrl_ir_pre_dis_inst1_fold
                                      && ctrl_ir_pre_dis_inst2_fold
                                      && ctrl_ir_pre_dis_inst3_fold
                                      && ctrl_ir_pre_dis_inst4_fold ;//add new logic by xlx

assign ctrl_ir_pre_dis_inst0123_fold = ctrl_ir_pre_dis_inst0_fold
                                      && ctrl_ir_pre_dis_inst1_fold
                                      && ctrl_ir_pre_dis_inst2_fold
                                      && ctrl_ir_pre_dis_inst3_fold
                                      && !ctrl_ir_pre_dis_inst3_fold ;
                                      //add new logic by xlx

//rob create0 en
//create0 en always from dis inst0 vld

//rob create1 en 
// &CombBeg; @1560
always @(ctrl_ir_pre_dis_inst2_vld
       or ctrl_ir_pre_dis_inst3_vld
       or ctrl_ir_pre_dis_inst01_fold
       or ctrl_ir_pre_dis_inst012_fold
       or ctrl_ir_pre_dis_inst0123_fold//add by xlx
       or ctrl_ir_pre_dis_inst1_vld)
begin
  if(ctrl_ir_pre_dis_inst0123_fold)//add by xlx
    ctrl_ir_pre_dis_rob_create1_en = ctrl_ir_pre_dis_inst4_vld;//add by xlx
  else if(ctrl_ir_pre_dis_inst012_fold)
    ctrl_ir_pre_dis_rob_create1_en = ctrl_ir_pre_dis_inst3_vld;
  else if(ctrl_ir_pre_dis_inst01_fold)
    ctrl_ir_pre_dis_rob_create1_en = ctrl_ir_pre_dis_inst2_vld;
  else
    ctrl_ir_pre_dis_rob_create1_en = ctrl_ir_pre_dis_inst1_vld;
// &CombEnd; @1567
end

//rob create2 en
//origin logic
/*
assign ctrl_ir_pre_dis_rob_create2_en = 
            !ctrl_ir_pre_dis_inst012_fold
         && !ctrl_ir_pre_dis_inst0123_fold 
         && ((ctrl_ir_pre_dis_inst01_fold || ctrl_ir_pre_dis_inst12_fold)
             ? ctrl_ir_pre_dis_inst3_vld : ctrl_ir_pre_dis_inst2_vld);
*/

//0 1 2
//new logic add by xlx
assign ctrl_ir_pre_dis_rob_create2_en = 
            !ctrl_ir_pre_dis_inst0123_fold//0 4 这样不行
            && ctrl_ir_pre_dis_inst2_vld
            &&
            (ctrl_ir_pre_dis_inst012_fold && ctrl_ir_pre_dis_inst4_vld
            ||ctrl_ir_pre_dis_inst01_fold && ctrl_ir_pre_dis_inst3_vld    //01 2 3
            ||ctrl_ir_pre_dis_inst12_fold && ctrl_ir_pre_dis_inst3_vld 
            ||ctrl_ir_pre_dis_inst123_fold && ctrl_ir_pre_dis_inst4_vld//0,123 4
            );

//rob create3 en
//origin logic
/*
assign ctrl_ir_pre_dis_rob_create3_en = 
         ctrl_ir_pre_dis_inst3_vld
         && !(ctrl_ir_pre_dis_inst01_fold
           || ctrl_ir_pre_dis_inst12_fold
           || ctrl_ir_pre_dis_inst23_fold
           || ctrl_ir_pre_dis_inst012_fold
           || ctrl_ir_pre_dis_inst123_fold); */

assign ctrl_ir_pre_dis_inst012_not_fold = !ctrl_ir_pre_dis_inst0_fold
                                      &&  !ctrl_ir_pre_dis_inst1_fold
                                      &&  !ctrl_ir_pre_dis_inst2_fold;

//rob create3 en
//new logic add by xlx
assign ctrl_ir_pre_dis_rob_create3_en = 
        ctrl_ir_pre_dis_inst3_vld
        &&  !ctrl_ir_pre_dis_inst0123_fold// 0 4
        &&  !ctrl_ir_pre_dis_inst012_fold//034  
        &&  !ctrl_ir_pre_dis_inst123_fold
        &&  !ctrl_ir_pre_dis_inst234_fold//0 1 4
        &&( ( (ctrl_ir_pre_dis_inst01_fold||ctrl_ir_pre_dis_inst12_fold
            ||ctrl_ir_pre_dis_inst23_fold)&&ctrl_ir_pre_dis_inst4_vld )
        ||ctrl_ir_pre_dis_inst3_vld && ctrl_ir_pre_dis_inst012_not_fold
        );

//rob create4 en

assign ctrl_ir_pre_dis_inst0123_not_fold = !ctrl_ir_pre_dis_inst0_fold
                                       &&  !ctrl_ir_pre_dis_inst1_fold
                                       &&  !ctrl_ir_pre_dis_inst2_fold
                                       &&  !ctrl_ir_pre_dis_inst3_fold
                                       ;

assign ctrl_ir_pre_dis_rob_create4_en = ctrl_ir_pre_dis_inst0123_not_fold
                                       &&  ctrl_ir_pre_dis_inst4_vld;


//rob create0 select:
/*
assign ctrl_ir_pre_dis_rob_create0_sel[1:0] =
           //select inst0, inst1 and inst2
           {2{ctrl_ir_pre_dis_inst012_fold}} & 2'd2
           //select inst0 and inst1
         | {2{ctrl_ir_pre_dis_inst01_fold}}  & 2'd1;         
           //else 2'd0: select inst0  */
assign ctrl_ir_pre_dis_rob_create0_sel[1:0] =
           //select inst0, inst1 and inst2 and inst3
           {2{ctrl_ir_pre_dis_inst0123_fold}} & 2'd3
           //select inst0, inst1 and inst2
         |  {2{ctrl_ir_pre_dis_inst012_fold}} & 2'd2
           //select inst0 and inst1
         | {2{ctrl_ir_pre_dis_inst01_fold}}  & 2'd1; 
           //else 2'd0: select inst0 


//rob create1 select
//origin logic
/*
assign ctrl_ir_pre_dis_rob_create1_sel[2:0] =
           //select inst1, inst2 and inst3
           {3{ctrl_ir_pre_dis_inst123_fold}} & 3'd4 
           //select inst3
         | {3{ctrl_ir_pre_dis_inst012_fold}} & 3'd3
           //select inst2
         | {3{ctrl_ir_pre_dis_inst01_fold}}  & 3'd2
           //select inst1 and inst2
         | {3{ctrl_ir_pre_dis_inst12_fold}}  & 3'd1; 
           //else 2'd0: select inst1
*/

//new logic
assign ctrl_ir_pre_dis_rob_create1_sel[2:0] =
           //select inst1, inst2 and inst3
           {3{ctrl_ir_pre_dis_inst123_fold}} & 3'd4 
           //select inst3
         | {3{ctrl_ir_pre_dis_inst012_fold}} & 3'd3
           //select inst2
         | {3{ctrl_ir_pre_dis_inst01_fold}}  & 3'd2
           //select inst1 and inst2
         | {3{ctrl_ir_pre_dis_inst12_fold}}  & 3'd1; 
           //else 2'd0: select inst1



//rob create2 select
//origin logic
/*
assign ctrl_ir_pre_dis_rob_create2_sel[1:0] =
           //select inst3
           {2{ctrl_ir_pre_dis_inst01_fold}}  & 2'd3 
           //select inst3
         | {2{ctrl_ir_pre_dis_inst12_fold}}  & 2'd3
           //select inst2 and inst3
         | {2{ctrl_ir_pre_dis_inst23_fold}}  & 2'd2;
           //else 2'd0: select inst2 */
assign ctrl_ir_pre_dis_rob_create2_sel[2:0] =
           {3{ctrl_ir_pre_dis_inst012_fold}}  & 3'd4 // 012 sel inst 
         | {3{ctrl_ir_pre_dis_inst123_fold}}  & 3'd4
         | {3{ctrl_ir_pre_dis_inst01_fold}}   & 3'd3 //01 fold sel inst3
         | {3{ctrl_ir_pre_dis_inst12_fold}}   & 3'd3//12 sel inst3
           //select inst2 and inst3
         | {3{ctrl_ir_pre_dis_inst23_fold}}   & 3'd2;//23 fold sel inst2
           //else 2'd0: select inst2




//rob create3 select
/*origin logic
//always select inst3*/

//new logic add by xlx
assign ctrl_ir_pre_dis_rob_create3_sel[2:0] =
              {3{ctrl_ir_pre_dis_inst01_fold}}  & 3'd4
            || {3{ctrl_ir_pre_dis_inst12_fold}}  & 3'd4
            || {3{ctrl_ir_pre_dis_inst23_fold}}  & 3'd4
            || {3{ctrl_ir_pre_dis_inst012_not_fold}}  & 3'd3;

//rob create4 select add by xlx
//always select inst4

//iid 逻辑需要修改
//origin
//pst create inst0 iid
//always select rtu inst0 iid

//pst create inst1 iid
//select rtu inst0 iid if fold with inst0

//origin logic 
/*
assign ctrl_ir_pre_dis_pst_create1_iid_sel = ctrl_ir_pre_dis_inst01_fold
                                          || ctrl_ir_pre_dis_inst012_fold;*/

//add new logic by xlx
//发生了01.. 折叠就选0  没发生就选1
assign ctrl_ir_pre_dis_pst_create1_iid_sel = ctrl_ir_pre_dis_inst01_fold
                                          || ctrl_ir_pre_dis_inst012_fold
                                          || ctrl_ir_pre_dis_inst0123_fold
                                          ;

//pst create inst2 iid
//select inst0
//origin logic 
/*
assign ctrl_ir_pre_dis_pst_create2_iid_sel[0] = ctrl_ir_pre_dis_inst012_fold
                                           
//select inst1

assign ctrl_ir_pre_dis_pst_create2_iid_sel[1] = ctrl_ir_pre_dis_inst01_fold
                                             || ctrl_ir_pre_dis_inst12_fold
                                             || ctrl_ir_pre_dis_inst123_fold;
//select inst2
assign ctrl_ir_pre_dis_pst_create2_iid_sel[2] = !(ctrl_ir_pre_dis_inst012_fold
                                               || ctrl_ir_pre_dis_inst01_fold
                                               || ctrl_ir_pre_dis_inst12_fold
                                               || ctrl_ir_pre_dis_inst123_fold);
*/
//newlogic
//select inst0
// 不太懂 先看后面
assign ctrl_ir_pre_dis_pst_create2_iid_sel[0] = ctrl_ir_pre_dis_inst012_fold
                                           || ctrl_ir_pre_dis_inst0123_fold;//add 0123 fold new logic by xlx
//select inst1
assign ctrl_ir_pre_dis_pst_create2_iid_sel[1] = ctrl_ir_pre_dis_inst01_fold //01 2 3 
                                             || ctrl_ir_pre_dis_inst12_fold //0 12 3
                                             || ctrl_ir_pre_dis_inst123_fold;


//pst create inst3 iid
//select inst1
assign ctrl_ir_pre_dis_pst_create3_iid_sel[0] = ctrl_ir_pre_dis_inst012_fold
                                             || ctrl_ir_pre_dis_inst123_fold;
//select inst2
assign ctrl_ir_pre_dis_pst_create3_iid_sel[1] = ctrl_ir_pre_dis_inst01_fold
                                             || ctrl_ir_pre_dis_inst12_fold
                                             || ctrl_ir_pre_dis_inst23_fold;
//select inst3
assign ctrl_ir_pre_dis_pst_create3_iid_sel[2] = !(ctrl_ir_pre_dis_inst012_fold
                                               || ctrl_ir_pre_dis_inst123_fold
                                               || ctrl_ir_pre_dis_inst01_fold
                                               || ctrl_ir_pre_dis_inst12_fold
                                               || ctrl_ir_pre_dis_inst23_fold);

//new logic

//==========================================================
//                   Performance Monitor
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign hpcp_clk_en = hpcp_idu_cnt_en
                     && (ir_inst0_vld
                      || ir_inst1_vld
                      || ir_inst2_vld
                      || ir_inst3_vld)
                     || ctrl_ir_hpcp_inst0_vld_ff
                     || ctrl_ir_hpcp_inst1_vld_ff
                     || ctrl_ir_hpcp_inst2_vld_ff
                     || ctrl_ir_hpcp_inst3_vld_ff;
// &Instance("gated_clk_cell", "x_hpcp_gated_clk"); @1669
gated_clk_cell  x_hpcp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (hpcp_clk          ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (hpcp_clk_en       ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1670
//          .external_en (1'b0), @1671
//          .global_en   (cp0_yy_clk_en), @1672
//          .module_en   (cp0_idu_icg_en), @1673
//          .local_en    (hpcp_clk_en), @1674
//          .clk_out     (hpcp_clk)); @1675

//----------------------------------------------------------
//                    RF inst valid
//----------------------------------------------------------
assign ctrl_ir_hpcp_inst_vld    = !ctrl_ir_stall;

//----------------------------------------------------------
//              RF stage performance monitor
//----------------------------------------------------------
always @(posedge hpcp_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    ctrl_ir_hpcp_inst0_vld_ff        <= 1'b0;
    ctrl_ir_hpcp_inst1_vld_ff        <= 1'b0;
    ctrl_ir_hpcp_inst2_vld_ff        <= 1'b0;
    ctrl_ir_hpcp_inst3_vld_ff        <= 1'b0;

    ctrl_ir_hpcp_inst0_type[6:0]     <= 7'b0;
    ctrl_ir_hpcp_inst1_type[6:0]     <= 7'b0;
    ctrl_ir_hpcp_inst2_type[6:0]     <= 7'b0;
    ctrl_ir_hpcp_inst3_type[6:0]     <= 7'b0;
  end
  else if(hpcp_idu_cnt_en && ctrl_ir_hpcp_inst_vld) begin
    ctrl_ir_hpcp_inst0_vld_ff        <= ir_inst0_vld;
    ctrl_ir_hpcp_inst1_vld_ff        <= ir_inst1_vld;
    ctrl_ir_hpcp_inst2_vld_ff        <= ir_inst2_vld;
    ctrl_ir_hpcp_inst3_vld_ff        <= ir_inst3_vld;
                                                                                          
    ctrl_ir_hpcp_inst0_type[6:0]     <= dp_ctrl_ir_inst0_hpcp_type[6:0];
    ctrl_ir_hpcp_inst1_type[6:0]     <= dp_ctrl_ir_inst1_hpcp_type[6:0];
    ctrl_ir_hpcp_inst2_type[6:0]     <= dp_ctrl_ir_inst2_hpcp_type[6:0];
    ctrl_ir_hpcp_inst3_type[6:0]     <= dp_ctrl_ir_inst3_hpcp_type[6:0];
  end
  else begin
    ctrl_ir_hpcp_inst0_vld_ff        <= 1'b0;
    ctrl_ir_hpcp_inst1_vld_ff        <= 1'b0;
    ctrl_ir_hpcp_inst2_vld_ff        <= 1'b0;
    ctrl_ir_hpcp_inst3_vld_ff        <= 1'b0;

    ctrl_ir_hpcp_inst0_type[6:0]     <= ctrl_ir_hpcp_inst0_type[6:0];
    ctrl_ir_hpcp_inst1_type[6:0]     <= ctrl_ir_hpcp_inst1_type[6:0];
    ctrl_ir_hpcp_inst2_type[6:0]     <= ctrl_ir_hpcp_inst2_type[6:0];
    ctrl_ir_hpcp_inst3_type[6:0]     <= ctrl_ir_hpcp_inst3_type[6:0];
  end
end

assign idu_hpcp_ir_inst0_vld         = ctrl_ir_hpcp_inst0_vld_ff;
assign idu_hpcp_ir_inst1_vld         = ctrl_ir_hpcp_inst1_vld_ff;
assign idu_hpcp_ir_inst2_vld         = ctrl_ir_hpcp_inst2_vld_ff;
assign idu_hpcp_ir_inst3_vld         = ctrl_ir_hpcp_inst3_vld_ff;
                                                                   
assign idu_hpcp_ir_inst0_type[6:0]   = ctrl_ir_hpcp_inst0_type[6:0];
assign idu_hpcp_ir_inst1_type[6:0]   = ctrl_ir_hpcp_inst1_type[6:0];
assign idu_hpcp_ir_inst2_type[6:0]   = ctrl_ir_hpcp_inst2_type[6:0];
assign idu_hpcp_ir_inst3_type[6:0]   = ctrl_ir_hpcp_inst3_type[6:0];

// &ModuleEnd; @1732
endmodule


