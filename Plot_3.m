%%%%Plot fig3a&b
clear all
str='data';%data path
cd(str);
load('Fig3_part1.mat');
a3=-a2;a0=a;
%diff swc bin
%swc role
SM=10:10:100;
swc_med(1,1:10)=nanmedian(a3(:,1:10));
swc25(1,1:10)=quantile(a3(:,1:10),0.25);
swc75(1,1:10)=quantile(a3(:,1:10),0.75);
swc_25=swc25(1,:);swc_75=swc75(1,:);
subplot(1,2,1)
for x=1:9
     patch([SM(x) SM(x+1) SM(x+1) SM(x) SM(x)],[swc_25(x) swc_25(x+1) swc_75(x+1) swc_75(x) swc_25(x)],ones(1,5),'facecolor','b','edgecolor','none','facealpha',0.1)
    hold on
end
l1=plot(SM,swc_med,'b','linewidth',4);hold on
plot(SM,swc_med,'ob','markerfacecolor','b','MarkerSize',12)

%vpd role
hold on
swc_med(1,1:10)=nanmedian(a0(:,1:10));
swc25(1,1:10)=quantile(a0(:,1:10),0.25);
swc75(1,1:10)=quantile(a0(:,1:10),0.75);
swc_25=swc25(1,:);swc_75=swc75(1,:);
for x=1:9
     patch([SM(x) SM(x+1) SM(x+1) SM(x) SM(x)],[swc_25(x) swc_25(x+1) swc_75(x+1) swc_75(x) swc_25(x)],ones(1,5),'facecolor','r','edgecolor','none','facealpha',0.1)
    hold on
end
l2=plot(SM,swc_med,'r','linewidth',4);hold on
plot(SM,swc_med,'or','markerfacecolor','r','MarkerSize',12)
legend([l1 l2],{'SWC','VPD'})
ylim([-0.8,0.8]);xlim([10,100]);
xticks(10:10:100);xticklabels({'10','20','30','40','50','60','70','80','90','100'})
ylabel('Sensitivity of GPP to SWC or VPD','Fontsize',14);
xlabel('SWC (percentiles)','Fontsize',14);
box on;set(gca,'Fontsize',14);

%diff vpd bin
clear all
str='data';%data path
cd(str);
load('Fig3_part1.mat');
a3=-a2';a0=a';
%diff swc bin
%swc role
SM=10:10:100;
swc_med(1,1:10)=nanmedian(a3(:,1:10));
swc25(1,1:10)=quantile(a3(:,1:10),0.25);
swc75(1,1:10)=quantile(a3(:,1:10),0.75);
swc_25=swc25(1,:);swc_75=swc75(1,:);
subplot(1,2,2)
for x=1:9
     patch([SM(x) SM(x+1) SM(x+1) SM(x) SM(x)],[swc_25(x) swc_25(x+1) swc_75(x+1) swc_75(x) swc_25(x)],ones(1,5),'facecolor','b','edgecolor','none','facealpha',0.1)
    hold on
end
plot(SM,swc_med,'b','linewidth',4);hold on
plot(SM,swc_med,'ob','markerfacecolor','b','MarkerSize',12)

%vpd role
hold on
swc_med(1,1:10)=nanmedian(a0(:,1:10));
swc25(1,1:10)=quantile(a0(:,1:10),0.25);
swc75(1,1:10)=quantile(a0(:,1:10),0.75);
swc_25=swc25(1,:);swc_75=swc75(1,:);
for x=1:9
     patch([SM(x) SM(x+1) SM(x+1) SM(x) SM(x)],[swc_25(x) swc_25(x+1) swc_75(x+1) swc_75(x) swc_25(x)],ones(1,5),'facecolor','r','edgecolor','none','facealpha',0.1)
    hold on
end
plot(SM,swc_med,'r','linewidth',4);hold on
plot(SM,swc_med,'or','markerfacecolor','r','MarkerSize',12)
ylim([-0.8,0.8]);xlim([10,100]);
ylabel('Sensitivity of GPP to SWC or VPD','Fontsize',14);
xticks(10:10:100);xticklabels({'10','20','30','40','50','60','70','80','90','100'})
xlabel('VPD (percentiles)','Fontsize',14);
box on;set(gca,'Fontsize',14);

%%%%Plot fig3c
clear all
str='data';%data path
cd(str);
load('Fig3_part2.mat')
yyaxis left
h1=boxplot([contri(:,1:2) nan(85,2)],'Widths',0.2,'symbol', '');
set(h1,'LineWidth',2);hold on
plot(nanmean(contri(:,1:2)), '+k','MarkerSize',12,'linewidth',2)
ylabel('\DeltaGPP (\mumol m^{-2} s^{-1})','Fontsize',14);
ylim([-11.8,5.8]);
yyaxis right
h2=boxplot([nan(85,2) contri(:,3:4)],'Widths',0.2,'symbol', '');
ylabel('\DeltaGPP_I (\mumol W^{-1} s^{-1})','Fontsize',14);
set(h2,'LineWidth',2)
hold on;plot([3,4],nanmean(contri(:,3:4)), '+k','MarkerSize',12,'linewidth',2)
xticklabels({'\DeltaGPP (VPD|SWC)','\DeltaGPP (SWC|VPD)','\DeltaGPP_I (VPD|SWC)','\DeltaGPP_I (SWC|VPD)'})
ax = gca;
ax.XRuler.TickLabelInterpreter = 'tex';
ylim([-0.018,0.008]);
ylabel('\DeltaGPP_I (\mumol W^{-1} s^{-1})','Fontsize',14);
box on;set(gca,'Fontsize',14);
