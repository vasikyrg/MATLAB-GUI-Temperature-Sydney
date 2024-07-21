This is a basic MATLAB programming, with focus on UI design in MATLAB's App Designer. It was written in MATLAB R2024a.
It's a simple UI which gets data from the official website of the Bureau of Meteorology, Australian Government (http://www.bom.gov.au/climate/data). 

EDIT: The dataset that australian government provides has null values at the end of it. For example has data for some months for the year 2020.
This UI has the following customizations:

o Ability to group the temperature data by year averages, as opposed to monthly values.

o Ability to overlay +-1σ (standard deviation) on the annual average, when the user has selected the above annual grouping. That is, if Tm are the monthly 
temperature values for a given year, the plot should display mean(Tm) and also mean(Tm) + std(Tm) & mean(Tm) - std(Tm).

o Ability to zoom around a center value, using custom MATLAB uicontrols and not the built-in zoom/pan interactions.The UI could offer an edit control where 
the user can type a year of interest (around which to zoom) and a slider which could change the zoom, keeping the year of interest centered in the plot.

  ![image](https://github.com/user-attachments/assets/ceb85f84-89da-49ef-b8b0-cf9243f0b7f5)

Version II: The new code provides a cleaner code, more functionallities for the standard_deviation plot (text labels in the graph in order to get easily the std, 
upper bound, lower bound and the temperature), a code for "zoom function" that centers the year and the annual temperature of it and finally a selection unit that 
change the temperature's unit from celsius to fahrenheit.

![image](https://github.com/user-attachments/assets/6d72aed1-d3c8-4e26-8eb1-4faa363ba737)
