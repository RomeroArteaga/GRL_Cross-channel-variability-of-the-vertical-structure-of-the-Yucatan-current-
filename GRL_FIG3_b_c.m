close all;clear all;clc;
%%
fontz=25;
sz= fontz;% Longitud posicion anclajes
lona17 = [
    -86.7444, -86.7257; % 1
    -86.5087 -86.5021;  % 2
    -86.4835 -86.4190;  % 3
    -86.3880 -86.3262;  % 4
    -86.2507 -86.2098;  % 5
    -86.1649 -86.1165;  % i5
    -86.0090 -85.9472;  % 6
    -85.8733 -85.8370;  % i6
    -85.7610 -85.6732;  % 7
    -85.5757 -85.4867;  % 8
    -85.4410 -85.3356;  % 8i
    -85.3200 -85.1366;  % 9
    -85.1307 -85.0663;  % 9i
    -85.0176 -84.9200;  % 10
    ];
lona17=mean(lona17,2)
%% nombres de los anclajes
yuc = {'Y1 ', 'Y2 ', 'Y3 ', 'Y4 ', 'Y5 ', 'Yi5', 'Y6 ', 'Yi6',...
    'Y7 ', 'Y8 ', 'Yi8', 'Y9 ', 'Yi9', 'Y10'};

LAT_Y =[[21, 30, 228]; [21, 32, 312]; [21, 33, 244]; [21, 34, 227]; [21, 36, 082];[21, 36, 082]; ...
    [21, 39, 855]; [21, 39, 855];[21, 39, 406]; [21, 41, 241];[21, 41, 241]; [21, 44, 348]; [21, 44, 348];[21,48, 071]];
lata17= [LAT_Y(:,1) + (1/60).*LAT_Y(:,2)]';





in2= datenum('11-Jul-2012 00:00:00','dd-mmm-yy   HH:MM:SS');
fn2= datenum('30-Nov-2020 00:00:00','dd-mmm-yy  HH:MM:SS');
fecha12=datenum(2012,6:12,01);
fecha13=datenum(2013,1:12,01);
fecha14=datenum(2014,1:12,01);
fecha15=datenum(2015,1:12,01);
fecha16=datenum(2016,1:12,01);
fecha17=datenum(2017,1:12,01);
fecha18=datenum(2018,1:12,01);
fecha19=datenum(2019,1:12,01);
fecha20=datenum(2020,1:11,01);

fecha=[ fecha12 fecha13 fecha14 fecha15 fecha16 fecha17 fecha18 fecha19 fecha20];

%% ========================================================================
load Position_LCEs_shedding_2012_2020
cosr=[0.85 0.33 0.1; 0.5 0.2 0.60; 0.5 0.7 0.20; 1 0 1; 0 0.5 0.8; 1 0.7 0.1; 0.15 0.15 0.15;...
    0.85 0.33 0.1; 0.5 0.2 0.60; 0.5 0.7 0.20; 1 0 1; 0 0.5 0.8; 1 0.7 0.1; 0.15 0.15 0.15];
fontz      = 32;
cont_value = 0.50;
cmin       = -0.20;
cmax       = 1;
rangeD     = cmin:0.1:cmax;



Q1=[
    2015	11	19	0	0	0
    2015	12	6	0	0	0
    2017	11	16	0	0	0
    2020	1	12	0	0	0];
Lon1=  Lon_detachment([11;  12;  14;  19]);
Lat1=  Lat_detachment([11; 12; 14;  19]);


Q2=[
    2013	3	23	0	0	0
    2014	5	5	0	0	0
    2014	7	5	0	0	0
    2014	11	5	0	0	0
    2015	1	14	0	0	0
    2015	6	22	0	0	0
    2015	10	23	0	0	0
    2016	4	4	0	0	0
    2018	2	6	0	0	0
    2018	6	18	0	0	0
    2019	7	6	0	0	0];
Lon2=  Lon_detachment([1; 2; 3; 4; 5; 8; 10; 13; 15;17; 18]);
Lat2=  Lat_detachment([1; 2; 3; 4; 5; 8; 10; 13;15; 17; 18]);


Q3=[
    2015	4	22	0	0	0
    2015	5	13	0	0	0
    2015	8	24	0	0	0
    2018	4	17	0	0	0
    2020	3	29	0	0	0];

Lon3=  Lon_detachment([6; 7;9;16;20]);
Lat3=  Lat_detachment([6; 7;9;16;20]);


load AVISO_MADT_2012_2020.mat
vf1= datenum(2012,07,10,0,0,0);
vf2= datenum(2020,11,30,0,0,0);
id= find(t>=vf1 & t<=vf2);

madt=madt(:,:,id(1):id(end));
us=u(:,:,id(1):id(end));
vs=v(:,:,id(1):id(end));
ts=t(id(1):id(end));

clearvars  u v t

u=us;
v=vs;
t=ts;

time =t;
day_idx_num= time;
day_idx_str= datestr(time);



load yuc_d_CNKvelOI_2012a2021_51_daily.mat;
Vmap_cnk_W = Veldy;
tt         = ttd;
res        = 0.03;
xlon       = -86.8:res:-84.9100;
profs      = 10:20:2090;
profs      = -profs;
nxb        = length(xlon);

%%=========================================================================
%% /carga seccion del canal para graficas
clearvars X Z
load yucsec3 ;
[X,Z]      = meshgrid(xlon,profs);
[mX,nX]    = size(X);
xv=bp(:,1); yv=bp(:,3); xv = [xv ; xv(1)]; yv = [yv ; 0];
in = inpolygon(X(:),Z(:),xv,yv); ind=find(in>.4);
mask=nan*ones(size(X)); dum=mask(:); dum(ind)=ones(size(ind));
mask(:)=dum;

%% =====================================================================
for jj=1:length(Lon1);
    i_flq1(jj)=find(time==datenum(Q1(jj,:)));
end
%% =====================================================================
for jj=1:length(Lon2);
    i_q1q2(jj)=find(time==datenum(Q2(jj,:)));
end
%% =====================================================================

for jj=1:length(Lon3);
    i_q2q3(jj)=find(time==datenum(Q3(jj,:)));
end


%% =====================================================================
%% Figure
% figure
cmin    = -0.4;
cmax    = 1.6;
rangeD  = [cmin:0.2:cmax];

for mm=1:3

    clearvars VV

    if        mm==1;   VV=  nanmean(Veldy(:,i_flq1),2); axes('pos',[0.127916666666667 0.22 0.254895833333333 0.46]); % text(-86.5,-1000,['Q_{0} - Q_{1}'],'fontsize',20); 
    elseif    mm==2;   VV=  nanmean(Veldy(:,i_q1q2),2); axes('pos', [0.3909375         0.22 0.254895833333333 0.46]);  %text(-86.5,-1000,['Q_{1} - Q_{3}'],'fontsize',20);
    elseif    mm==3;   VV=  nanmean(Veldy(:,i_q2q3),2); axes('pos', [0.652916666666667 0.22 0.254895833333333 0.46]); %text(-86.5,-1000,['Q_{4} - Q_{5}'],'fontsize',20);
    end
    
    mask(celda)=VV;
    contourf(xlon,profs,mask,rangeD);
    hold on
    [C,h]    = contour(xlon,profs,mask,[0.3 0.3],'k','linewidth',4);  set(h,'linewidth',4,'Color',[0 0 0]);
[c0,b0]    = contour(xlon,profs,mask,[0 0],'k-','linewidth',4);  set(b0,'linewidth',4,'Color',[0.8 0.8 0.8]);

    colormap(cmocean('balance',50))
    caxis([cmin cmax]);
    
    % text YUC
    for yi = 1:1:length(yuc);
        if yi==2;text(lona17(yi)-0.15,80,yuc{yi},'FontWeight','bold','fontsize',22);
        else;text(lona17(yi)-.05,80,yuc{yi},'FontWeight','bold','fontsize',22);
        end;end
    
    
% puntos YUC
plot(lona17,0,'o','Markersize',15,'MarkerEdgeColor',[0.0 0.5 0.0],'MarkerFaceColor',[0.0 0.5 0.0]);
plot(lona17,0,'.','Markersize',12,'MarkerEdgeColor',[0 0 0 ],'MarkerFaceColor',[0 0 0]);

    % contorno YUC
plot(bp(:,1),bp(:,3),'Color',[0 0 0],'linewidth',2);
    text(-85.22,-1900,['Cuba'],'FontWeight','bold','fontsize',sz);
    text(-86.70,-1900,['Yucatan'],'FontWeight','bold','fontsize',sz);  
    ylim([-2050 0])     
    if     mm==1;  text(-86.55,-1750,['Q_{1}'],'fontweight','bold','fontsize',sz); ylabel('Depth (m)');    xlabel('Longitude')
    elseif mm==2;  text(-86.55,-1750,['Q_{2}'],'fontweight','bold','fontsize',sz);    xlabel('Longitude');set(gca,'yticklabel',[])
    elseif mm==3;  text(-86.55,-1750,['Q_{3}'],'fontweight','bold','fontsize',sz);xlabel('Longitude');set(gca,'yticklabel',[])
    end
    set(gca,'FontWeight','bold','fontsize',sz)
    set(gca,'layer','top'); box on; axn = gca; axn.XColor = 'black'; axn.LineWidth = 3; set(gca,'fontsize',fontz);
    
end

[nc,hc]=colorb('v',[cmin cmax],'',[],rangeD,sz,2);
set(hc,'position',[0.92 0.22 0.018 0.46]);

set(gca,'FontWeight','bold','fontsize',fontz)
th=text(-84.30,-1050,'ms^{-1}','FontWeight','bold','fontsize',sz);
set(th,'Rotation',90);

% %save figure
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
% name1=['FIG_030_Q1Q2Q3'];
% print(name1,'-dpng','-r0');
% savefig([name1,'.fig']);
% 






%% =====================================================================
cont_value = 0.50;
cmin=0
cmax=1;
rangeD=cmin:.1:cmax;
%% ========================================================================
%% FIG09 b
figure
subplot(1,3,1);
contourf(Lon,Lat,nanmean(madt(:,:,i_flq1),3));hold on
colormap(cmocean('curl',50));
caxis([cmin cmax]);
hold on
[C,h]=contour(Lon,Lat,nanmean(madt(:,:,i_flq1),3),[0.55 0.55],'k','linewidth',3);
%% lon & lat
PD = plot(Lon1,Lat1,'MarkerSize',15,'Marker','+','LineWidth',4,'LineStyle','none','Color',[0 0 1]);
PS = plot([-100 -80],[23 23],'LineWidth',3,'LineStyle','--','Color',[0 0 0]); 
xlabel('Longitude', 'fontweight', 'bold','FontSize', fontz);
ylabel('Latitude', 'fontweight', 'bold','FontSize', fontz);
% plot / costa
esc=15:5:75;
load('costa.dat'); costa(find(costa(:,2)<26),2)=nan;
load('con0.mat');  cosmap=cos(26*pi/180);
plot(costa(:,1),costa(:,2),'k','linewidth',1.5);
plot(b(:,2),b(:,1),'k','linewidth',1.5);
plot(lona17,lata17,'o','Markersize',15,'MarkerEdgeColor',[0.0 0.5 0.0],'MarkerFaceColor',[0.0 0.5 0.0]);
plot(lona17,lata17,'.','Markersize',12,'MarkerEdgeColor',[0 0 0 ],'MarkerFaceColor',[0 0 0]);
plot([-95 -80],[23 23],'--','color','k','LineWidth',2) 
set(gca,'dataaspectratio',[cosmap,1,1],'plotboxaspectratio',[cosmap,1,1]);
axis([-92 -83 20 29]) 
set(gca,'layer','top'); box on; ax = gca; ax.XColor = 'black'; ax.LineWidth = 3; set(gca,'fontsize',fontz);
set(gca,'fontweight', 'bold','FontSize', fontz);
set(gca,'layer','top'); box on; ax = gca; ax.XColor = 'black'; ax.LineWidth = 3; set(gca,'fontsize',fontz);
text(-89.5,20.5,['Yucatan'],'fontweight','bold','fontsize',sz);
textcuba=text(-84.1,22.2,['Cuba'],'fontweight','bold','fontsize',sz); set(textcuba,  'Rotation',30) 
text(-88.8,21.1,['Q_{1}'],'fontweight','bold','fontsize',sz); 
  
    

%% ========================================================================

subplot(1,3,2);
contourf(Lon,Lat,nanmean(madt(:,:,i_q1q2),3));hold on
colormap(cmocean('curl',50));
caxis([cmin cmax]);
hold on
[C,h]=contour(Lon,Lat,nanmean(madt(:,:,i_q1q2),3),[0.5 0.5],'k','linewidth',3);
%% lon & lat
PD = plot(Lon2,Lat2,'MarkerSize',15,'Marker','+','LineWidth',4,'LineStyle','none','Color',[0 0 1]);
PS = plot([-100 -80],[23 23],'LineWidth',3,'LineStyle','--','Color',[0 0 0]); 
xlabel('Longitude', 'fontweight', 'bold','FontSize', fontz);
ylabel('Latitude', 'fontweight', 'bold','FontSize', fontz);
% plot / costa
esc=15:5:75;
load('costa.dat'); costa(find(costa(:,2)<26),2)=nan;
load('con0.mat');  cosmap=cos(26*pi/180);
plot(costa(:,1),costa(:,2),'k','linewidth',1.5);
plot(b(:,2),b(:,1),'k','linewidth',1.5);
plot(lona17,lata17,'o','Markersize',15,'MarkerEdgeColor',[0.0 0.5 0.0],'MarkerFaceColor',[0.0 0.5 0.0]);
plot(lona17,lata17,'.','Markersize',12,'MarkerEdgeColor',[0 0 0 ],'MarkerFaceColor',[0 0 0]);
plot([-95 -80],[23 23],'--','color','k','LineWidth',2) 

set(gca,'dataaspectratio',[cosmap,1,1],'plotboxaspectratio',[cosmap,1,1]);
axis([-92 -83 20 29])  
set(gca,'layer','top'); box on; ax = gca; ax.XColor = 'black'; ax.LineWidth = 3; set(gca,'fontsize',fontz);
set(gca,'fontweight', 'bold','FontSize', fontz);
set(gca,'layer','top'); box on; ax = gca; ax.XColor = 'black'; ax.LineWidth = 3; set(gca,'fontsize',fontz);
text(-89.5,20.5,['Yucatan'],'fontweight','bold','fontsize',sz);
textcuba=text(-84.1,22.2,['Cuba'],'fontweight','bold','fontsize',sz); set(textcuba,  'Rotation',30) 
text(-88.8,21.1,['Q_{2}'],'fontweight','bold','fontsize',sz); 
  
%% ========================================================================

subplot(1,3,3);
contourf(Lon,Lat,nanmean(madt(:,:,i_q2q3),3));hold on
colormap(cmocean('curl',50));

caxis([cmin cmax]);
hold on
[C,h]=contour(Lon,Lat,nanmean(madt(:,:,i_q2q3),3),[0.5 0.5],'k','linewidth',3);
%% lon & lat
PD = plot(Lon3,Lat3,'MarkerSize',15,'Marker','+','LineWidth',4,'LineStyle','none','Color',[0 0 1]);
PS = plot([-100 -80],[23 23],'LineWidth',3,'LineStyle','--','Color',[0 0 0]); 
xlabel('Longitude', 'fontweight', 'bold','FontSize', fontz);
ylabel('Latitude', 'fontweight', 'bold','FontSize', fontz);
% plot / costa
esc=15:5:75;
load('costa.dat'); costa(find(costa(:,2)<26),2)=nan;
load('con0.mat');  cosmap=cos(26*pi/180);
plot(costa(:,1),costa(:,2),'k','linewidth',1.5);
plot(b(:,2),b(:,1),'k','linewidth',1.5);
plot(lona17,lata17,'o','Markersize',15,'MarkerEdgeColor',[0.0 0.5 0.0],'MarkerFaceColor',[0.0 0.5 0.0]);
plot(lona17,lata17,'.','Markersize',12,'MarkerEdgeColor',[0 0 0 ],'MarkerFaceColor',[0 0 0]);
plot([-95 -80],[23 23],'--','color','k','LineWidth',2) 

set(gca,'dataaspectratio',[cosmap,1,1],'plotboxaspectratio',[cosmap,1,1]);
axis([-92 -83 20 29])  
set(gca,'fontweight', 'bold','FontSize', fontz);
set(gca,'layer','top'); box on; ax = gca; ax.XColor = 'black'; ax.LineWidth = 3; set(gca,'fontsize',fontz);
set(gca,'fontweight', 'bold','FontSize', fontz);

% colorbar
[nc,hc]=colorb('v',[cmin cmax],'',[],rangeD,sz,2);
set(hc,'position',[0.92 0.31 0.018 0.42]);
set(gca,'fontsize',sz);
th=text(-80.5,24.2,'m','FontWeight','bold','fontsize',sz);
set(th,'Rotation',90);
text(-89.5,20.5,['Yucatan'],'fontweight','bold','fontsize',sz);
textcuba=text(-84.1,22.2,['Cuba'],'fontweight','bold','fontsize',sz); set(textcuba,  'Rotation',30) 
text(-88.8,21.1,['Q_{3}'],'fontweight','bold','fontsize',sz); 
text(-86.8,28.30,['+ Eddy Shedding'],'fontweight','bold','fontsize',sz,'color',[0 0 1]); 
set(gca,'fontweight', 'bold','FontSize', fontz);
packboth(1,3)


% %save figure
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
% name1=['FIG_MADT1_Q1Q2Q3'];
% print(name1,'-dpng','-r0');
% savefig([name1,'.fig']);
% 



