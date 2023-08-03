function fun_plot_particles_sphere(struct_sphere, struct_relative, struct_orient, t, idx_rel)
%画三维粒子分布函数。输入数据，各数据时刻

    %% 画球面
    drawsphere(0,0,0,1);
    hold on;
    
    %% 画粒子
    scatter3(struct_sphere.sphere_pos_all(t,:,1), struct_sphere.sphere_pos_all(t,:,2), struct_sphere.sphere_pos_all(t,:,3), 150*struct_sphere.weight_sphere(t,:), 'MarkerFaceColor',[0 .75 .75]);
    if norm(struct_sphere.measurement_all(t,:)) > 0.1
        scatter3(0.8*struct_sphere.measurement_all(t,1), 0.8*struct_sphere.measurement_all(t,2), 0.8*struct_sphere.measurement_all(t,3), 60, 'MarkerEdgeColor','k', 'MarkerFaceColor',[0.8500, 0.10, 0.0980]);
    end
%     scatter3(n(shownlengthRange,1),n(shownlengthRange,2),n(shownlengthRange,3), sizeMarker, colorMarker','.')
%     quiver3(0,0,0,0,0,1,'-','LineWidth',2,'Color','#0072BD','AutoScale','on','AutoScaleFactor',1)

    %% 绘图配置
    axis equal;
%     xlabel("x");
%     ylabel("y");
%     zlabel("z");
    ax = gca;
    ax.GridLineStyle = '-';
    ax.View = [-1.694536890767183e+02,3.107892593122449];
%     ax.CameraViewAngle = 3;
%     ax.Projection = "perspective";
end
