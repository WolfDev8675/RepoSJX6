%% Class for app screen to show imported Tables 
% programmed with MATLAB R2019A
% ideology: Dr.D.Majumdar
% coding: B.Biswas
% app classes or functions are parts of MarketRiskMeasure app - may not be 
% distributed separately without concent of creators 
% images included are stock images 
%% Code Table_viewer Class
classdef Table_viewer < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        ImportdataUIFigure  matlab.ui.Figure
        Image               matlab.ui.control.Image
        UITable             matlab.ui.control.Table
        UIAxes              matlab.ui.control.UIAxes
        CloseButton         matlab.ui.control.Button
    end

    
    properties (Access = public)
        Tdata % Description
    end
    
    methods (Access = public)
        
        function results = dataImport(app)
            results=app.Tdata;
            %return results;
            
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app, data_in)
            app.Tdata=data_in;
            app.UITable.Data=app.Tdata.data;
            app.UITable.ColumnName=app.Tdata.colheaders;
            plot(app.UIAxes,app.Tdata.data);
            app.UITable.Enable = 'on';
            app.UITable.Visible = 'on';
            app.UIAxes.AlphaScale='log';
            app.UIAxes.Alphamap=1;
            
        end

        % Close request function: ImportdataUIFigure
        function ImportdataUIFigureCloseRequest(app, event)
            delete(app)
            
        end

        % Button pushed function: CloseButton
        function CloseButtonPushed(app, event)
            app.ImportdataUIFigureCloseRequest
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create ImportdataUIFigure and hide until all components are created
            app.ImportdataUIFigure = uifigure('Visible', 'off');
            app.ImportdataUIFigure.Position = [100 100 1148 546];
            app.ImportdataUIFigure.Name = 'Import data';
            app.ImportdataUIFigure.CloseRequestFcn = createCallbackFcn(app, @ImportdataUIFigureCloseRequest, true);

            % Create Image
            app.Image = uiimage(app.ImportdataUIFigure);
            app.Image.ScaleMethod = 'stretch';
            app.Image.Position = [1 1 1148 546];
            app.Image.ImageSource = 'polygon_art.jpg';

            % Create UITable
            app.UITable = uitable(app.ImportdataUIFigure);
            app.UITable.ColumnName = {''};
            app.UITable.RowName = {};
            app.UITable.Enable = 'off';
            app.UITable.Visible = 'off';
            app.UITable.Position = [193 220 114 207];

            % Create UIAxes
            app.UIAxes = uiaxes(app.ImportdataUIFigure);
            title(app.UIAxes, '')
            xlabel(app.UIAxes, '')
            ylabel(app.UIAxes, '')
            app.UIAxes.AmbientLightColor = 'none';
            app.UIAxes.ClippingStyle = 'rectangle';
            app.UIAxes.BoxStyle = 'full';
            app.UIAxes.Visible = 'off';
            app.UIAxes.BackgroundColor = [0.5059 0.8 0.8];
            app.UIAxes.Interruptible = 'off';
            app.UIAxes.Position = [76 59 596 70];

            % Create CloseButton
            app.CloseButton = uibutton(app.ImportdataUIFigure, 'push');
            app.CloseButton.ButtonPushedFcn = createCallbackFcn(app, @CloseButtonPushed, true);
            app.CloseButton.Position = [1018 38 100 22];
            app.CloseButton.Text = 'Close';

            % Show the figure after all components are created
            app.ImportdataUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Table_viewer(varargin)

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.ImportdataUIFigure)

            % Execute the startup function
            runStartupFcn(app, @(app)startupFcn(app, varargin{:}))

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.ImportdataUIFigure)
        end
    end
end

%% Copyrights
% @MarketRiskMeasure app 
% weblink: https://github.com/WolfDev8675/RepoSJX6