" Vim syntax file
" Language:	      EcScript
" Maintainer:	      Peter Lustig <peter.lustig@energid.com>
" Version:            2.0
" Project Repository: https://github.com/Energid/vim-ecscript


" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

if !exists("g:ecs_check_parens")
  let g:ecs_check_parens = 0
endif

if !exists("g:ecs_warn_deprecated")
  let g:ecs_warn_deprecated = 1
endif

if !exists("g:ecs_rcf_extensions")
  let g:ecs_rcf_extensions = 1
endif

if !exists("g:ecs_actin_extensions")
  let g:ecs_actin_extensions = 1
endif

if !exists("g:ecs_ur_extensions")
  let g:ecs_ur_extensions = 0
endif


if g:ecs_check_parens
  syn match ecsExcessParen ")"
endif

syn keyword ecsTodo TODO FIXME XXX contained

syn match ecsComment "#.*" contains=ecsTodo

syn keyword ecsVariable def_fun contained
syn keyword ecsVariable def_bool def_u32 def_u32_vec def_real def_real_vec def_string contained
syn keyword ecsVariable def_trans def_rot def_pose contained

syn keyword ecsControl include eval contained
syn keyword ecsControl if while contained
syn keyword ecsControl motion_seq group_motion_seq stream_motion_seq motion_para contained
syn keyword ecsControl wait wait_for_settle break return contained

syn match ecsOperator "\v%(:\=|[-+&|*/^]|[=~]\=|[!<>]\=?)" contained

syn keyword ecsFunction QUAT AA RPY YPR DCC DCR contained
syn keyword ecsFunction dot cross inv norm mod pow exp sqrt contained
syn keyword ecsFunction sin cos tan asin acos atan atan2 contained
syn keyword ecsFunction abs ceil floor round min max contained
syn keyword ecsFunction log log2 log10 rand randn contained
syn keyword ecsFunction elem_of size_of get_rot get_trans contained
syn keyword ecsFunction real_to_trans real_vec_to_pose real_vec_to_trans contained
syn keyword ecsFunction rot_to_real_vec to_real to_u32 contained
syn keyword ecsFunction get_base_acceleration_factor get_base_speed_factor contained
syn keyword ecsFunction get_control_description_id get_ee_pose get_ee_set_id contained
syn keyword ecsFunction get_frame contained
syn keyword ecsFunction get_joint_ee get_joint_ee_velocity get_joint_positions get_joint_velocities contained
syn keyword ecsFunction get_link_id get_manip_id contained
syn keyword ecsFunction get_state_time contained
syn keyword ecsFunction hit_joint_limit is_converged contained
syn keyword ecsFunction get_data_map_bool get_data_map_u32 get_data_map_u32_vec contained
syn keyword ecsFunction get_data_map_real get_data_map_real_vec get_data_map_string contained
syn keyword ecsFunction get_data_map_trans get_data_map_rot get_data_map_pose contained
syn keyword ecsFunction get_digital_input contained
syn keyword ecsFunction elapsed_time contained

if g:ecs_rcf_extensions
  syn keyword ecsFunction get_data_store_bool get_data_store_u32 get_data_store_u32_vec contained
  syn keyword ecsFunction get_data_store_real get_data_store_real_vec get_data_store_string contained
  syn keyword ecsFunction get_data_store_trans get_data_store_rot get_data_store_pose contained
  syn keyword ecsFunction get_data_store_u8 get_data_store_u16 contained
  syn keyword ecsFunction get_data_store_u32 get_data_store_u64 contained
  syn keyword ecsFunction get_data_store_bit_u8 get_data_store_bit_u16 contained
  syn keyword ecsFunction get_data_store_bit_u32 get_data_store_bit_u64 contained
endif

syn keyword ecsFunctionDeprecated get_dm_bool get_dm_u32 get_dm_u32_vec contained
syn keyword ecsFunctionDeprecated get_dm_real get_dm_real_vec get_dm_string contained
syn keyword ecsFunctionDeprecated get_dm_trans get_dm_rot get_dm_pose contained
syn keyword ecsFunctionDeprecated get_di contained

syn keyword ecsCommand set_elem_of contained
syn keyword ecsCommand attach_manip detach_manip contained
syn keyword ecsCommand enable_joint_limits disable_joint_limits contained
syn keyword ecsCommand include_collision exclude_collision
syn keyword ecsCommand include_attach_collision exclude_attach_collision contained
syn keyword ecsCommand check_collision contained
syn keyword ecsCommand set_base_accel_factor set_base_speed_factor contained
syn keyword ecsCommand set_control_description set_ee_set set_named_frame set_pcs contained
syn keyword ecsCommand set_position_control_method set_position_state set_sensed_state contained
syn keyword ecsCommand set_tcp set_path_offset set_payload contained
syn keyword ecsCommand move_pose move_pose_rel contained
syn keyword ecsCommand move_joint move_joint_mix move_joint_rel contained
syn keyword ecsCommand move_circular move_linear move_helical move_path contained
syn keyword ecsCommand speed stop contained
syn keyword ecsCommand find_solution rrt_plan contained
syn keyword ecsCommand set_data_map_bool set_data_map_u32 set_data_map_u32_vec contained
syn keyword ecsCommand set_data_map_real set_data_map_real_vec set_data_map_string contained
syn keyword ecsCommand set_data_map_trans set_data_map_rot set_data_map_pose contained
syn keyword ecsCommand set_digital_input set_digital_output contained
syn keyword ecsCommand start_timer contained

if g:ecs_rcf_extensions
  syn keyword ecsCommand invoke contained
  syn keyword ecsCommand set_data_store_bool set_data_store_u32 set_data_store_u32_vec contained
  syn keyword ecsCommand set_data_store_real set_data_store_real_vec set_data_store_string contained
  syn keyword ecsCommand set_data_store_trans set_data_store_rot set_data_store_pose contained
  syn keyword ecsCommand set_data_store_u8 set_data_store_u16 contained
  syn keyword ecsCommand set_data_store_u32 set_data_store_u64 contained
  syn keyword ecsCommand set_data_store_bit_u8 set_data_store_bit_u16 contained
  syn keyword ecsCommand set_data_store_bit_u32 set_data_store_bit_u64 contained
endif

if g:ecs_actin_extensions
  syn keyword ecsCommand move_joint_seq rrt_connect_plan contained
endif

if g:ecs_ur_extensions
  syn keyword ecsCommand find_ur_solution contained
endif

syn keyword ecsCommandDeprecated set_acd set_apcm set_baf set_bsp contained
syn keyword ecsCommandDeprecated set_tool_offset contained
syn keyword ecsCommandDeprecated pose_seq interp_pos_seq move_pose_b contained
syn keyword ecsCommandDeprecated set_dm_bool set_dm_u32 set_dm_u32_vec contained
syn keyword ecsCommandDeprecated set_dm_real set_dm_real_vec set_dm_string contained
syn keyword ecsCommandDeprecated set_dm_trans set_dm_rot set_dm_pose contained
syn keyword ecsCommandDeprecated set_di set_do contained
syn keyword ecsCommandDeprecated profile_joint profile_pose contained

syn keyword ecsAssert assert contained

syn keyword ecsAssertDeprecated assert_approx_eq contained

syn keyword ecsPrint print contained

if g:ecs_rcf_extensions
  syn keyword ecsPrint print_log contained
endif

syn keyword ecsParameter AccelerationFactor contained
syn keyword ecsParameter AssertTolerance contained
syn keyword ecsParameter CacheCost CacheNumWaypoints CacheThreshold contained
syn keyword ecsParameter CollisionStepSize CollisionThreshold contained
syn keyword ecsParameter InitialPosition contained
syn keyword ecsParameter MaxTime contained
syn keyword ecsParameter PathShorteningIterations PathShorteningTolerance contained
syn keyword ecsParameter SpeedFactor contained
syn keyword ecsParameter StepSize contained
syn keyword ecsParameter Tolerance contained
syn keyword ecsParameter AttachExclusion AttachPlacement contained

if g:ecs_rcf_extensions
  syn keyword ecsParameter INFO ERROR WARNING FATAL contained
endif

if g:ecs_actin_extensions
  syn keyword ecsParameter BlendingThreshold contained
  syn keyword ecsParameter DesiredBlending contained
  syn keyword ecsParameter JerkFactor contained
  syn keyword ecsParameter PredefinedSeed contained
  syn keyword ecsParameter RunSynchronous contained
  syn keyword ecsParameter ScalingActiveKey ScalingMaxTimeMicroseconds ScalingStepSize contained
  syn keyword ecsParameter SpeedLimitNamedFrames contained
  syn keyword ecsParameter VelocityTolerance contained
endif

syn keyword ecsBoolean TRUE FALSE contained

syn keyword ecsBooleanDeprecated true false contained

syn match ecsNumber "\v<%(0x[0-9a-fA-F]+|-?%(\.\d+|\d+%(\.\d*)?)%([Ee]-?\d+)?%(deg|in|mm?|rad)?)>" contained
syn keyword ecsNumber BASE contained

syn region ecsString start="\"" skip="\\\"" end="\"" oneline contained
syn match ecsSpecialChar "\\["\\]" containedin=ecsString

if g:ecs_check_parens
  syn region ecsStatement start="(" end=")" transparent fold contains=ALLBUT,ecsExcessParen,ecsSpecialChar,ecsTodo
else
  syn region ecsStatement start="(" end=")" transparent fold contains=ALLBUT,ecsSpecialChar,ecsTodo
endif

if g:ecs_check_parens
  syn sync fromstart
  hi def link ecsExcessParen Error
endif

if g:ecs_warn_deprecated
  hi def link ecsCommandDeprecated Todo
  hi def link ecsFunctionDeprecated Todo
  hi def link ecsAssertDeprecated Todo
  hi def link ecsBooleanDeprecated Todo
else
  hi def link ecsCommandDeprecated ecsCommand
  hi def link ecsFunctionDeprecated ecsFunction
  hi def link ecsAssertDeprecated ecsAssert
  hi def link ecsBooleanDeprecated ecsBoolean
endif

hi def link ecsTodo Todo
hi def link ecsComment Comment
hi def link ecsVariable Type
hi def link ecsControl Statement
hi def link ecsOperator Operator
hi def link ecsFunction Identifier
hi def link ecsCommand Function
hi def link ecsAssert WarningMsg
hi def link ecsPrint Special
hi def link ecsParameter Identifier
hi def link ecsBoolean Boolean
hi def link ecsNumber Number
hi def link ecsString String
hi def link ecsSpecialChar Special

let &cpo = s:cpo_save
unlet s:cpo_save


" vim: sw=2
" End of File
