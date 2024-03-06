%% 读入数据
% 耗时长，1个小时 谨慎运行此部分
clc;clear;
bag = rosbag("E:/fly_mcl_2023-07-09-16-40-20.bag"); % E:/大文件/闫村实验二次打击-230709/0709-1645MCL-3次/fly_mcl_2023-07-09-16-40-20.bag
topic_sphere_marker = select(bag,'Time',[bag.StartTime+60 bag.StartTime+105],'Topic','/sphere_marker');
msg_sphere_marker = readMessages(topic_sphere_marker);
topic_target_marker = select(bag,'Time',[bag.StartTime+60 bag.StartTime+105],'Topic','/target_marker');
msg_target_marker = readMessages(topic_target_marker);
topic_particles = select(bag,'Time',[bag.StartTime+60 bag.StartTime+105],'Topic','/particles');
msg_particles = readMessages(topic_particles);

% % 可替换为下面
% load msg_sphere_marker.mat;
% load msg_target_marker.mat;
% load msg_particles.mat;

%% 选择需要的数据，转为mat
particle_num = length(msg_sphere_marker{1,1}.Markers)-2;

struct_sphere = struct;
sphere_pos_all = zeros(length(msg_sphere_marker), particle_num, 3);
t_sphere = zeros(length(msg_sphere_marker), 1);
weight_sphere = zeros(length(msg_sphere_marker), particle_num, 1);
measurement_all = zeros(length(msg_sphere_marker), 3);
barycenter_all = zeros(length(msg_sphere_marker), 3);

struct_relative = struct;
relative_pos_all = zeros(length(msg_target_marker), particle_num, 3);
t_relative = zeros(length(msg_target_marker), 1);

struct_orient = struct;
mav_orient_all = zeros(length(msg_particles), particle_num, 4);
t_orient = zeros(length(msg_particles), 1);

% 遍历每一时刻
for t = 1:length(msg_sphere_marker)
    % 遍历每个粒子，球面位置
    msg_t_sphere_marker = msg_sphere_marker{t,1}.Markers;
    for m = 1:particle_num
        particle = msg_t_sphere_marker(m,1);
        sphere_pos_all(t,m,:) = [particle.Pose.Position.X, particle.Pose.Position.Y, particle.Pose.Position.Z];
        weight_sphere(t,m,1) = particle.Scale.X;
    end
    
    t_stamp = msg_t_sphere_marker(1,1).Header.Stamp.Sec + 1e-9 * msg_t_sphere_marker(1,1).Header.Stamp.Nsec;
    t_sphere(t,1) = t_stamp;
    measurement_all(t,:) = [msg_t_sphere_marker(particle_num+1,1).Pose.Position.X, msg_t_sphere_marker(particle_num+1,1).Pose.Position.Y, msg_t_sphere_marker(particle_num+1,1).Pose.Position.Z];
    barycenter_all(t,:) = [msg_t_sphere_marker(particle_num+2,1).Points(2,1).X, msg_t_sphere_marker(particle_num+2,1).Points(2,1).Y, msg_t_sphere_marker(particle_num+2,1).Points(2,1).Z];
end
struct_sphere.sphere_pos_all = sphere_pos_all;
struct_sphere.t_sphere = t_sphere;
struct_sphere.weight_sphere = weight_sphere;
struct_sphere.measurement_all = measurement_all;
struct_sphere.barycenter_all = barycenter_all;

for t = 1:length(msg_target_marker)
    % 相对位置
    msg_t_target_marker = msg_target_marker{t,1}.Markers;
    for m = 1:particle_num
        particle = msg_t_target_marker(m,1);
        relative_pos_all(t,m,:) = [particle.Pose.Position.X, particle.Pose.Position.Y, particle.Pose.Position.Z];
    end
    
    t_stamp = msg_t_target_marker(1,1).Header.Stamp.Sec + 1e-9 * msg_t_target_marker(1,1).Header.Stamp.Nsec;
    t_relative(t,1) = t_stamp;
end
struct_relative.relative_pos_all = relative_pos_all;
struct_relative.t_relative = t_relative;

for t = 1:length(msg_particles)
    % 粒子朝向
    msg_t_particles = msg_particles{t,1}.Poses;
    for m = 1:particle_num
        particle = msg_t_particles(m,1);
        mav_orient_all(t,m,:) = [particle.Orientation.W, particle.Orientation.X, particle.Orientation.Y, particle.Orientation.Z];
    end
    
    t_stamp = msg_particles{t,1}.Header.Stamp.Sec + 1e-9 * msg_particles{t,1}.Header.Stamp.Nsec;
    t_orient(t,1) = t_stamp;
end
struct_orient.mav_orient_all = mav_orient_all;
struct_orient.t_orient = t_orient;

%% 保存数据
save("struct_sphere.mat", "struct_sphere");
save("struct_relative.mat", "struct_relative");
save("struct_orient.mat", "struct_orient");
