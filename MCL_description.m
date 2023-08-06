clc;clear;
figure_configuration_IEEE_standard;

%% 数据
relative_pos_all = zeros(5, 5, 3);  % （时间，粒子id，坐标）
mav_orient_all = zeros(5, 5, 1);    % 偏航角
sphere_pos_all = zeros(5, 5, 3);
measurement_pos_all = zeros(5, 1, 3);
measurement_pos_sphere = zeros(5, 1, 3);

times = size(relative_pos_all, 1);
particle_num = size(relative_pos_all, 2);

relative_pos_all(1,:,:) = [0.3, 5, 3; 2.5, 6, 3.3; 1.2, 7.5, 2.8; -0.4, 9, 3.5; 1.8, 10.5, 2.6];
mav_orient_all(1,:,:) = deg2rad([86; 88; 90; 92; 94]);
relative_pos_all(2,:,:) = [-0.3, 4.5, 3.2; 2.9, 5.8, 3.5; 1.3, 6.8, 2.7; -1.4, 8.5, 3.4; 2.2, 9.1, 2.7];
mav_orient_all(2,:,:) = deg2rad([82; 86; 90; 94; 98]);
relative_pos_all(3,:,:) = [-0.3, 4.5, 3.2; 2.9, 5.8, 3.5; 1.3, 6.8, 2.7; -1.4, 8.5, 3.4; 2.2, 9.1, 2.7];
mav_orient_all(3,:,:) = deg2rad([82; 86; 90; 94; 98]);
relative_pos_all(4,:,:) = [1.0, 6.4, 3.0; 1.8, 6.6, 2.5; 1.3, 6.8, 2.7; 2.1, 9.0, 2.6; 2.3, 9.2, 2.8];
mav_orient_all(4,:,:) = deg2rad([86; 88; 90; 98; 100]);
relative_pos_all(5,:,:) = [0.6, 5.8, 3.2; 1.6, 6.2, 2.3; 1.2, 6.4, 2.8; 1.7, 8.4, 2.4; 2.1, 8.8, 2.7];
mav_orient_all(5,:,:) = deg2rad([86; 88; 92; 96; 100]);
measurement_pos_all(3,1,:) = [1.2, 8, 2.8];

for t = 1:times
    for m = 1:particle_num
        p = squeeze(relative_pos_all(t,m,:));
        sphere_pos_all(t,m,:) = p / norm(p);
        q = squeeze(measurement_pos_all(t,:,:));
        if norm(q) > 0.1
            measurement_pos_sphere(t,1,:) = q / norm(q);
        end
    end
end


%% 第一列第一行
t = 1;
subplot(2,5,1);
[weight_sphere, size_sphere] = fun_plot_particles_sphere_simple(squeeze(sphere_pos_all(t,:,:)), squeeze(measurement_pos_sphere(t,:,:)));

%% 第一列第二行
subplot(2,5,6);
fun_plot_particles_simple(squeeze(relative_pos_all(t,:,:)), squeeze(mav_orient_all(t,:,:)), squeeze(measurement_pos_all(t,:,:)), weight_sphere, size_sphere );


%% 第二列第一行
t = 2;
subplot(2,5,2);
[weight_sphere, size_sphere] = fun_plot_particles_sphere_simple(squeeze(sphere_pos_all(t,:,:)), squeeze(measurement_pos_sphere(t,:,:)));

%% 第二列第二行
subplot(2,5,7);
fun_plot_particles_simple(squeeze(relative_pos_all(t,:,:)), squeeze(mav_orient_all(t,:,:)), squeeze(measurement_pos_all(t,:,:)), weight_sphere, size_sphere );


%% 第三列第一行
t = 3;
subplot(2,5,3);
[weight_sphere, size_sphere] = fun_plot_particles_sphere_simple(squeeze(sphere_pos_all(t,:,:)), squeeze(measurement_pos_sphere(t,:,:)));

%% 第三列第二行
subplot(2,5,8);
fun_plot_particles_simple(squeeze(relative_pos_all(t,:,:)), squeeze(mav_orient_all(t,:,:)), squeeze(measurement_pos_all(t,:,:)), weight_sphere, size_sphere );


%% 第四列第一行
t = 4;
subplot(2,5,4);
[weight_sphere, size_sphere] = fun_plot_particles_sphere_simple(squeeze(sphere_pos_all(t,:,:)), squeeze(measurement_pos_sphere(t,:,:)));

%% 第四列第二行
subplot(2,5,9);
fun_plot_particles_simple(squeeze(relative_pos_all(t,:,:)), squeeze(mav_orient_all(t,:,:)), squeeze(measurement_pos_all(t,:,:)), weight_sphere, size_sphere );


%% 第五列第一行
t = 5;
subplot(2,5,5);
[weight_sphere, size_sphere] = fun_plot_particles_sphere_simple(squeeze(sphere_pos_all(t,:,:)), squeeze(measurement_pos_sphere(t,:,:)));

%% 第五列第二行
subplot(2,5,10);
fun_plot_particles_simple(squeeze(relative_pos_all(t,:,:)), squeeze(mav_orient_all(t,:,:)), squeeze(measurement_pos_all(t,:,:)), weight_sphere, size_sphere );

