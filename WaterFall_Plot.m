clear all;
clc;

% Load you spatio-temporal data
% Here data.mat has 3D shape corresponds to (examples,t,x) -> (250,256,642)
sample = 3;
U = load('data.mat');
V = squeeze(U.U_pred(sample,:,:));
U1  = V(25,:)';
U2  = V(50,:)';
U3  = V(75,:)';
U4  = V(100,:)';
U5  = V(125,:)';
U6  = V(150,:)';
U7  = V(175,:)';
U8  = V(200,:)';
U9  = V(225,:)';
U10 = V(250,:)';

%% Plotting
D = [U1, U2, U3, U4, U5, U6, U7, U8, U9, U10];
p = waterfall_func(D');
set(p, 'color', 'b');
% set(p, 'LineStyle', '--');
yticklabels([25 50 75 100 125 150 175 200 225 250]);
xlim([0 642]) % x limits

xlabel('Spatial steps (Nodes)', 'FontName','Times', 'FontSize', 10);
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontName','Times','fontsize',10)

ylabel('Time steps', 'FontName','Times', 'FontSize', 10);
b = get(gca,'YTickLabel');
set(gca,'YTickLabel',b,'FontName','Times','fontsize',10)
legend
legend([p(1)], {'Wave pattern'})

%% set figure size
set(gcf, 'PaperUnits', 'inches');
x_width = 20 ;
y_width = 10;
set(gcf, 'PaperPosition', [0 0 x_width y_width]); 
% saveas(gcf,'Sample_figure.jpg')
ax = gca;
exportgraphics(ax,'Sample_figure_2.jpg', 'Resolution', 500)