close all;clear all;clc
sz =35;
fontz=sz;
fz=35;
load Morfological_parameters_2012_2020_F.mat

%% ========================================================================
in2     = datenum('10-Jul-2012 00:00:00','dd-mmm-yy   HH:MM:SS');
fn2     = datenum('30-Nov-2020 00:00:00','dd-mmm-yy  HH:MM:SS');
fecha12 = datenum(2012,7:2:12,01);
fecha13 = datenum(2013,1:2:12,01);
fecha14 = datenum(2014,1:2:12,01);
fecha15 = datenum(2015,1:2:12,01);
fecha16 = datenum(2016,1:2:12,01);
fecha17 = datenum(2017,1:2:12,01);
fecha18 = datenum(2018,1:2:12,01);
fecha19 = datenum(2019,1:2:12,01);
fecha20 = datenum(2020,1:2:12,01);
fecha   = [fecha12 fecha13 fecha14 fecha15 fecha16 fecha17 fecha18 fecha19 fecha20];



%% ========================================================================
%% Fig01_a
figure
esc=1;
s2=subplot(2,1,1);
[AX, h1, h2] =plotyy(time_day,V_max_F,time_day,L_max_F); hold on
set(AX(1,1),'YColor',[0 0 1]) ; set(h1,'LineWidth',3,'Color',[0 0 1]) ;
set(AX(1,2),'YColor',[0 0.45 0.74]) ; set(h2,'LineWidth',3,'Color',[0 0.45 0.74],'linestyle','-') ;
set(get(AX(1),'Ylabel'),'String',{'V_{max} (ms^{-1})'},'fontsize',fontz);
set(get(AX(2),'Ylabel'),'String',{'L_{max} (degrees)'},'fontsize',fontz);
ylim(AX(1),[0.6   2.2 ]);
ylim(AX(2),[-86.6  -85.6]);
set(AX(1), 'YTick',[     0.6000    1.0000    1.4000    1.8000    2.2000])
set(AX(2), 'YTick',[-86.6000  -86.3500  -86.1000  -85.8500  -85.6000]);
set(AX(1,1),'xtick',fecha);datetick(AX(1,1),'x','mmm-yy','keepticks');
set(AX(1,2),'xtick',fecha);datetick(AX(1,2),'x','mmm-yy','keepticks');
set(AX(1,1),'xticklabel',[])
set(AX(1,2),'xticklabel',[])
set(AX(1,1),'Fontsize',fontz,'FontWeight','b');
set(AX(1,2),'Fontsize',fontz,'FontWeight','b');
set(gca,'layer','top'); box on; AXX = gca; AXX.XColor = 'black'; AXX.LineWidth = 3; set(gca,'fontsize',fontz);
th=rotateticklabel(AX(1,1),90); 
set(th,'Fontsize',fontz,'FontWeight','b');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
rn_1=nancorrcoef(V_max_F,L_max_F);            rn1=round(rn_1,2);
text(fecha(end-5),2.05,['r = ',num2str(rn1)],'Fontsize',fontz,'FontWeight','b');
text(fecha(end)+50,2*0.22,['Yucatan'],'Fontsize',fontz-5,'FontWeight','b','Rotation',0)
text(fecha(end)+50,2*1.18,['Cuba'],'Fontsize',fontz-5,'FontWeight','b','Rotation',0)
grid on
text(fecha(2),2.05,'a)','fontsize',fontz,'FontWeight','b')

% name1=['GRL_FIG2_a'];
% savefig([name1,'.fig']);
% print(name1,'-dpng','-r0');


%% ========================================================================
%% Fig02_b
figure
load Position_LCEs_shedding_2012_2020;
tv_deta=datevec(time_detachment);
tv_day=datevec(time_day);
cruz=ones(length(tv_deta),1);
for jj=1:length(tv_deta);
    clearvars crux
crux= find(tv_day(:,1)==tv_deta(jj,1) & tv_day(:,2)==tv_deta(jj,2) & tv_day(:,3)==tv_deta(jj,3));
cruz(jj,1)=crux(1);
end

s1=subplot(2,1,1);
[AX, h1, h2] =plotyy(time_day,esc*V_c03_F,time_day,L_c03_F); hold on
set(AX,'NextPlot','add')
plot(AX(1),time_day(cruz),esc*V_c03_F(cruz),'MarkerSize',20,'Marker','+','LineWidth',4,'LineStyle','none','Color',[0 0 1]);
plot(AX(1),[time_day(1) time_day(end)],[esc*(0.56) esc*(0.56) ],'--k', 'LineWidth',2);
plot(AX(1),[time_day(1) time_day(end)],[esc*(0.67) esc*(0.67) ],'--k', 'LineWidth',2);
text(AX(1),time_day(1)+50,esc*0.8,'Q_{3}','Fontsize',fontz-5,'FontWeight','b');
text(AX(1),time_day(1)+50,esc*0.61,'Q_{2}','Fontsize',fontz-5,'FontWeight','b');
text(AX(1),time_day(1)+50,esc*0.4,'Q_{1}','Fontsize',fontz-5,'FontWeight','b');
set(AX(1,1),'YColor',[0.49 0.18 0.56]) ; set(h1,'LineWidth',3,'Color',[0.49 0.18 0.56]) ;
set(AX(1,2),'YColor',[1 0 1]) ; set(h2,'LineWidth',3,'Color',[1 0 1],'linestyle','-') ;
set(get(AX(1),'Ylabel'),'String',{'V_{cnt} (ms^{-1})'},'fontsize',fontz);
set(get(AX(2),'Ylabel'),'String',{'L_{cnt} (degrees)'},'fontsize',fontz);
ylim(AX(1),[esc*0.3  esc*1.1]);
ylim(AX(2),[-86.6  -85.6]);
set(AX(1), 'YTick',[esc*0.3000    esc*0.5000    esc*0.7000    esc*0.9000    esc*1.1000])
set(AX(2), 'YTick',[-86.6000  -86.3500  -86.1000  -85.8500  -85.6000]);
set(AX(1,1),'xtick',fecha);datetick(AX(1,1),'x','mmm-yy','keepticks');
set(AX(1,2),'xtick',fecha);datetick(AX(1,2),'x','mmm-yy','keepticks');
set(AX(1,1),'xticklabel',[])
set(AX(1,2),'xticklabel',[])
set(AX(1,1),'Fontsize',fontz,'FontWeight','b');
set(AX(1,2),'Fontsize',fontz,'FontWeight','b');
set(gca,'layer','top'); box on; axx = gca; axx.XColor = 'black'; axx.LineWidth = 3; set(gca,'fontsize',fontz);
th=rotateticklabel(AX(1,1),90); 
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
rn_2=nancorrcoef(V_c03_F,L_c03_F);            rn2=round(rn_2,1);
text(fecha(end-5),1.03,['r = ',num2str(rn2),'0'],'Fontsize',fontz,'FontWeight','b');
text(fecha(end)+50,esc*0.22,['Yucatan'],'Fontsize',fontz-5,'FontWeight','b','Rotation',0)
text(fecha(end)+50,esc*1.18,['Cuba'],'Fontsize',fontz-5,'FontWeight','b','Rotation',0)
grid on
text(fecha(2),1.03,'b)','fontsize',fontz,'FontWeight','b')


% name2=['GRL_FIG2_b'];
% savefig([name2,'.fig']);
% print(name2,'-dpng','-r0');


%% ========================================================================
%% Fig02_c
figure
s3=subplot(2,1,1);
[AX, h1, h2] =plotyy(time_day,Z_max_c03_F,time_day,Area_c03_F); hold on
set(AX(1,1),'YColor',[0 0 0 ]) ; set(h1,'LineWidth',3,'Color',[0 0 0]) ;
set(AX(1,2),'YColor',[0.3 .75 .93]) ; set(h2,'LineWidth',3,'Color',[0.3 .75 .93],'linestyle','-') ;
set(get(AX(1),'Ylabel'),'String',{'Z (m)'},'fontsize',fontz);
set(get(AX(2),'Ylabel'),'String',{'A (m^{2})'},'fontsize',fontz);
ylim(AX(1),[-800 -200]);
ylim(AX(2),[ 0  60000000]);
set(AX(1), 'YTick',[  -800 -600 -400 -200])
set(AX(2), 'YTick',[ 0  20000000 40000000 60000000]);
set(AX(1,1),'xtick',fecha);datetick(AX(1,1),'x','mmm-yy','keepticks');
set(AX(1,2),'xtick',fecha);datetick(AX(1,2),'x','mmm-yy','keepticks');
set(AX(1,1),'xticklabel',[])
set(AX(1,2),'xticklabel',[])
set(AX(1,1),'Fontsize',fontz,'FontWeight','b');
set(AX(1,2),'Fontsize',fontz,'FontWeight','b');
set(gca,'layer','top'); box on; AXX = gca; AXX.XColor = 'black'; AXX.LineWidth = 3; set(gca,'fontsize',fontz);
th=rotateticklabel(AX(1,1),90); 
set(th,'Fontsize',fontz,'FontWeight','b');
rn_3=nancorrcoef(Z_max_c03_F,Area_c03_F);     rn3=round(rn_3,2);
text(fecha(end-5),-260,['r = ',num2str(rn3)],'Fontsize',fontz,'FontWeight','b');
grid on
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
text(fecha(2),-260,'c)','fontsize',fontz,'FontWeight','b')


% name3=['GRL_FIG2_c'];
% savefig([name3,'.fig']);
% print(name3,'-dpng','-r0');





%% ========================================================================
%% Fig02_d (LC)
figure
subplot(2,1,1);
load Tracking_LC_2012_2020.mat;
ix_lp       = find(t>=in2 & t<=fn2);
length_loop = length_loop(ix_lp);
area_loop   = area_loop(ix_lp);
lon_loop    = lon_loop(ix_lp);
lat_loop    = lat_loop(ix_lp);

p_Q1=[11 12 14 19];
p_Q2=[1 2 3 4 5 8 10 13 15 17 18];
p_Q3=[6 7 9 16 20];


[ax, h1, h2] =plotyy(time_day,lat_loop,time_day, area_loop); hold on
set(ax,'NextPlot','add')
for a=1:2:length(cruz); 
     if a==10; text(time_day(cruz(a)-28),29.3,num2str(a),'fontsize',25);
     elseif a==12; text(time_day(cruz(a)+28),29.3,num2str(a),'fontsize',25); 
     else
   text(time_day(cruz(a)),29.3,num2str(a),'fontsize',30);
plot(ax(1),time_day(cruz),lat_loop(cruz),'MarkerSize',20,'Marker','+','LineWidth',4,'LineStyle','none','Color',[0 0 1]);
          end
     end

set(ax(1,1),'YColor',[0 0.5 0]) ; set(h1,'LineWidth',3,'Color',[0 0.5 0],'linestyle','-') ;
set(ax(1,2),'YColor',[0.5 0.5 0.5]) ; set(h2,'LineWidth',3,'Color',[0.5 0.5 0.5]) ;
set(get(ax(1),'Ylabel'),'String',{'Lat_{LC}(degrees)'},'fontsize',fontz);
set(get(ax(2),'Ylabel'),'String',{'A_{LC} (Km^{2})'},'fontsize',fontz)
set(ax(1,1),'xtick',fecha);datetick(ax(1,1),'x','mmm-yy','keepticks');
set(ax(1,2),'xtick',fecha);datetick(ax(1,2),'x','mmm-yy','keepticks');  
set(ax(1,1),'Fontsize',fontz,'FontWeight','b');
set(ax(1,2),'Fontsize',fontz,'FontWeight','b');
set(ax(1,1),'xticklabel',[])
set(ax(1,2),'xticklabel',[])
set(ax(1,1),'Ylim',[23 29]); set(ax(1,1),'ytick',[ 23  24 25 26 27 28 29]);
set(ax(1,2),'Ylim',[2.5e+05 5.5e+05]); set(ax(1,2),'ytick',[  2.5e+05 3e+05 3.5e+05 4e+05 4.5e+05 5e+05 5.5e+05]);
set(gca,'layer','top'); box on; axn = gca; axn.XColor = 'black'; axn.LineWidth = 3; set(gca,'fontsize',fontz);
th=rotateticklabel(ax(1,1),90); set(th,'fontsize',fontz,'FontWeight','b')
grid on
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
hold on     
rn_4= nancorrcoef(lat_loop,  area_loop); rn4= round(rn_4(1)*10)/10;
text(ax(1,1),fecha(end-5),28.3,['r = ',num2str(rn4),'0'], 'fontsize',fontz,'FontWeight','b')
text(fecha(2),28.3,'d)','fontsize',fontz,'FontWeight','b')

% name4=['GRL_FIG2_d'];
% savefig([name4,'.fig']);
% print(name4,'-dpng','-r0');


 
%% ========================================================================
%% Fig02_e
load EOF_YC_2012_2020.mat
figure
subplot(2,1,1)%  axes('pos', [0.1 0.15 0.80 0.8150]);
[ax, h1, h2] =plotyy(time_day,-1*PC1_F,time_day,L_c03_F); hold on
set(ax(1,1),'YColor',[0.929411768913269 0.694117665290833 0.125490203499794]) ; set(h1,'LineWidth',3,'Color',[[0.929411768913269 0.694117665290833 0.125490203499794]]) ;
set(ax(1,2),'YColor',[1 0 1 ]) ; set(h2,'LineWidth',3,'Color',[1 0 1],'linestyle','-') ;
set(get(ax(1),'Ylabel'),'String',{'Amplitude'},'fontsize',fontz);
set(get(ax(2),'Ylabel'),'String',{'L_{cnt}  (degrees)'},'fontsize',fontz);
ylim(ax(1),[-3  3]);
ylim(ax(2),[-86.6  -85.6]);
set(ax(1), 'YTick',[  -3.0000   -1.5000         0    1.5000    3.0000])
set(ax(2), 'YTick',[-86.6000  -86.3500  -86.1000  -85.8500  -85.6000]);
set(ax(1,1),'xtick',fecha);datetick(ax(1,1),'x','mmm-yy','keepticks');
set(ax(1,2),'xtick',fecha);datetick(ax(1,2),'x','mmm-yy','keepticks');  
set(ax(1,1),'Fontsize',fontz,'FontWeight','b');
set(ax(1,2),'Fontsize',fontz,'FontWeight','b');
set(gca,'layer','top'); box on; ax = gca; ax.XColor = 'black'; ax.LineWidth = 3; set(gca,'fontsize',fontz);
th=rotateticklabel(ax(1,1),90);
set(th, 'Fontsize',fontz,'FontWeight','b');
rn_5=nancorrcoef(-1*PC1_F,L_c03_F);     rn5=round(rn_5,2);
text(fecha(end-5),2.4,['r = ' num2str(rn5)], 'Fontsize',fontz,'FontWeight','b');
text(fecha(end)+50,-3.5,['Yucatan'],'Fontsize',fontz-5,'FontWeight','b','Rotation',0)
text(fecha(end)+50,3.5,['Cuba'],'Fontsize',fontz-5,'FontWeight','b','Rotation',0)
grid on
set(gcf, 'Units', 'Normalized', 'OuterPosition', [ 0 0 1 1 ]);
text(fecha(2),2.4,'e)','fontsize',fontz,'FontWeight','b')

% name5=['GRL_FIG2_e'];
% savefig([name5,'.fig']);
% print(name5,'-dpng','-r0');
