% clc;clear;
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
        q = reshape( mav_orient_all(t,m,:), [], 1);
        mav_orient_xyz(t,m,:) = 1.3 * q(2:4) / norm(q(2:4));
    end
end
struct_orient.mav_orient_xyz = mav_orient_xyz;

%% 第一列第一行
subplot(2,4,1);
t = 100;
idx_rel = 86;

fun_plot_particles_sphere(struct_sphere, struct_relative, struct_orient, t, idx_rel);


%% 第一列第二行
subplot(2,4,5);
fun_plot_particles(struct_sphere, struct_relative, struct_orient, t, idx_rel, particle_num);


%% 第二列第一行
subplot(2,4,2);
t = 353;
idx_rel = 293;

fun_plot_particles_sphere(struct_sphere, struct_relative, struct_orient, t, idx_rel);


%% 第二列第二行
subplot(2,4,6);
fun_plot_particles(struct_sphere, struct_relative, struct_orient, t, idx_rel, particle_num);



%% 第三列第一行
subplot(2,4,3);
t = 400;
idx_rel = 333;

fun_plot_particles_sphere(struct_sphere, struct_relative, struct_orient, t, idx_rel);


%% 第三列第二行
subplot(2,4,7);
fun_plot_particles(struct_sphere, struct_relative, struct_orient, t, idx_rel, particle_num);


%% 第四列第一行
subplot(2,4,4);
t = 823;
idx_rel = 600;

fun_plot_particles_sphere(struct_sphere, struct_relative, struct_orient, t, idx_rel);


%% 第四列第二行
subplot(2,4,8);
fun_plot_particles(struct_sphere, struct_relative, struct_orient, t, idx_rel, particle_num);

