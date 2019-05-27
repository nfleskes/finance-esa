# The Financial Structure Landscape of Europe
Nicole Fleskes

Master Thesis Advisor: Luis Reyes

Université Paris 1 Panthéon-Sorbonne

Pantheon-Sorbonne Master in Economics Thesis

May 27, 2019


The online version of the paper can be found here: http://rpubs.com/nfleskes/PSMEthesis

The appendix for this paper can be found here: http://rpubs.com/nfleskes/PSMEthesisappendix

#### Abstract: 

This paper analyzes the capital structure and financial structure of European financial and non-financial firms, focusing on the country level determinants under a macroeconomic perspective using key capital structure ratios and financial structure indicators, such as Debt-to-GDP, Debt-to-Value, and the ratio of short-term to long-term debt. Using country level data from the European System of Accounts 2010 for a sample of 23 European countries from 1995-2017, I find that countries have differing relationships with the determinants of capital structure depending on market-orientation, financial development, and macroeconomic conditions. Anglo-Saxon market-oriented countries like the United Kingdom and to some extent the Netherlands are characterized by the increased importance of equity and their exposure to equity volatility, and tend to de-leverage more during times of economic distress. Germanic bank-oriented countries such as Germany and Austria generally keep low but stable levels of debt and longer term debt despite macroeconomic conditions. Latinic network-oriented countries like France, Spain, Italy, Portugal tend to have more public debt and have a more ambiguous relationship with macroeconomic conditions. Norway displays many characteristics of a Germanic bank-oriented economy, and Sweden, Denmark, and Finland show a stronger relationship with equity than Latinic network-oriented and Germanic bank-oriented countries, but less than Anglo-Saxon market-oriented countries. For Eastern and Central European countries, history, politics, and level of financial development play more of a role than legal system or banking tradition. Furthermore, I find that macroeconomic conditions can either reduce or emphasize country level differences in the key capital structure ratios and indicators.
	

## Figures

All figures used in the paper are contained in the Graphs folder

## Data Tables
1. Pearson pairwise correlations for D/GDP, D/VAL, and ST/LT for each country and sector throughout the sample time period. Correlations significant at the 5% level are highlighted in green.
2. Price Indices: Contains the indexed prices of debt and equity security liabilities for both the financial and non-financial sectors. Indexed to 2015.
5. Final: Contains the final data table used in the creation of figures and correlations
4. Key Years: Contains a smaller subsample of the final dataset for easier viewing. Data is included from 1995, 2000, 2005, 2010, and 2015 for the following variables for all countries in the sample:
```
Real Implicit Interest Rate
Debt to GDP
Debt to Value
Financial Profitability
Financial Assets, % of GDP
Financial Liabilities, % of GDP
Stock Market Capitalization (Value of Publicly Trade Shares, % of GDP)
Deposit Money Bank Assets to GDP (%)
Total Fixed Assets (Net) % of GDP
Short Term to Long Term Debt

```

## R Files
R-version: 3.4.4

1. table_calculations: Contains the calcualtions and code used produce the final.csv file
Libraries:
```
data.table
dplyr
reshape2
```

2. correlation_tables.R: Contains the code to produce the correlation tables as found in the Correlation Tables folder.
Libraries:
```
data.table
dplyr
Hmisc
```

## STATA Files
STATA version: 15

1. timesseries_analysis.do: Contains the Augmented Dickey Fuller tests for the following variables for a subsample of countries:
```
Debt to Value
Debt to GDP
GDP
Banking sector size
Interest paid, % of GDP
Net fixed assets, % of GDP
Real implicit interest rate
Stock market capitalization, % of GDP
```

