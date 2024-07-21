classdef assignment21 < matlab.apps.AppBase

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
        UnitSwitchLabel           matlab.ui.control.Label
        UnitSwitch                matlab.ui.control.Switch
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
            %% Fahrenheit or Celsius
            dataCelsius
            dataFahrenheit
            currentUnit = 'Celsius'
            year
            annual
            %% Other 
            common_xlim2
            common_ylim2
            common_xlim
            common_ylim
            common_xlim3
            common_ylim3
            upper_bound
            lower_bound
            isenabled3
            isenabled2
            isenabled
            
    end
    
    methods (Access = private)
        
        function fahrenheit = convertToFahrenheit(~, celsius)
            fahrenheit = celsius * 9/5 + 32;
        end
        function monthIndex = getMonthIndex(~, monthName)
            months = {'January', 'February', 'March', 'April', 'May', 'June', ...
                      'July', 'August', 'September', 'October', 'November', 'December'};
            monthIndex = find(strcmp(months, monthName));
            if isempty(monthIndex)
                monthIndex = -1; % Return -1 if monthName not found
            end
        end
        function data = getDataForCurrentUnit(app, monthIndex)
            if strcmp(app.currentUnit, 'Celsius')
                data = app.dataCelsius(:, monthIndex);
            else
                data = app.dataFahrenheit(:, monthIndex);
                
            end
         end
        function data = getData(app)
            if strcmp(app.currentUnit, 'Celsius')
                data = app.dataCelsius();
            else
                data = app.dataFahrenheit();
                app.annual = app.convertToFahrenheit(app.annual);
            end
        end
        function applyZoom(~, zoomPercentage, ax, com_xlim, com_ylim, centered_year, interest_year, interest_yeary)
            % Get current axis limits
            xLimits = com_xlim;
            yLimits = com_ylim;

            % Calculate the current range
            xRange = xLimits(2) - xLimits(1);
            yRange = yLimits(2) - yLimits(1);

            % Calculate the new axis limits
            newXRange = xRange / zoomPercentage;
            newYRange = yRange / zoomPercentage;
            if centered_year == true
                % Use the centered year as the center
                xCenter = interest_year;
                yCenter = interest_yeary;
            else
                % Use the centered year as the center
                xCenter = (xLimits(2) + xLimits(1)) / 2;
                yCenter = (yLimits(2) + yLimits(1)) / 2;
                
            end
            % Calculate the new limits ensuring the second element is greater than the first
                newXLim = [xCenter - newXRange / 2, xCenter + newXRange / 2];
                newYLim = [yCenter - newYRange / 2, yCenter + newYRange / 2];
    
                % Set the new axis limits
                ax.XLim = newXLim;
                ax.YLim = newYLim;
            
            % Ensure new limits do not exceed original limits
            if newXLim(1) < com_xlim(1)
                ax.XLim = com_xlim;
            end
            if newYLim(1) < com_ylim(1)
                ax.YLim = com_ylim;
            end
            
        end
        function updateMousePosition(app, ~, ~)
            % Get current mouse position
            currentPoint = app.UIAxes3.CurrentPoint;
            mouseX = currentPoint(1,1);
            mouseY = currentPoint(1,2);
            
            % Get plot limits
            xLimits = get(app.UIAxes3, 'XLim');
            yLimits = get(app.UIAxes3, 'YLim');
            
            % Check if the mouse is inside the plot area
            if mouseX >= xLimits(1) && mouseX <= xLimits(2) && mouseY >= yLimits(1) && mouseY <= yLimits(2)
                % Find the closest year in the data based on mouseX
                [~, index] = min(abs(app.year - mouseX));
                selectedYear = app.year(index);
                selectedTemperature = app.annual(index);
                upper_bound_selected = app.upper_bound(index);
                lower_bound_selected = app.lower_bound(index);

                % Clear existing text annotations
                delete(findall(app.UIAxes3, 'Type', 'text'));
                
                % Display the information on the plot
                text(app.UIAxes3, selectedYear, selectedTemperature, ...
                    sprintf('Year: %d\nTemp: %.2f\nRange: %.2f - %.2f', ...
                    selectedYear, selectedTemperature, upper_bound_selected, lower_bound_selected), ...
                    'BackgroundColor', 'White', 'EdgeColor', 'blue');
            else
                % If mouse is outside, clear text annotations (optional)
                delete(findall(app.UIAxes3, 'Type', 'text'));
            end
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
              data = readtable('IDCJAC0002_066062_Data12.csv');
              app.dataCelsius = data{:, 4:15};
              app.annual = data.Annual;
              app.year = data.Year;
              app.dataFahrenheit = app.convertToFahrenheit(app.dataCelsius);
              app.SelectMonthDropDown.Value = 'January';
              
        end

        % Button pushed function: LoadDataButton
        function LoadDataButtonPushed(app, event)
            
            selectedMonth = app.SelectMonthDropDown.Value;
            monthIndex = app.getMonthIndex(selectedMonth);
            data = app.getDataForCurrentUnit(monthIndex);
            
            plot(app.UIAxes, app.year, data);
            xlabel(app.UIAxes,'Year');
            ylabel(app.UIAxes, selectedMonth);
            xlim(app.UIAxes, [app.year(1), app.year(length(app.year))]);
            
            disableDefaultInteractivity(app.UIAxes)
            app.UIAxes.Toolbar.Visible = 'off'; 
            app.common_ylim = get(app.UIAxes, 'YLim');
            app.common_xlim = get(app.UIAxes, 'XLim');
            
        end

        % Button pushed function: LoadDataButton_2
        function LoadDataButton_2Pushed(app, event)
            %% Find the average
           app.startupFcn();
           average_per_year = mean(app.getData, 2);
           plot(app.UIAxes2,app.year,average_per_year);
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
           std_per_year = std(app.getData,0,2);
           app.upper_bound = app.annual + std_per_year;
           app.lower_bound = app.annual - std_per_year;
           
           plot(app.UIAxes3, app.year, app.annual, '-o', 'LineWidth', 2, 'DisplayName', 'Mean Tm');
           hold(app.UIAxes3, 'on');
           
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
           
           % Set the WindowButtonMotionFcn callback to update mouse position
           app.UIFigure.WindowButtonMotionFcn = @(src, event) updateMousePosition(app, src, event);
        end

        % Button pushed function: FindYearButton_2
        function FindYearButton_2Pushed(app, event)
           app.isenabled2 = true;
            for i=1:1:length(app.year)
                if app.YearEditField_2.Value == app.year(i)
                    if app.YearEditField_2.Value == app.year(end)
                        app.common_xlim2 = [app.year(i-1), app.year(i)]; 
                    elseif app.YearEditField_2.Value == app.year(1)
                        app.common_xlim2 = [app.year(i), app.year(i+1)];  
                    else
                        app.common_xlim2 = [app.year(i-1), app.year(i+1)]; 
                    end 
                    set(app.UIAxes2, 'XLim', app.common_xlim2);
                end
            end
        end

        % Button pushed function: ResetFigureButton_2
        function ResetFigureButton_2Pushed(app, event)
            app.LoadDataButton_2Pushed();
        end

        % Value changing function: ZoomSlider_2
        function ZoomSlider_2ValueChanging(app, event)
            zoomPercentage = event.Value;
            if app.isenabled2
                app.applyZoom(zoomPercentage, app.UIAxes2, app.common_xlim2, app.common_ylim2, true, app.YearEditField_2.Value, interp1(app.year, mean(app.getData, 2), app.YearEditField_2.Value));
            else
                app.applyZoom(zoomPercentage, app.UIAxes2, app.common_xlim2, app.common_ylim2, false);
            end
        end

        % Button pushed function: ResetFigureButton_3
        function ResetFigureButton_3Pushed(app, event)
            app.LoadDataButton_3Pushed();
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
                end
            end
        end

        % Value changing function: ZoomSlider_3
        function ZoomSlider_3ValueChanging(app, event)
            zoomPercentage = event.Value;
            if app.isenabled3
                std_per_year = std(app.getData,0,2);
                app.applyZoom(zoomPercentage, app.UIAxes3, app.common_xlim3, app.common_ylim3, true, app.YearEditField_3.Value, interp1(app.year, std_per_year, app.YearEditField.Value));
            else
                app.applyZoom(zoomPercentage, app.UIAxes3, app.common_xlim3, app.common_ylim3, false);
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
                end
            end
        end

        % Button pushed function: ResetFigureButton
        function ResetFigureButtonPushed(app, event)
            app.LoadDataButtonPushed();
        end

        % Value changing function: ZoomSlider
        function ZoomSliderValueChanging(app, event)
            zoomPercentage = event.Value;
            if app.isenabled
                selectedMonth = app.SelectMonthDropDown.Value;
                monthIndex = app.getMonthIndex(selectedMonth);
                data = app.getDataForCurrentUnit(monthIndex);
                app.applyZoom(zoomPercentage, app.UIAxes, app.common_xlim, app.common_ylim, true, app.YearEditField.Value, interp1(app.year, data, app.YearEditField.Value));
            else
                app.applyZoom(zoomPercentage, app.UIAxes, app.common_xlim, app.common_ylim, false);
            end
        end

        % Value changed function: UnitSwitch
        function UnitSwitchValueChanged(app, event)
            value = app.UnitSwitch.Value;
            
            if strcmp(value, 'Fahrenheit') && strcmp(app.currentUnit, 'Celsius')
                % Convert data to Fahrenheit
                app.dataFahrenheit = app.convertToFahrenheit(app.dataCelsius);
                app.currentUnit = 'Fahrenheit';
            elseif strcmp(value, 'Celsius') && strcmp(app.currentUnit, 'Fahrenheit')
                % Convert data back to Celsius
                % No conversion needed here as we keep the original Celsius data
                app.currentUnit = 'Celsius';
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

            % Create UnitSwitchLabel
            app.UnitSwitchLabel = uilabel(app.AverageTemperaturepermonthperyearTab);
            app.UnitSwitchLabel.HorizontalAlignment = 'center';
            app.UnitSwitchLabel.Position = [150 208 27 22];
            app.UnitSwitchLabel.Text = 'Unit';

            % Create UnitSwitch
            app.UnitSwitch = uiswitch(app.AverageTemperaturepermonthperyearTab, 'slider');
            app.UnitSwitch.Items = {'Celsius', 'Fahrenheit'};
            app.UnitSwitch.ValueChangedFcn = createCallbackFcn(app, @UnitSwitchValueChanged, true);
            app.UnitSwitch.Position = [141 229 45 20];
            app.UnitSwitch.Value = 'Celsius';

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
        function app = assignment21

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
