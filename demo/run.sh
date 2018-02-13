
#Command line arguments
#proj_rows - Number of rows in projection data
#proj_cols - Number of columns in projection data
#proj_x_num - Number of views for tilt across x-axis
#proj_y_num - Number of views for tilt across y-axis
#vox_wid - Width of voxel
#qggmrf_sigma - Regularization parameter. Decides smoothness of reconstruction.
#qggmrf_c - Parameter that prevents smoothing of edges. Set it less than (minimum difference in units of magnetization along an edge)/qggmrf_sigma. Unit of magnetization is the squared inverse of the unit of 'vox_wid'. If you can't figure this out, just set to an arbitrarily small number.
# convg_thresh - Threshold for convergence.
# admm_mu - ADMM parameter. Set it equal to 1 if you cannot figure out a more appropriate value.
# admm_maxiters - Maximum number of ADMM iterations.
# x_widnum - Number of voxels along x-axis of reconstruction.
# y_widnum - Number of voxels along y-axis of reconstruction.
# z_widnum - Number of voxels along z-axis of reconstruction.
# data_variance - Variance in data. Set equal to 1 if you don't estimate it.

#Input and output files (all files are in 'double' precision)
#proj_angles_x.bin - Projection angles in radians for tilt across x-axis
#data_unflip_y.bin - Projection angles in radians for tilt across y-axis
#data_unflip_x.bin - Projection data in row-major order for tilt across x-axis. Ordering is (angles,rows,columns).
#proj_angles_y.bin - Projection data in row-major order for tilt across y-axis. Ordering is (angles,rows,columns).
#magnetization.bin - Reconstruction of magnetization. Ordering is (z-axis,y-axis,x-axis,3).
#magvecpot.bin - Reconstruction of magnetic vector potential. Ordering is (z-axis,y-axis,x-axis,3).
 
export OMP_NUM_THREADS=8 #Set appropriately depending on the system. This enviornment variable may or may not be applicable depending on the system.

../src/XT_Main --proj_rows 128 --proj_cols 128 --proj_x_num 71 --proj_y_num 71 --vox_wid 5 --regparam_beta 10000000 --convg_thresh 1.0 --admm_mu 100000 --admm_maxiters 10 --x_widnum 128 --y_widnum 128 --z_widnum 64
