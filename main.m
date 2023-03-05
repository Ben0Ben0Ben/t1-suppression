clc;clear;close all;
tic
 data1 = GetSpecFromBidary('HSQC\1\pdata\1\2rr',1024,128,1);S=data1;
%  data1 = GetSpecFromBidary('HMBC\1\pdata\1\2rr',2048,256,1);spec=data1;
%  data1 = GetSpecFromBidary('COSY\1\pdata\1\2rr',2048,1024,1);spec=data1;
%  data1 = GetSpecFromBidary('NOESY\1\pdata\1\2rr',2048,1024,1);spec=data1;
%    data1 = GetSpecFromBidary('TOCSY\1\pdata\1\2rr',1024,512,1);spec=data1;

 [m,n]=size(S);
 d=8;%这是一个可以调整的参数
 if m<512
     d=2;
 end
 [g,sigma,A,alpha]=Step1(S,d);
 [S1,W]=Step2(S,g,sigma,A,alpha);


figure(7)
imagesc(W(end:-1:1,:))
%添加热力图，一旁的指示图
colorbar
%设置热力图的颜色模式，默认为cold模式
colormap('parula')
set(gca,'linewidth',1.5)
set(gca,'FontSize',20)
set(gca,'tickdir','out')
 %去除上右边框刻度
box off  
%移除坐标轴边框
set(gca,'Visible','off');
%设置x轴的标签和步长
set(gca,'xticklabel',[9.597:(-0.302-9.597)/9:-0.302])
%对每个x轴上的值，进行自定义重命名
set(gca,'yticklabel',[0.499:(10.087-0.499)/9:10.087])

figure(1);contour(data1,100);
figure(2);contour(S1,100);

toc