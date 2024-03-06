# 实验数据可视化
1. `readbag.m` 从rosbag中导入数据，将结果保存到文件，运行一次即可！
2. `subplot_process.m` 绘制拦截过程的粒子分布多合一图。
想完美画图需要改`figure_configuration_IEEE_standard.m`第20行k_width_hight = 0.43。
关掉`fun_plot_particles.m`和`fun_plot_particles_sphere`里的xlable、ylabel、zlabel。
3. `plot_particles_sphere.m` 绘制球面S^2上粒子，for循环时连续播放，可录屏。选择要的一帧改`subplot_process.m`中的t。
4. `plot_particles_all.m` 绘制R^3上粒子，for循环时连续播放，可录屏。选择要的一帧改`subplot_process.m`中的t。

# 画MCL示意图
`MCL_description.m` 得到论文中MCL的示意图。

# 工具
1. `pic2video.m` 将输出的图片转换为视频。
2. `figure_configuration_IEEE_standard.m` 绘图参数，绘制结果保存为svg后直接复制到visio中。
参数`k_width_hight`和`width = 17.6 * k_scaling`比较重要。
3. `drawsphere.m` 画球面函数，kcx同款。