
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name PROYECTO -dir "C:/Proyectos ISE/PROYECTO/planAhead_run_1" -part xc3s700anfgg484-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Proyectos ISE/PROYECTO/proj1est.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Proyectos ISE/PROYECTO} {ipcore_dir} }
add_files [list {ipcore_dir/mem.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/mem2.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "vgacont.ucf" [current_fileset -constrset]
add_files [list {vgacont.ucf}] -fileset [get_property constrset [current_run]]
link_design
