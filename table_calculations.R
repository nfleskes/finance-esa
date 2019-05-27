library(data.table)
library(dplyr)
library(reshape2)
setwd("/home/nicole/Documents/Spring 2018/Masters Thesis")

###########################################
## Tables and descriptions
###########################################

# ESA 2010 tables
# 1. nasa_10_nf_tr: Non-financial transactions
# 2. nasa_10_f_cp: Counter party transactions
# 3. nasa_10_f_bs: Financial balance sheet
# 4. nasa_10_f_gl: Revaluation account
# 5. nasa_10_f_oc: Other changes in volume
# 6. nasa_10_f_tr: Financial transactions
# 7. nasa_10_ki: Key indicators
# 8. nama_10_nfa_bs: Non-financial assets

# World Bank tables
# 1. Stkmktcap - Stock Market Capitalization (% of GDP), World Bank Financial Structure Database
# 2. banksize - Deposit Money Bank Assets to GDP (%), World Bank Financial Structure Database.
# 3. gdpdefl - GDP deflator (annual %), World Bank Development Indicators

###########################################
## ESA assumptions
###########################################

# 1. unit = PC_GDP, MIO_NAC; values in millions of national currenct and as a % of country GDP
unit <- c("PC_GDP","MIO_NAC")

# 2. sector = S1 (Total Economy), S11 (Non-Financial Corporations), S12 (Financial Corporations),
  # S13 (General Govt), S14_S15 (Households; non-profit institutions serving households), S2 (Rest of World)
sectors <- c("S1","S11","S12","S13","S14_S15","S2")

# 3. We are only concerned with the following countries:

countries <- c('Austria','Belgium','Estonia','Latvia','Lithuania','Slovakia',
           'Slovenia','Finland','Cyprus','Greece','Italy','Portugal','Spain',
           'France','Germany','Netherlands','Ireland','Luxembourg','Bulgaria','Czechia',
           'Hungary','Poland','Denmark','Sweden','Norway','United Kingdom')

# Read in table with gathered data fields
s <- readRDS('table.rds')
names(s)

#### Account item descriptions
# SFA_per and SFL_per: All financial assets and liabilities (% of GDP)
# SFL3 and SFA3: Debt assets and liabilities
# SFL3_per and SFA3_per: Debt assets and liabilities
# SFL4 and SFA4: Loan assets and liabilities
# SFL4_per and SFA4_per: Loan assets and liabilities (% of GDP)
# SFL5 and SFA5: Equity and investment fund shares, assets and liabilities
# SFL5_per and SFA5_per: Equity and investment fund shares, assets and liabilities (% of GDP)
# fixed: Total fixed assets, non-financial (% of GDP)
# GDP: Gross domestic product (millions of national currency)
# int_paid: Flows of interest paid (millions of national currency)
# divs_paid: Flows of dividends paids  (millions of national currency)
# infl: GDP Deflator
# bank_size: Deposit Money Assets to GDP
# fin_profit_f3l, fin_profit_f3a, fin_profit_f5a, and fin_profit_f5l: Financial profit for debt and equity assets and liabilities
# stkmktcap: Stock Market Capitalization
# st: Short term debt and loans (FL31 + FL41)
# lt: Long term debt and loans (FL32 + FL42)


#### Calculations

s[is.na(s)] <- 0

# Total Debt = FL3 + FL4 
s$total_debt <- s$SFL3 + s$SFL4

# Debt to Value = (FL3 + FL4) / (FL3 + FL4 + FL5)
s$debt_to_value <- s$total_debt / (s$total_debt + s$SFL5)

# Debt to GDP = (FL3 + FL4) / GDP
s$debt_to_gdp <- s$total_debt / s$GDP

# Short term to long term debt
s$stlt <- s$st / s$lt

# Divs paid, % of GDP = divs paid / GDP
s$divs_paid_per <- s$divs_paid / s$GDP

# Fixed assets, % of GDP = fixed / GDP
s$fixed_per <- s$fixed / s$GDP

# Interest paid, % of GDP = int paid / GDP
s$int_paid_per <- s$int_paid / s$GDP

# real implicit interest rate = (int paid / total debt)*100 - infl
s$app_int_rate_real <- ((s$int_paid / s$total_debt) *100) - s$infl

s[s == "Inf"] <- 0
s[s == "-Inf"] <- 0
s[is.na(s)] <- 0

# s <- saveRDS('final.rds')

