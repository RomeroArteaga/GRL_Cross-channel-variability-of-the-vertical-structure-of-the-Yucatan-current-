
%%=========================================================================
close all;clear all;clc
sz=32;
%% LON / LAT/ MOORING
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
%% NAME / MOORING
yuc = {'Y1 ', 'Y2 ', 'Y3 ', 'Y4 ', 'Y5 ', 'Yi5', 'Y6 ', 'Yi6',...
    'Y7 ', 'Y8 ', 'Yi8', 'Y9 ', 'Yi9', 'Y10'};


%%=========================================================================
%% /load files
load Morfological_parameters_2012_2020_R;
load yuc_d_CNKvelOI_2012a2021_51_daily.mat;
Vmap_cnk_W = Veldy;
tt         = ttd;

%%=========================================================================
%% PARAMETERS
res        = 0.03; 
xlon       = -86.8:res:-84.9100;
profs      = 10:20:2090; 
profs      = -profs;
nxb        = length(xlon);

clearvars X Z
load yucsec3 ; 
[X,Z]      = meshgrid(xlon,profs); 
[mX,nX]    = size(X);
xv=bp(:,1); yv=bp(:,3); xv = [xv ; xv(1)]; yv = [yv ; 0];
in = inpolygon(X(:),Z(:),xv,yv); ind=find(in>.4);
mask=nan*ones(size(X)); dum=mask(:); dum(ind)=ones(size(ind));
mask(:)=dum;

%%=========================================================================
%% MEAN/ VARIANCE
Velpro     = mean(Veldy');
Velvaz     = var(Veldy');
Mz         = length(tt);

%%=========================================================================
%% FIGURE: MEAN + centroid
cmin       = -0.4;
cmax       = 1.4;
rangeD     = [cmin:0.1:cmax];

figure;
set(gca, 'pos', [0.117708333333333 0.11 0.334659090909091 0.815])
mask(celda)= Velpro;
contourf(xlon,profs,mask,rangeD,'linewidth',1);hold on
[c1,c2]    = contour(xlon,profs,mask,[0.3 0.3],'k','linewidth',4);  set(c2,'linewidth',4,'Color',[0 0 0]);
[c0,b0]    = contour(xlon,profs,mask,[0 0],'k-','linewidth',4);  set(b0,'linewidth',4,'Color',[0.8 0.8 0.8]);
H          = cmocean('ice',length(rangeD)-1);
H          = flipdim(H,1);
colormap(H)
caxis([cmin cmax]);
% TEXT / YUC
for yi = 1:1:length(yuc);
    if yi==2;text(lona17(yi)-0.15,50,yuc{yi},'FontWeight','bold','fontsize',22);
    else;text(lona17(yi)-.05,50,yuc{yi},'FontWeight','bold','fontsize',22);
    end;end
    
    
% MORRING/ YUC
plot(lona17,0,'o','Markersize',15,'MarkerEdgeColor',[0.0 0.5 0.0],'MarkerFaceColor',[0.0 0.5 0.0]);
plot(lona17,0,'.','Markersize',12,'MarkerEdgeColor',[0 0 0 ],'MarkerFaceColor',[0 0 0]);

% centroid
plot(L_c03_R,Z_c03_R,'MarkerSize',10,'Marker','.','LineStyle','none','Color',[0.5 0.1 0.8],'linewidth',1);

% line/ YUC
plot(bp(:,1),bp(:,3),'Color',[0 0 0],'linewidth',2);

% limites
xlim([-86.5 -85.4])
ylim([-2050 -50])
ylabel ('Depth (m)','fontweight','bold','fontsize',sz);
xlabel ('Longitude (Degree)','fontweight','bold','fontsize',sz);
ax = gca; ax.XColor = 'black'; ax.LineWidth = 3;

%colorbar
[nc,hc]=colorb('v',[cmin cmax],'',[],rangeD,sz,2);
set(hc,'position',[0.47 0.11 0.02 0.81])
text(-84.80, -2193,'ms^{-1}','fontweight','bold','fontsize',sz);

set(gca,'fontweight','bold','fontsize',sz);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [ 0 0 1 1 ]);
axis tight

% % SAVE FIGURE
% name1='GRL_FIG1_c';
% savefig([name1,'.fig']);
% print(name1,'-dpng','-r0');


%% FIGURE: VARIANCE + centroid

cmin    = 0.0;
cmax    = 0.12;
rangeD  = [cmin:0.01:cmax];

figure
set(gca, 'pos', [0.117708333333333 0.11 0.334659090909091 0.815])
mask(celda) = Velvaz ;
contourf(xlon,profs,mask,rangeD,'linewidth',1);hold on
mp=cmocean('matter',(length(rangeD)-1));
colormap(mp)
[c0,b0]=contour(xlon,profs,mask,[0 0],'k-','linewidth',4);  set(b0,'linewidth',4,'Color',[0.8 0.8 0.8]);
caxis([cmin cmax]);


% text YUC
for yi = 1:1:length(yuc);
    if yi==2;text(lona17(yi)-0.15,50,yuc{yi},'FontWeight','bold','fontsize',22);
    else;text(lona17(yi)-.05,50,yuc{yi},'FontWeight','bold','fontsize',22);
    end;end
    

% MORRING/ YUC
plot(lona17,0,'o','Markersize',15,'MarkerEdgeColor',[0.0 0.5 0.0],'MarkerFaceColor',[0.0 0.5 0.0]);
plot(lona17,0,'.','Markersize',12,'MarkerEdgeColor',[0 0 0 ],'MarkerFaceColor',[0 0 0]);

% centroid
plot(L_c03_R,Z_c03_R,'MarkerSize',10,'Marker','.','LineStyle','none','Color',[0.5 0.1 0.8],'linewidth',1);

% line/ YUC
plot(bp(:,1),bp(:,3),'Color',[0 0 0],'linewidth',2);

% limites
xlim([-86.5 -85.4])
ylim([-2050 -50])
ylabel ('Depth (m)','fontweight','bold','fontsize',sz);
xlabel ('Longitude (Degree)','fontweight','bold','fontsize',sz);
ax = gca; ax.XColor = 'black'; ax.LineWidth = 3;
    
    
%colorbar
[nc,hc]=colorb('v',[cmin cmax],'',[],rangeD,sz,2);
set(hc,'position',[0.47 0.11 0.02 0.81])

text(-84.80, -2193,'ms^{-1}','fontweight','bold','fontsize',sz);
set(gca,'fontweight','bold','fontsize',sz);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [ 0 0 1 1 ]);
axis tight

% % SAVE FIGURE
% name1='GRL_FIG1_d';
% savefig([name1,'.fig']);
% print(name1,'-dpng','-r0');

