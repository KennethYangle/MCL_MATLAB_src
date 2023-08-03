% clc;clear;
figure_configuration_IEEE_standard;
load struct_sphere.mat;
load struct_relative.mat;
load struct_orient.mat;

idx_rel = 1;
for t = 1:length(struct_sphere.sphere_pos_all)
%     t = 100;
    disp(t);
    if struct_relative.t_relative(idx_rel+1,1) < struct_sphere.t_sphere(t,1)
        idx_rel = idx_rel + 1;
    end
    disp(idx_rel);
    
    fun_plot_particles(struct_sphere, struct_relative, struct_orient, t, idx_rel);

    pause(0.01);
    hold off;
end
