function [depth, latitude, longitude, temperature, salinity, zonal_current, meridional_current, sea_surface_height] = parsedata(filename)

%ncdisp(filename); % display the content of the .nc file

depth = ncread(filename, 'depth');
latitude = ncread(filename, 'lat');
longitude = ncread(filename, 'lon');
temperature = ncread(filename, 'temp');
salinity = ncread(filename, 'salt');
zonal_current = ncread(filename, 'u');
meridional_current = ncread(filename, 'v');
sea_surface_height = ncread(filename, 'zeta');