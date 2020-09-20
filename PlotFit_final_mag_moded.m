%% Function PlotFit_final_mag_moded
% original function PlotFit_final.m 
% function moded to operate with matlab.ui.control.UIAxes classes and
% objects
% original creator:-uncredited
% integrated to (c)MarketRiskMeasure app 
% app classes or functions are parts of MarketRiskMeasure app - may not be 
% distributed separately without concent of creators 
% images included are stock images 
%% Function body
function [pd1,pd2] = PlotFit_final_mag_moded(dataset,fig)

%Finding the peaks in data
pks = findpeaks(dataset);
dataset = sort(pks);

% Force all inputs to be column vectors
dataset = dataset(:);

% Prepare figure
% clf;
hold (fig,'on');
LegHandles = []; LegText = {};


% Get data limits to determine plotting range
XLim = [min(dataset), max(dataset)];
XLim_max = XLim(1);
%Calculating mean and standard deviation values
%mean
mean_value = mean(dataset);

%Initializing variables
std_value = [];
nstd_value = [];

%Calculating Standard Deviation
for i = 1:1:6
std_value(i) = mean_value + i*std(dataset);
nstd_value(i) = mean_value - i*std(dataset);
end


% Create grid where function will be computed
XLim = XLim + [-1 1] * 0.01 * diff(XLim);
XGrid = linspace(XLim(1),XLim(2),100);


%----------------Create fit "dataset fit-------------------"
pd1 = fitdist(dataset,'kernel','kernel','normal','support','unbounded','width',0.15);
YPlot = pdf(pd1,XGrid);
%YPlot = sgolayfilt(YPlot,7,15);
[YPlot_max, index] = max(YPlot);
XGrid_max = XGrid(index);

%indexOfInterest = (XGrid > index);
title(fig,'Comparative Density Plot')
%Message
%str_print = {'\sigma values are','with respect to \mu'};
%text(XLim_max,YPlot_max,str_print);
%indexOfInterest
%Plotting datafit graph
hLine = plot(fig,XGrid(XGrid>=XGrid_max), YPlot(XGrid>=XGrid_max),'Color',[1 0 0],...
    'LineStyle','-', 'LineWidth',2,...
    'Marker','none', 'MarkerSize',6);
LegHandles(end+1) = hLine;
LegText{end+1} = 'Kernel probability density plot';
xlim([XGrid_max inf])

% ------------ Create fit "Normal fit"------------
% Fit this distribution to get parameter values
% To use parameter estimates from the original fit:
pd2 = fitdist(dataset, 'normal');
YPlot = pdf(pd2,XGrid);

hLine = plot(fig,XGrid(XGrid>=XGrid_max),YPlot(XGrid>=XGrid_max),'Color',[0 0 1],...
    'LineStyle',':', 'LineWidth',2,...
    'Marker','none', 'MarkerSize',6);
LegHandles(end+1) = hLine;
LegText{end+1} = 'Normal density';

%----------------plotting additional values------------------------
%mean
plot(fig,[mean_value mean_value],[0 max(YPlot)],':');

%Plotting Standard Deviation
for i = 1:1:6
    plot(fig,[std_value(i) std_value(i)],[0 max(YPlot)],':');
end

for i = 1:1:6
    plot(fig,[nstd_value(i) nstd_value(i)],[0 max(YPlot)],':');
end


%Plotting Global maxima
%plot([XGrid_max XGrid_max], [0 max(YPlot)]);

%Plotting lines for better visualization
text(fig,mean_value,0,'\mu');
%text(XGrid_max,max(YPlot),'S');
 
for i = 1:1:6
    
    %To avoid displaying 1sigma
    if i==1
        str = ['\mu + ','\sigma'];
        str1 = ['\mu -','\sigma'];
    else
        str = ['\mu + ', num2str(i), '\sigma'];
        str1 = ['\mu -', num2str(i), '\sigma'];
    end
        
    text(fig,std_value(i),max(YPlot),str);
   % text(nstd_value(i),max(YPlot),str1);
end

box (fig,'on');
hold (fig,'off');
xlabel(fig,'Daily Loss');
ylabel(fig,'Density');

% Create legend from accumulated handles and labels
hLegend = legend(fig,LegHandles,LegText,'Orientation', 'vertical', 'FontSize', 9, 'Location', 'northeast');
set(hLegend,'Interpreter','none');

%% Copyrights
% @MarketRiskMeasure app 
% weblink: https://github.com/WolfDev8675/RepoSJX6