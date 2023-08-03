% clc;clear;
figure_configuration_IEEE_standard;
load struct_sphere.mat;
load struct_relative.mat;
load struct_orient.mat;

%% 第一列第一行
subplot(2,4,1);
t = 100;
idx_rel = 86;

fun_plot_particles_sphere(struct_sphere, struct_relative, struct_orient, t, idx_rel);


%% 第一列第二行
subplot(2,4,5);
fun_plot_particles(struct_sphere, struct_relative, struct_orient, t, idx_rel);


%% 第二列第一行
subplot(2,4,2);
t = 353;
idx_rel = 293;

fun_plot_particles_sphere(struct_sphere, struct_relative, struct_orient, t, idx_rel);


%% 第二列第二行
subplot(2,4,6);
fun_plot_particles(struct_sphere, struct_relative, struct_orient, t, idx_rel);



%% 第三列第一行
subplot(2,4,3);
t = 400;
idx_rel = 333;

fun_plot_particles_sphere(struct_sphere, struct_relative, struct_orient, t, idx_rel);


%% 第三列第二行
subplot(2,4,7);
fun_plot_particles(struct_sphere, struct_relative, struct_orient, t, idx_rel);


%% 第四列第一行
subplot(2,4,4);
t = 823;
idx_rel = 600;

fun_plot_particles_sphere(struct_sphere, struct_relative, struct_orient, t, idx_rel);


%% 第四列第二行
subplot(2,4,8);
fun_plot_particles(struct_sphere, struct_relative, struct_orient, t, idx_rel);

