clear all;close all;clc
% load Morfological_parameters_2012_2020
load Morfological_parameters_2012_2020_R
fontz=34;

%% Data points representing values sampled every 20 days
dt=20;
points=round(length(time_day)/20);

for jj=1:points;
asd(jj) = time_day(jj*dt);
pos(jj) = find(time_day==asd(jj))
end


figure
subplot(1,2,1)
scatter(L_c03_R(pos),V_c03_R(pos),50, ...
    'MarkerFaceColor',[0.501960784313725 0.501960784313725 0.501960784313725],...
    'MarkerEdgeColor',[0.149019607843137 0.149019607843137 0.149019607843137],'linewidth',1.5);
hold on
set(gca,'fontsize',fontz);
xlabel('L_{cnt} (degrees)','fontsize',fontz,'FontWeight','bold');
ylabel('V_{cnt} (ms^{-1})','fontsize',fontz,'FontWeight','bold');

axis square
set(gca,'layer','top'); box on; axx = gca; axx.XColor = 'black'; axx.LineWidth = 3; set(gca,'fontsize',fontz);
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
ylim([0.2 0.9])
yticks([ 0.2000   0.3000  0.4000    0.5000     0.6000      0.7000       0.8000    0.9000]);

% Data
x=L_c03_R(pos);
y=V_c03_R(pos);

% Fit line 
p= polyfit(x,y,1);
m = p(1); %slope
b = p(2); %Intercept

% Evaluate the fitted line
y_fit = polyval (p,x); % Fitted y values

% plot fitted line
plot(x,y_fit,'r-','LineWidth',1.5);

% Display the line equation
equation = sprintf ('y= %.2fx  %.2f',m,b); % Format the equation
text(-85.9,0.80,equation,'Fontsize',30,'Color','k','FontWeight','bold');


%Calculate R-squared 
SS_res = sum((y - y_fit).^2); % Residual sum of squares 
SS_tot = sum((y - mean(y)).^2); % Total sum of squares 
R_squared = 1 - (SS_res / SS_tot); % R-squared  
mdl = fitlm(L_c03_R(pos),V_c03_R(pos))
text (-86.15,0.30,['R^{2} = ',num2str(round(R_squared*100)/100)],'fontsize',30,'FontWeight','bold');



