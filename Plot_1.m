clear all
str='ICOSdata/';%set ICOS data path
cd(str);
d=dir('*.csv');
tbl=nan(2000,9,length(d));
for i=1:length(d)
    GPP182(1,1:8)=nan;
    name1=d(i).name;
    name=name1(1:length(name1)-4);
    fLoad_ABACUS_csv
    YEAR=floor(TIMESTAMP_START/1e8);
    MONTH=floor((TIMESTAMP_START-YEAR*1e8)/1e6);
    DAY=floor((TIMESTAMP_START-YEAR*1e8-MONTH*1e6)/1e4);
    HOUR=floor((TIMESTAMP_START-YEAR*1e8-MONTH*1e6-DAY*1e4)/100)+rem((TIMESTAMP_START-YEAR*1e8-MONTH*1e6-DAY*1e4)/100,1)*5/3;
    LEAP=zeros(length(YEAR),1);LEAP(rem(YEAR/4,1)==0)=1;
    dMONTH=[0 31 28 31 30 31 30 31 31 30 31 30 31];
    dMONTH_L=[0 31 29 31 30 31 30 31 31 30 31 30 31];
    csMONTH=cumsum(dMONTH);
    csMONTH_L=cumsum(dMONTH_L);
    DOY=DAY+csMONTH(MONTH)';
    CSLEAP=csMONTH_L(MONTH);
    DOY(LEAP==1)=DAY(LEAP==1)+CSLEAP(LEAP==1)';
    
    for kk=1:length(YEAR)
        if NEE_VUT_REF(kk)==-9999
            GPP_NT_VUT_REF(kk)=nan;
        end
        if NEE_VUT_REF_QC(kk)>=2
            GPP_NT_VUT_REF(kk)=nan;
        end
        if GPP_NT_VUT_REF(kk)<0
            GPP_NT_VUT_REF(kk)=nan;
        end
        if SWC_F_MDS_1(kk)<0
            SWC_F_MDS_1(kk)=nan;
        end
    end
    PPFD=SW_IN_F.*2;a1=6;a2=7;a3=8;
    for year=2014:max(YEAR)
        for k=1:max(DAY(MONTH==a1))
            GPP18(k,1,1)=nanmean(GPP_NT_VUT_REF(PPFD>0&VPD_F>-100&TA_F>-100&GPP_NT_VUT_REF>=0&NEE_VUT_REF_QC<2&SWC_F_MDS_1_QC<2&SWC_F_MDS_1>=0&TA_F_QC<2&VPD_F_QC<2&SW_IN_F_QC<2&HOUR<=19&HOUR>=7&DAY==k&YEAR==year&MONTH==a1));
            GPP18(k,2,1)=nanmean(TA_F(PPFD>0&VPD_F>-100&TA_F>-100&GPP_NT_VUT_REF>=0&NEE_VUT_REF_QC<2&SWC_F_MDS_1_QC<2&SWC_F_MDS_1>=0&TA_F_QC<2&VPD_F_QC<2&SW_IN_F_QC<2&HOUR<=19&HOUR>=7&DAY==k&YEAR==year&MONTH==a1));
            GPP18(k,3,1)=nanmean(VPD_F(PPFD>0&VPD_F>-100&TA_F>-100&GPP_NT_VUT_REF>=0&NEE_VUT_REF_QC<2&SWC_F_MDS_1_QC<2&SWC_F_MDS_1>=0&TA_F_QC<2&VPD_F_QC<2&SW_IN_F_QC<2&HOUR<=19&HOUR>=7&DAY==k&YEAR==year&MONTH==a1));
            GPP18(k,4,1)=nanmean(SWC_F_MDS_1(PPFD>0&VPD_F>-100&TA_F>-100&GPP_NT_VUT_REF>=0&NEE_VUT_REF_QC<2&SWC_F_MDS_1_QC<2&SWC_F_MDS_1>=0&TA_F_QC<2&VPD_F_QC<2&SW_IN_F_QC<2&HOUR<=19&HOUR>=7&DAY==k&YEAR==year&MONTH==a1));
            GPP18(k,5,1)=nanmean(PPFD(PPFD>0&VPD_F>-100&TA_F>-100&GPP_NT_VUT_REF>=0&NEE_VUT_REF_QC<2&SWC_F_MDS_1_QC<2&SWC_F_MDS_1>=0&TA_F_QC<2&VPD_F_QC<2&SW_IN_F_QC<2&HOUR<=19&HOUR>=7&DAY==k&YEAR==year&MONTH==a1));
            GPP18(k,7,1)=year;
            GPP18(k,8,1)=i;
        end
        
        n=length(GPP18(:,1,1));
        for k=1:max(DAY(MONTH==a2))
            GPP18(k+n,1,1)=nanmean(GPP_NT_VUT_REF(PPFD>0&VPD_F>-100&TA_F>-100&GPP_NT_VUT_REF>=0&NEE_VUT_REF_QC<2&SWC_F_MDS_1_QC<2&SWC_F_MDS_1>=0&TA_F_QC<2&VPD_F_QC<2&SW_IN_F_QC<2&HOUR<=19&HOUR>=7&DAY==k&YEAR==year&MONTH==a2));
            GPP18(k+n,2,1)=nanmean(TA_F(PPFD>0&VPD_F>-100&TA_F>-100&GPP_NT_VUT_REF>=0&NEE_VUT_REF_QC<2&SWC_F_MDS_1_QC<2&SWC_F_MDS_1>=0&TA_F_QC<2&VPD_F_QC<2&SW_IN_F_QC<2&HOUR<=19&HOUR>=7&DAY==k&YEAR==year&MONTH==a2));
            GPP18(k+n,3,1)=nanmean(VPD_F(PPFD>0&VPD_F>-100&TA_F>-100&GPP_NT_VUT_REF>=0&NEE_VUT_REF_QC<2&SWC_F_MDS_1_QC<2&SWC_F_MDS_1>=0&TA_F_QC<2&VPD_F_QC<2&SW_IN_F_QC<2&HOUR<=19&HOUR>=7&DAY==k&YEAR==year&MONTH==a2));
            GPP18(k+n,4,1)=nanmean(SWC_F_MDS_1(PPFD>0&VPD_F>-100&TA_F>-100&GPP_NT_VUT_REF>=0&NEE_VUT_REF_QC<2&SWC_F_MDS_1_QC<2&SWC_F_MDS_1>=0&TA_F_QC<2&VPD_F_QC<2&SW_IN_F_QC<2&HOUR<=19&HOUR>=7&DAY==k&YEAR==year&MONTH==a2));
            GPP18(k+n,5,1)=nanmean(PPFD(PPFD>0&VPD_F>-100&TA_F>-100&GPP_NT_VUT_REF>=0&NEE_VUT_REF_QC<2&SWC_F_MDS_1_QC<2&SWC_F_MDS_1>=0&TA_F_QC<2&VPD_F_QC<2&SW_IN_F_QC<2&HOUR<=19&HOUR>=7&DAY==k&YEAR==year&MONTH==a2));
            GPP18(k+n,7,1)=year;
            GPP18(k+n,8,1)=i;
        end
        
        n=length(GPP18(:,1,1));
        for k=1:max(DAY(MONTH==a3))
            GPP18(k+n,1,1)=nanmean(GPP_NT_VUT_REF(PPFD>0&VPD_F>-100&TA_F>-100&GPP_NT_VUT_REF>=0&NEE_VUT_REF_QC<2&SWC_F_MDS_1_QC<2&SWC_F_MDS_1>=0&TA_F_QC<2&VPD_F_QC<2&SW_IN_F_QC<2&HOUR<=19&HOUR>=7&DAY==k&YEAR==year&MONTH==a3));
            GPP18(k+n,2,1)=nanmean(TA_F(PPFD>0&VPD_F>-100&TA_F>-100&GPP_NT_VUT_REF>=0&NEE_VUT_REF_QC<2&SWC_F_MDS_1_QC<2&SWC_F_MDS_1>=0&TA_F_QC<2&VPD_F_QC<2&SW_IN_F_QC<2&HOUR<=19&HOUR>=7&DAY==k&YEAR==year&MONTH==a3));
            GPP18(k+n,3,1)=nanmean(VPD_F(PPFD>0&VPD_F>-100&TA_F>-100&GPP_NT_VUT_REF>=0&NEE_VUT_REF_QC<2&SWC_F_MDS_1_QC<2&SWC_F_MDS_1>=0&TA_F_QC<2&VPD_F_QC<2&SW_IN_F_QC<2&HOUR<=19&HOUR>=7&DAY==k&YEAR==year&MONTH==a3));
            GPP18(k+n,4,1)=nanmean(SWC_F_MDS_1(PPFD>0&VPD_F>-100&TA_F>-100&GPP_NT_VUT_REF>=0&NEE_VUT_REF_QC<2&SWC_F_MDS_1_QC<2&SWC_F_MDS_1>=0&TA_F_QC<2&VPD_F_QC<2&SW_IN_F_QC<2&HOUR<=19&HOUR>=7&DAY==k&YEAR==year&MONTH==a3));
            GPP18(k+n,5,1)=nanmean(PPFD(PPFD>0&VPD_F>-100&TA_F>-100&GPP_NT_VUT_REF>=0&NEE_VUT_REF_QC<2&SWC_F_MDS_1_QC<2&SWC_F_MDS_1>=0&TA_F_QC<2&VPD_F_QC<2&SW_IN_F_QC<2&HOUR<=19&HOUR>=7&DAY==k&YEAR==year&MONTH==a3));
            GPP18(k+n,7,1)=year;
            GPP18(k+n,8,1)=i;
        end
        GPP182=[GPP182;GPP18];
        clear GPP18
    end
    GPP18=GPP182;
    GPP18(:,6)=GPP18(:,1)./GPP18(:,5);
    y18=GPP18;
    clear GPP18;
    
    y18 = rmmissing(y18,1);
    cc=y18;cc(:,7)=y18(:,7);cc(:,8)=y18(:,8);cc(:,9)=a2;
    tbl(1:length(cc(:,1)),:,i)=cc;
    site(i,1)=string(name(5:10));
    clearvars -except d str i tbl site
end
%save output

%%
%%plot fig1.a
clear all;
str='data/';cd(str)
load('Fig1_part1.mat')
width = 10;     % Width in inches
height = 10;    % Height in inches
defpos = get(0,'defaultFigurePosition');
set(0,'defaultFigurePosition', [defpos(1) defpos(2) width*100, height*100]);
top_margin=0.01;
left_margin=0.06;
horizontal_margin=0.001;
vertical_margin=0.001;
map_width=0.4;
map_height=0.2;
hold on;
str='data/';%set ICOS data path
cd(str);
d=dir('*.csv');
for m=1:length(d)
    gpp(:,m)=tbl(:,1,m);
    ta(:,m)=tbl(:,2,m);
    vpd(:,m)=tbl(:,3,m);
    swc(:,m)=tbl(:,4,m);
    ppfd(:,m)=tbl(:,5,m);
    lue(:,m)=tbl(:,6,m);
    year(:,m)=tbl(:,7,m);
    siteid(:,m)=tbl(:,8,m);
    mm(:,m)=tbl(:,9,m);
end
gpp=gpp(:);ta=ta(:);vpd=vpd(:);swc=swc(:);ppfd=ppfd(:);lue=lue(:);year=year(:);siteid=siteid(:);mm=mm(:);
vpd = rmmissing(vpd,1);swc = rmmissing(swc,1);gpp = rmmissing(gpp,1);ppfd = rmmissing(ppfd,1);ta = rmmissing(ta,1);
lue = rmmissing(lue,1);year = rmmissing(year,1);siteid = rmmissing(siteid,1);mm = rmmissing(mm,1);
for i=1:15
    for j=2014:2018
        ddgpp2(i,j-2013)=(nanmean(gpp(siteid==i&year==j))-nanmean(gpp(siteid==i)))/nanmean(gpp(siteid==i));
        ddswc2(i,j-2013)=(nanmean(swc(siteid==i&year==j))-nanmean(swc(siteid==i)))/nanmean(swc(siteid==i));
        ddvpd2(i,j-2013)=(nanmean(vpd(siteid==i&year==j))-nanmean(vpd(siteid==i)))/nanmean(vpd(siteid==i));
        year2(i,j-2013)=nanmean(year(siteid==i&year==j));
        site2(i,j-2013)=nanmean(siteid(siteid==i&year==j));
    end
end
ddgpp=ddgpp2(:);ddswc=ddswc2(:);ddvpd=ddvpd2(:);year3=year2(:);%11 68row
ddswc(11)=0.6;ddswc(68)=-0.6;site3=site2(:);

result=[ddgpp,ddswc,ddvpd,year3,site3];result2=result;
edges = -60:10:60;
Y = discretize(100*ddswc,edges);
for i=1:length(edges)
    binswc(i,1)=mean(100*ddswc(Y==i));
    binsite(i,1)=length(ddswc(Y==i));
end
edges1 = -60:10:60;
Y1 = discretize(100*ddvpd,edges1);
for i=1:length(edges1)
    binvpd(i,1)=mean(100*ddvpd(Y1==i));
    binsite2(i,1)=length(ddvpd(Y1==i));
end
for j=1:length(edges1)
    for i=1:length(edges)
        bingpp(j,i)=mean(100*ddgpp(Y==i&Y1==j));
        binsite3(j,i)=length(ddgpp(Y==i&Y1==j));
    end
end

CT=cbrewer('div', 'BrBG', 50);
ax1 = subplot('position',[left_margin,1-top_margin-0.4-vertical_margin,0.403,0.4]);
pcolor(bingpp);colormap(CT);caxis([-20 20])
set(gca,'XTick',[1:length(edges)],'XTickLabel',edges);hold on;
set(gca,'YTick',[1:length(edges1)],'YTickLabel',edges1);hold on;
yticklabels({'-60','','-40','','-20','','0','','20','','40','','60'})
xticklabels({'-60','','-40','','-20','','0','','20','','40','','60'})
ylabel('\DeltaSummer VPD (%)','Fontsize',14)
xlabel('\DeltaSummer SWC (%)','Fontsize',14)
h=colorbar('Fontsize',14);
set(get(h,'label'),'string','\DeltaSummer GPP (%)','Fontsize',14);
set(gca, 'Fontsize',14);
shading('flat');
binsite3(binsite3==0)=nan;
for j=1:length(edges1)
    for i=1:length(edges)
        A=binsite3(j,i);
        B = num2str(A)'; % Convert numbers into strings.
        I = strfind(B(:)','NaN'); % Find NaNs
        B([I I+1 I+2]) = ' '; % Replace NaN with spaces
        A = B' ;
        text(i+0.5,j+0.5,A)
    end
end

patch([1 1 2 2 1],[12 13 13 12 12],ones(1,5),'facecolor','none','edgecolor','r','linewidth',2)
patch([1 1 2 2 1],[9 10 10 9 9],ones(1,5),'facecolor','none','edgecolor','r','linewidth',2)
patch([3 4 4 3 3],[10 10 11 11 10],ones(1,5),'facecolor','none','edgecolor','r','linewidth',2)
patch([4 4 5 5 4],[11 10 10 11 11],ones(1,5),'facecolor','none','edgecolor','r','linewidth',2)
patch([2 2 3 3 2],[10 9 9 10 10],ones(1,5),'facecolor','none','edgecolor','r','linewidth',2)
patch([3 3 4 4 3],[10 9 9 10 10],ones(1,5),'facecolor','none','edgecolor','r','linewidth',2)
patch([5 5 6 6 5],[10 9 9 10 10],ones(1,5),'facecolor','none','edgecolor','r','linewidth',2)
patch([3 3 4 4 3],[9 8 8 9 9],ones(1,5),'facecolor','none','edgecolor','r','linewidth',2)
patch([5 5 6 6 5],[9 8 8 9 9],ones(1,5),'facecolor','none','edgecolor','r','linewidth',2)
patch([6 6 7 7 6],[9 8 8 9 9],ones(1,5),'facecolor','none','edgecolor','r','linewidth',2)
patch([4 4 5 5 4],[8 7 7 8 8],ones(1,5),'facecolor','none','edgecolor','r','linewidth',2)
patch([7 7 8 8 7],[8 7 7 8 8],ones(1,5),'facecolor','none','edgecolor','r','linewidth',2)
patch([4 4 5 5 4],[10 9 9 10 10],ones(1,5),'facecolor','none','edgecolor','r','linewidth',2)
patch([10.6 10.6 11.3 11.3 10.6],[12.6 11.9 11.9 12.6 12.6],ones(1,5),'facecolor','none','edgecolor','r','linewidth',1.3)
text(0.88,0.94,'2018','Units','normalized','Fontsize',14);
text(-0.171,1.014,'a','Units','normalized','Fontsize',20,'Fontweight','bold');

%%
%%plot fig1.b&c
clear all;
str='data/';
cd(str);
d=dir('*.csv');
load('Fig1_part2.mat')
width = 10;
height = 10;
defpos = get(0,'defaultFigurePosition');
set(0,'defaultFigurePosition', [defpos(1) defpos(2) width*100, height*100]);
top_margin=0.03;
left_margin=0.06;
horizontal_margin=0.001;
vertical_margin=0.001;
map_width=0.4;
map_height=0.2;
hold on;
for m=1:length(d)
    gpp(:,m)=tbl(:,1,m);
    ta(:,m)=tbl(:,2,m);
    vpd(:,m)=tbl(:,3,m);
    swc(:,m)=tbl(:,4,m);
    ppfd(:,m)=tbl(:,5,m);
    lue(:,m)=tbl(:,6,m);
    year(:,m)=tbl(:,7,m);
    siteid(:,m)=tbl(:,8,m);
end
gpp=gpp(:);ta=ta(:);vpd=vpd(:);swc=swc(:);ppfd=ppfd(:);lue=lue(:);year=year(:);siteid=siteid(:);
vpd = rmmissing(vpd,1);swc = rmmissing(swc,1);gpp = rmmissing(gpp,1);ppfd = rmmissing(ppfd,1);ta = rmmissing(ta,1);
lue = rmmissing(lue,1);year = rmmissing(year,1);siteid = rmmissing(siteid,1);

tbl0 = table(lue,gpp,ta,vpd,swc,ppfd,year,siteid,'VariableNames',{'lue','gpp','ta','vpd','swc','ppfd','year','siteid'});
tbl1= table(lue(year<2018),gpp(year<2018),ta(year<2018),vpd(year<2018),swc(year<2018),ppfd(year<2018),year(year<2018),siteid(year<2018),'VariableNames',{'lue','gpp','ta','vpd','swc','ppfd','year','siteid'});

ax2=subplot('position',[left_margin,1-top_margin-map_height*2-vertical_margin-0.25,0.2,0.2]);
h1417=histfit(tbl1.swc);set(h1417(1),'FaceColor','b','FaceAlpha',.2,'EdgeAlpha',.2); h1417(2).Color = [0 0 1];
hold on;
h1418=histfit(tbl0.swc);set(h1418(1),'FaceColor','r','FaceAlpha',.2,'EdgeAlpha',.2);
[muHat1,sigmaHat1] = normfit(tbl1.swc);
[muHat2,sigmaHat2] = normfit(tbl0.swc);
ylabel('Number of site-days');
xlabel('SWC anomaly');legend([h1418(1) h1417(1)],{'2014-2018','2014-2017'});
legend('boxoff');set(gca, 'Fontsize',14);ylim([0 300]);xlim([-3.1 5]);
box off
hold on;
text(-0.296,1.022,'b','Units','normalized','Fontsize',20,'Fontweight','bold');

ax2=subplot('position',[left_margin+0.2+horizontal_margin+0.025,1-top_margin-map_height*2-vertical_margin-0.25,0.2,0.2]);
h1417=histfit(tbl1.vpd);set(h1417(1),'FaceColor','b','FaceAlpha',.2,'EdgeAlpha',.2); h1417(2).Color = [0 0 1];
hold on;
h1418=histfit(tbl0.vpd);set(h1418(1),'FaceColor','r','FaceAlpha',.2,'EdgeAlpha',.2);
[muHat1,sigmaHat1] = normfit(tbl1.vpd);
[muHat2,sigmaHat2] = normfit(tbl0.vpd);
xlabel('VPD anomaly');set(gca, 'Fontsize',14);ylim([0 300]);
set(gca, 'Yticklabel', []);box off
set(gca,'ycolor',[1 1 1]);xlim([-3.1 5]);
text(-0.06,1.022,'c','Units','normalized','Fontsize',20,'Fontweight','bold');

%%
%%plot fig1.d&e
%gpp~vpd+swc+vpd*swc+ta+ppfd
clear all;
str='data/';
cd(str);
d=dir('*.csv');
load('Fig1_part2.mat')
width = 10;
height = 10;
defpos = get(0,'defaultFigurePosition');
set(0,'defaultFigurePosition', [defpos(1) defpos(2) width*100, height*100]);
top_margin=0.03;
left_margin=0.06;
horizontal_margin=0.001;
vertical_margin=0.001;
map_width=0.4;
map_height=0.2;
hold on;
for m=1:length(d)
    gpp(:,m)=tbl(:,1,m);
    ta(:,m)=tbl(:,2,m);
    vpd(:,m)=tbl(:,3,m);
    swc(:,m)=tbl(:,4,m);
    ppfd(:,m)=tbl(:,5,m);
    lue(:,m)=tbl(:,6,m);
    year(:,m)=tbl(:,7,m);
    siteid(:,m)=tbl(:,8,m);
end
gpp=gpp(:);ta=ta(:);vpd=vpd(:);swc=swc(:);ppfd=ppfd(:);lue=lue(:);year=year(:);siteid=siteid(:);
vpd = rmmissing(vpd,1);swc = rmmissing(swc,1);gpp = rmmissing(gpp,1);ppfd = rmmissing(ppfd,1);ta = rmmissing(ta,1);
lue = rmmissing(lue,1);year = rmmissing(year,1);siteid = rmmissing(siteid,1);
tbl8 = table(lue,gpp,ta,vpd,swc,ppfd,year,siteid,'VariableNames',{'lue','gpp','ta','vpd','swc','ppfd','year','siteid'});
for n=1:15
    tbl0=tbl8(tbl8.siteid==n,:);
    lme0 = fitlme(tbl0,'gpp~vpd+swc+vpd*swc+ta+ppfd');
    slope18(n,1:2)=lme0.Coefficients.Estimate(3:4);slope18(n,3:4)=lme0.Coefficients.SE(3:4);slope18(n,11:12)=lme0.Coefficients.pValue(3:4);
    tbl1=tbl0(tbl0.year<2018,:);
    lme1 = fitlme(tbl1,'gpp~vpd+swc+vpd*swc+ta+ppfd');
    slope18(n,5:6)=lme1.Coefficients.Estimate(3:4);slope18(n,7:8)=lme1.Coefficients.SE(3:4);
    slope18(n,9)=length(tbl0.siteid);slope18(n,10)=length(tbl1.siteid);slope18(n,13:14)=lme1.Coefficients.pValue(3:4);
end

b2=slope18(:,2);b172=slope18(:,6);b1=slope18(:,1);b171=slope18(:,5);

ax2=subplot('position',[left_margin,1-top_margin-map_height*3-vertical_margin*2-0.31,0.2,0.2]);
b2=-b2;b172=-b172;
XGrid=min(b2):0.01:max(b2);
pd1 = fitdist(b2, 'normal');
YPlot = pdf(pd1,XGrid);
hLine = plot(XGrid,YPlot,'Color',[0 0 1],...
    'LineStyle','-', 'LineWidth',2,...
    'Marker','none', 'MarkerSize',6);
hold on;
XGrid3=min(b172):0.01:max(b172);
pd3 = fitdist(b172, 'normal');
YPlot3 = pdf(pd3,XGrid3);
hLine3 = plot(XGrid3,YPlot3,'Color',[0 0 1],...
    'LineStyle','-.', 'LineWidth',2,...
    'Marker','none', 'MarkerSize',6);
lege=legend('2014-2018','2014-2017');set(lege,'box','off')
set(gca, 'Yticklabel', []);
ylabel('Probability density','Fontsize',12)
xlabel('Slope between GPP and SWC','Fontsize',12)
set(gca, 'Fontsize',12);set(gca,'Ytick',[]);box off
xlim([-0.6 0.201]);
set(gca, 'Fontsize',14);
text(-0.296,0.99,'d','Units','normalized','Fontsize',20,'Fontweight','bold');

ax2=subplot('position',[left_margin+0.2+horizontal_margin+0.025,1-top_margin-map_height*3-vertical_margin*2-0.31,0.2,0.2]);
XGrid2=min(b1):0.01:max(b1);
pd2 = fitdist(b1, 'normal');
YPlot2 = pdf(pd2,XGrid2);
hLine2 = plot(XGrid2,YPlot2,'Color',[1 0 0],...
    'LineStyle','-', 'LineWidth',2,...
    'Marker','none', 'MarkerSize',6);
hold on;
XGrid4=min(b171):0.01:max(b171);
pd4 = fitdist(b171, 'normal');
YPlot4 = pdf(pd4,XGrid4);
hLine4 = plot(XGrid4,YPlot4,'Color',[1 0 0],...
    'LineStyle','-.', 'LineWidth',2,...
    'Marker','none', 'MarkerSize',6);
set(gca, 'Yticklabel', []);
xlabel('Slope between GPP and VPD','Fontsize',12)
set(gca, 'Fontsize',12);set(gca,'Ytick',[]);box off;
set(gca,'ycolor',[1 1 1])
xlim([-0.97 0]);
set(gca, 'Fontsize',14);
text(-0.06,0.99,'e','Units','normalized','Fontsize',20,'Fontweight','bold');

