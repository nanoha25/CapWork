fig1 = figure;
fig1.Units = 'centimeters';
fig1.Position = [5   5   16   12];
fig1.Color = 'white';

x = 0:pi/100:6*pi;
y = sin(x);
plot(x,y)

title('Title')
ax = gca; ax.FontSize = 12; ax.XTickLabel = {'0','6','12','18'}; ax.XTick = [0 6 12 18];
ax.XLim = [1 18]; ax.YLim = [-2 2];
ax.Box = 'on'; ax.Color = 'white';
xlabel('Time')
ylabel('{\itP} (kW)')

saveas(fig1, 'sample_figure.fig');
export_fig sample_figure.eps
export_fig sample_figure.pdf