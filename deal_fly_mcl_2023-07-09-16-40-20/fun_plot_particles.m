function fun_plot_particles(struct_sphere, struct_relative, struct_orient, t, idx_rel, particle_num)
%画三维粒子分布函数。输入数据，各数据时刻

    %% 画球面
    drawsphere(0,0,0,1, "face", 10);
    hold on;
    
    %% 画粒子
%     scatter3(struct_sphere.sphere_pos_all(t,:,1), struct_sphere.sphere_pos_all(t,:,2), struct_sphere.sphere_pos_all(t,:,3));
    scatter3(struct_sphere.sphere_pos_all(t,:,1), struct_sphere.sphere_pos_all(t,:,2), struct_sphere.sphere_pos_all(t,:,3), 75*struct_sphere.weight_sphere(t,:), 'MarkerFaceColor',[0 .75 .75]);
    if norm(struct_sphere.measurement_all(t,:)) > 0.1
        scatter3(0.8*struct_sphere.measurement_all(t,1), 0.8*struct_sphere.measurement_all(t,2), 0.8*struct_sphere.measurement_all(t,3), 15, 'MarkerEdgeColor','k', 'MarkerFaceColor',[0.8500, 0.10, 0.0980]);
    end
    scatter3(struct_relative.relative_pos_all(idx_rel,:,1), struct_relative.relative_pos_all(idx_rel,:,2), struct_relative.relative_pos_all(idx_rel,:,3), 15, 'MarkerEdgeColor',"#f47923", 'MarkerFaceColor',"#ff8d24");
    
%     quiver3(zeros(1,particle_num),zeros(1,particle_num),zeros(1,particle_num), struct_orient.mav_orient_xyz(idx_rel,:,1), struct_orient.mav_orient_xyz(idx_rel,:,2), struct_orient.mav_orient_xyz(idx_rel,:,3), ...
%     '-','LineWidth',3,'Color','#77AC30','AutoScale','on','AutoScaleFactor',1);

    %% 绘图配置
    axis equal;
    xlim([-10, 10]);
    ylim([-90, 50]);
    zlim([-10, 10]);
    xlabel("x(m)");    % 画subplot可能碍事，关掉就行
    ylabel("y(m)");
    zlabel("z(m)");
    ax = gca;
    ax.GridLineStyle = '-';
    ax.YTick = [-80 -40 0];
    ax.View = [-1.694536890767183e+02,3.107892593122449];
    ax.CameraViewAngle = 3;
    ax.Projection = "perspective";
end

