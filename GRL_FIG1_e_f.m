for jj=1; figure('color', 'w');
    
    %% modos
    %     subplot(2,2,[1 3])
    figure
    axes('pos', [0.117708333333333 0.11 0.334659090909091 0.815]);
    eval(['contourf(X,Z,-1*Um',num2str(jj),',rangeD);'])
    colormap(cmocean('balance',50))
    hold on
    
    
    % text YUC
    for yi = 1:1:length(yuc);
        if yi==2;text(lona17(yi)-0.15,50,yuc{yi},'FontWeight','bold','fontsize',22);
        else;text(lona17(yi)-.05,50,yuc{yi},'FontWeight','bold','fontsize',22);
        end;end
    
    
    % puntos YUC
    plot(lona17,0,'o','Markersize',15,'MarkerEdgeColor',[0.0 0.5 0.0],'MarkerFaceColor',[0.0 0.5 0.0]);
    plot(lona17,0,'.','Markersize',12,'MarkerEdgeColor',[0 0 0 ],'MarkerFaceColor',[0 0 0]);
    plot(bp(:,1),bp(:,3),'Color',[0 0 0],'linewidth',2);ylim([-2100, 0])
    
    %text depth/longitud/Modo
    text(-86.7, -2000,['EOF', num2str(jj),' ',num2str(round(VE(jj)*100)/100 ),'%'],'Fontsize',fontz,'fontweight','bold');
    ylabel ('Depth (m)','fontweight','bold','fontsize',sz);
    xlabel ('Longitude (Degree)','fontweight','bold','fontsize',sz);
    
    
    % limites
    xlim([-86.5 -85.4])
    ylim([-2050 -50])
    ax = gca; ax.XColor = 'black'; ax.LineWidth = 3;
    set(gca,'FontWeight','bold','fontsize',fontz);
    
    %colorbar
    [nc,hc]=colorb('v',[cmin cmax],'',[],rangeD,sz,2);
    set(hc,'position',[0.47 0.11 0.02 0.81])
    set(gca,'fontweight','bold','fontsize',sz);
    set(gcf, 'Units', 'Normalized', 'OuterPosition', [ 0 0 1 1 ]);
    axis tight
    
    %% figure
    set(gcf, 'Units', 'Normalized', 'OuterPosition', [ 0 0 1 1 ]);
    name1=['Modo',num2str(jj),'_GRL2'];
    savefig([name1,'.fig']);
    print(name1,'-dpng','-r0');
    
    
    %%  serie temporal
    figure
    % subplot(2,2,[1 2 3 4])
    axes('pos', [0.117708333333333 0.15 0.334659090909091 0.815]);
    plot(ttd, -1*T(:,jj),'color',[0.5 0.5 0.5],'linewidth',3);hold on;
    eval(['plot(ttd, -1*F_T',num2str(jj),',''color'',[0.929411768913269 0.694117665290833 0.125490203499794],''linewidth'',3)'])
    %     eval(['plot(ttd, -1*F_T',num2str(jj),',''color'',''k'',''linewidth'',3)'])
    set(gca,'xtick',fecha(1:2:end));datetick('x','mmm-yy' ,'keepticks');
    ylim([-3 3])
    ytick([ -3 -2 -1 0 1 2 3])
    xlim([in2 fn2]);
    ylabel('Amplitud','fontweight','bold','fontsize',sz);
    text(fecha(5),2.7,'Hourly data','color',[0.5 0.5 0.5],'fontweight','bold','fontsize',sz);
    text(fecha(34),2.7,'Daily data','color',[0.929411768913269 0.694117665290833 0.125490203499794],'fontweight','bold','fontsize',sz);
    
    th=rotateticklabel(gca,90);set(th,'Fontsize',sz,'Color',[ 0 0 0]);
    set(th,'fontweight','bold','fontsize',sz);
    text(fecha(end-8), -2.5,['CP ', num2str(jj)],'FontWeight','bold','fontsize',fontz);
    ax = gca; ax.XColor = 'black'; ax.LineWidth = 3;
    set(gca,'FontWeight','bold','fontsize',fontz);
    
    
    %% figure
    set(gcf, 'Units', 'Normalized', 'OuterPosition', [ 0 0 1 1 ]);
    name1=['Serie',num2str(jj),'_GRL2'];
    savefig([name1,'.fig']);
    print(name1,'-dpng','-r0');
    
end
