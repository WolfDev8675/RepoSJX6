%% Class for main app screen control 
% programmed with MATLAB R2019A
% ideology: Dr.D.Majumdar
% coding: B.Biswas
% app classes or functions are parts of MarketRiskMeasure app - may not be 
% distributed separately without concent of creators 
% images included are stock images 
%% Code MktRskMsr_d2_v001 Class
classdef MktRskMsr_d2_v001 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        MarketriskmeasureUIFigure     matlab.ui.Figure
        Image                         matlab.ui.control.Image
        Label                         matlab.ui.control.Label
        HistoricalVolatilityButton    matlab.ui.control.Button
        ImpliedVolatilityButton       matlab.ui.control.Button
        VegaButton                    matlab.ui.control.Button
        SkewnessButton                matlab.ui.control.Button
        KurtosisButton                matlab.ui.control.Button
        BetaCoefficientButton         matlab.ui.control.Button
        JensensAlphaButton            matlab.ui.control.Button
        TreynorsRatioButton           matlab.ui.control.Button
        MsquaredRatioButton           matlab.ui.control.Button
        FamasIndexButton              matlab.ui.control.Button
        VaRButton                     matlab.ui.control.Button
        ExpectedShortfallButton       matlab.ui.control.Button
        NonSubjectiveVaRButton        matlab.ui.control.Button
        NonSubjectiveExpectedShortfallButton  matlab.ui.control.Button
        ExportButton                  matlab.ui.control.Button
        chartButton                   matlab.ui.control.Button
        Label_2                       matlab.ui.control.Label
        BasicmeasuresLabel            matlab.ui.control.Label
        TailrelatedriskmeasuresLabel  matlab.ui.control.Label
        MeasuresofMarketRiskLabel     matlab.ui.control.Label
        CharacteristicsofDataLabel    matlab.ui.control.Label
        UploadDataButton              matlab.ui.control.Button
        RangeButton                   matlab.ui.control.Button
        StandardDeviationButton       matlab.ui.control.Button
        CoefficientofVariationButton  matlab.ui.control.Button
        BarDiagramButton              matlab.ui.control.Button
        ScatterDiagramButton          matlab.ui.control.Button
        HistogramButton               matlab.ui.control.Button
        MeanButton                    matlab.ui.control.Button
        V001betatestLabel             matlab.ui.control.Label
        Label_3                       matlab.ui.control.Label
    end

    
    properties (Access = public)
        data_in=false; % variable for detecting presence of data var
        data='none' %contain the uploaded data
    end
    
    methods (Access = private,Static)
        
        function underDEV(~)
            warndlg('Section under development ...  ','Apologies..')
            
        end
    end
    
    methods (Access = private)
        
        function result = data_load(app)
            [data_fName,data_fPath]=uigetfile;
            %fullFName=data_fPath+'\'+data_fName;
            try
                fullFName=strcat(data_fPath,data_fName);
                warndlg({fullFName;' Copy to clipboard';' the relevant data'},'File Selected .. ');
                winopen(fullFName);
                result=uiimport('-pastespecial');
                app.data_in=true;
            catch ME
                errordlg({'Unsupported file type ... ';'reconsider input file type'},'Data Error')
            end
        end
    end


    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            app.Label.Text=char(date);
        end

        % Button pushed function: VaRButton
        function VaRButtonPushed(app, event)
            app.underDEV
            %app.Label_2.Text='T = '+ string(valueAtRisk());
        end

        % Button pushed function: HistogramButton
        function HistogramButtonPushed(app, event)
            if (app.data_in)
               % figure;PlotFit_final_mag(app.data)
               histFig=Histogram_view(app.data);
            else
                errordlg({'No information of a data available...';' Please upload data '},'Data Error')
            end
            
        end

        % Size changed function: MarketriskmeasureUIFigure
        function MarketriskmeasureUIFigureSizeChanged(app, event)
            position = app.MarketriskmeasureUIFigure.Position;
            app.MarketriskmeasureUIFigure.WindowState='maximized';
            app.Image.ScaleMethod = 'fill';
        end

        % Button pushed function: HistoricalVolatilityButton
        function HistoricalVolatilityButtonPushed(app, event)
            app.underDEV
        end

        % Button pushed function: ImpliedVolatilityButton
        function ImpliedVolatilityButtonPushed(app, event)
            app.underDEV
        end

        % Button pushed function: VegaButton
        function VegaButtonPushed(app, event)
            app.underDEV
        end

        % Button pushed function: SkewnessButton
        function SkewnessButtonPushed(app, event)
            app.underDEV
        end

        % Button pushed function: KurtosisButton
        function KurtosisButtonPushed(app, event)
            app.underDEV
        end

        % Button pushed function: BetaCoefficientButton
        function BetaCoefficientButtonPushed(app, event)
            app.underDEV
        end

        % Button pushed function: JensensAlphaButton
        function JensensAlphaButtonPushed(app, event)
            app.underDEV
        end

        % Button pushed function: TreynorsRatioButton
        function TreynorsRatioButtonPushed(app, event)
            app.underDEV
        end

        % Button pushed function: MsquaredRatioButton
        function MsquaredRatioButtonPushed(app, event)
            app.underDEV
        end

        % Button pushed function: FamasIndexButton
        function FamasIndexButtonPushed(app, event)
            app.underDEV
        end

        % Button pushed function: ExpectedShortfallButton
        function ExpectedShortfallButtonPushed(app, event)
            app.underDEV
        end

        % Button pushed function: NonSubjectiveVaRButton
        function NonSubjectiveVaRButtonPushed(app, event)
            app.underDEV
        end

        % Button pushed function: 
        % NonSubjectiveExpectedShortfallButton
        function NonSubjectiveExpectedShortfallButtonPushed(app, event)
            app.underDEV
        end

        % Button pushed function: ExportButton
        function ExportButtonPushed(app, event)
            app.underDEV
        end

        % Button pushed function: chartButton
        function chartButtonPushed(app, event)
            app.underDEV
        end

        % Button pushed function: UploadDataButton
        function UploadDataButtonPushed(app, event)
            
            try
                app.data=app.data_load;
                sub_app1=Table_viewer(app.data);
                app.data=app.data.data;
                app.data_in=true;
            catch ME
                app.data_in=false;
            end
        end

        % Button pushed function: RangeButton
        function RangeButtonPushed(app, event)
            app.underDEV
        end

        % Button pushed function: StandardDeviationButton
        function StandardDeviationButtonPushed(app, event)
            app.underDEV
        end

        % Button pushed function: CoefficientofVariationButton
        function CoefficientofVariationButtonPushed(app, event)
            app.underDEV
        end

        % Button pushed function: BarDiagramButton
        function BarDiagramButtonPushed(app, event)
            app.underDEV
        end

        % Button pushed function: ScatterDiagramButton
        function ScatterDiagramButtonPushed(app, event)
            app.underDEV
        end

        % Button pushed function: MeanButton
        function MeanButtonPushed(app, event)
            app.underDEV
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create MarketriskmeasureUIFigure and hide until all components are created
            app.MarketriskmeasureUIFigure = uifigure('Visible', 'off');
            app.MarketriskmeasureUIFigure.NumberTitle = 'on';
            app.MarketriskmeasureUIFigure.AutoResizeChildren = 'off';
            app.MarketriskmeasureUIFigure.Position = [100 100 1454 782];
            app.MarketriskmeasureUIFigure.Name = 'Market risk measure';
            app.MarketriskmeasureUIFigure.SizeChangedFcn = createCallbackFcn(app, @MarketriskmeasureUIFigureSizeChanged, true);

            % Create Image
            app.Image = uiimage(app.MarketriskmeasureUIFigure);
            app.Image.ScaleMethod = 'stretch';
            app.Image.Position = [-56 1 1510 795];
            app.Image.ImageSource = 'painted_img_edited.jpg';

            % Create Label
            app.Label = uilabel(app.MarketriskmeasureUIFigure);
            app.Label.Interruptible = 'off';
            app.Label.HorizontalAlignment = 'right';
            app.Label.FontSize = 18;
            app.Label.FontWeight = 'bold';
            app.Label.FontColor = [0.7686 0.7529 0.7529];
            app.Label.Position = [1214 33 222 22];
            app.Label.Text = '';

            % Create HistoricalVolatilityButton
            app.HistoricalVolatilityButton = uibutton(app.MarketriskmeasureUIFigure, 'push');
            app.HistoricalVolatilityButton.ButtonPushedFcn = createCallbackFcn(app, @HistoricalVolatilityButtonPushed, true);
            app.HistoricalVolatilityButton.Position = [192 651 112 22];
            app.HistoricalVolatilityButton.Text = 'Historical Volatility';

            % Create ImpliedVolatilityButton
            app.ImpliedVolatilityButton = uibutton(app.MarketriskmeasureUIFigure, 'push');
            app.ImpliedVolatilityButton.ButtonPushedFcn = createCallbackFcn(app, @ImpliedVolatilityButtonPushed, true);
            app.ImpliedVolatilityButton.Position = [193 624 102 22];
            app.ImpliedVolatilityButton.Text = 'Implied Volatility';

            % Create VegaButton
            app.VegaButton = uibutton(app.MarketriskmeasureUIFigure, 'push');
            app.VegaButton.ButtonPushedFcn = createCallbackFcn(app, @VegaButtonPushed, true);
            app.VegaButton.Position = [194 588 100 22];
            app.VegaButton.Text = 'Vega';

            % Create SkewnessButton
            app.SkewnessButton = uibutton(app.MarketriskmeasureUIFigure, 'push');
            app.SkewnessButton.ButtonPushedFcn = createCallbackFcn(app, @SkewnessButtonPushed, true);
            app.SkewnessButton.Position = [195 558 100 22];
            app.SkewnessButton.Text = 'Skewness';

            % Create KurtosisButton
            app.KurtosisButton = uibutton(app.MarketriskmeasureUIFigure, 'push');
            app.KurtosisButton.ButtonPushedFcn = createCallbackFcn(app, @KurtosisButtonPushed, true);
            app.KurtosisButton.Position = [195 520 100 22];
            app.KurtosisButton.Text = 'Kurtosis';

            % Create BetaCoefficientButton
            app.BetaCoefficientButton = uibutton(app.MarketriskmeasureUIFigure, 'push');
            app.BetaCoefficientButton.ButtonPushedFcn = createCallbackFcn(app, @BetaCoefficientButtonPushed, true);
            app.BetaCoefficientButton.Position = [195 488 100 22];
            app.BetaCoefficientButton.Text = 'Beta Coefficient';

            % Create JensensAlphaButton
            app.JensensAlphaButton = uibutton(app.MarketriskmeasureUIFigure, 'push');
            app.JensensAlphaButton.ButtonPushedFcn = createCallbackFcn(app, @JensensAlphaButtonPushed, true);
            app.JensensAlphaButton.Position = [195 449 100 22];
            app.JensensAlphaButton.Text = 'Jensen''s Alpha';

            % Create TreynorsRatioButton
            app.TreynorsRatioButton = uibutton(app.MarketriskmeasureUIFigure, 'push');
            app.TreynorsRatioButton.ButtonPushedFcn = createCallbackFcn(app, @TreynorsRatioButtonPushed, true);
            app.TreynorsRatioButton.Position = [195 418 100 22];
            app.TreynorsRatioButton.Text = 'Treynor''s Ratio';

            % Create MsquaredRatioButton
            app.MsquaredRatioButton = uibutton(app.MarketriskmeasureUIFigure, 'push');
            app.MsquaredRatioButton.ButtonPushedFcn = createCallbackFcn(app, @MsquaredRatioButtonPushed, true);
            app.MsquaredRatioButton.Position = [193 389 104 22];
            app.MsquaredRatioButton.Text = 'M-squared Ratio';

            % Create FamasIndexButton
            app.FamasIndexButton = uibutton(app.MarketriskmeasureUIFigure, 'push');
            app.FamasIndexButton.ButtonPushedFcn = createCallbackFcn(app, @FamasIndexButtonPushed, true);
            app.FamasIndexButton.Position = [195 357 100 22];
            app.FamasIndexButton.Text = 'Fama''s Index';

            % Create VaRButton
            app.VaRButton = uibutton(app.MarketriskmeasureUIFigure, 'push');
            app.VaRButton.ButtonPushedFcn = createCallbackFcn(app, @VaRButtonPushed, true);
            app.VaRButton.Position = [340 654 100 22];
            app.VaRButton.Text = 'VaR';

            % Create ExpectedShortfallButton
            app.ExpectedShortfallButton = uibutton(app.MarketriskmeasureUIFigure, 'push');
            app.ExpectedShortfallButton.ButtonPushedFcn = createCallbackFcn(app, @ExpectedShortfallButtonPushed, true);
            app.ExpectedShortfallButton.Position = [336 622 113 22];
            app.ExpectedShortfallButton.Text = 'Expected Shortfall';

            % Create NonSubjectiveVaRButton
            app.NonSubjectiveVaRButton = uibutton(app.MarketriskmeasureUIFigure, 'push');
            app.NonSubjectiveVaRButton.ButtonPushedFcn = createCallbackFcn(app, @NonSubjectiveVaRButtonPushed, true);
            app.NonSubjectiveVaRButton.Position = [331 588 123 22];
            app.NonSubjectiveVaRButton.Text = 'Non Subjective VaR';

            % Create NonSubjectiveExpectedShortfallButton
            app.NonSubjectiveExpectedShortfallButton = uibutton(app.MarketriskmeasureUIFigure, 'push');
            app.NonSubjectiveExpectedShortfallButton.ButtonPushedFcn = createCallbackFcn(app, @NonSubjectiveExpectedShortfallButtonPushed, true);
            app.NonSubjectiveExpectedShortfallButton.Position = [324 541 139 38];
            app.NonSubjectiveExpectedShortfallButton.Text = {'Non Subjective '; 'Expected Shortfall'};

            % Create ExportButton
            app.ExportButton = uibutton(app.MarketriskmeasureUIFigure, 'push');
            app.ExportButton.ButtonPushedFcn = createCallbackFcn(app, @ExportButtonPushed, true);
            app.ExportButton.Position = [392 295 100 22];
            app.ExportButton.Text = 'Export';

            % Create chartButton
            app.chartButton = uibutton(app.MarketriskmeasureUIFigure, 'push');
            app.chartButton.ButtonPushedFcn = createCallbackFcn(app, @chartButtonPushed, true);
            app.chartButton.Position = [719 622 100 22];
            app.chartButton.Text = 'chart';

            % Create Label_2
            app.Label_2 = uilabel(app.MarketriskmeasureUIFigure);
            app.Label_2.FontSize = 14;
            app.Label_2.FontWeight = 'bold';
            app.Label_2.FontColor = [1 1 1];
            app.Label_2.Position = [1021 235 305 215];
            app.Label_2.Text = '';

            % Create BasicmeasuresLabel
            app.BasicmeasuresLabel = uilabel(app.MarketriskmeasureUIFigure);
            app.BasicmeasuresLabel.BackgroundColor = [0.102 0.0118 0.0118];
            app.BasicmeasuresLabel.HorizontalAlignment = 'center';
            app.BasicmeasuresLabel.FontSize = 14;
            app.BasicmeasuresLabel.FontWeight = 'bold';
            app.BasicmeasuresLabel.FontColor = [0.4392 0.7804 0.7804];
            app.BasicmeasuresLabel.Position = [192 683 112 44];
            app.BasicmeasuresLabel.Text = 'Basic measures';

            % Create TailrelatedriskmeasuresLabel
            app.TailrelatedriskmeasuresLabel = uilabel(app.MarketriskmeasureUIFigure);
            app.TailrelatedriskmeasuresLabel.BackgroundColor = [0.0588 0.0196 0.0196];
            app.TailrelatedriskmeasuresLabel.HorizontalAlignment = 'center';
            app.TailrelatedriskmeasuresLabel.FontSize = 14;
            app.TailrelatedriskmeasuresLabel.FontWeight = 'bold';
            app.TailrelatedriskmeasuresLabel.FontColor = [0.4392 0.7804 0.7804];
            app.TailrelatedriskmeasuresLabel.Position = [342 681 99 44];
            app.TailrelatedriskmeasuresLabel.Text = {'Tail - related'; 'risk measures'};

            % Create MeasuresofMarketRiskLabel
            app.MeasuresofMarketRiskLabel = uilabel(app.MarketriskmeasureUIFigure);
            app.MeasuresofMarketRiskLabel.BackgroundColor = [0.0431 0.1176 0.1882];
            app.MeasuresofMarketRiskLabel.HorizontalAlignment = 'center';
            app.MeasuresofMarketRiskLabel.FontSize = 30;
            app.MeasuresofMarketRiskLabel.FontWeight = 'bold';
            app.MeasuresofMarketRiskLabel.FontColor = [0.4353 0.7804 0.7804];
            app.MeasuresofMarketRiskLabel.Position = [517 746 363 37];
            app.MeasuresofMarketRiskLabel.Text = 'Measures of Market Risk';

            % Create CharacteristicsofDataLabel
            app.CharacteristicsofDataLabel = uilabel(app.MarketriskmeasureUIFigure);
            app.CharacteristicsofDataLabel.BackgroundColor = [0.0588 0.0196 0.0196];
            app.CharacteristicsofDataLabel.HorizontalAlignment = 'center';
            app.CharacteristicsofDataLabel.FontSize = 14;
            app.CharacteristicsofDataLabel.FontWeight = 'bold';
            app.CharacteristicsofDataLabel.FontColor = [0.4392 0.7804 0.7804];
            app.CharacteristicsofDataLabel.Position = [45 691 111 34];
            app.CharacteristicsofDataLabel.Text = {'Characteristics '; 'of Data'};

            % Create UploadDataButton
            app.UploadDataButton = uibutton(app.MarketriskmeasureUIFigure, 'push');
            app.UploadDataButton.ButtonPushedFcn = createCallbackFcn(app, @UploadDataButtonPushed, true);
            app.UploadDataButton.Position = [40 652 100 22];
            app.UploadDataButton.Text = 'Upload Data';

            % Create RangeButton
            app.RangeButton = uibutton(app.MarketriskmeasureUIFigure, 'push');
            app.RangeButton.ButtonPushedFcn = createCallbackFcn(app, @RangeButtonPushed, true);
            app.RangeButton.Position = [43 583 100 22];
            app.RangeButton.Text = 'Range';

            % Create StandardDeviationButton
            app.StandardDeviationButton = uibutton(app.MarketriskmeasureUIFigure, 'push');
            app.StandardDeviationButton.ButtonPushedFcn = createCallbackFcn(app, @StandardDeviationButtonPushed, true);
            app.StandardDeviationButton.Position = [36 549 118 22];
            app.StandardDeviationButton.Text = 'Standard Deviation';

            % Create CoefficientofVariationButton
            app.CoefficientofVariationButton = uibutton(app.MarketriskmeasureUIFigure, 'push');
            app.CoefficientofVariationButton.ButtonPushedFcn = createCallbackFcn(app, @CoefficientofVariationButtonPushed, true);
            app.CoefficientofVariationButton.Position = [28 510 135 22];
            app.CoefficientofVariationButton.Text = 'Coefficient of Variation';

            % Create BarDiagramButton
            app.BarDiagramButton = uibutton(app.MarketriskmeasureUIFigure, 'push');
            app.BarDiagramButton.ButtonPushedFcn = createCallbackFcn(app, @BarDiagramButtonPushed, true);
            app.BarDiagramButton.Position = [45 473 100 22];
            app.BarDiagramButton.Text = 'Bar Diagram';

            % Create ScatterDiagramButton
            app.ScatterDiagramButton = uibutton(app.MarketriskmeasureUIFigure, 'push');
            app.ScatterDiagramButton.ButtonPushedFcn = createCallbackFcn(app, @ScatterDiagramButtonPushed, true);
            app.ScatterDiagramButton.Position = [44 439 103 22];
            app.ScatterDiagramButton.Text = 'Scatter Diagram';

            % Create HistogramButton
            app.HistogramButton = uibutton(app.MarketriskmeasureUIFigure, 'push');
            app.HistogramButton.ButtonPushedFcn = createCallbackFcn(app, @HistogramButtonPushed, true);
            app.HistogramButton.Position = [45 400 100 22];
            app.HistogramButton.Text = 'Histogram';

            % Create MeanButton
            app.MeanButton = uibutton(app.MarketriskmeasureUIFigure, 'push');
            app.MeanButton.ButtonPushedFcn = createCallbackFcn(app, @MeanButtonPushed, true);
            app.MeanButton.Position = [45 622 100 22];
            app.MeanButton.Text = 'Mean';

            % Create V001betatestLabel
            app.V001betatestLabel = uilabel(app.MarketriskmeasureUIFigure);
            app.V001betatestLabel.FontColor = [0.0588 1 1];
            app.V001betatestLabel.Position = [1335 12 101 22];
            app.V001betatestLabel.Text = 'V 0.0.1 beta (test)';

            % Create Label_3
            app.Label_3 = uilabel(app.MarketriskmeasureUIFigure);
            app.Label_3.FontColor = [1 1 1];
            app.Label_3.Position = [21 237 372 22];
            app.Label_3.Text = '';

            % Show the figure after all components are created
            app.MarketriskmeasureUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = MktRskMsr_d2_v001

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.MarketriskmeasureUIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.MarketriskmeasureUIFigure)
        end
    end
end

%% Copyrights
% @MarketRiskMeasure app 
% weblink: https://github.com/WolfDev8675/RepoSJX6