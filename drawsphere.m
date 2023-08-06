function drawsphere(a,b,c,R, varargin)
% 绘制球面
% 以(a,b,c)为球心，R为半径，"face"为球一个方向上的面数
% 用法: drawsphere(0,0,0,1);
%       drawsphere(0,0,0,1, "face", 10);

    p = inputParser;            % 函数的输入解析器
    addParameter(p, 'face', 20);      % 设置变量名和默认参数
    parse(p, varargin{:});       % 对输入变量进行解析，如果检测到前面的变量被赋值，则更新变量取值
    
    % 生成数据
    [x,y,z] = sphere(p.Results.face);

    % 调整半径
    x = R*x; 
    y = R*y;
    z = R*z;

    % 调整球心
    x = x+a;
    y = y+b;
    z = z+c;

    % 使用mesh绘制
    axis equal;
    mesh(x,y,z,'LineStyle','-','FaceAlpha','0.2','FaceColor','flat','EdgeAlpha','0.25','EdgeColor','flat');

    % 使用surf绘制
%     axis equal;
%     surf(x,y,z,'LineStyle','none','FaceAlpha','0.3');
end