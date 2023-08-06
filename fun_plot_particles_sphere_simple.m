function [weight_sphere, size_sphere] = fun_plot_particles_sphere_simple(sphere_pos, measurement_sphere)
%画单位球面三维粒子分布函数。

    %% 算权重
    sigma_p = 0.02;
    particle_num = size(sphere_pos, 1);
    
    weight_sphere = zeros(particle_num, 1);
    size_sphere = zeros(particle_num, 1);
    for m = 1:particle_num
        weight_sphere(m) = fun_Gaussian(1.0 - sphere_pos(m,:) * measurement_sphere, 0, sigma_p);

        if norm(measurement_sphere) < 0.1
            weight_sphere(m) = 1e-100;
        end
        
        size_sphere(m) = max(weight_sphere(m)/20, 0.1);
    end

    %% 画球面
    drawsphere(0,0,0,1);
    hold on;
    
    %% 画粒子
    scatter3(sphere_pos(:,1), sphere_pos(:,2), sphere_pos(:,3), 150*size_sphere(:), 'MarkerFaceColor',[0 .75 .75]);
    if norm(measurement_sphere) > 0.1
        scatter3(0.9*measurement_sphere(1), 0.9*measurement_sphere(2), 0.9*measurement_sphere(3), 60, 'MarkerEdgeColor', 'k', 'MarkerFaceColor',[0.9, 0.078, 0.184]);
    end
%     quiver3(0,0,0, 0.9*struct_sphere.barycenter_all(t,1),0.9*struct_sphere.barycenter_all(t,2),0.9*struct_sphere.barycenter_all(t,3), ...
%     '-','LineWidth',3,'Color','#77AC30','AutoScale','on','AutoScaleFactor',1);

    %% 绘图配置
    axis equal;
    % xlabel("x");
    % ylabel("y");
    % zlabel("z");
    ax = gca;
    ax.GridLineStyle = '-';
    ax.View = [4.342160665890058,4.669177333304829];
end
