% clc;clear;
addpath(genpath('..\'));

figure_configuration_IEEE_standard;
load struct_sphere.mat;
load struct_relative.mat;
load struct_orient.mat;

% 写视频操作
videoobj = VideoWriter('particles_sphere-fly_mcl_2023-07-10-17-00-41.avi', 'Uncompressed AVI');
videoobj.FrameRate = 30;
open(videoobj)

idx_rel = 1;
for t = 1:length(struct_sphere.sphere_pos_all)
%     t = 600;
    disp(t);
    if idx_rel == s(1)
        break
    end
    
    if struct_relative.t_relative(idx_rel+1,1) < struct_sphere.t_sphere(t,1)
        idx_rel = idx_rel + 1;
    end
    
    fun_plot_particles_sphere(struct_sphere, struct_relative, struct_orient, t, idx_rel);
    
    pause(0.01);
    hold off;
    
    temp=getframe(gcf);
    frame=temp.cdata;
    writeVideo(videoobj,frame);
end
close(videoobj)
