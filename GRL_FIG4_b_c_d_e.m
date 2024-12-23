close all;clear all;clc;
load Morfological_parameters_approx_2012_2020.mat

in2= datenum('10-Jul-2012 00:00:00','dd-mmm-yy   HH:MM:SS');
fn2= datenum('30-Nov-2020 00:00:00','dd-mmm-yy  HH:MM:SS');
fecha12=datenum(2012,7:2:12,01);
fecha13=datenum(2013,1:2:12,01);
fecha14=datenum(2014,1:2:12,01);
fecha15=datenum(2015,1:2:12,01);
fecha16=datenum(2016,1:2:12,01);
fecha17=datenum(2017,1:2:12,01);
fecha18=datenum(2018,1:2:12,01);
fecha19=datenum(2019,1:2:12,01);
fecha20=datenum(2020,1:2:12,01);
fecha=[ fecha12 fecha13 fecha14 fecha15 fecha16 fecha17 fecha18 fecha19 fecha20];
fontz=35;

%__________________________________________________________________________
figure
set(gca, 'pos', [0.13 0.663007683863886 0.635625 0.261992316136114])
s41=plot (time_day,W_aprox_aviso,'color',[.9 .3 .1],'LineWidth',3)
hold on
s41=plot(time_day,W_c03,'color',[0.3 0.3 0.3],'LineWidth',3)
ylabel('m','fontsize',fontz);
set(gca,'Ylim',[50000      250000])
set(gca,'ytick',[50000      100000      150000      200000      250000]);
set(gca,'fontsize',fontz);
set(gca,'xtick',fecha(1:2:end));
datetick(gca,'x','mmm-yy','keepticks');
set(gca,'xticklabel',[])
set(gca,'layer','top'); box on; axx = gca; axx.XColor = 'black'; axx.LineWidth = 3; set(gca,'fontsize',fontz);
cp0=nancorrcoef(W_aprox_aviso,W_c03); cpp0=round(cp0*100)/100
text(gca,fecha(end-6),220000,['r = ', num2str(cpp0)],'fontsize',fontz-5)
legend({'W_{aviso}','W'},'Location','NorthWest','Orientation','Horizontal','FontSize',fontz-5,'FontName','Arial','Box','off','Color','none');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
% save figure
name1='Fig4b';
savefig([name1,'.fig']);
print(name1,'-dpng','-r0');
%__________________________________________________________________________



figure
set(gca, 'pos', [0.13 0.663007683863886 0.635625 0.261992316136114])% subplot(4,3,[4 5]);
s41=plot (time_day,Area_aprox,'color',[0.3 0.75 .93],'LineWidth',3)
hold on
s41=plot(time_day,Area,'color',[0.3 0.3 0.3],'LineWidth',3)
ylabel('m^{2}','fontsize',fontz);
set(gca,'Ylim',[10000000  70000000])
set(gca,'ytick',[10000000  30000000  50000000  70000000 ]);
set(gca,'fontsize',fontz);
set(gca,'xtick',fecha(1:2:end));
datetick(gca,'x','mmm-yy','keepticks');
set(gca,'xticklabel',[])
set(gca,'layer','top'); box on; axx = gca; axx.XColor = 'black'; axx.LineWidth = 3; set(gca,'fontsize',fontz);
cp1=nancorrcoef(Area_aprox,Area'); cpp1=round(cp1*100)/100
text(gca,fecha(end-6),60000000,['r = ', num2str(cpp1)],'fontsize',fontz-5)
legend({'A_{approx}','A'},'Location','NorthWest','Orientation','Horizontal','FontSize',fontz-5,'FontName','Arial','Box','off','Color','none');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
% save figure
name1='Fig4c';
savefig([name1,'.fig']);
print(name1,'-dpng','-r0');
%__________________________________________________________________________



figure
set(gca, 'pos', [0.13 0.663007683863886 0.635625 0.261992316136114])
s41=plot (time_day,L_aprox ,'color',[1 0 1],'LineWidth',3)
hold on
s41=plot(time_day,L_cnt,'color',[0.3 0.3 0.3],'LineWidth',3)
ylabel('degrees','fontsize',fontz);
set(gca,'Ylim',[-86.4000 -85.6000])
set(gca,'ytick',[-86.4000  -86.2000  -86.0000  -85.8000  -85.6000]);
set(gca,'fontsize',fontz);
set(gca,'xtick',fecha(1:2:end));
datetick(gca,'x','mmm-yy','keepticks');
set(gca,'xticklabel',[])
set(gca,'layer','top'); box on; axx = gca; axx.XColor = 'black'; axx.LineWidth = 3; set(gca,'fontsize',fontz);
cp4=nancorrcoef(L_aprox,L_cnt'); cpp4=round(cp4*100)/100
text(gca,fecha(end-6),-85.74,['r = ', num2str(cpp4)],'fontsize',fontz-5)
legend({'L_{approx}','L_{cnt}'},'Location','NorthWest','Orientation','Horizontal','FontSize',fontz-5,'FontName','Arial','Box','off','Color','none');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
% save figure
name1='Fig4d';
savefig([name1,'.fig']);
print(name1,'-dpng','-r0');
%__________________________________________________________________________



figure
set(gca, 'pos', [0.13 0.663007683863886 0.635625 0.261992316136114])
% V_aprox = -0.66*L - 56; %% obtenemos lon(Hmax)
s41=plot (time_day,V_aprox,'color',[0.49 .18 .56],'LineWidth',3)
hold on
s41=plot(time_day,V_cnt,'color',[0.3 0.3 0.3],'LineWidth',3)
ylabel('ms^{-1}','fontsize',fontz);
set(gca,'Ylim',[0.4 1])
set(gca,'ytick',[0.4  0.6  0.8  1]);
set(gca,'fontsize',fontz);
set(gca,'xtick',fecha(1:2:end));
datetick(gca,'x','mmm-yy','keepticks');
th=rotateticklabel(gca,90); set(th,'fontsize',fontz);
set(gca,'layer','top'); box on; axx = gca; axx.XColor = 'black'; axx.LineWidth = 3; set(gca,'fontsize',fontz);
cp5=nancorrcoef(V_aprox,V_cnt'); cpp5=round(cp5*100)/100
text(gca,fecha(end-6),0.90,['r = ', num2str(cpp5)],'fontsize',fontz-5)
legend({'V_{approx}','V_{cnt}'},'Location','NorthWest','Orientation','Horizontal','FontSize',fontz-5,'FontName','Arial','Box','off','Color','none');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
% save figure
name1='Fig4e';
savefig([name1,'.fig']);
print(name1,'-dpng','-r0');
%__________________________________________________________________________



