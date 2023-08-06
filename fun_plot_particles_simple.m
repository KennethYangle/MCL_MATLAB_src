function fun_plot_particles_simple(relative_pos, mav_orient, measurement_pos, weight_sphere, size_sphere)
%画二维粒子分布函数。

    %% 算方向
    particle_num = size(relative_pos, 1);
    L = 1.5;
    mav_orient_xy = zeros(2, particle_num);
    mav_orient_xy(1,:) = L * cos(mav_orient);
    mav_orient_xy(2,:) = L * sin(mav_orient);

    %% 画球面
    viscircles([0,0], 1,'Color','#b1ceef');
    hold on;
    
    %% 画粒子
    if norm(measurement_pos) > 0.1
        scatter(measurement_pos(1), measurement_pos(2), 60, 'MarkerEdgeColor','k', 'MarkerFaceColor',[0.8500, 0.10, 0.0980]);
        scatter(relative_pos(:,1), relative_pos(:,2), 150*size_sphere(:), 'MarkerEdgeColor',"#f47923", 'MarkerFaceColor',"#ff8d24");
    else
        scatter(relative_pos(:,1), relative_pos(:,2), 15, 'MarkerEdgeColor',"#f47923", 'MarkerFaceColor',"#ff8d24");
    end
    
    quiver(zeros(1,particle_num),zeros(1,particle_num), mav_orient_xy(1,:), mav_orient_xy(2,:), ...
    '-','LineWidth',3,'Color','#77AC30','AutoScale','on','AutoScaleFactor',1);

    %% 绘图配置
    axis equal;
    xlim([-5, 5]);
    ylim([-2, 12]);
    ax = gca;
    ax.GridLineStyle = '-';
    box on;
end

