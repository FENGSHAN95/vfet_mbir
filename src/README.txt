------------------------------------------------ Command line arguments ------------------------------------------
proj_rows - Number of rows (or slices) in the projection image. Typically, it is the number of detector bins in the axial direction.
proj_cols - Number of columns in the projection image. Typically, it is the number of detector bins in the cross-axial direction.
proj_u_num - Number of views for tilt across u-axis
proj_v_num - Number of views for tilt across v-axis
vox_wid - Width of each voxel. 
          Reconstruction will be in inverse units of 'vox_wid'. 
          For instance, if 'vox_wid' is specified in units of nm, magnetic vector potential reconstruction will have unit of nm^{-1} and magnetization will have unit of nm^{-2}. 
regparam_beta - Regularization parameter. 
                This parameter is chosen empirically by observing the magnetization reconstruction results. 
                Increasing 'regparam_beta' will increase reconstruction smoothness while reducing noise.
                Reducing 'regparam_beta' will increase noise while improving the reconstruction sharpness.
                A good starting value for 'regparam_beta' is zero, which ensures no regularization. 
                Then, increase 'regparam_beta' in multiples of 10 until you get the desired smoothness and reconstruction quality of magnetization.
convg_thresh - Threshold for convergence, specified as a percentage.
               Used to determine when the algorithm is converged at each stage of multi-resolution reconstruction.
               For instance, if convg_thresh = 1.0, the algorithm stops running when the percentage change in average value of reconstruction is less than 1.0%. 
admm_mu - ADMM parameter. Needs to be set properly for stable and quick convergence. 
          A good starting value for this parameter is 1. 
          Then, increase this parameter if magnetic vector potential reconstruction seems to be producing valid images but magnetization does not seem to be proper or accurate.
admm_maxiters - Maximum number of admm iterations
u_widnum - Number of voxels to reconstruct in the u-axis direction
v_widnum - Number of voxels to reconstruct in v-axis direction
w_widnum - Number of voxels to reconstruct in w-axis direction

-------------------------------------- Input and output files (all files are in 'double' precision) --------------------------
data_u.bin - Electron phase shift data in rasterized order for tilt across u-axis. Data ordering is (angles,rows,columns).
             The matlab script 'demo/display_input_data.m' can be used to visualize and better understand the formatting of this binary file.
data_v.bin - Electron phase shift data in rasterized order for tilt across v-axis. Data ordering is (angles,rows,columns).
             The matlab script 'demo/display_input_data.m' can be used to visualize and better understand the formatting of this binary file.
proj_angles_u.bin - Tilt angles in radians for tilt across u-axis.
proj_angles_v.bin - Tilt angles in radians for tilt across v-axis.
magnetization.bin - Reconstruction of magnetization in raster format. Data ordering is (w-axis,v-axis,u-axis,3).
                    The matlab script 'demo/display_output_data.m' can be used to visualize and better understand the formatting of this binary file.
magvecpot.bin - Reconstruction of magnetic vector potential in raster format. Ordering is (w-axis,v-axis,u-axis,3).
                The matlab script 'demo/display_output_data.m' can be used to visualize and better understand the formatting of this binary file.
