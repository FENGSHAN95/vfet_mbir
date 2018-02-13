clc; clear; close all;

N_u = 128; %Number of voxels along u-axis
N_v = 128; %Number of voxels along v-axis
N_w = 64; %Number of voxels along w-axis
vox_wid = 5; %Voxel width (in nm)
comp_index = 1; %Index of vector component to display. 1->w-axis, 2->v-axis, 3->u-axis

w_slice = N_w/2; %w-axis index for the slice (along u-v plane) that must be displayed
v_slice = N_v/2-3; %v-axis index for the slice (along u-w plane) that must be displayed

ROI_u = 1:N_u;
ROI_v = N_v/4-8:N_v*3/4+8;
ROI_w = N_w/2+(-N_w/4-4:N_w/4+4);

idx_u = (ROI_u - N_u/2)*vox_wid;
idx_v = (ROI_v - N_v/2)*vox_wid;
idx_w = (ROI_w - N_w/2)*vox_wid;

%% Magnetization analysis
magn_minmax = [-4,4]*10^(-5); %min/max scaling for magnetization display
magn_filename = 'magnetization.bin'; %Filename containing the magnetization voxel values

fid = fopen(magn_filename, 'rb');
mag = reshape(fread(fid, N_u*N_v*N_w*3, 'double'), [3, N_u, N_v, N_w]);
mag = permute(mag, [3,2,4,1]);
fclose(fid);

figure(1); imagesc(idx_u, idx_v, mag(ROI_v,ROI_u,w_slice,comp_index), magn_minmax); 
colormap(gray); colorbar; axis image; title('Magnetization');
xlabel('u-axis (nm)'); ylabel('v-axis (nm)');
c = colorbar; c.Label.String = 'Units of nm^{-2}';

figure(2); imagesc(idx_u, idx_w, permute(mag(v_slice,ROI_u,ROI_w,comp_index),[3,2,1,4]), magn_minmax); 
colormap(gray); colorbar; axis image; title('Magnetization');
xlabel('u-axis (nm)'); ylabel('w-axis (nm)');
c = colorbar; c.Label.String = 'Units of nm^{-2}';

%% Magnetic Vector Potential analysis

magvecpot_minmax = [-11,11]*10^(-3); %min/max scaling for magnetic vector potential display
magvecpot_filename = 'magvecpot.bin'; %Filename containing the magnetic vector potential voxel values

fid = fopen(magvecpot_filename, 'rb');
mag = reshape(fread(fid, N_u*N_v*N_w*3, 'double'), [3, N_u, N_v, N_w]);
mag = permute(mag, [3,2,4,1]);
fclose(fid);

figure(3); imagesc(idx_u, idx_v, mag(ROI_v,ROI_u,w_slice,comp_index), magvecpot_minmax); 
colormap(gray); colorbar; axis image; title('Magnetic Vector Potential');
xlabel('u-axis (nm)'); ylabel('v-axis (nm)');
c = colorbar; c.Label.String = 'Units of nm^{-1}';

figure(4); imagesc(idx_u, idx_w, permute(mag(v_slice,ROI_u,ROI_w,comp_index),[3,2,1,4]), magvecpot_minmax); 
colormap(gray); colorbar; axis image; title('Magnetic Vector Potential');
xlabel('u-axis (nm)'); ylabel('w-axis (nm)');
c = colorbar; c.Label.String = 'Units of nm^{-1}';
