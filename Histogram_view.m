%% Class for app screen to show histograms 
% programmed with MATLAB R2019A
% ideology: Dr.D.Majumdar
% coding: B.Biswas
% app classes or functions are parts of MarketRiskMeasure app - may not be 
% distributed separately without concent of creators 
% images included are stock images 
%% Code Histogram_view Class
classdef Histogram_view < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        HistogramUIFigure  matlab.ui.Figure
        Image              matlab.ui.control.Image
        UIAxes             matlab.ui.control.UIAxes
        CloseButton        matlab.ui.control.Button
    end

 

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app, data_in)
            %plotter for histological curve 
            PlotFit_final_mag_moded(data_in,app.UIAxes)
            app.UIAxes.AlphaScale='log';
            app.UIAxes.Alphamap=1;
            
        end

        % Close request function: HistogramUIFigure
        function HistogramUIFigureCloseRequest(app, event)
            delete(app)
            %closes app window when called
        end

        % Button pushed function: CloseButton
        function CloseButtonPushed(app, event)
            app.HistogramUIFigureCloseRequest
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create HistogramUIFigure and hide until all components are created
            app.HistogramUIFigure = uifigure('Visible', 'off');
            app.HistogramUIFigure.Position = [100 100 1148 546];
            app.HistogramUIFigure.Name = 'Histogram';
            app.HistogramUIFigure.CloseRequestFcn = createCallbackFcn(app, @HistogramUIFigureCloseRequest, true);

            % Create Image
            app.Image = uiimage(app.HistogramUIFigure);
            app.Image.ScaleMethod = 'stretch';
            app.Image.Position = [1 1 1148 546];
            app.Image.ImageSource = 'polygon_art.jpg';

            % Create UIAxes
            app.UIAxes = uiaxes(app.HistogramUIFigure);
            title(app.UIAxes, '')
            xlabel(app.UIAxes, '')
            ylabel(app.UIAxes, '')
            app.UIAxes.AmbientLightColor = 'none';
            app.UIAxes.ClippingStyle = 'rectangle';
            app.UIAxes.BoxStyle = 'full';
            app.UIAxes.BackgroundColor = [0.6196 0.7294 0.7294];
            app.UIAxes.Position = [41 28 696 436];

            % Create CloseButton
            app.CloseButton = uibutton(app.HistogramUIFigure, 'push');
            app.CloseButton.ButtonPushedFcn = createCallbackFcn(app, @CloseButtonPushed, true);
            app.CloseButton.Position = [1018 38 100 22];
            app.CloseButton.Text = 'Close';

            % Show the figure after all components are created
            app.HistogramUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Histogram_view(varargin)

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.HistogramUIFigure)

            % Execute the startup function
            runStartupFcn(app, @(app)startupFcn(app, varargin{:}))

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.HistogramUIFigure)
        end
    end
end

%% Copyrights
% @MarketRiskMeasure app 
% weblink: https://github.com/WolfDev8675/RepoSJX6