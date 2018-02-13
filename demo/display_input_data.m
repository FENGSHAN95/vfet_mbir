clc; close all; clear;

N_pixels = 128; %Number of pixels along each row of input image (i.e., electron phase image)
angles = -70:2:70; %Number of view angles
view = 20; %View index at which the input image must be fetched and displayed 
pix_width = 5; %Resolution or width of each pixel in input image (in nm)

N_projs = numel(angles); %Number of view angles
ROI_v = N_pixels/4-8:N_pixels*3/4+8; %ROI (Region of Interest) to limit the field of view of the display image

%Read tilt series data across u-axis
fid = fopen('data_u.bin', 'rb');
data_u = reshape(fread(fid, N_pixels*N_pixels*N_projs, 'float'), [N_pixels, N_pixels, N_projs]);
data_u = permute(data_u, [2,1,3]);
fclose(fid);

%Read tilt series data across v-axis
fid = fopen('data_v.bin', 'rb');
data_v = reshape(fread(fid, N_pixels*N_pixels*N_projs, 'float'), [N_pixels, N_pixels, N_projs]);
data_v = permute(data_v, [2,1,3]);
fclose(fid);

%max/min values for displaying the input image
maxval = max(data_u(:))*4/5;
minval = min(data_u(:))*4/5;

figure(1); 
imagesc(data_u(ROI_v,:,view));
xlabel('u-axis (nm)'); ylabel('v-axis (nm)');
title('Phase image for tilt across u-axis');
c = colorbar; c.Label.String = 'Units of radians';
colormap(gray); axis image;

figure(2);
imagesc(data_v(ROI_v,:,view)); 
xlabel('u-axis (nm)'); ylabel('v-axis (nm)');
title('Phase image for tilt across v-axis');
c = colorbar; c.Label.String = 'Units of radians';
colormap(gray); axis image;
