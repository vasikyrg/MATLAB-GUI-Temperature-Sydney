classdef assignment1 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                  matlab.ui.Figure
        TabGroup                  matlab.ui.container.TabGroup
        AverageTemperaturepermonthperyearTab  matlab.ui.container.Tab
        UIAxes                    matlab.ui.control.UIAxes
        UIAxes2                   matlab.ui.control.UIAxes
        LoadDataButton            matlab.ui.control.Button
        LoadDataButton_2          matlab.ui.control.Button
        SelectMonthDropDownLabel  matlab.ui.control.Label
        SelectMonthDropDown       matlab.ui.control.DropDown
        ZoomSlider_3Label         matlab.ui.control.Label
        ZoomSlider                matlab.ui.control.Slider
        ZoomSlider_2Label         matlab.ui.control.Label
        ZoomSlider_2              matlab.ui.control.Slider
        YearEditFieldLabel        matlab.ui.control.Label
        YearEditField             matlab.ui.control.NumericEditField
        YearEditField_2Label      matlab.ui.control.Label
        YearEditField_2           matlab.ui.control.NumericEditField
        FindYearButton            matlab.ui.control.Button
        FindYearButton_2          matlab.ui.control.Button
        ZoomOptionLabel           matlab.ui.control.Label
        ZoomOptionLabel_2         matlab.ui.control.Label
        PresstheLoadDatatoseetheAverageTemperatureLabel  matlab.ui.control.Label
        SelectMonthandseethepresstheLoadDataLabel  matlab.ui.control.Label
        ResetFigureButton_2       matlab.ui.control.Button
        ResetFigureButton         matlab.ui.control.Button
        StandardDeviationTab      matlab.ui.container.Tab
        UIAxes3                   matlab.ui.control.UIAxes
        LoadDataButton_3          matlab.ui.control.Button
        ZoomSliderLabel           matlab.ui.control.Label
        ZoomSlider_3              matlab.ui.control.Slider
        YearEditField_3Label      matlab.ui.control.Label
        YearEditField_3           matlab.ui.control.NumericEditField
        FindYearButton_3          matlab.ui.control.Button
        ResetFigureButton_3       matlab.ui.control.Button
    end

    
    properties (Access = private)
         %% Load Data From CSV File
            %% Load Data From CSV File
            year = readtable('IDCJAC0002_066062_Data12.csv').Year;
            jan = readtable('IDCJAC0002_066062_Data12.csv').Jan;
            feb = readtable('IDCJAC0002_066062_Data12.csv').Feb;
            mar = readtable('IDCJAC0002_066062_Data12.csv').Mar;
            apr = readtable('IDCJAC0002_066062_Data12.csv').Apr;
            may = readtable('IDCJAC0002_066062_Data12.csv').May;
            jun = readtable('IDCJAC0002_066062_Data12.csv').Jun;
            jul = readtable('IDCJAC0002_066062_Data12.csv').Jul;
            aug = readtable('IDCJAC0002_066062_Data12.csv').Aug;
            sep = readtable('IDCJAC0002_066062_Data12.csv').Sep;
            oct = readtable('IDCJAC0002_066062_Data12.csv').Oct;
            nov = readtable('IDCJAC0002_066062_Data12.csv').Nov;
            dec = readtable('IDCJAC0002_066062_Data12.csv').Dec;
            annual = readtable('IDCJAC0002_066062_Data12.csv').Annual;
            %% Other 
            common_xlim2
            common_ylim2
            common_xlim
            common_ylim
            common_xlim3
            common_ylim3
            upper_bound
            lower_bound
            original_x3
            original_y3
            original_x2
            original_y2
            original_x
            original_y
            isenabled3
            isenabled2
            isenabled
            average_per_year
            
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            
        end

        % Button pushed function: LoadDataButton
        function LoadDataButtonPushed(app, event)
            %% DropDown Menu
            SelectUnitSwitchValueChanged(app, event)
            switch app.SelectMonthDropDown.Value
                case 'January'
                    plot(app.UIAxes,app.year,app.jan);
                    xlabel(app.UIAxes,'Year');
                    ylabel(app.UIAxes,'January');
                    xlim(app.UIAxes, [app.year(1), app.year(length(app.year))]);
                    disableDefaultInteractivity(app.UIAxes)
                    app.UIAxes.Toolbar.Visible = 'off'; 
                    app.common_ylim = get(app.UIAxes, 'YLim');
                    app.common_xlim = get(app.UIAxes, 'XLim');
                case 'February'
                    plot(app.UIAxes,app.year,app.feb);
                    xlabel(app.UIAxes,'Year');
                    ylabel(app.UIAxes,'February');
                    xlim(app.UIAxes, [app.year(1), app.year(length(app.year))]);
                    disableDefaultInteractivity(app.UIAxes)
                    app.UIAxes.Toolbar.Visible = 'off'; 
                    app.common_ylim = get(app.UIAxes, 'YLim');
                    app.common_xlim = get(app.UIAxes, 'XLim');
                case 'March'
                    plot(app.UIAxes,app.year,app.mar);
                    xlabel(app.UIAxes,'Year');
                    ylabel(app.UIAxes,'March');
                    xlim(app.UIAxes, [app.year(1), app.year(length(app.year))]);
                    disableDefaultInteractivity(app.UIAxes)
                    app.UIAxes.Toolbar.Visible = 'off'; 
                    app.common_ylim = get(app.UIAxes, 'YLim');
                    app.common_xlim = get(app.UIAxes, 'XLim');
                case 'April'
                    plot(app.UIAxes,app.year,app.apr);
                    xlabel(app.UIAxes,'Year');
                    ylabel(app.UIAxes,'April');
                    xlim(app.UIAxes, [app.year(1), app.year(length(app.year))]);
                    disableDefaultInteractivity(app.UIAxes)
                    app.UIAxes.Toolbar.Visible = 'off'; 
                    app.common_ylim = get(app.UIAxes, 'YLim');
                    app.common_xlim = get(app.UIAxes, 'XLim');
                case 'May'
                    plot(app.UIAxes,app.year,app.may);
                    xlabel(app.UIAxes,'Year');
                    ylabel(app.UIAxes,'May');
                    xlim(app.UIAxes, [app.year(1), app.year(length(app.year))]);
                    disableDefaultInteractivity(app.UIAxes)
                    app.UIAxes.Toolbar.Visible = 'off'; 
                    app.common_ylim = get(app.UIAxes, 'YLim');
                    app.common_xlim = get(app.UIAxes, 'XLim');
                case 'June'
                    plot(app.UIAxes,app.year,app.jun);
                    xlabel(app.UIAxes,'Year');
                    ylabel(app.UIAxes,'June');
                    xlim(app.UIAxes, [app.year(1), app.year(length(app.year))]);
                    disableDefaultInteractivity(app.UIAxes)
                    app.UIAxes.Toolbar.Visible = 'off'; 
                    app.common_ylim = get(app.UIAxes, 'YLim');
                    app.common_xlim = get(app.UIAxes, 'XLim');
                case 'July'
                    plot(app.UIAxes,app.year,app.jul);
                    xlabel(app.UIAxes,'Year');
                    ylabel(app.UIAxes,'July');
                    xlim(app.UIAxes, [app.year(1), app.year(length(app.year))]);
                    disableDefaultInteractivity(app.UIAxes)
                    app.UIAxes.Toolbar.Visible = 'off';
                    app.common_ylim = get(app.UIAxes, 'YLim');
                    app.common_xlim = get(app.UIAxes, 'XLim');
                case 'August'
                    plot(app.UIAxes,app.year,app.aug);
                    xlabel(app.UIAxes,'Year');
                    ylabel(app.UIAxes,'August');
                    xlim(app.UIAxes, [app.year(1), app.year(length(app.year))]);
                    disableDefaultInteractivity(app.UIAxes)
                    app.UIAxes.Toolbar.Visible = 'off'; 
                    app.common_ylim = get(app.UIAxes, 'YLim');
                    app.common_xlim = get(app.UIAxes, 'XLim');
                case 'September'
                    plot(app.UIAxes,app.year,app.sep);
                    xlabel(app.UIAxes,'Year');
                    ylabel(app.UIAxes,'September');
                    xlim(app.UIAxes, [app.year(1), app.year(length(app.year))]);
                    disableDefaultInteractivity(app.UIAxes)
                    app.UIAxes.Toolbar.Visible = 'off'; 
                    app.common_ylim = get(app.UIAxes, 'YLim');
                    app.common_xlim = get(app.UIAxes, 'XLim');
                case 'October'
                    plot(app.UIAxes,app.year,app.oct);
                    xlabel(app.UIAxes,'Year');
                    ylabel(app.UIAxes,'October');
                    xlim(app.UIAxes, [app.year(1), app.year(length(app.year))]);
                    disableDefaultInteractivity(app.UIAxes)
                    app.UIAxes.Toolbar.Visible = 'off'; 
                    app.common_ylim = get(app.UIAxes, 'YLim');
                    app.common_xlim = get(app.UIAxes, 'XLim');
                case 'November'
                    plot(app.UIAxes,app.year,app.nov);
                    xlabel(app.UIAxes,'Year');
                    ylabel(app.UIAxes,'November');
                    xlim(app.UIAxes, [app.year(1), app.year(length(app.year))]);
                    disableDefaultInteractivity(app.UIAxes)
                    app.UIAxes.Toolbar.Visible = 'off'; 
                    app.common_ylim = get(app.UIAxes, 'YLim');
                    app.common_xlim = get(app.UIAxes, 'XLim');
                case 'December'
                    plot(app.UIAxes,app.year,app.dec);
                    xlabel(app.UIAxes,'Year');
                    ylabel(app.UIAxes,'December');
                    xlim(app.UIAxes, [app.year(1), app.year(length(app.year))]);
                    disableDefaultInteractivity(app.UIAxes)
                    app.UIAxes.Toolbar.Visible = 'off'; 
                    app.common_ylim = get(app.UIAxes, 'YLim');
                    app.common_xlim = get(app.UIAxes, 'XLim');
                    
            end
        end

        % Button pushed function: LoadDataButton_2
        function LoadDataButton_2Pushed(app, event)
            %% Find the average
            app.average_per_year = zeros(150,1);
            for i=1:1:length(app.year)
                app.average_per_year(i) = (app.jan(i) + app.feb(i) + app.mar(i) + app.apr(i) + app.may(i) + app.jun(i)+app.jul(i)+app.aug(i) ...
                    +app.sep(i)+app.oct(i)+app.nov(i)+app.dec(i))/12;
            end
           plot(app.UIAxes2,app.year,app.average_per_year);
           xlabel(app.UIAxes2,'Year');
           ylabel(app.UIAxes2,'Average Temperature');
           xlim(app.UIAxes2, [app.year(1), app.year(length(app.year))]);
           disableDefaultInteractivity(app.UIAxes2)
           app.UIAxes2.Toolbar.Visible = 'off'; 
           app.common_ylim2 = get(app.UIAxes2, 'YLim');
           app.common_xlim2 = get(app.UIAxes2, 'XLim');
        end

        % Callback function
        function SelectUnitSwitchValueChanged(app, event)
              
        end

        % Callback function: UIAxes3
        function UIAxes3ButtonDown(app, event)
            
        end

        % Button pushed function: LoadDataButton_3
        function LoadDataButton_3Pushed(app, event)
           months_temp = [app.jan app.feb app.mar app.apr app.may app.jun app.jul app.aug app.sep app.oct app.nov app.dec];

           std_per_year = zeros(size(app.year));
 
            for i=1:1:length(app.year)
                % mean_per_year(i) = mean(app.annual(i));
                std_per_year(i) = std(months_temp(i,:),0,2);
            end
           plot(app.UIAxes3, app.year, app.annual, '-o', 'LineWidth', 2, 'DisplayName', 'Mean Tm');
           hold(app.UIAxes3, 'on');
           app.upper_bound = app.annual + std_per_year;
           app.lower_bound = app.annual - std_per_year;
           % Exclude the last values
           % Plot mean ± 1 standard deviation
           plot(app.UIAxes3, app.year, app.annual + std_per_year, '-', 'Color', 'b', 'LineWidth', 1, 'DisplayName', 'Mean Tm + 1\sigma');
           hold(app.UIAxes3,'on');
           plot(app.UIAxes3, app.year, app.annual - std_per_year, '-', 'Color', 'b', 'LineWidth', 1, 'DisplayName', 'Mean Tm - 1\sigma');
           fill(app.UIAxes3,[app.year; flip(app.year)], [app.upper_bound; flip(app.lower_bound)], 'b', 'FaceAlpha', 0.3, 'EdgeColor', 'none', 'DisplayName', 'Area Between');
           title(app.UIAxes3,'Mean Yearly Temperatures');
           xlabel(app.UIAxes3, 'Years');
           ylabel(app.UIAxes3, 'Mean Temperature');
           xlim(app.UIAxes3, [app.year(1), app.year(length(app.year))]);
           legend(app.UIAxes3, 'show', 'Location', 'best');
           hold(app.UIAxes3, 'off'); 
           disableDefaultInteractivity(app.UIAxes3)
           app.UIAxes3.Toolbar.Visible = 'off'; 
           app.common_ylim3 = get(app.UIAxes3, 'YLim');
           app.common_xlim3 = get(app.UIAxes3, 'XLim');
%            % Get current mouse position
%         currentPoint = app.UIAxes.CurrentPoint;
%         mouseX = currentPoint(1,1);
%         mouseY = currentPoint(1,2);
%         [~, index] = min(abs(app.year - mouseX));
%         selectedYear = app.year(index);
%         selectedTemperature = app.annual(index);
%         % Calculate upper and lower bounds for the selected year
% upper_bound_selected = app.annual(index) + std_per_year(index);
% lower_bound_selected = app.annual(index) - std_per_year(index);
% 
% % Display the range (mean ± 1 standard deviation) for the selected year
% 
%         set(app.YearEditField, 'Value', int32(selectedYear))
%         set(app.TemperatureEditField, 'Value', selectedTemperature)
%         range_text = sprintf('%.2f - %.2f', upper_bound_selected, lower_bound_selected);
%         set(app.RangeEditField, 'Value', range_text);
% 
%         % % Extract X coordinate (representing year)
%         % 
%         % 
%         % % Find the closest year in the data based on mouseX
%         % [~, index] = min(abs(app.year - mouseX));
%         % selectedYear = app.year(index);
%         % selectedTemperature = app.(index);
%         % if isInAxes
%         %         set(app.YearEditField, 'Value',...
%         %             sprintf('%.2f', selectedYear))
%         %         set(app.TemperatureEditField, 'Value',...
%         %             sprintf('%.2f', selectedTemperature))
%         %         set(app.RangeEditField, 'Value',...
%         %             sprintf('%.2f - %.2f', selectedYear))
%         % else
%         %         set(app.CurrentPositionEditField, 'Value', '')
%         % end
        end

        % Button pushed function: FindYearButton_2
        function FindYearButton_2Pushed(app, event)
           app.isenabled2 = true;
            for i=1:1:length(app.year)
                if app.YearEditField_2.Value == app.year(i)
                    if app.YearEditField_2.Value == app.year(end)
                        app.common_xlim2 = [app.year(i-1), app.year(i)]; % Set x-axis limits to min and max of original signal 
                    elseif app.YearEditField_2.Value == app.year(1)
                        app.common_xlim2 = [app.year(i), app.year(i+1)]; % Set x-axis limits to min and max of original signal 
                    else
                        app.common_xlim2 = [app.year(i-1), app.year(i+1)]; % Set x-axis limits to min and max of original signal 
                    end 
                    set(app.UIAxes2, 'XLim', app.common_xlim2);
                    app.original_x2 = get(app.UIAxes2,'XLim');
                    app.original_y2 = get(app.UIAxes2,'YLim');
                end
            end
        end

        % Button pushed function: ResetFigureButton_2
        function ResetFigureButton_2Pushed(app, event)
            app.common_xlim2 = [app.year(1), app.year(end)]; % Set x-axis limits to min and max of original signal 
            app.common_ylim2 = [app.average_per_year(1), app.average_per_year(end)];
            set(app.UIAxes2, 'XLim', app.common_xlim2);
            set(app.UIAxes2, 'YLim', app.common_ylim2);
            app.common_ylim2 = get(app.UIAxes2, 'YLim');
            app.isenabled2 = false;
        end

        % Value changing function: ZoomSlider_2
        function ZoomSlider_2ValueChanging(app, event)
            zoomPercentage = event.Value;
            % Get current axis limits
            xLimits = app.common_xlim2;
            yLimits = app.common_ylim2;
            % Calculate the current range
            xRange = xLimits(2) - xLimits(1);
            yRange = yLimits(2) - yLimits(1);
            % Calculate the new axis limits
            newXRange = xRange / zoomPercentage;
            newYRange = yRange / zoomPercentage;
            % Calculate the center of the current limits
            xCenter = (xLimits(2) + xLimits(1)) / 2;
            yCenter = (yLimits(2) + yLimits(1)) / 2;
            % Calculate the new limits ensuring the second element is greater than the first
            newXLim = [xCenter - newXRange / 2, xCenter + newXRange / 2];
            newYLim = [yCenter - newYRange / 2, yCenter + newYRange / 2];
            % Set the new axis limits centered around the center
            app.UIAxes2.XLim = newXLim;
            app.UIAxes2.YLim = newYLim;

            if zoomPercentage == 0
                if app.isenabled2
                    set(app.UIAxes2, 'XLim', app.original_x2);
                    set(app.UIAxes2, 'YLim', app.original_y2);
                end
            end


            
        end

        % Button pushed function: ResetFigureButton_3
        function ResetFigureButton_3Pushed(app, event)
            app.common_xlim3 = [app.year(1), app.year(end)]; % Set x-axis limits to min and max of original signal 
            app.common_ylim3 = [app.lower_bound(1), app.upper_bound(end)];
            set(app.UIAxes3, 'XLim', app.common_xlim3);
            set(app.UIAxes3, 'YLim', app.common_ylim3);
            app.common_ylim3 = get(app.UIAxes3, 'YLim');
            app.isenabled3 = false;
        end

        % Button pushed function: FindYearButton_3
        function FindYearButton_3Pushed(app, event)
            app.isenabled3 = true;
            for i=1:1:length(app.year)
                if app.YearEditField_3.Value == app.year(i)
                    if app.YearEditField_3.Value == app.year(end)
                        app.common_xlim3 = [app.year(i-1), app.year(i)]; % Set x-axis limits to min and max of original signal 
                    elseif app.YearEditField_3.Value == app.year(1)
                        app.common_xlim3 = [app.year(i), app.year(i+1)]; % Set x-axis limits to min and max of original signal 
                    else
                        app.common_xlim3 = [app.year(i-1), app.year(i+1)]; % Set x-axis limits to min and max of original signal 
                    end 
                    set(app.UIAxes3, 'XLim', app.common_xlim3);
                    app.original_x3 = get(app.UIAxes3,'XLim');
                    app.original_y3 = get(app.UIAxes3,'YLim');
                end
            end
        end

        % Value changing function: ZoomSlider_3
        function ZoomSlider_3ValueChanging(app, event)
            zoomPercentage = event.Value;
            % Get current axis limits
            xLimits = app.common_xlim3;
            yLimits = app.common_ylim3;
            % Calculate the current range
            xRange = xLimits(2) - xLimits(1);
            yRange = yLimits(2) - yLimits(1);
            % Calculate the new axis limits
            newXRange = xRange / zoomPercentage;
            newYRange = yRange / zoomPercentage;
            % Calculate the center of the current limits
            xCenter = (xLimits(2) + xLimits(1)) / 2;
            yCenter = (yLimits(2) + yLimits(1)) / 2;
            % Calculate the new limits ensuring the second element is greater than the first
            newXLim = [xCenter - newXRange / 2, xCenter + newXRange / 2];
            newYLim = [yCenter - newYRange / 2, yCenter + newYRange / 2];
            % Set the new axis limits centered around the center
            app.UIAxes3.XLim = newXLim;
            app.UIAxes3.YLim = newYLim;

            if zoomPercentage == 0
                if app.isenabled3
                    set(app.UIAxes3, 'XLim', app.original_x3);
                    set(app.UIAxes3, 'YLim', app.original_y3);
                end
            end
            
        end

        % Value changed function: YearEditField
        function YearEditFieldValueChanged(app, event)
            
            
        end

        % Button pushed function: FindYearButton
        function FindYearButtonPushed(app, event)
            app.isenabled = true;
            for i=1:1:length(app.year)
                if app.YearEditField.Value == app.year(i)
                    if app.YearEditField.Value == app.year(end)
                        app.common_xlim = [app.year(i-1), app.year(i)]; % Set x-axis limits to min and max of original signal 
                    elseif app.YearEditField.Value == app.year(1)
                        app.common_xlim = [app.year(i), app.year(i+1)]; % Set x-axis limits to min and max of original signal 
                    else
                        app.common_xlim = [app.year(i-1), app.year(i+1)]; % Set x-axis limits to min and max of original signal 
                    end 
                    set(app.UIAxes, 'XLim', app.common_xlim);
                    app.original_x = get(app.UIAxes,'XLim');
                    app.original_y = get(app.UIAxes,'YLim');
                end
            end
        end

        % Button pushed function: ResetFigureButton
        function ResetFigureButtonPushed(app, event)
            app.common_xlim = [app.year(1), app.year(end)]; % Set x-axis limits to min and max of original signal 
            months = ['January','February', 'March', 'May', 'June', 'July', 'August', ...
                'September', 'October', 'November', 'December'];
            array_months = [app.jan, app.feb, app.mar, app.apr, app.may, app.jun, app.jul, app.aug ...
                ,app.sep, app.oct, app.nov, app.dec];
            for i = 1:length(months)
                if app.SelectMonthDropDown.Value == months(i)
                    app.common_ylim = [array_months{i}(1), array_months{i}(end)];
                end
            end
            set(app.UIAxes, 'XLim', app.common_xlim);
            set(app.UIAxes, 'YLim', app.common_ylim);
            app.common_ylim = get(app.UIAxes, 'YLim');
            app.isenabled = false;
        end

        % Value changing function: ZoomSlider
        function ZoomSliderValueChanging(app, event)
            zoomPercentage = event.Value;
            % Get current axis limits
            xLimits = app.common_xlim;
            yLimits = app.common_ylim;
            % Calculate the current range
            xRange = xLimits(2) - xLimits(1);
            yRange = yLimits(2) - yLimits(1);
            % Calculate the new axis limits
            newXRange = xRange / zoomPercentage;
            newYRange = yRange / zoomPercentage;
            % Calculate the center of the current limits
            xCenter = (xLimits(2) + xLimits(1)) / 2;
            yCenter = (yLimits(2) + yLimits(1)) / 2;
            % Calculate the new limits ensuring the second element is greater than the first
            newXLim = [xCenter - newXRange / 2, xCenter + newXRange / 2];
            newYLim = [yCenter - newYRange / 2, yCenter + newYRange / 2];
            % Set the new axis limits centered around the center
            app.UIAxes.XLim = newXLim;
            app.UIAxes.YLim = newYLim;

            if zoomPercentage == 0
                if app.isenabled
                    set(app.UIAxes, 'XLim', app.original_x);
                    set(app.UIAxes, 'YLim', app.original_y);
                end
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [0.651 0.651 0.651];
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [2 1 639 480];

            % Create AverageTemperaturepermonthperyearTab
            app.AverageTemperaturepermonthperyearTab = uitab(app.TabGroup);
            app.AverageTemperaturepermonthperyearTab.Title = 'Average Temperature per month / per year';

            % Create UIAxes
            app.UIAxes = uiaxes(app.AverageTemperaturepermonthperyearTab);
            title(app.UIAxes, 'Temperature from 1859 to 2019')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.XGrid = 'on';
            app.UIAxes.YGrid = 'on';
            app.UIAxes.Position = [8 262 300 185];

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.AverageTemperaturepermonthperyearTab);
            title(app.UIAxes2, 'Average Temperature ')
            xlabel(app.UIAxes2, 'X')
            ylabel(app.UIAxes2, 'Y')
            zlabel(app.UIAxes2, 'Z')
            app.UIAxes2.XGrid = 'on';
            app.UIAxes2.YGrid = 'on';
            app.UIAxes2.Position = [9 9 300 185];

            % Create LoadDataButton
            app.LoadDataButton = uibutton(app.AverageTemperaturepermonthperyearTab, 'push');
            app.LoadDataButton.ButtonPushedFcn = createCallbackFcn(app, @LoadDataButtonPushed, true);
            app.LoadDataButton.Position = [538 387 100 22];
            app.LoadDataButton.Text = 'Load Data';

            % Create LoadDataButton_2
            app.LoadDataButton_2 = uibutton(app.AverageTemperaturepermonthperyearTab, 'push');
            app.LoadDataButton_2.ButtonPushedFcn = createCallbackFcn(app, @LoadDataButton_2Pushed, true);
            app.LoadDataButton_2.Position = [456 172 100 22];
            app.LoadDataButton_2.Text = 'Load Data';

            % Create SelectMonthDropDownLabel
            app.SelectMonthDropDownLabel = uilabel(app.AverageTemperaturepermonthperyearTab);
            app.SelectMonthDropDownLabel.HorizontalAlignment = 'right';
            app.SelectMonthDropDownLabel.Position = [328 387 75 22];
            app.SelectMonthDropDownLabel.Text = 'Select Month';

            % Create SelectMonthDropDown
            app.SelectMonthDropDown = uidropdown(app.AverageTemperaturepermonthperyearTab);
            app.SelectMonthDropDown.Items = {'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'};
            app.SelectMonthDropDown.Position = [418 387 100 22];
            app.SelectMonthDropDown.Value = 'January';

            % Create ZoomSlider_3Label
            app.ZoomSlider_3Label = uilabel(app.AverageTemperaturepermonthperyearTab);
            app.ZoomSlider_3Label.HorizontalAlignment = 'right';
            app.ZoomSlider_3Label.Position = [388 258 36 22];
            app.ZoomSlider_3Label.Text = 'Zoom';

            % Create ZoomSlider
            app.ZoomSlider = uislider(app.AverageTemperaturepermonthperyearTab);
            app.ZoomSlider.ValueChangingFcn = createCallbackFcn(app, @ZoomSliderValueChanging, true);
            app.ZoomSlider.Position = [445 267 150 3];

            % Create ZoomSlider_2Label
            app.ZoomSlider_2Label = uilabel(app.AverageTemperaturepermonthperyearTab);
            app.ZoomSlider_2Label.HorizontalAlignment = 'right';
            app.ZoomSlider_2Label.Position = [379 32 36 22];
            app.ZoomSlider_2Label.Text = 'Zoom';

            % Create ZoomSlider_2
            app.ZoomSlider_2 = uislider(app.AverageTemperaturepermonthperyearTab);
            app.ZoomSlider_2.ValueChangingFcn = createCallbackFcn(app, @ZoomSlider_2ValueChanging, true);
            app.ZoomSlider_2.Position = [436 41 150 3];

            % Create YearEditFieldLabel
            app.YearEditFieldLabel = uilabel(app.AverageTemperaturepermonthperyearTab);
            app.YearEditFieldLabel.HorizontalAlignment = 'right';
            app.YearEditFieldLabel.Position = [347 302 29 22];
            app.YearEditFieldLabel.Text = 'Year';

            % Create YearEditField
            app.YearEditField = uieditfield(app.AverageTemperaturepermonthperyearTab, 'numeric');
            app.YearEditField.Limits = [1859 2019];
            app.YearEditField.ValueChangedFcn = createCallbackFcn(app, @YearEditFieldValueChanged, true);
            app.YearEditField.Position = [391 302 100 22];
            app.YearEditField.Value = 1859;

            % Create YearEditField_2Label
            app.YearEditField_2Label = uilabel(app.AverageTemperaturepermonthperyearTab);
            app.YearEditField_2Label.HorizontalAlignment = 'right';
            app.YearEditField_2Label.Position = [351 90 29 22];
            app.YearEditField_2Label.Text = 'Year';

            % Create YearEditField_2
            app.YearEditField_2 = uieditfield(app.AverageTemperaturepermonthperyearTab, 'numeric');
            app.YearEditField_2.Limits = [1859 2019];
            app.YearEditField_2.Position = [395 90 100 22];
            app.YearEditField_2.Value = 1859;

            % Create FindYearButton
            app.FindYearButton = uibutton(app.AverageTemperaturepermonthperyearTab, 'push');
            app.FindYearButton.ButtonPushedFcn = createCallbackFcn(app, @FindYearButtonPushed, true);
            app.FindYearButton.Position = [524 323 100 22];
            app.FindYearButton.Text = 'Find Year';

            % Create FindYearButton_2
            app.FindYearButton_2 = uibutton(app.AverageTemperaturepermonthperyearTab, 'push');
            app.FindYearButton_2.ButtonPushedFcn = createCallbackFcn(app, @FindYearButton_2Pushed, true);
            app.FindYearButton_2.Position = [538 104 100 22];
            app.FindYearButton_2.Text = 'Find Year';

            % Create ZoomOptionLabel
            app.ZoomOptionLabel = uilabel(app.AverageTemperaturepermonthperyearTab);
            app.ZoomOptionLabel.FontWeight = 'bold';
            app.ZoomOptionLabel.Position = [470 135 80 22];
            app.ZoomOptionLabel.Text = 'Zoom Option';

            % Create ZoomOptionLabel_2
            app.ZoomOptionLabel_2 = uilabel(app.AverageTemperaturepermonthperyearTab);
            app.ZoomOptionLabel_2.FontWeight = 'bold';
            app.ZoomOptionLabel_2.Position = [470 352 80 22];
            app.ZoomOptionLabel_2.Text = 'Zoom Option';

            % Create PresstheLoadDatatoseetheAverageTemperatureLabel
            app.PresstheLoadDatatoseetheAverageTemperatureLabel = uilabel(app.AverageTemperaturepermonthperyearTab);
            app.PresstheLoadDatatoseetheAverageTemperatureLabel.FontWeight = 'bold';
            app.PresstheLoadDatatoseetheAverageTemperatureLabel.Position = [321 201 320 22];
            app.PresstheLoadDatatoseetheAverageTemperatureLabel.Text = 'Press the "Load Data" to see the Average Temperature';

            % Create SelectMonthandseethepresstheLoadDataLabel
            app.SelectMonthandseethepresstheLoadDataLabel = uilabel(app.AverageTemperaturepermonthperyearTab);
            app.SelectMonthandseethepresstheLoadDataLabel.FontWeight = 'bold';
            app.SelectMonthandseethepresstheLoadDataLabel.Position = [321 425 285 22];
            app.SelectMonthandseethepresstheLoadDataLabel.Text = 'Select Month and see the press the "Load Data" ';

            % Create ResetFigureButton_2
            app.ResetFigureButton_2 = uibutton(app.AverageTemperaturepermonthperyearTab, 'push');
            app.ResetFigureButton_2.ButtonPushedFcn = createCallbackFcn(app, @ResetFigureButton_2Pushed, true);
            app.ResetFigureButton_2.Position = [537 69 100 22];
            app.ResetFigureButton_2.Text = 'Reset Figure';

            % Create ResetFigureButton
            app.ResetFigureButton = uibutton(app.AverageTemperaturepermonthperyearTab, 'push');
            app.ResetFigureButton.ButtonPushedFcn = createCallbackFcn(app, @ResetFigureButtonPushed, true);
            app.ResetFigureButton.Position = [524 281 100 22];
            app.ResetFigureButton.Text = 'Reset Figure';

            % Create StandardDeviationTab
            app.StandardDeviationTab = uitab(app.TabGroup);
            app.StandardDeviationTab.Title = 'Standard Deviation';

            % Create UIAxes3
            app.UIAxes3 = uiaxes(app.StandardDeviationTab);
            title(app.UIAxes3, 'Title')
            xlabel(app.UIAxes3, 'X')
            ylabel(app.UIAxes3, 'Y')
            zlabel(app.UIAxes3, 'Z')
            app.UIAxes3.XGrid = 'on';
            app.UIAxes3.YGrid = 'on';
            app.UIAxes3.Position = [1 125 637 331];

            % Create LoadDataButton_3
            app.LoadDataButton_3 = uibutton(app.StandardDeviationTab, 'push');
            app.LoadDataButton_3.ButtonPushedFcn = createCallbackFcn(app, @LoadDataButton_3Pushed, true);
            app.LoadDataButton_3.Position = [280 90 100 22];
            app.LoadDataButton_3.Text = 'Load Data';

            % Create ZoomSliderLabel
            app.ZoomSliderLabel = uilabel(app.StandardDeviationTab);
            app.ZoomSliderLabel.HorizontalAlignment = 'right';
            app.ZoomSliderLabel.Position = [62 42 66 22];
            app.ZoomSliderLabel.Text = 'ZoomSlider';

            % Create ZoomSlider_3
            app.ZoomSlider_3 = uislider(app.StandardDeviationTab);
            app.ZoomSlider_3.ValueChangingFcn = createCallbackFcn(app, @ZoomSlider_3ValueChanging, true);
            app.ZoomSlider_3.Position = [149 51 150 3];

            % Create YearEditField_3Label
            app.YearEditField_3Label = uilabel(app.StandardDeviationTab);
            app.YearEditField_3Label.HorizontalAlignment = 'right';
            app.YearEditField_3Label.Position = [462 63 29 22];
            app.YearEditField_3Label.Text = 'Year';

            % Create YearEditField_3
            app.YearEditField_3 = uieditfield(app.StandardDeviationTab, 'numeric');
            app.YearEditField_3.Limits = [1859 2019];
            app.YearEditField_3.Position = [506 63 100 22];
            app.YearEditField_3.Value = 1859;

            % Create FindYearButton_3
            app.FindYearButton_3 = uibutton(app.StandardDeviationTab, 'push');
            app.FindYearButton_3.ButtonPushedFcn = createCallbackFcn(app, @FindYearButton_3Pushed, true);
            app.FindYearButton_3.Position = [351 63 100 22];
            app.FindYearButton_3.Text = 'Find Year';

            % Create ResetFigureButton_3
            app.ResetFigureButton_3 = uibutton(app.StandardDeviationTab, 'push');
            app.ResetFigureButton_3.ButtonPushedFcn = createCallbackFcn(app, @ResetFigureButton_3Pushed, true);
            app.ResetFigureButton_3.Position = [439 20 100 22];
            app.ResetFigureButton_3.Text = 'Reset Figure';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = assignment1

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end
