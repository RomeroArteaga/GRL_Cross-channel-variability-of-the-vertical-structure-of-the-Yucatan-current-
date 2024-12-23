close all;clear all;clc;

load Morfological_parameters_2012_2020_F.mat
% load Position_LCEs_shedding_2012_2020
fontz=32;
sz= fontz;

%% /Longitud posiciones horizontales donde se encuentran los anclajes (dentro del rango)
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



%% =========================================================================
%% QUARTILES
dts_m = time_day;
A_m   = V_max_F;
B_m   = L_max_F;

dts_c = time_day;
A_c   = V_c03_F;
B_c   = L_c03_F;

%% velmax
Q_m = quantile(A_m,[0 0.25 0.5 0.75 1]);
q0_m=find(A_m<=Q_m(1));                  % min
q1_m=find(A_m>Q_m(1) & A_m<=Q_m(2));    %  q0 a q1 %25
q2_m=find(A_m>Q_m(2) & A_m<=Q_m(3));     %  q1 a q2 %25\
q3_m=find(A_m>Q_m(3) & A_m<=Q_m(4));     %  q2 a q3 %25/ %total %50
q4_m=find(A_m>Q_m(4) & A_m<=Q_m(5));     %  q3 a q4 %75
q5_m=find(A_m>=Q_m(5));                  % max

%% v_centroid 
Q_c = quantile(A_c,[0 0.25 0.5 0.75 1]);
q0_c=find(A_c<=Q_c(1));                  % min
q1_c=find(A_c>Q_c(1) & A_c<=Q_c(2));    %  q0 a q1 %25
q2_c=find(A_c>Q_c(2) & A_c<=Q_c(3));     %  q1 a q2 %25\
q3_c=find(A_c>Q_c(3) & A_c<=Q_c(4));     %  q2 a q3 %25/ %total %50
q4_c=find(A_c>Q_c(4) & A_c<=Q_c(5));     %  q3 a q4 %75
q5_c=find(A_c>=Q_c(5));                  % max


% %% TABLE QUARTILES
T_cvel=[V_c03_F(min(q0_c)),V_c03_F(max(q1_c)),V_c03_F(min([q2_c ;q3_c])),V_c03_F(max([q2_c; q3_c])),V_c03_F(min(q4_c)),V_c03_F(max(q5_c))];
T_maxvel=[V_max_F(min(q0_m)),V_max_F(max(q1_m)),V_max_F(min([q2_m ;q3_m])),V_max_F(max([q2_m; q3_m])),V_max_F(min(q4_m)),V_max_F(max(q5_m))];
disp('           MIN    Q1   min(Q2)  max(Q2)   Q3  MAX ')
Datos_GRL=[round(T_cvel*100)/100 ;round(T_maxvel*100)/100]
%% quartil for the parameters
q25_Vnc=nanmean(V_c03_F(q1_c));
q25_Lnc=nanmean(L_c03_F(q1_c));
q25_Hnc=nanmean(Z_max_c03_F(q1_c));
q25_Anc=nanmean(Area_c03_F(q1_c));
q25_Vmx=nanmean(V_max_F(q1_c));
q25_Lmx=nanmean(L_max_F(q1_c));

q50_Vnc=nanmean(V_c03_F([q2_c ; q3_c]));
q50_Lnc=nanmean(L_c03_F([q2_c; q3_c]));
q50_Hnc=nanmean(Z_max_c03_F([q2_c; q3_c]));
q50_Anc=nanmean(Area_c03_F([q2_c ;q3_c]));
q50_Vmx=nanmean(V_max_F([q2_c; q3_c]));
q50_Lmx=nanmean(L_max_F([q2_c; q3_c]));

q75_Vnc=nanmean(V_c03_F(q4_c));
q75_Lnc=nanmean(L_c03_F(q4_c));
q75_Hnc=nanmean(Z_max_c03_F(q4_c));
q75_Anc=nanmean(Area_c03_F(q4_c));
q75_Vmx=nanmean(V_max_F(q4_c));
q75_Lmx=nanmean(L_max_F(q4_c));



%% ========================================================================
%% HISTOGRAMAS
figure
subplot(3,3,[1 3 4 5 6])
ym=400;

histogram(A_c,'EdgeColor',[1 0 0],'FaceColor',[0.49 0.18 0.56],'BinMethod','auto','LineWidth',2); hold on
histogram(A_m,'EdgeColor',[1 1 1 ],'FaceColor',[0 0 1],'BinMethod','auto','LineWidth',2);
xlim([0.20 2.2])
ylim([0 ym])
ylabel('Number of days','FontWeight','bold','fontsize',fontz);
xlabel('Velocity (ms^{-1})','color',[0 0  0],'FontWeight','bold','fontsize',fontz);
t1=text(2.35,155,'Density','FontWeight','bold','fontsize',fontz,'Rotation',90);

plot([Q_c(2) Q_c(2)],[0 ym],'--k');
plot([Q_c(4) Q_c(4)],[0 ym],'--k');
text(Q_c(2),ym+25,'Q_1','FontWeight','bold','fontsize',fontz)
text(Q_c(3),ym+25,'Q_2','FontWeight','bold','fontsize',fontz)
text(Q_c(4),ym+25,'Q_3','FontWeight','bold','fontsize',fontz)

plot([Q_m(2) Q_m(2)],[0 ym],'--k');
plot([Q_m(4) Q_m(4)],[0 ym],'--k');
text(Q_m(2),ym+25,'Q_1','FontWeight','bold','fontsize',fontz)
text(Q_m(3),ym+25,'Q_2','FontWeight','bold','fontsize',fontz)
text(Q_m(4),ym+25,'Q_3','FontWeight','bold','fontsize',fontz)

set(gca,'layer','top'); box on; ax = gca; ax.XColor = 'black'; ax.LineWidth = 3; set(gca,'fontsize',fontz);
set(gca,'FontWeight','bold','fontsize',fontz);

%% ========================================================================
%% PDFs

%% CENTROID
fontz= 20;
axes('pos', [0.173958333333333 0.71525753158406  0.0828125 0.187560738581146]);

cmin=0;
cmax=10;
color_shift=cmin:1:cmax
c = jet(length(color_shift)-1);
c(1,:)=[1 1 1];


dat2_c=[B_c A_c ];
[bandwidth_c,density_c,X_c,Y_c]=kde2d(dat2_c);
pcolor(X_c,Y_c,density_c);shading interp

ylim([0.2 1])
xlim([-86.5 -85.5]);
xticks(-86.5:0.5:-85.5)
hold on
caxis([cmin cmax]);
colormap(c)
set(gca,'layer','top'); box on; ax = gca; ax.XColor = 'black'; ax.LineWidth = 3; set(gca,'fontsize',fontz);
set(gca,'FontWeight','bold','fontsize',fontz);
ylabel('V_{cnt} (ms^{-1})','FontWeight','bold','FontSize',fontz,'color',[0.49 0.18 0.56])
set(gca,'FontWeight','bold','fontsize',fontz);
set(gca,'layer','top'); box on; ax = gca; ax.XColor = 'black'; ax.LineWidth = 3; set(gca,'fontsize',fontz);
xlabel('Longitude','FontWeight','bold','fontsize',fontz);

for jj=3:3:10
    plot(lona17(jj), 0.22 ,'MarkerFaceColor',[0.0 0.5 0.0],'MarkerSize',18,'Marker','o','LineStyle','none','Color',[0.0 0.5 0.0]);
    plot(lona17(jj),0.22,'MarkerFaceColor',[0 0 0],'MarkerSize',18,'Marker','.','LineStyle','none','Color',[0 0 0]);
    hte=text (lona17(jj),.265,yuc(jj),'FontWeight','bold','fontsize',fontz-5);
    set(hte,'rotation',90)
end


%% MAXVEL
axes('pos', [0.7875 0.71525753158406 0.0828125 0.187560738581146]);
dat2_m=[B_m A_m ];
[bandwidth_m,density_m,X_m,Y_m]=kde2d(dat2_m);
pcolor(X_m,Y_m,density_m);shading interp
ylim([0.6 2.2]) ;
yticks([0.6:0.2: 2.2]);
yticklabels({'0.6','0.8','1','1.2' ,'1.4','1.6','1.8','2','2.2'})
xlim([-86.5 -85.5]);
xticks(-86.5:0.5:-85.5)
hold on
caxis([cmin cmax]);
colormap(c)
set(gca,'layer','top'); box on; ax = gca; ax.XColor = 'black'; ax.LineWidth = 3; set(gca,'fontsize',fontz);
set(gca,'FontWeight','bold','fontsize',fontz);
ylabel('V_{max} (ms^{-1})','FontWeight','bold','FontSize',fontz,'Color',[0 0 1])
xlabel('Longitude','FontWeight','bold','fontsize',fontz);
% yticklabels([])

for jj=3:3:10
    plot(lona17(jj), 0.62 ,'MarkerFaceColor',[0.0 0.5 0.0],'MarkerSize',18,'Marker','o','LineStyle','none','Color',[0.0 0.5 0.0]);
    plot(lona17(jj),0.62,'MarkerFaceColor',[0 0 0],'MarkerSize',18,'Marker','.','LineStyle','none','Color',[0 0 0]);
    hte=text (lona17(jj),.70,yuc(jj),'FontWeight','bold','fontsize',fontz-5);
    set(hte,'rotation',90)
end


%% colorbar
[nc,hc]=colorb('v',[cmin cmax],'',[],color_shift,fontz+5,2);
set(hc,'position',[0.92 0.41 0.018928571428571 0.51])
set(gca,'FontWeight','bold','fontsize',fontz);
set(gca,'FontWeight','bold','fontsize',fontz);
set(gca,'layer','top'); box on; ax = gca; ax.XColor = 'black'; ax.LineWidth = 3; set(gca,'fontsize',fontz);

% save Figure
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
name1='GRL_FIG4_a';
savefig([name1,'.fig']);
print(name1,'-dpng','-r0');
