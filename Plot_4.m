%%%%Plot fig4a-j
clear all
InPath = '/Volumes/zf_mac/CMIP5/CMIP6/daily/mrsos-hf/';
cd(InPath);
load('sitebysitecsiro.mat')
width = 10;     % Width in inches
height = 10;    % Height in inches
defpos = get(0,'defaultFigurePosition');
set(0,'defaultFigurePosition', [defpos(1) defpos(2) width*100, height*100]);
top_margin=0.03;
left_margin=0.06;
horizontal_margin=0.001;
vertical_margin=0.001;
map_width=0.14;
map_height=0.16;
% figure;
ax1 = subplot('position',[left_margin,1-top_margin-map_height-vertical_margin,map_width,map_height]);
a3=[-a2;nan(1,10)];max(a3)
min(a3)
pcolor([a3,nan(11,1)])
CT=cbrewer('div', 'BrBG', 50);colormap(CT);
colormap(ax1,CT)
caxis([-0.6 0.6])
ylabel('VPD (percentiles)','Fontsize',11)
xticks(1:1:11);set(gca, 'Xticklabel', []);
yticks(1:1:11);yticklabels({'0','','20','','40','','60','','80','','100'})
set(gca, 'Fontsize',11)
title('ACCESS-ESM1-5','Fontsize',11)
hold on;
text(-0.3,1.06,'a','Units','normalized','Fontsize',14,'Fontweight','bold');

ax2=subplot('position',[left_margin,1-top_margin-map_height*2-vertical_margin-0.02,map_width,map_height]);
a0=[a;nan(1,10)];max(a0);min(a0)
pcolor([a0,nan(11,1)])
CT1=cbrewer('div', 'BrBG', 50);colormap(ax2,CT1(1:25,:));
caxis([-1 0])
xticks(1:1:11);set(gca, 'Xticklabel', []);
yticks(1:1:11);yticklabels({'0','','20','','40','','60','','80','','100'})
ylabel('VPD (percentiles)','Fontsize',11)
set(gca, 'Fontsize',11)
hold on;
text(-0.3,1.06,'f','Units','normalized','Fontsize',14,'Fontweight','bold');

%CMCC
clear all
InPath = '/Volumes/zf_mac/CMIP5/CMIP6/daily/mrsos-hf/';
cd(InPath);
load('sitebysitecmcc.mat')

width = 10;     % Width in inches
height = 10;    % Height in inches
defpos = get(0,'defaultFigurePosition');
set(0,'defaultFigurePosition', [defpos(1) defpos(2) width*100, height*100]);
top_margin=0.03;
left_margin=0.06;
horizontal_margin=0.001;
vertical_margin=0.001;
map_width=0.14;
map_height=0.16;
ax1 = subplot('position',[left_margin+map_width+horizontal_margin+0.015,1-top_margin-map_height-vertical_margin,map_width,map_height]);
a3=[-a2;nan(1,10)];max(a3)
min(a3)
pcolor([a3,nan(11,1)])
CT=cbrewer('div', 'BrBG', 50);colormap(CT);
colormap(ax1,CT)
caxis([-0.6 0.6])
xticks(1:1:11);set(gca, 'Xticklabel', []);
yticks(1:1:11);set(gca, 'Yticklabel', []);
title('CMCC-CM2-SR5','Fontsize',11)
set(gca, 'Fontsize',11)
hold on;
text(-0.08,1.06,'b','Units','normalized','Fontsize',14,'Fontweight','bold');

ax2=subplot('position',[left_margin+map_width+horizontal_margin+0.015,1-top_margin-map_height*2-vertical_margin-0.02,map_width,map_height]);
a0=[a;nan(1,10)];max(a0)
min(a0)
pcolor([a0,nan(11,1)])
CT1=cbrewer('div', 'BrBG', 50);colormap(ax2,CT1(1:25,:));
caxis([-1 0])
xticks(1:1:11);set(gca, 'Xticklabel', []);
yticks(1:1:11);set(gca, 'Yticklabel', []);
set(gca, 'Fontsize',11)
text(-0.08,1.06,'g','Units','normalized','Fontsize',14,'Fontweight','bold');

%ipsl
clear all
InPath = '/Volumes/zf_mac/CMIP5/CMIP6/daily/mrsos-hf/';
cd(InPath);
load('sitebysiteipsl.mat')

width = 10;     % Width in inches
height = 10;    % Height in inches
defpos = get(0,'defaultFigurePosition');
set(0,'defaultFigurePosition', [defpos(1) defpos(2) width*100, height*100]);
top_margin=0.03;
left_margin=0.06;
horizontal_margin=0.001;
vertical_margin=0.001;
map_width=0.14;
map_height=0.16;
ax1 = subplot('position',[left_margin+map_width*2+horizontal_margin*2+0.015*2,1-top_margin-map_height-vertical_margin,map_width,map_height]);
a3=[-a2;nan(1,10)];max(a3)
min(a3)
pcolor([a3,nan(11,1)])
CT=cbrewer('div', 'BrBG', 50);colormap(CT);
colormap(ax1,CT)
caxis([-0.6 0.6])
xticks(1:1:11);set(gca, 'Xticklabel', []);
yticks(1:1:11);set(gca, 'Yticklabel', []);
set(gca, 'Fontsize',11)
title('IPSL-CM6A-LR','Fontsize',11)
hold on;
text(-0.08,1.06,'c','Units','normalized','Fontsize',14,'Fontweight','bold');

ax2=subplot('position',[left_margin+map_width*2+horizontal_margin*2+0.015*2,1-top_margin-map_height*2-vertical_margin-0.02,map_width,map_height]);
a0=[a;nan(1,10)];max(a0)
min(a0)
pcolor([a0,nan(11,1)])
CT1=cbrewer('div', 'BrBG', 50);colormap(ax2,CT1(1:25,:));
caxis([-1 0])
xticks(1:1:11);set(gca, 'Xticklabel', []);
yticks(1:1:11);set(gca, 'Yticklabel', []);
set(gca, 'Fontsize',11)
hold on;
text(-0.08,1.06,'h','Units','normalized','Fontsize',14,'Fontweight','bold');

%normLM
clear all
InPath = '/Volumes/zf_mac/CMIP5/CMIP6/daily/mrsos-hf/';
cd(InPath);
load('sitebysitenoresm2-lm.mat')

width = 10;     % Width in inches
height = 10;    % Height in inches
defpos = get(0,'defaultFigurePosition');
set(0,'defaultFigurePosition', [defpos(1) defpos(2) width*100, height*100]);
top_margin=0.03;
left_margin=0.06;
horizontal_margin=0.001;
vertical_margin=0.001;
map_width=0.14;
map_height=0.16;
ax1 = subplot('position',[left_margin+map_width*3+horizontal_margin*3+0.015*3,1-top_margin-map_height-vertical_margin,map_width,map_height]);
a3=[-a2;nan(1,10)];max(a3)
min(a3)
pcolor([a3,nan(11,1)])
CT=cbrewer('div', 'BrBG', 50);colormap(CT);
colormap(ax1,CT)
caxis([-0.6 0.6])
xticks(1:1:11);set(gca, 'Xticklabel', []);
yticks(1:1:11);set(gca, 'Yticklabel', []);
title('NorESM2-LM','Fontsize',11)
hold on;
text(-0.08,1.06,'d','Units','normalized','Fontsize',14,'Fontweight','bold');

ax2=subplot('position',[left_margin+map_width*3+horizontal_margin*3+0.015*3,1-top_margin-map_height*2-vertical_margin-0.02,map_width,map_height]);
a0=[a;nan(1,10)];max(a0)
min(a0)
pcolor([a0,nan(11,1)])
CT1=cbrewer('div', 'BrBG', 50);colormap(ax2,CT1(1:25,:));
caxis([-1 0])
yticks(1:1:11);set(gca, 'Yticklabel', []);
xticks(1:1:11);set(gca, 'Xticklabel', []);
hold on;
text(-0.08,1.06,'i','Units','normalized','Fontsize',14,'Fontweight','bold');

%normMM
clear all
InPath = '/Volumes/zf_mac/CMIP5/CMIP6/daily/mrsos-hf/';
cd(InPath);
load('sitebysitenoresm2-mm.mat')

width = 10;     % Width in inches
height = 10;    % Height in inches
defpos = get(0,'defaultFigurePosition');
set(0,'defaultFigurePosition', [defpos(1) defpos(2) width*100, height*100]);
top_margin=0.03;
left_margin=0.06;
horizontal_margin=0.001;
vertical_margin=0.001;
map_width=0.14;
map_height=0.16;

ax1 = subplot('position',[left_margin+map_width*4+horizontal_margin*4+0.015*4,1-top_margin-map_height-vertical_margin,map_width,map_height]);
a3=[-a2;nan(1,10)];max(a3)
min(a3)
pcolor([a3,nan(11,1)])
CT=cbrewer('div', 'BrBG', 50);colormap(CT);
colormap(ax1,CT)
caxis([-0.6 0.6])
xticks(1:1:11);set(gca, 'Xticklabel', []);
yticks(1:1:11);set(gca, 'Yticklabel', []);
h=colorbar('Location','East','Position',...
    [0.832 0.809 0.014 0.16],...
    'Ticks',[-0.6 -0.4 -0.2 0 0.2 0.4 0.6],'Fontsize',11);
set(h,'TickLabels',num2str(get(h,'Ticks')','%.2f'))
set(get(h,'label'),'string','GPP sens. to SWC','Fontsize',11)
title('NorESM2-MM','Fontsize',11)
hold on;
text(-0.08,1.06,'e','Units','normalized','Fontsize',14,'Fontweight','bold');

ax2=subplot('position',[left_margin+map_width*4+horizontal_margin*4+0.015*4,1-top_margin-map_height*2-vertical_margin-0.02,map_width,map_height]);
a0=[a;nan(1,10)];max(a0)
min(a0)
pcolor([a0,nan(11,1)])
CT1=cbrewer('div', 'BrBG', 50);colormap(ax2,CT1(1:25,:));
caxis([-1 0])
yticks(1:1:11);set(gca, 'Yticklabel', []);
xticks(1:1:11);set(gca, 'Xticklabel', []);

h=colorbar('Location','East','Position',...
    [0.832 0.629 0.014 0.16],...
    'Ticks',[-1,-0.8,-0.6 -0.4 -0.2 0],'Fontsize',11);
set(h,'TickLabels',num2str(get(h,'Ticks')','%.2f'))
set(get(h,'label'),'string','GPP sens. to VPD','Fontsize',11)
hold on;
text(-0.08,1.06,'j','Units','normalized','Fontsize',14,'Fontweight','bold');

%%
%%%%Plot fig4k-t
%modelsen-obssen
clear all
str='/Volumes/zf_mac/Drought_2018/americaflux/shasitehh/icos2015/sitebysitegpp/';
cd(str);
load('obssen.mat')

InPath = '/Volumes/zf_mac/CMIP5/CMIP6/daily/mrsos-hf/';cd(InPath);
load('sitebysitecsiro.mat')

width = 10;     % Width in inches
height = 10;    % Height in inches
defpos = get(0,'defaultFigurePosition');
set(0,'defaultFigurePosition', [defpos(1) defpos(2) width*100, height*100]);
top_margin=0.03;
left_margin=0.06;
horizontal_margin=0.001;
vertical_margin=0.001;
map_width=0.14;
map_height=0.16;
ax1=subplot('position',[left_margin,1-top_margin-map_height*3-vertical_margin-0.04,map_width,map_height]);
a3=[-a2+a2swc;nan(1,10)];max(a3)
min(a3)
pcolor([a3,nan(11,1)])
CT=flipud(cbrewer('div', 'RdBu', 50));
colormap(ax1,CT)
caxis([-0.4 0.4])
ylabel('VPD (percentiles)','Fontsize',11)
xticks(1:1:11);set(gca, 'Xticklabel', []);
yticks(1:1:11);yticklabels({'0','','20','','40','','60','','80','','100'})
set(gca, 'Fontsize',11)
hold on;
text(-0.3,1.06,'k','Units','normalized','Fontsize',14,'Fontweight','bold');

ax2=subplot('position',[left_margin,1-top_margin-map_height*4-vertical_margin-0.06,map_width,map_height]);
a0=[a-avpd;nan(1,10)];max(a0);min(a0)
pcolor([a0,nan(11,1)])
CT1=flipud(cbrewer('div', 'RdBu', 50));colormap(ax2,CT1)
caxis([-0.4 0.4])
xticks(1:1:11);xticklabels({'0','','20','','40','','60','','80','','100'})
yticks(1:1:11);yticklabels({'0','','20','','40','','60','','80','','100'})
ylabel('VPD (percentiles)','Fontsize',11)
xlabel('SWC (percentiles)','Fontsize',11);
set(gca, 'Fontsize',11)
hold on;
text(-0.3,1.06,'p','Units','normalized','Fontsize',14,'Fontweight','bold');

%cmcc
InPath = '/Volumes/zf_mac/CMIP5/CMIP6/daily/mrsos-hf/';cd(InPath);
load('sitebysitecmcc.mat')

ax1 = subplot('position',[left_margin+map_width+horizontal_margin+0.015,1-top_margin-map_height*3-vertical_margin-0.04,map_width,map_height]);
a3=[-a2+a2swc;nan(1,10)];max(a3)
min(a3)
pcolor([a3,nan(11,1)])
CT=flipud(cbrewer('div', 'RdBu', 50));
colormap(ax1,CT)
caxis([-0.4 0.4])
xticks(1:1:11);set(gca, 'Xticklabel', []);
yticks(1:1:11);set(gca, 'Yticklabel', []);% xlabel('SWC (percentiles)','Fontsize',11);set(gca, 'Fontsize',11)
set(gca, 'Fontsize',11)
hold on;
text(-0.08,1.06,'l','Units','normalized','Fontsize',14,'Fontweight','bold');

ax2=subplot('position',[left_margin+map_width+horizontal_margin+0.015,1-top_margin-map_height*4-vertical_margin-0.06,map_width,map_height]);
a0=[a-avpd;nan(1,10)];max(a0);min(a0)
pcolor([a0,nan(11,1)])
CT1=flipud(cbrewer('div', 'RdBu', 50));colormap(ax2,CT1)
caxis([-0.4 0.4])
xticks(1:1:11);xticklabels({'0','','20','','40','','60','','80','','100'})
yticks(1:1:11);set(gca, 'Yticklabel', []);
xlabel('SWC (percentiles)','Fontsize',11);
set(gca, 'Fontsize',11)
hold on;
text(-0.08,1.06,'q','Units','normalized','Fontsize',14,'Fontweight','bold');

%ipsl
InPath = '/Volumes/zf_mac/CMIP5/CMIP6/daily/mrsos-hf/';cd(InPath);
load('sitebysiteipsl.mat')

ax1 = subplot('position',[left_margin+map_width*2+horizontal_margin*2+0.015*2,1-top_margin-map_height*3-vertical_margin-0.04,map_width,map_height]);
a3=[-a2+a2swc;nan(1,10)];max(a3)
min(a3)
pcolor([a3,nan(11,1)])
CT=flipud(cbrewer('div', 'RdBu', 50));
colormap(ax1,CT)
caxis([-0.4 0.4])
xticks(1:1:11);set(gca, 'Xticklabel', []);
yticks(1:1:11);set(gca, 'Yticklabel', []);
set(gca, 'Fontsize',11)
hold on;
text(-0.08,1.06,'m','Units','normalized','Fontsize',14,'Fontweight','bold');

ax2=subplot('position',[left_margin+map_width*2+horizontal_margin*2+0.015*2,1-top_margin-map_height*4-vertical_margin-0.06,map_width,map_height]);
a0=[a-avpd;nan(1,10)];max(a0);min(a0)
pcolor([a0,nan(11,1)])
CT1=flipud(cbrewer('div', 'RdBu', 50));colormap(ax2,CT1)
caxis([-0.4 0.4])
xticks(1:1:11);xticklabels({'0','','20','','40','','60','','80','','100'})
yticks(1:1:11);set(gca, 'Yticklabel', []);
xlabel('SWC (percentiles)','Fontsize',11);
set(gca, 'Fontsize',11)
hold on;
text(-0.08,1.06,'r','Units','normalized','Fontsize',14,'Fontweight','bold');

%normlm
InPath = '/Volumes/zf_mac/CMIP5/CMIP6/daily/mrsos-hf/';cd(InPath);
load('sitebysitenoresm2-lm.mat')

ax1 = subplot('position',[left_margin+map_width*3+horizontal_margin*3+0.015*3,1-top_margin-map_height*3-vertical_margin-0.04,map_width,map_height]);
a3=[-a2+a2swc;nan(1,10)];max(a3)
min(a3)
pcolor([a3,nan(11,1)])
CT=flipud(cbrewer('div', 'RdBu', 50));
colormap(ax1,CT)
caxis([-0.4 0.4])
xticks(1:1:11);set(gca, 'Xticklabel', []);
yticks(1:1:11);set(gca, 'Yticklabel', []);% xlabel('SWC (percentiles)','Fontsize',11);set(gca, 'Fontsize',11)
set(gca, 'Fontsize',11)
text(-0.08,1.06,'n','Units','normalized','Fontsize',14,'Fontweight','bold');

ax2=subplot('position',[left_margin+map_width*3+horizontal_margin*3+0.015*3,1-top_margin-map_height*4-vertical_margin-0.06,map_width,map_height]);
a0=[a-avpd;nan(1,10)];max(a0);min(a0)
pcolor([a0,nan(11,1)])
CT1=flipud(cbrewer('div', 'RdBu', 50));colormap(ax2,CT1)
caxis([-0.4 0.4])
xticks(1:1:11);xticklabels({'0','','20','','40','','60','','80','','100'})
yticks(1:1:11);set(gca, 'Yticklabel', []);
xlabel('SWC (percentiles)','Fontsize',11);
text(-0.08,1.06,'s','Units','normalized','Fontsize',14,'Fontweight','bold');

%normmm
InPath = '/Volumes/zf_mac/CMIP5/CMIP6/daily/mrsos-hf/';cd(InPath);
load('sitebysitenoresm2-mm.mat')

ax1 = subplot('position',[left_margin+map_width*4+horizontal_margin*4+0.015*4,1-top_margin-map_height*3-vertical_margin-0.04,map_width,map_height]);
a3=[-a2+a2swc;nan(1,10)];max(a3)
min(a3)
pcolor([a3,nan(11,1)])
CT=flipud(cbrewer('div', 'RdBu', 50));
colormap(ax1,CT)
caxis([-0.4 0.4])
xticks(1:1:11);set(gca, 'Xticklabel', []);
yticks(1:1:11);set(gca, 'Yticklabel', []);% xlabel('SWC (percentiles)','Fontsize',11);set(gca, 'Fontsize',11)
set(gca, 'Fontsize',11)
h=colorbar('Location','East','Position',...
    [0.832 0.449 0.014 0.16],...
    'Ticks',[-0.4 -0.2 0 0.2 0.4],'Fontsize',11);
set(h,'TickLabels',num2str(get(h,'Ticks')','%.2f'))
set(get(h,'label'),'string','Sen. to SWC (model-obs)','Fontsize',11)
hold on;
text(-0.08,1.06,'o','Units','normalized','Fontsize',14,'Fontweight','bold');

ax2=subplot('position',[left_margin+map_width*4+horizontal_margin*4+0.015*4,1-top_margin-map_height*4-vertical_margin-0.06,map_width,map_height]);
a0=[a-avpd;nan(1,10)];max(a0);min(a0)
pcolor([a0,nan(11,1)])
CT1=flipud(cbrewer('div', 'RdBu', 50));colormap(ax2,CT1)
caxis([-0.4 0.4])
xticks(1:1:11);xticklabels({'0','','20','','40','','60','','80','','100'})
yticks(1:1:11);set(gca, 'Yticklabel', []);
xlabel('SWC (percentiles)','Fontsize',11);
h=colorbar('Location','East','Position',...
    [0.832 0.269 0.014 0.16],...
    'Ticks',[-0.4 -0.2 0 0.2 0.4],'Fontsize',11);
set(h,'TickLabels',num2str(get(h,'Ticks')','%.2f'))
set(get(h,'label'),'string','Sen. to VPD (model-obs)','Fontsize',11)
hold on;
text(-0.08,1.06,'t','Units','normalized','Fontsize',14,'Fontweight','bold');

