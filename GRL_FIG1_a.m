clear all; clc; close all
fontz  = 32;
load BATI100_FINAL.mat

%% POSICION ANCLAJES
LAT_Y  = [[21, 30, 228]; [21, 32, 312]; [21, 33, 244]; [21, 34, 227]; [21, 36, 082]; ...
    [21, 39, 855]; [21, 39, 406]; [21, 41, 241]; [21, 44, 348]; [21,48, 071]];

LON_Y  = [[-86, 44, 137];[-86, 30, 341]; [-86, 27, 050]; [-86, 21, 319];[-86, 13, 787];
    [-85, 59, 106];[-85, 42, 491]; [-85, 31, 115]; [-85, 17, 793];[-84, 58, 513]];

lata17 = [LAT_Y(:,1) + (1/60).*LAT_Y(:,2)   ]';  
lona17 = [LON_Y(:,1) - (1/60).*LON_Y(:,2)   ]';  
JJ     = length(lona17);

%% ==========================YUCATAN CHANNEL =========================
figure;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
axes('position',[.1,.1,.9,.85])
m_proj('miller','long',[-89 -83],'lat',[19 25]);
m_gshhs_i('color','k','linewidth',3);
m_gshhs_i('patch',[0.7 0.7 0.7]);
m_gshhs_h('patch',[0.7 0.7 0.7]);
m_grid('box','fancy','linestyle','none','fontsize',fontz);% tamano de lon lat
hold on
[Xmap,Ymap]=m_ll2xy(lona17,lata17);


%% BATHYMETRY
v     = [-500 -1000 -1500 -2000 -2500 -3000 -3500 -4000 -4500 -5000 ];
[C,h] = m_contourf(LON100,LAT100,Z100,v); hold on
colormap(m_colmap('blues'));
caxis([-5000 -500 ]);
brighten(.1);
cbat=[0 0 0];
m_text(-88.1,24.3,'1000','FontWeight','bold','fontsize',fontz-2,'FontName','Arial','rotation',0,'color',[cbat]);
m_text(-88.1,24.6,'2000','FontWeight','bold','fontsize',fontz-2,'FontName','Arial','rotation',0,'color',[cbat]);
m_text(-85,22.5,'3000','FontWeight','bold','fontsize',fontz-2,'FontName','Arial','rotation',25,'color',[cbat]);
m_text(-86,23.5,'4000','FontWeight','bold','fontsize',fontz-2,'FontName','Arial','rotation',45,'color',[cbat]);
m_text(-85,21,'5000','FontWeight','bold','fontsize',fontz-2,'FontName','Arial','rotation',45,'color',[cbat]);


%% TITLE('Location the moorings in Yucatan') 
%==================================== MOORING  ===========================
for i=1:JJ
    plot(Xmap(1,i),Ymap(1,i),'o','markersize',15,'MarkerEdgeColor',[0.0 0.5 0.0],'MarkerFaceColor',[0.0 0.5 0.0]);
    plot(Xmap(1,i),Ymap(1,i),'.','markersize',12,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor',[0 0 0]);
    hold on 
end

%% TEXTO ('Location the moorings in Yucatan')
tn1=text(Xmap(1,1)-.03,Ymap(1,1)-0.005,'Yucatan','fontsize',fontz,'fontw','bold','color',[ 1 1 1]);
tn2=text(Xmap(1,end)+.020,Ymap(1,end)+.015,'Cuba','fontsize',fontz,'fontw','bold','color',[1 1 1]);
tn3=text(Xmap(1,5)+.005,Ymap(1,5)+0.052,'Gulf of Mexico','fontsize',fontz,'fontw','bold','color',[1 1 1]);
tn3=text(Xmap(1,5)+.007,Ymap(1,5)-0.02,'Caribbean Sea','fontsize',fontz,'fontw','bold','color',[1 1 1]);
plot(Xmap(1,1)-0.035,Ymap(1,1)-0.008,'o','markersize',15,'MarkerEdgeColor',[0.0 0.5 0.0],'MarkerFaceColor',[0.0 0.5 0.0]);
plot(Xmap(1,1)-0.035,Ymap(1,1)-0.008,'.','markersize',15,'MarkerEdgeColor',[0 0 0],'MarkerFaceColor',[0 0 0]);
text(Xmap(1,1)-0.032,Ymap(1,1)-0.008,'Instrumented mooring','fontsize',20,'fontw','bold','color',[1 1 1]);

%% NORTHARROW
m_northarrow(-83.35,24.6,.25,'type',2);

%% BOX
m_grid('box','fancy','linestyle','none','fontsize',fontz);% tamano de lon lat
xlabel('Longitude (degrees)','fontsize',fontz,'FontWeight','bold');
ylabel('Latitude (degrees)','fontsize',fontz,'FontWeight','bold');
set(gca,'fontsize',fontz,'FontWeight','bold');
%==========================================================================
%% MAP OF MEXICO
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
fontz=25;
axes('Position',[.37, .53, .12, .2]);
m_proj('miller','long',[-100 -82],'lat',[18 29]);
m_gshhs_i('color','k');
m_gshhs_i('patch',[0.7 0.7 0.7]);
m_gshhs_h('patch',[0.7 0.7 0.7]);
m_grid('box','fancy','linestyle','none','fontsize',fontz);% tamano de lon lat
hold on

%% BATHYMETRY
vx     = [0 -20 -500 -1000 -2000 -3000 -5000 -10000];
[Cx,hx] = m_contour(LON100,LAT100,Z100,vx);


%% TEXTO
m_text(-93.6,26.5,'Gulf','rotation',0,'fontName','Arial','fontsize',fontz,'fontw','bold','Color',[0 0 0])
m_text(-92.8,25,'of','rotation',0,'fontName','Arial','fontsize',fontz,'fontw','bold','Color',[0 0 0])
m_text(-94.7,23.8,'Mexico','rotation',0,'fontName','Arial','fontsize',fontz,'fontw','bold','Color',[0 0 0])

%% BOX
bndry_lon=[ -87 -84 ;-87 -84; -87 -87; -84 -84];
bndry_lat=[ 20.5 20.5  ; 22.5 22.5 ;   20.5 22.5;  20.5 22.5];

m_line(bndry_lon,bndry_lat,'linewi',3,'color',[0 0 0]); % zoom cuadrado del area de estudio
m_grid('box','fancy','linestyle','none','fontsize',fontz);% tamano de lon lat

%% SAVE FIGURE
name1='FIG01_area_GRL';
savefig([name1,'.fig']);
print(name1,'-dpng','-r0');




