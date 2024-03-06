clc
clear
% 移动到某个目录下
srcDic = uigetdir('E:\ShareCache\杨坤_BY2103058\智能院\MCL_MATLAB_src');
cd(srcDic);
%读取所有的图片
allnames = struct2cell(dir('*.png'));
[k,len]=size(allnames);
videoobj = VideoWriter('particles_all.avi', 'Uncompressed AVI');
%设置帧率
videoobj.FrameRate = 30;
open(videoobj)
%我制作了由180张图片构成的视频
for i = 1:len
    name = allnames{1,i};
    frame = imread(name);
    writeVideo(videoobj,frame);
end
close(videoobj)