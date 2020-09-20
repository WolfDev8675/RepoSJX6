%% Class for app screen to show SplashScreen 
% programmed with MATLAB R2019A
% ideology: Dr.D.Majumdar
% coding: B.Biswas
% app classes or functions are parts of MarketRiskMeasure app - may not be 
% distributed separately without concent of creators 
% images included are stock images 
%% Code splashUI Class
classdef splashUI < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        MarketRiskMeasure_Launcher  matlab.ui.Figure
        Image                       matlab.ui.control.Image
        Label                       matlab.ui.control.Label
    end

    methods (Access = private)
        
        function loading_progress(app)
              app.Label.Text="";
              T = timer('TimerFcn',@(~,~)disp(''),'StartDelay',0.08);
              for i=1:100
                  start(T);wait(T);
                  app.Label.Text=strcat(app.Label.Text,"I");                       
              end
              % 1 second wait timer
              T = timer('TimerFcn',@(~,~)disp(''),'StartDelay',1);
              start(T);wait(T);
              app.MarketRiskMeasure_LauncherCloseRequest            
        end
    
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
                app.loading_progress
        end

        % Close request function: MarketRiskMeasure_Launcher
        function MarketRiskMeasure_LauncherCloseRequest(app, event)
            delete(app)
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create MarketRiskMeasure_Launcher and hide until all components are created
            app.MarketRiskMeasure_Launcher = uifigure('Visible', 'off');
            app.MarketRiskMeasure_Launcher.AutoResizeChildren = 'off';
            app.MarketRiskMeasure_Launcher.Position = [100 100 758 480];
            app.MarketRiskMeasure_Launcher.Name = 'MarketRiskMeasure_Launcher';
            app.MarketRiskMeasure_Launcher.Resize = 'off';
            app.MarketRiskMeasure_Launcher.CloseRequestFcn = createCallbackFcn(app, @MarketRiskMeasure_LauncherCloseRequest, true);

            % Create Image
            app.Image = uiimage(app.MarketRiskMeasure_Launcher);
            app.Image.ScaleMethod = 'stretch';
            app.Image.Position = [0 1 759 480];
            app.Image.ImageSource = 'AppSplash1.png';

            % Create Label
            app.Label = uilabel(app.MarketRiskMeasure_Launcher);
            app.Label.HorizontalAlignment = 'center';
            app.Label.FontSize = 22;
            app.Label.FontWeight = 'bold';
            app.Label.FontColor = [0.051 0.749 0.5412];
            app.Label.Position = [15 61 730 51];
            app.Label.Text = '';

            % Show the figure after all components are created
            app.MarketRiskMeasure_Launcher.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = splashUI

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.MarketRiskMeasure_Launcher)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.MarketRiskMeasure_Launcher)
        end
    end
end

%% Copyrights
% @MarketRiskMeasure app 
% weblink: https://github.com/WolfDev8675/RepoSJX6