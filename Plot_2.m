%%
%%%%Plot fig2a
clear all
str='data';%data path
cd(str);
load('Fig2_part1.mat');
width = 12;     % Width in inches
height = 12;    % Height in inches
defpos = get(0,'defaultFigurePosition');
set(0,'defaultFigurePosition', [defpos(1) defpos(2) width*100, height*100]);
top_margin=0.035;
left_margin=0.06;
horizontal_margin=0.001;
vertical_margin=0.001;
map_width=0.2;
map_height=0.28;
% figure;
ax1 = subplot('position',[left_margin,1-top_margin-map_height-vertical_margin,map_width,map_height]);
a3=[-a2;nan(1,10)];max(a3)
min(a3)
pcolor([a3,nan(11,1)])
CT=cbrewer('div', 'BrBG', 50);colormap(CT);
colormap(ax1,CT)
caxis([-0.6 0.6])
ylabel('VPD (percentiles)','Fontsize',14)
xticks(1:1:11);set(gca, 'Xticklabel', []);
yticks(1:1:11);yticklabels({'0','','20','','40','','60','','80','','100'})
title('GPP','Fontsize',14)
set(gca, 'Fontsize',14)
for k=1:10
    for jj=1:10
        if  hswc(jj,k)==1
            hold on;
            scatter(1+k-0.5,1+jj-0.5,'*k')
            hold on;
        end
    end
end
hold on;
text(-0.2,1.06,'a','Units','normalized','Fontsize',20,'Fontweight','bold');
hold on;

ax2=subplot('position',[left_margin,1-top_margin-map_height*2-vertical_margin-0.03,map_width,map_height]);
a0=[a;nan(1,10)];max(a0)
min(a0)
pcolor([a0,nan(11,1)])
CT1=cbrewer('div', 'BrBG', 50);colormap(ax2,CT1(1:25,:));
caxis([-1 0])
xticks(1:1:11);xticklabels({'0','','20','','40','','60','','80','','100'})
yticks(1:1:11);yticklabels({'0','','20','','40','','60','','80','','100'})
ylabel('VPD (percentiles)','Fontsize',14)
xlabel('SWC (percentiles)','Fontsize',14);
for k=1:10
    for jj=1:10
        if  hvpd(jj,k)==1
            hold on;
            scatter(1+k-0.5,1+jj-0.5,'*k')
            hold on;
        end
    end
end
set(gca, 'Fontsize',14)
text(-0.2,1.06,'d','Units','normalized','Fontsize',20,'Fontweight','bold');
hold on;

%%
%%%%Plot fig2b
clear all
str='data';%data path
cd(str);
load('Fig2_part2.mat')
width = 12;
height = 12;
defpos = get(0,'defaultFigurePosition');
set(0,'defaultFigurePosition', [defpos(1) defpos(2) width*100, height*100]);
top_margin=0.035;
left_margin=0.06;
horizontal_margin=0.001;
vertical_margin=0.001;
map_width=0.2;
map_height=0.28;
% figure;
ax1 = subplot('position',[left_margin+map_width+horizontal_margin+0.02,1-top_margin-map_height-vertical_margin,map_width,map_height]);
a3=[-a2;nan(1,10)];max(a3)
min(a3)
pcolor([a3,nan(11,1)])
CT=cbrewer('div', 'BrBG', 50);colormap(CT);
colormap(ax1,CT)
caxis([-0.6 0.6])
xticks(1:1:11);set(gca, 'Xticklabel', []);
yticks(1:1:11);set(gca, 'Yticklabel', []);
title('{\itG}_c','Fontsize',14)
for k=1:10
    for jj=1:10
        if  hswc(jj,k)==1
            hold on;
            scatter(1+k-0.5,1+jj-0.5,'*k')
            hold on;
        end
    end
end
hold on;set(gca, 'Fontsize',14)
text(-0.05,1.06,'b','Units','normalized','Fontsize',20,'Fontweight','bold');

ax2=subplot('position',[left_margin+map_width+horizontal_margin+0.02,1-top_margin-map_height*2-vertical_margin-0.03,map_width,map_height]);
a0=[a;nan(1,10)];max(a0)
min(a0)
pcolor([a0,nan(11,1)])
CT1=cbrewer('div', 'BrBG', 50);
colormap(ax2,CT1(1:25,:));
caxis([-1 0])
xticks(1:1:11);xticklabels({'0','','20','','40','','60','','80','','100'})
yticks(1:1:11);set(gca, 'Yticklabel', []);
xlabel('SWC (percentiles)','Fontsize',11);
for k=1:10
    for jj=1:10
        if  hvpd(jj,k)==1
            hold on;
            scatter(1+k-0.5,1+jj-0.5,'*k')
            hold on;
        end
    end
end
hold on;set(gca, 'Fontsize',14)
text(-0.05,1.06,'e','Units','normalized','Fontsize',20,'Fontweight','bold');

%%
%%%%Plot fig2c
clear all
str='data';%data path
cd(str);
load('Fig2_part3.mat')
width = 12;
height = 12;
defpos = get(0,'defaultFigurePosition');
set(0,'defaultFigurePosition', [defpos(1) defpos(2) width*100, height*100]);
top_margin=0.035;
left_margin=0.06;
horizontal_margin=0.001;
vertical_margin=0.001;
map_width=0.2;
map_height=0.28;
ax1 = subplot('position',[left_margin+map_width*2+horizontal_margin*2+0.02*2,1-top_margin-map_height-vertical_margin,map_width,map_height]);
a3=[-a2;nan(1,10)];max(a3)
min(a3)
pcolor([a3,nan(11,1)])
CT=cbrewer('div', 'BrBG', 50);
colormap(ax1,CT)
caxis([-0.6 0.6])
xticks(1:1:11);set(gca, 'Xticklabel', []);
yticks(1:1:11);set(gca, 'Yticklabel', []);
title('{\itA}_{max}','Fontsize',14)
for k=1:10
    for jj=1:10
        if  hswc(jj,k)==1
            hold on;
            scatter(1+k-0.5,1+jj-0.5,'*k')
            hold on;
        end
    end
end
h=colorbar('Location','East','Position',...
    [0.27+map_width*2+horizontal_margin*2+0.02*2 0.689-0.005 0.012 map_height],...
    'Ticks',[-0.6 -0.4 -0.2 0 0.2 0.4 0.6],'Fontsize',14);
set(h,'TickLabels',num2str(get(h,'Ticks')','%.2f'))
set(get(h,'label'),'string','Sensitivity to SWC','Fontsize',14)
set(gca, 'Fontsize',14)
text(-0.05,1.06,'c','Units','normalized','Fontsize',20,'Fontweight','bold');
hold on;

ax2=subplot('position',[left_margin+map_width*2+horizontal_margin*2+0.02*2,1-top_margin-map_height*2-vertical_margin-0.03,map_width,map_height]);
a0=[a;nan(1,10)];max(a0)
min(a0)
pcolor([a0,nan(11,1)])
CT1=cbrewer('div', 'BrBG', 50);colormap(ax2,CT1(1:25,:));
caxis([-1 0])
xticks(1:1:11);xticklabels({'0','','20','','40','','60','','80','','100'})
yticks(1:1:11);set(gca, 'Yticklabel', []);
xlabel('SWC (percentiles)','Fontsize',14);
for k=1:10
    for jj=1:10
        if  hvpd(jj,k)==1
            hold on;
            scatter(1+k-0.5,1+jj-0.5,'*k')
            hold on;
        end
    end
end
h=colorbar('Location','East','Position',...
    [0.27+map_width*2+horizontal_margin*2+0.02*2 0.379-0.005 0.012 map_height],...
    'Ticks',[-1,-0.8,-0.6 -0.4 -0.2 0],'Fontsize',14);
set(h,'TickLabels',num2str(get(h,'Ticks')','%.2f'))
set(get(h,'label'),'string','Sensitivity to VPD','Fontsize',14)
set(gca, 'Fontsize',14)
text(-0.05,1.06,'f','Units','normalized','Fontsize',20,'Fontweight','bold');
