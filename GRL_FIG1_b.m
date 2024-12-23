close all; clear all ; clc;
%% FIGURE PROPERTIES
sz=35;
fontz=sz;
esc         =  [-.5:.1:1.5];
cmin    = 1;
cmax    = 1.2;
rangeD  = [cmin:0.3:cmax];


%% LON / LAT / MOORING
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
lona17=mean(lona17,2);    
%% nombres de los anclajes
yuc = {'Y1 ', 'Y2 ', 'Y3 ', 'Y4 ', 'Y5 ', 'Yi5', 'Y6 ', 'Yi6',...
    'Y7 ', 'Y8 ', 'Yi8', 'Y9 ', 'Yi9', 'Y10'};


load yuc_d_CNKvelOI_2012a2021_51_daily
Vmap_cnk_W=Veldy;
tt=ttd;

%% PARAMETERS
res =.03; xlon=-86.8:res:-84.9100;
profs=10:20:2090; profs=-profs;
nxb=length(xlon);

%% CONTOUR / SKETCH
clearvars X Z
load yucsec3 ; 
[X,Z]=meshgrid(xlon,profs); 
[mX,nX]=size(X);
xv=bp(:,1); yv=bp(:,3); xv = [xv ; xv(1)]; yv = [yv ; 0];
in = inpolygon(X(:),Z(:),xv,yv); ind=find(in>.4);
mask=nan*ones(size(X)); dum=mask(:); dum(ind)=ones(size(ind));
mask(:)=dum;
Velpro     = mean(Veldy');
Velstd     = std(Veldy');
Mz         = length(tt);

cmin    = 0.3;
cmax    = 1.2;
rangeD  = [cmin:0.3:cmax];
    

figure;
subplot(2,2,[2 4])
mask(celda)= Velpro;
[c,hContour] =contour(xlon,profs,mask,rangeD,'linewidth',3);
hold on
[coor_xH,h]=contourf(xlon,profs,mask,[0.3 0.3],'color',[0 0 0],'linewidth',4);  
coor_x=coor_xH(1,:);
coor_H=coor_xH(2,:);
hold on
ind=find(coor_H>-10);
coor_H(ind)=[];
coor_x(ind)=[];
coor_x=[coor_x(1) coor_x  coor_x(end) coor_x(1)];
coor_H=[-10       coor_H   -10         -10  ];
H=cmocean('ice',50);
colormap(flipdim(H,1))
caxis([cmin cmax]);
plot(coor_x,coor_H,'color',[0 0 0],'linewidth',4);


%% CONVERT DEGREES TO KM
dista  = [coor_x+coor_x(1)];
metros = dista*111.111*1000;

[geom]=poligonos([coor_x],[ coor_H]);
[geom_A]=poligonos([metros],[ coor_H]);
%%
%% HORIZONTAL LINE/ W / SKETCH
hLC1 = annotation('arrow');   hLC1.Parent = gca;  hLC1.X = [-86.5222  -85.4496];  hLC1.Y = [ -14 -14];         
hLC2 = annotation('arrow');   hLC2.Parent = gca;  hLC2.X = [-85.4496 -86.5222];  hLC2.Y = [-14  -14 ]; 
hLC1.LineWidth  = 4; hLC1.HeadWidth  = 30; hLC1.HeadLength = 30; hLC1.LineStyle='-';hLC1.Color=[0.90 0.30 0.10];
hLC2.LineWidth  = 4; hLC2.HeadWidth  = 30; hLC2.HeadLength = 30; hLC2.LineStyle='-';hLC2.Color=[0.90 0.30 0.10];


%% VERTICAL LINE/ Zcnt / SKETCH
hZ1 = annotation('arrow');   hZ1.Parent = gca;  hZ1.X = [-86.0167 -86.0167];  hZ1.Y = [-10 -430];         
hZ2 = annotation('arrow');   hZ2.Parent = gca;  hZ2.X = [-86.0167 -86.0167];  hZ2.Y = [ -430 -10];         
hZ1.LineWidth  = 4; hZ1.HeadWidth  = 30; hZ1.HeadLength = 30; hZ1.LineStyle='--'; hZ1.Color=[0 0 0];
hZ2.LineWidth  = 4; hZ2.HeadWidth  = 30; hZ2.HeadLength = 30; hZ2.LineStyle='--'; hZ2.Color=[0 0 0];


%% DOTS / SKETCH
% cnt
plot(geom(2),geom(3),'MarkerSize',84,'Marker','.','LineStyle','none','Color',[0.5 0.2 0.6],'linewidth',2);%Vcnt
plot(geom(2),geom(3),'MarkerSize',44,'Marker','.','LineStyle','none','Color',[1 0 1],'linewidth',2); %Lcnt

%max
plot(-86.14,-10,'MarkerSize',84,'Marker','.','LineStyle','none','Color',[0 0 1],'linewidth',2);      %Lmax
plot(-86.14,-10,'MarkerSize',44,'Marker','.','LineStyle','none','Color',[ 0 .5 .8],'linewidth',2);

%Zcnt
plot(-86.0167,-431.8990,'MarkerSize',80,'Marker','.','LineStyle','none','Color',[0 0 0],'linewidth',2);%Zcnt
    

%% TEXT/ SKETCH
t00=text(-85.55,-250,'0.3 ms^{-1}','FontWeight','bold','fontsize',fontz); set(t00,  'Rotation',77) 
t01=text(-86.3,-350,'0.3 ms^{-1}','FontWeight','bold','fontsize',fontz); set(t01,  'Rotation',100) 
t02=text(-86.35,-30,'L_{max}','FontWeight','bold','fontsize',fontz,'color',[0 .5 .8]);
t03=text(-86.26,-60,'V_{max}','FontWeight','bold','fontsize',fontz,'color',[0 0 1]);
t04=text(-85.9,-170,'V_{cnt}','FontWeight','bold','fontsize',fontz,'color',[0.49 0.18 0.56]);
t05=text(-86.2,-170,'L_{cnt}','FontWeight','bold','fontsize',fontz,'color',[1 0 1]);
t06=text(-85.93,-430,'Z','FontWeight','bold','fontsize',fontz,'color',[0 0 0]);
t07=text(-85.8,-100,'A','FontWeight','bold','fontsize',fontz,'color',[0.30 0.75 0.90]);
t08=text(-85.4,-30,'W','FontWeight','bold','fontsize',fontz,'color',[ 0.90 0.3 0.1]);



%%  % MOORINGS
for yi = 1:1:length(yuc);
    if yi==2;text(lona17(yi)-0.15,13,yuc{yi},'FontWeight','bold','fontsize',22);
    else;text(lona17(yi)-.05,13,yuc{yi},'FontWeight','bold','fontsize',22);
    end;end
plot(lona17,0,'o','Markersize',15,'MarkerEdgeColor',[0.0 0.5 0.0],'MarkerFaceColor',[0.0 0.5 0.0]);
plot(lona17,0,'.','Markersize',12,'MarkerEdgeColor',[0 0 0 ],'MarkerFaceColor',[0 0 0]);

%% TEXT
ylim([-450 0])
ax = gca; ax.XColor = 'black'; ax.LineWidth = 3;
set(gca,'FontWeight','bold','fontsize',fontz);
set(gca,'fontweight','bold','fontsize',sz);
ylabel ('Depth (m)','fontweight','bold','fontsize',sz);
xlabel ('Longitude (degrees)','fontweight','bold','fontsize',sz);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [ 0 0 1 1 ]);

%% SAVE FIGURE
name1='GRL_FIG1_b';
savefig([name1,'.fig']);
print(name1,'-dpng','-r0');

