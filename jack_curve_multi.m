


num_plot = 4;

img = 4;

for img_num=0:img
figure
set(gcf,'Position',[100, 100, 1800, 900]);

structName = strOr_fbb;
for roi=1:num_plot
    cur_roi = roi + img_num*num_plot;
    subaxis(3,num_plot,roi,'SpacingVertical',0,'SpacingHorizontal',0, ...
        'PaddingLeft',0.01,'PaddingRight',0.015,'PaddingTop',0.05,'PaddingBottom',0, ...
        'MarginLeft',0.05,'MarginRight',0.001,'MarginTop',0.01,'MarginBottom',0.07);
    %subplot(3,10,roi)
    boxplot(mat_nor_fbb(cur_roi,:),mmse_fbb,'PlotStyle','compact');
    ylim([0 1]);
    set(gca,'YTick',0:0.1:1,'XDir','reverse','FontSize',9);
    set(findobj(gca,'Type','text'),'FontSize',8)
    plt_name = sprintf('%s : roi = %d',structName{cur_roi},cur_roi);
    title(plt_name);
end

structName = strOr_fdg;
for roi=1:num_plot
    cur_plot = roi + num_plot;
    cur_roi = roi + img_num*num_plot;
    subaxis(3,num_plot,cur_plot,'SpacingVertical',0,'SpacingHorizontal',0, ...
        'PaddingLeft',0.01,'PaddingRight',0.015,'PaddingTop',0.06,'PaddingBottom',0.01, ...
        'MarginLeft',0.05,'MarginRight',0.001,'MarginTop',0.01,'MarginBottom',0.07);
    %subplot(3,10,roi)
    boxplot(mat_nor_fdg(cur_roi,:),mmse_fdg,'PlotStyle','compact');
    ylim([0 1]);
    set(gca,'YTick',0:0.1:1,'XDir','reverse','FontSize',9);
    set(findobj(gca,'Type','text'),'FontSize',8)
    plt_name = sprintf('%s : roi = %d',structName{cur_roi},cur_roi);
    title(plt_name);
end

structName = strOr_thk;
for roi=1:num_plot
    cur_plot = roi + num_plot*2;
    cur_roi = roi + img_num*num_plot;
    
    subaxis(3,num_plot,cur_plot,'SpacingVertical',0,'SpacingHorizontal',0, ...
        'PaddingLeft',0.01,'PaddingRight',0.015,'PaddingTop',0.01,'PaddingBottom',0.01, ...
        'MarginLeft',0.05,'MarginRight',0.001,'MarginTop',0.01,'MarginBottom',0);
    %subplot(3,10,roi)
    boxplot(mat_nor_thk(cur_roi,:),mmse_thk,'PlotStyle','compact');
    ylim([0 1]);
    set(gca,'YTick',0:0.1:1,'XDir','reverse','FontSize',9);
    set(findobj(gca,'Type','text'),'FontSize',8)
    plt_name = sprintf('%s : roi = %d',structName{cur_roi},cur_roi);
    title(plt_name);
end
print( sprintf('./jack_curve_multi_%s(fdgthr=0.5)(%d).jpg',datestr(datetime,'yyyymmdd'),img_num),'-r240','-djpeg');
close all;

end