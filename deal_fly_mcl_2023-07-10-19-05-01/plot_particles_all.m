% clc;clear;
addpath(genpath('..\'));

figure_configuration_IEEE_standard;
load struct_sphere.mat;
load struct_relative.mat;
load struct_orient.mat;

s = size(struct_orient.mav_orient_all);
particle_num = s(2);
mav_orient_xyz = zeros(s(1), s(2), 3);
mav_orient_all = struct_orient.mav_orient_all;
for t = 1:size(mav_orient_all,1)
    for m = 1:size(mav_orient_all,2)
        q = reshape( mav_orient_all(t,m,:), 1, []);
        
        q0 = [0,1,0,0];  % 初始点转四元数
        dq = quatmultiply(q,q0); % 计算q2*q
        q3 = quatinv(q);  % 求四元数的逆
        q4 = quatmultiply(dq,q3);
        mav_orient_xyz(t,m,:) = 1.3 * q4(2:4);
    end
end
struct_orient.mav_orient_xyz = mav_orient_xyz;

% 写视频操作
videoobj = VideoWriter('particles_all-fly_mcl_2023-07-10-19-05-01.avi', 'Uncompressed AVI');
videoobj.FrameRate = 30;
open(videoobj)

idx_rel = 1;
for t = 1:length(struct_sphere.sphere_pos_all)
    disp(t);
    if idx_rel == s(1)
        break
    end
    
    if struct_relative.t_relative(idx_rel+1,1) < struct_sphere.t_sphere(t,1)
        idx_rel = idx_rel + 1;
    end
    disp(idx_rel);
    
%     t = 100;
%     idx_rel = 85;
    
    fun_plot_particles(struct_sphere, struct_relative, struct_orient, t, idx_rel, particle_num);

    pause(0.01);
    hold off;
    
    temp=getframe(gcf);
    frame=temp.cdata;
    writeVideo(videoobj,frame);
end
close(videoobj)

rmpath(genpath('..\'));
