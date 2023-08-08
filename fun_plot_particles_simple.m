function fun_plot_particles_simple(relative_pos, mav_orient, measurement_pos, weight_sphere, size_sphere)
%画二维粒子分布函数。

    %% 概率分布
    sigma_p = 0.025;
    xmin = -5; xmax = 5;
    ymin = -2; ymax = 12;
    step = 0.1;
    if norm(measurement_pos) > 0.1
        a = xmin:step:xmax;
        b = ymin:step:ymax;
        [x,y] = meshgrid(a,b);
        z = zeros(size(x));

        for i = 1:size(x,1)
            for j = 1:size(x,2)
                % z(i,j) = sin(x(i,j)) + sin(y(i,j));
                norm_p = [x(i,j), y(i,j), 0] / norm([x(i,j), y(i,j), 0]);
                norm_measurement = measurement_pos / norm(measurement_pos);
                z(i,j) = fun_Gaussian(1.0 - norm_p * norm_measurement, 0, sigma_p) - 5;
            end
        end
    end

    %% 算方向
    particle_num = size(relative_pos, 1);
    L = 1.5;
    mav_orient_xy = zeros(2, particle_num);
    mav_orient_xy(1,:) = L * cos(mav_orient);
    mav_orient_xy(2,:) = L * sin(mav_orient);

    %% 画粒子
    hold on;
    if norm(measurement_pos) > 0.1
        scatter(measurement_pos(1), measurement_pos(2), 60, 'MarkerEdgeColor','k', 'MarkerFaceColor',[0.8500, 0.10, 0.0980]);
        scatter(relative_pos(:,1), relative_pos(:,2), 150*size_sphere(:), 'MarkerEdgeColor',"#f47923", 'MarkerFaceColor',"#ff8d24");
        surf(x,y,z, 'FaceAlpha',0.5);
        mymap = [[1:-0.01:0.]; [1:-0.01:0.]; [1:-0.01:0.]]';
        colormap(gca, mymap);
%         mymap = [1,1,1; 0.6,0.6,0.6];
%         colorbar('SouthOutside')
        shading interp;
        view(2)
    else
        scatter(relative_pos(:,1), relative_pos(:,2), 15, 'MarkerEdgeColor',"#f47923", 'MarkerFaceColor',"#ff8d24");
    end
    
    %% 画圆和箭头
    viscircles([0,0], 1,'Color','#b1ceef');
    quiver(zeros(1,particle_num),zeros(1,particle_num), mav_orient_xy(1,:), mav_orient_xy(2,:), ...
    '-','LineWidth',3,'Color','#77AC30','AutoScale','on','AutoScaleFactor',1);
    
    %% 绘图配置
    axis equal;
    box on;
    xlim([xmin, xmax]);
    ylim([ymin, ymax]);
    ax = gca;
    ax.GridLineStyle = '-';
end

