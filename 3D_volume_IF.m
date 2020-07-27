filename = 'C:\Users\Maria\Desktop\MAP2-1.tif';
obj = Tiff(filename, 'r');
n_voxel_white = 0;
n_voxel_black = 0;
voxelsize = 0.171 * 0.171 * 5; %(um3);

while 1
    subimage = obj.read();
    binary_image = im2bw(subimage, 0.175);
    % Comment this out to check what the mask looks like.
    %imshow(binary_image);
      %break;
    n_voxel_white = n_voxel_white + sum(binary_image(:) > 0)
    n_voxel_black = n_voxel_black + sum(binary_image(:) == 0);
    if (obj.lastDirectory())
        break;
    end
    obj.nextDirectory()
end
MAP2volume = voxelsize * n_voxel_white