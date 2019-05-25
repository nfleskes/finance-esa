****************
clear mata
capture log close
clear all
cd "/home/nicole/Documents/Spring 2018/Masters Thesis/"
set more off
****************

***Import Data***
// This data only includes countries with complete fixed_per fields
use "thesis.dta"
egen group = group(geo)
xtset group year

gen ldval = log(debt_to_value)
gen lgdp = log(gdp)
gen lbank = log(bank_size)
gen lintpaid = log(int_paid_per)
gen lfixed = log(fixed_per)
gen lappint = log(app_int_rate)
gen lstk = log(stkmktcap)
gen ldgdp = log(debt_to_gdp)
bysort group (year): gen Ddval = D1.debt_to_value
bysort group (year): gen Dldval = D1.ldval
bysort group (year): gen Dlgdp = D1.lgdp
bysort group (year): gen Dbank = D1.bank_size
bysort group (year): gen Dlbank = D1.lbank
bysort group (year): gen D2bank = D2.bank_size
bysort group (year): gen D2lbank = D2.lbank
bysort group (year): gen Dintpaid = D1.int_paid_per
bysort group (year): gen Dlintpaid = D1.lintpaid
bysort group (year): gen Dfixed = D1.fixed_per
bysort group (year): gen Dlfixed = D1.lfixed
bysort group (year): gen D2fixed = D2.fixed_per
bysort group (year): gen D2lfixed = D2.lfixed
bysort group (year): gen Dappint = D1.app_int_rate
bysort group (year): gen Dlappint = D1.lappint
bysort group (year): gen Dstk = D1.stkmktcap
bysort group (year): gen Dlstk = D1.lstk
bysort group (year): gen Ddgdp = D1.debt_to_gdp
bysort group (year): gen Dldgdp = D1.ldgdp
bysort group (year): gen LDdgdp = L1.Ddgdp
bysort group (year): gen Ldval = L1.debt_to_value
bysort group (year): gen Ldgdp = L1.debt_to_gdp

*** Country Level Regressions ***

// Western and Central
******************************************************************************************
* 1. France* (9)
******************************************************************************************

// Variables
* debt_to_value = level
dfuller debt_to_value if group == 9, trend regress // trend not sig
dfuller debt_to_value if group == 9, regress // cons sig, 
*CCL: t stat < t crit
*we reject H0 and have a stationary process
//dfuller debt_to_value if group == 9, nocons regress //

* gdp = dlgdp
dfuller lgdp if group == 9, trend regress // trend not sig
dfuller lgdp if group == 9, regress // cons sig, 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process
//dfuller lgdp if group == 9, nocons regress //

dfuller Dlgdp if group == 9, trend regress // trend not sig
dfuller Dlgdp if group == 9, regress // cons sig, 
*CCL: t stat < t crit
*we reject H0 and have a stationary process
//dfuller lgdp if group == 9, nocons regress //

* bank_size = dlbank
dfuller bank_size if group == 9, trend regress // trend not sig
dfuller bank_size if group == 9, regress // cons not sig 
dfuller bank_size if group == 9, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lbank if group == 9, trend regress // trend not sig
dfuller lbank if group == 9, regress // cons not sig
dfuller lbank if group == 9, nocons regress // cons not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dbank if group == 9, trend regress // trend not sig
dfuller Dbank if group == 9, regress // cons not sig
dfuller Dbank if group == 9, nocons regress // cons not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dlbank if group == 9, trend regress // trend not sig
dfuller Dlbank if group == 9, regress // cons not sig
dfuller Dlbank if group == 9, nocons regress // cons not sig
*CCL: t stat < t crit
*we reject H0 and have a stationary process

*int_paid_per = dintpaid
dfuller int_paid_per if group == 9, trend regress // trend not sig
dfuller int_paid_per if group == 9, regress // cons not sig, 
dfuller int_paid_per if group == 9, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lintpaid if group == 9, trend regress // trend not sig
dfuller lintpaid if group == 9, regress // cons not sig, 
dfuller lintpaid if group == 9, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dintpaid if group == 9, trend regress // trend not sig
dfuller Dintpaid if group == 9, regress // cons not sig, 
dfuller Dintpaid if group == 9, nocons regress //
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* fixed_per = Dfixed
dfuller fixed_per if group == 9, trend regress // trend not sig
dfuller fixed_per if group == 9, regress // cons not sig, 
dfuller fixed_per if group == 9, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lfixed if group == 9, trend regress // trend not sig
dfuller lfixed if group == 9, regress // cons not sig, 
dfuller lfixed if group == 9, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dfixed if group == 9, trend regress // trend not sig
dfuller Dfixed if group == 9, regress // cons sig, 
*CCL: t stat < t crit
*we reject H0 and have a stationary process


* app_int_rate = dappint

dfuller app_int_rate if group == 9, trend regress // trend sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lappint if group == 9, trend regress // trend sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dappint if group == 9, trend regress // trend not sig
dfuller Dappint if group == 9, regress // cons not sig, 
dfuller Dappint if group == 9, nocons regress //
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* stkmktcap = Dstk
dfuller stkmktcap if group == 9, trend regress // trend not sig
dfuller stkmktcap if group == 9, regress // cons sig, 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lstk if group == 9, trend regress // trend not sig
dfuller lstk if group == 9, regress // cons sig, 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dstk if group == 9, trend regress // trend not sig
dfuller Dstk if group == 9, regress // cons not sig, 
dfuller Dstk if group == 9, nocons regress //
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* debt to gdp = Ddgdp
dfuller debt_to_gdp if group == 9, trend regress // trend sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller ldgdp if group == 9, trend regress // trend sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Ddgdp if group == 9, trend regress // trend not sig
dfuller Ddgdp if group == 9, regress // cons sig, 
*CCL: t stat < t crit
*we reject H0 and have a stationary process

// Stationary variables to use
* debt_to_value = level
* gdp = Dlgdp
* bank_size = Dlbank
* int_paid_per = Dintpaid
* fixed_per = Dfixed
* app_int_rate = dappint
* stkmktcap = Dstk
* debt_to_gdp = Ddgdp

regress debt_to_value Dlgdp Dlbank Dintpaid Dfixed Dappint Dstk Ddgdp if group == 9
estat vif // we're ok
estat hettest // pval > .05, fail reject the null that there is constant variance
estimates store fr

******************************************************************************************
* 2. Netherlands* (18)
******************************************************************************************

// Variables
* debt_to_value = Dldval
dfuller debt_to_value if group == 18, trend regress // trend not sig
dfuller debt_to_value if group == 18, regress // cons not sig, 
dfuller debt_to_value if group == 18, nocons regress //  
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller ldval if group == 18, trend regress // trend not sig
dfuller ldval if group == 18, regress // cons not sig, 
dfuller ldval if group == 18, nocons regress // 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Ddval if group == 18, trend regress // trend not sig
dfuller Ddval if group == 18, regress // cons not sig, 
dfuller Ddval if group == 18, nocons regress // 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dldval if group == 18, trend regress // trend not sig
dfuller Dldval if group == 18, regress // cons not sig, 
dfuller Dldval if group == 18, nocons regress // 
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* gdp = dlgdp
dfuller lgdp if group == 18, trend regress // trend not sig
dfuller lgdp if group == 18, regress // cons sig, 
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* bank_size = lbank
dfuller bank_size if group == 18, trend regress // trend not sig
dfuller bank_size if group == 18, regress // cons not sig 
dfuller bank_size if group == 18, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lbank if group == 18, trend regress // trend not sig
dfuller lbank if group == 18, regress // cons sig
*CCL: t stat < t crit
*we reject H0 and have a stationary process


*int_paid_per = dintpaid
dfuller int_paid_per if group == 18, trend regress // trend not sig
dfuller int_paid_per if group == 18, regress // cons sig, 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lintpaid if group == 18, trend regress // trend not sig
dfuller lintpaid if group == 18, regress // cons sig, 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dintpaid if group == 18, trend regress // trend not sig
dfuller Dintpaid if group == 18, regress // cons not sig, 
dfuller Dintpaid if group == 18, nocons regress //
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* fixed_per = Dfixed
dfuller fixed_per if group == 18, trend regress // trend not sig
dfuller fixed_per if group == 18, regress // cons sig, 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lfixed if group == 18, trend regress // trend not sig
dfuller lfixed if group == 18, regress // cons sig, 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dfixed if group == 18, trend regress // trend not sig
dfuller Dfixed if group == 18, regress // cons not sig, 
dfuller Dfixed if group == 18, nocons regress //  
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* app_int_rate = lappint

dfuller app_int_rate if group == 18, trend regress // trend not sig
dfuller app_int_rate if group == 18, regress // cons not sig
dfuller app_int_rate if group == 18, nocons regress // 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lappint if group == 18, trend regress // trend not sig
dfuller lappint if group == 18, regress  // cons not sig
dfuller lappint if group == 18, nocons regress 
*CCL: t stat < t crit
*we reject H0 and have a stationary process


* stkmktcap = Dstk
dfuller stkmktcap if group == 18, trend regress // trend not sig
dfuller stkmktcap if group == 18, regress // cons not sig, 
dfuller stkmktcap if group == 18, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lstk if group == 18, trend regress // trend not sig
dfuller lstk if group == 18, regress // cons not sig, 
dfuller lstk if group == 18, nocons regress 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dstk if group == 18, trend regress // trend not sig
dfuller Dstk if group == 18, regress // cons not sig, 
dfuller Dstk if group == 18, nocons regress //
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* debt to gdp = Dldgdp
dfuller debt_to_gdp if group == 18, trend regress // trend sig
dfuller debt_to_gdp if group == 18, regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller ldgdp if group == 18, trend regress // trend sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Ddgdp if group == 18, trend regress // trend not sig
dfuller Ddgdp if group == 18, regress // cons not sig, 
dfuller Ddgdp if group == 18, nocons regress 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dldgdp if group == 18, trend regress // trend not sig
dfuller Dldgdp if group == 18, regress // cons not sig, 
dfuller Dldgdp if group == 18, nocons regress 
*CCL: t stat < t crit
*we reject H0 and have a stationary process

// Stationary variables to use
* debt_to_value = Dldval
* gdp = lgdp
* bank_size = lbank
* int_paid_per = Dintpaid
* fixed_per = Dfixed
* app_int_rate = lappint
* stkmktcap = Dstk
* debt to gdp = Dldgdp


regress debt_to_value lgdp lbank Dintpaid Dfixed lappint Dstk Dldgdp if group == 18
estat vif // we're ok
estat hettest // pval > .05, fail reject the null that there is constant variance
estimates store nl

******************************************************************************************
* 3. United Kingdom* (26)
******************************************************************************************

// Variables
* debt_to_value = Ddval
dfuller debt_to_value if group == 26, trend regress // trend not sig
dfuller debt_to_value if group == 26, regress
dfuller debt_to_value if group == 26, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller ldval if group == 26, trend regress // trend not sig
dfuller ldval if group == 26, regress // cons not sig, 
dfuller ldval if group == 26, nocons regress // 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Ddval if group == 26, trend regress // trend not sig
dfuller Ddval if group == 26, regress // cons not sig, 
dfuller Ddval if group == 26, nocons regress // 
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* gdp = dlgdp
dfuller lgdp if group == 26, trend regress // trend not sig
dfuller lgdp if group == 26, regress // cons sig, 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dlgdp if group == 26, trend regress // trend not sig
dfuller Dlgdp if group == 26, regress // cons sig, 
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* bank_size = D2lbank
dfuller bank_size if group == 26, trend regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lbank if group == 26, trend regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dbank if group == 26, trend regress // trend not sig
dfuller Dbank if group == 26, regress // cons not sig
dfuller Dbank if group == 26, nocons regress 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dlbank if group == 26, trend regress // trend not sig
dfuller Dlbank if group == 26, regress // cons not sig
dfuller Dlbank if group == 26, nocons regress // cons not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller D2bank if group == 26, trend regress // trend not sig
dfuller D2bank if group == 26, regress // cons not sig
dfuller D2bank if group == 26, nocons regress 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller D2lbank if group == 26, trend regress // trend not sig
dfuller D2lbank if group == 26, regress // cons not sig
dfuller D2lbank if group == 26, nocons regress 
*CCL: t stat < t crit
*we reject H0 and have a stationary process


*int_paid_per = dintpaid
dfuller int_paid_per if group == 26, trend regress // trend not sig
dfuller int_paid_per if group == 26, regress // cons not sig, 
dfuller int_paid_per if group == 26, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lintpaid if group == 26, trend regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dintpaid if group == 26, trend regress // trend not sig
dfuller Dintpaid if group == 26, regress // cons not sig, 
dfuller Dintpaid if group == 26, nocons regress //
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* fixed_per = Dfixed
dfuller fixed_per if group == 26, trend regress // trend not sig
dfuller fixed_per if group == 26, regress // 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lfixed if group == 26, trend regress // trend not sig
dfuller lfixed if group == 26, regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dfixed if group == 26, trend regress // trend not sig
dfuller Dfixed if group == 26, regress // 
dfuller Dfixed if group == 26, nocons regress // 
*CCL: t stat < t crit
*we reject H0 and have a stationary process


* app_int_rate = level

dfuller app_int_rate if group == 26, trend regress // trend sig
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* stkmktcap = Dstk
dfuller stkmktcap if group == 26, trend regress // trend not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lstk if group == 26, trend regress // trend not sig
dfuller lstk if group == 26, regress // cons sig, 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dstk if group == 26, trend regress // trend not sig
dfuller Dstk if group == 26, regress // cons not sig, 
dfuller Dstk if group == 26, nocons regress //
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* debt to gdp = ldgdp
dfuller debt_to_gdp if group == 26, trend regress // trend sig
dfuller debt_to_gdp if group == 26, regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller ldgdp if group == 26, trend regress // trend sig
dfuller ldgdp if group == 26, regress
dfuller ldgdp if group == 26, nocons regress

*CCL: t stat < t crit
*we reject H0 and have a stationary process

// Stationary variables to use
* debt_to_value = Ddval
* gdp = Dlgdp
* bank_size = D2lbank
* int_paid_per = Dintpaid
* fixed_per = Dfixed
* app_int_rate = level
* stkmktcap = Dstk
* debt to gdp = ldgdp


regress Ddval Dlgdp D2lbank Dintpaid Dfixed app_int_rate Dstk ldgdp if group == 26
estat vif // we're ok
estat hettest // pval > .05, fail reject the null that there is constant variance
estimates store uk

******************************************************************************************
* 4. Austria (1)
******************************************************************************************

// Variables
* debt_to_value = Ddval
dfuller debt_to_value if group == 1, trend regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller ldval if group == 1, trend regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Ddval if group == 1, trend regress
dfuller Ddval if group == 1, regress
dfuller Ddval if group == 1, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process


* gdp = dlgdp
dfuller lgdp if group == 1, trend regress // trend not sig
dfuller lgdp if group == 1, regress
dfuller lgdp if group == 1, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process


dfuller Dlgdp if group == 1, trend regress // trend not sig
dfuller Dlgdp if group == 1, regress // cons sig, 
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* bank_size = dbank
dfuller bank_size if group == 1, trend regress // trend not sig
dfuller bank_size if group == 1, regress // cons not sig 
dfuller bank_size if group == 1, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lbank if group == 1, trend regress // trend not sig
dfuller lbank if group == 1, regress // cons not sig
dfuller lbank if group == 1, nocons regress // cons not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dbank if group == 1, trend regress // trend not sig
dfuller Dbank if group == 1, regress // cons not sig
dfuller Dbank if group == 1, nocons regress // cons not sig
*CCL: t stat < t crit
*we reject H0 and have a stationary process

*int_paid_per = dintpaid
dfuller int_paid_per if group == 1, trend regress // trend not sig
dfuller int_paid_per if group == 1, regress // cons not sig, 
dfuller int_paid_per if group == 1, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lintpaid if group == 1, trend regress // trend not sig
dfuller lintpaid if group == 1, regress // cons not sig, 
dfuller lintpaid if group == 1, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dintpaid if group == 1, trend regress // trend not sig
dfuller Dintpaid if group == 1, regress // cons not sig, 
dfuller Dintpaid if group == 1, nocons regress //
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* fixed_per = Dfixed
dfuller fixed_per if group == 1, trend regress // trend not sig
dfuller fixed_per if group == 1, regress // cons not sig, 
dfuller fixed_per if group == 1, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lfixed if group == 1, trend regress // trend not sig
dfuller lfixed if group == 1, regress // cons not sig, 
dfuller lfixed if group == 1, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dfixed if group == 1, trend regress // trend not sig
dfuller Dfixed if group == 1, regress
dfuller Dfixed if group == 1, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process


* app_int_rate = dappint

dfuller app_int_rate if group == 1, trend regress // trend sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lappint if group == 1, trend regress
dfuller lappint if group == 1, regress
dfuller lappint if group == 1, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dappint if group == 1, trend regress // trend not sig
dfuller Dappint if group == 1, regress // cons not sig, 
dfuller Dappint if group == 1, nocons regress //
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* stkmktcap = Dstk
dfuller stkmktcap if group == 1, trend regress // trend not sig
dfuller stkmktcap if group == 1, regress // 
dfuller stkmktcap if group == 1, nocons regress 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lstk if group == 1, trend regress // trend not sig
dfuller lstk if group == 1, regress // cons sig, 
dfuller lstk if group == 1, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dstk if group == 1, trend regress // trend not sig
dfuller Dstk if group == 1, regress // cons not sig, 
dfuller Dstk if group == 1, nocons regress //
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* debt to gdp = Ddgdp
dfuller debt_to_gdp if group == 1, trend regress
dfuller debt_to_gdp if group == 1, regress 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller ldgdp if group == 1, trend regress
dfuller ldgdp if group == 1, regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Ddgdp if group == 1, trend regress // trend not sig
dfuller Ddgdp if group == 1, regress
dfuller Ddgdp if group == 1, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process

// Stationary variables to use
* debt_to_value = Ddval
* gdp = Dlgdp
* bank_size = Dbank
* int_paid_per = Dintpaid
* fixed_per = Dfixed
* app_int_rate = dappint
* stkmktcap = Dstk
* debt_to_gdp = Ddgdp

regress Ddval Dlgdp Dbank Dintpaid Dfixed Dappint Dstk Ddgdp if group == 1
estat vif // we're ok
estat hettest // pval < .05, reject the null that there is not constant variance. need to control for HSK
regress Ddval Dlgdp Dbank Dintpaid Dfixed Dappint Dstk Ddgdp if group == 1, robust
estat vif // we're ok
estimates store at

******************************************************************************************
* 5. Belgium (2)
******************************************************************************************

*************************************************************************************

// Variables
* debt_to_value = Ddval
dfuller debt_to_value if group == 2, trend regress
dfuller debt_to_value if group == 2, regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller ldval if group == 2, trend regress
dfuller ldval if group == 2, regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Ddval if group == 2, trend regress
dfuller Ddval if group == 2, regress
dfuller Ddval if group == 2, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process


* gdp = dlgdp
dfuller lgdp if group == 2, trend regress // trend not sig
dfuller lgdp if group == 2, regress
dfuller lgdp if group == 2, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process


dfuller Dlgdp if group == 2, trend regress // trend not sig
dfuller Dlgdp if group == 2, regress // cons sig, 
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* bank_size = level
dfuller bank_size if group == 2, trend regress // trend not sig
dfuller bank_size if group == 2, regress // cons not sig 
dfuller bank_size if group == 2, nocons regress //
*CCL: t stat < t crit
*we reject H0 and have a stationary process

*int_paid_per = dintpaid
dfuller int_paid_per if group == 2, trend regress // trend not sig
dfuller int_paid_per if group == 2, regress // cons not sig, 
dfuller int_paid_per if group == 2, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lintpaid if group == 2, trend regress // trend not sig
dfuller lintpaid if group == 2, regress // cons not sig, 
dfuller lintpaid if group == 2, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dintpaid if group == 2, trend regress // trend not sig
dfuller Dintpaid if group == 2, regress // cons not sig, 
dfuller Dintpaid if group == 2, nocons regress //
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* fixed_per = Dfixed
dfuller fixed_per if group == 2, trend regress // trend not sig
dfuller fixed_per if group == 2, regress // cons not sig, 
dfuller fixed_per if group == 2, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lfixed if group == 2, trend regress // trend not sig
dfuller lfixed if group == 2, regress // cons not sig, 
dfuller lfixed if group == 2, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dfixed if group == 2, trend regress // trend not sig
dfuller Dfixed if group == 2, regress
dfuller Dfixed if group == 2, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process


* app_int_rate = dappint

dfuller app_int_rate if group == 2, trend regress // trend sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lappint if group == 2, trend regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dappint if group == 2, trend regress // trend not sig
dfuller Dappint if group == 2, regress // cons not sig, 
dfuller Dappint if group == 2, nocons regress //
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* stkmktcap = Dstk
dfuller stkmktcap if group == 2, trend regress // trend not sig
dfuller stkmktcap if group == 2, regress // 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lstk if group == 2, trend regress // trend not sig
dfuller lstk if group == 2, regress // cons sig, 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dstk if group == 2, trend regress // trend not sig
dfuller Dstk if group == 2, regress // cons not sig, 
dfuller Dstk if group == 2, nocons regress //
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* debt to gdp = Ddgdp
dfuller debt_to_gdp if group == 2, trend regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller ldgdp if group == 2, trend regress
dfuller ldgdp if group == 2, regress
dfuller ldgdp if group == 2, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Ddgdp if group == 2, trend regress // trend not sig
dfuller Ddgdp if group == 2, regress
dfuller Ddgdp if group == 2, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process

// Stationary variables to use
* debt_to_value = Ddval
* gdp = Dlgdp
* bank_size = level
* int_paid_per = Dintpaid
* fixed_per = Dfixed
* app_int_rate = dappint
* stkmktcap = Dstk
* debt_to_gdp = Ddgdp

regress Ddval Dlgdp bank_size Dintpaid Dfixed Dappint Dstk Ddgdp if group == 2
estat vif // we're ok
estat hettest // pval < .05, reject the null that there is not constant variance. need to control for HSK
estimates store be

******************************************************************************************
* 6. Germany (10)
******************************************************************************************
*************************************************************************************

// Variables
* debt_to_value = Ddval
dfuller debt_to_value if group == 10, trend regress
dfuller debt_to_value if group == 10, regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller ldval if group == 10, trend regress
dfuller ldval if group == 10, regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Ddval if group == 10, trend regress
dfuller Ddval if group == 10, regress
dfuller Ddval if group == 10, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process


* gdp = dlgdp
dfuller lgdp if group == 10, trend regress // trend not sig
dfuller lgdp if group == 10, regress
dfuller lgdp if group == 10, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process


dfuller Dlgdp if group == 10, trend regress // trend not sig
dfuller Dlgdp if group == 10, regress // cons sig, 
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* bank_size = lbank
dfuller bank_size if group == 10, trend regress // trend not sig
dfuller bank_size if group == 10, regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lbank if group == 10, trend regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process

*int_paid_per = level
dfuller int_paid_per if group == 10, trend regress // trend not sig
dfuller int_paid_per if group == 10, regress // cons not sig, 
dfuller int_paid_per if group == 10, nocons regress //
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* fixed_per = Dfixed
dfuller fixed_per if group == 10, trend regress // trend not sig
dfuller fixed_per if group == 10, regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lfixed if group == 10, trend regress // trend not sig
dfuller lfixed if group == 10, regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dfixed if group == 10, trend regress // trend not sig
dfuller Dfixed if group == 10, regress
dfuller Dfixed if group == 10, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process


* app_int_rate = level

dfuller app_int_rate if group == 10, trend regress // trend sig
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* stkmktcap = Dstk
dfuller stkmktcap if group == 10, trend regress // trend not sig
dfuller stkmktcap if group == 10, regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lstk if group == 10, trend regress // trend not sig
dfuller lstk if group == 10, regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dstk if group == 10, trend regress // trend not sig
dfuller Dstk if group == 10, regress // cons not sig, 
dfuller Dstk if group == 10, nocons regress //
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* debt to gdp = Ddgdp
dfuller debt_to_gdp if group == 10, trend regress
dfuller debt_to_gdp if group == 10, regress 
dfuller debt_to_gdp if group == 10, nocons regress 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller ldgdp if group == 10, trend regress
dfuller ldgdp if group == 10, regress
dfuller ldgdp if group == 10, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Ddgdp if group == 10, trend regress // trend not sig
dfuller Ddgdp if group == 10, regress
dfuller Ddgdp if group == 10, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process

// Stationary variables to use
* debt_to_value = Ddval
* gdp = Dlgdp
* bank_size = lbank
* int_paid_per = level
* fixed_per = Dfixed
* app_int_rate = level
* stkmktcap = Dstk
* debt_to_gdp = Ddgdp

regress Ddval Dlgdp lbank int_paid_per Dfixed app_int_rate Dstk Ddgdp if group == 10
estat vif // int paid per and lbank are collinear, so we remove

regress Ddval Dlgdp Dfixed app_int_rate Dstk Ddgdp if group == 10
estat vif //ok
estat hettest //ok
estimates store de

// Northern
******************************************************************************************
* 1. Norway* (19)
******************************************************************************************

// Variables
* debt_to_value = Ddval
dfuller debt_to_value if group == 19, trend regress
dfuller debt_to_value if group == 19, regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller ldval if group == 19, trend regress
dfuller ldval if group == 19, regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Ddval if group == 19, trend regress
dfuller Ddval if group == 19, regress
dfuller Ddval if group == 19, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process


* gdp = dlgdp
dfuller lgdp if group == 19, trend regress // trend not sig
dfuller lgdp if group == 19, regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process


dfuller Dlgdp if group == 19, trend regress // trend not sig
dfuller Dlgdp if group == 19, regress // cons sig, 
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* bank_size = D2lbank
dfuller bank_size if group == 19, trend regress // trend not sig
dfuller bank_size if group == 19, regress // cons not sig 
dfuller bank_size if group == 19, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lbank if group == 19, trend regress // trend not sig
dfuller lbank if group == 19, regress // cons not sig
dfuller lbank if group == 19, nocons regress // cons not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dbank if group == 19, trend regress // trend not sig
dfuller Dbank if group == 19, regress // cons not sig
dfuller Dbank if group == 19, nocons regress // cons not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller D2bank if group == 19, trend regress // trend not sig
dfuller D2bank if group == 19, regress // cons not sig
dfuller D2bank if group == 19, nocons regress // cons not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller D2lbank if group == 19, trend regress // trend not sig
dfuller D2lbank if group == 19, regress // cons not sig
dfuller D2lbank if group == 19, nocons regress // cons not sig
*CCL: t stat < t crit
*we reject H0 and have a stationary process


*int_paid_per = dintpaid
dfuller int_paid_per if group == 19, trend regress // trend not sig
dfuller int_paid_per if group == 19, regress // cons not sig, 
dfuller int_paid_per if group == 19, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lintpaid if group == 19, trend regress // trend not sig
dfuller lintpaid if group == 19, regress // cons not sig, 
dfuller lintpaid if group == 19, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dintpaid if group == 19, trend regress // trend not sig
dfuller Dintpaid if group == 19, regress // cons not sig, 
dfuller Dintpaid if group == 19, nocons regress //
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* fixed_per = Dfixed
dfuller fixed_per if group == 19, trend regress // trend not sig
dfuller fixed_per if group == 19, regress // cons not sig, 
dfuller fixed_per if group == 19, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lfixed if group == 19, trend regress // trend not sig
dfuller lfixed if group == 19, regress // cons not sig, 
dfuller lfixed if group == 19, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dfixed if group == 19, trend regress // trend not sig
dfuller Dfixed if group == 19, regress
dfuller Dfixed if group == 19, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

* app_int_rate = level

dfuller app_int_rate if group == 19, trend regress
dfuller app_int_rate if group == 19, regress
*we reject H0 and have a stationary process

* stkmktcap = Dstk
dfuller stkmktcap if group == 19, trend regress // trend not sig
dfuller stkmktcap if group == 19, regress // 
dfuller stkmktcap if group == 19, nocons regress 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lstk if group == 19, trend regress // trend not sig
dfuller lstk if group == 19, regress // cons sig, 
dfuller lstk if group == 19, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dstk if group == 19, trend regress // trend not sig
dfuller Dstk if group == 19, regress // cons not sig, 
dfuller Dstk if group == 19, nocons regress //
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* debt to gdp = ldgdp
dfuller debt_to_gdp if group == 19, trend regress
dfuller debt_to_gdp if group == 19, regress 
dfuller debt_to_gdp if group == 19, nocons regress 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller ldgdp if group == 19, trend regress
dfuller ldgdp if group == 19, regress
dfuller ldgdp if group == 19, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process

// Stationary variables to use
* debt_to_value = Ddval
* gdp = Dlgdp
* bank_size = D2lbank
* int_paid_per = Dintpaid
* fixed_per = Dfixed *not stationary even at 2nd difference
* app_int_rate = level
* stkmktcap = Dstk
* debt to gdp = ldgdp

regress Ddval Dlgdp D2lbank Dintpaid Dfixed app_int_rate Dstk ldgdp if group == 19
estat vif // Dlgdp app int rate and dfixed show colienearity, remove highest
estat hettest // ok
regress Ddval D2lbank Dintpaid Dfixed app_int_rate Dstk ldgdp if group == 19
estat vif //ok 
estat hettest // no hsk

estimates store nw

******************************************************************************************
* 2. Finland (8)
******************************************************************************************
*************************************************************************************

// Variables
* debt_to_value = Ddval
dfuller debt_to_value if group == 8, trend regress
dfuller debt_to_value if group == 8, regress
dfuller debt_to_value if group == 8, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller ldval if group == 8, trend regress
dfuller ldval if group == 8, regress
dfuller ldval if group == 8, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Ddval if group == 8, trend regress
dfuller Ddval if group == 8, regress
dfuller Ddval if group == 8, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process


* gdp = dlgdp
dfuller lgdp if group == 8, trend regress // trend not sig
dfuller lgdp if group == 8, regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dlgdp if group == 8, trend regress // trend not sig
dfuller Dlgdp if group == 8, regress // cons sig, 
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* bank_size = D2lbank
dfuller bank_size if group == 8, trend regress // trend not sig
dfuller bank_size if group == 8, regress // cons not sig 
dfuller bank_size if group == 8, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lbank if group == 8, trend regress // trend not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dbank if group == 8, trend regress // trend not sig
dfuller Dbank if group == 8, regress // cons not sig
dfuller Dbank if group == 8, nocons regress // 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dlbank if group == 8, trend regress // trend not sig
dfuller Dlbank if group == 8, regress // cons not sig
dfuller Dlbank if group == 8, nocons regress // 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller D2bank if group == 8, trend regress // trend not sig
dfuller D2bank if group == 8, regress // cons not sig
dfuller D2bank if group == 8, nocons regress // 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller D2lbank if group == 8, trend regress // trend not sig
dfuller D2lbank if group == 8, regress // cons not sig
dfuller D2lbank if group == 8, nocons regress // 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process


*int_paid_per = dintpaid
dfuller int_paid_per if group == 8, trend regress // trend not sig
dfuller int_paid_per if group == 8, regress // cons not sig, 
dfuller int_paid_per if group == 8, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lintpaid if group == 8, trend regress // trend not sig
dfuller lintpaid if group == 8, regress // cons not sig, 
dfuller lintpaid if group == 8, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dintpaid if group == 8, trend regress // trend not sig
dfuller Dintpaid if group == 8, regress // cons not sig, 
dfuller Dintpaid if group == 8, nocons regress //
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* fixed_per = level
dfuller fixed_per if group == 8, trend regress // trend not sig
dfuller fixed_per if group == 8, regress // cons not sig, 
*CCL: t stat < t crit
*we reject H0 and have a stationary process


* app_int_rate = level

dfuller app_int_rate if group == 8, trend regress // trend sig
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* debt to gdp = Ddgdp
dfuller debt_to_gdp if group == 8, trend regress
dfuller debt_to_gdp if group == 8, regress 
dfuller debt_to_gdp if group == 8, nocons regress 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller ldgdp if group == 8, trend regress
dfuller ldgdp if group == 8, regress
dfuller ldgdp if group == 8, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Ddgdp if group == 8, trend regress // trend not sig
dfuller Ddgdp if group == 8, regress
dfuller Ddgdp if group == 8, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process

// Stationary variables to use
* debt_to_value = Ddval
* gdp = Dlgdp
* bank_size = D2lbank
* int_paid_per = Dintpaid
* fixed_per = level
* app_int_rate = level
* stkmktcap = Dstk
* debt_to_gdp = Ddgdp

regress Ddval Dlgdp D2lbank Dintpaid fixed_per app_int_rate Dstk Ddgdp if group == 8
estat vif // we're ok
estat hettest // we're ok
estimates store fl
******************************************************************************************
* 3. Denmark (6)
******************************************************************************************
*************************************************************************************

// Variables
* debt_to_value = Ddval
dfuller debt_to_value if group == 6, trend regress
dfuller debt_to_value if group == 6, regress
dfuller debt_to_value if group == 6, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller ldval if group == 6, trend regress
dfuller ldval if group == 6, regress
dfuller ldval if group == 6, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Ddval if group == 6, trend regress
dfuller Ddval if group == 6, regress
dfuller Ddval if group == 6, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process


* gdp = dlgdp
dfuller lgdp if group == 6, trend regress // trend not sig
dfuller lgdp if group == 6, regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process


dfuller Dlgdp if group == 6, trend regress // trend not sig
dfuller Dlgdp if group == 6, regress // cons sig, 
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* bank_size = D2lbank
dfuller bank_size if group == 6, trend regress // trend not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lbank if group == 6, trend regress // trend not sig
dfuller lbank if group == 6, regress // cons not sig
dfuller lbank if group == 6, nocons regress // cons not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dbank if group == 6, trend regress // trend not sig
dfuller Dbank if group == 6, regress // cons not sig
dfuller Dbank if group == 6, nocons regress // cons not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dlbank if group == 6, trend regress // trend not sig
dfuller Dlbank if group == 6, regress // cons not sig
dfuller Dlbank if group == 6, nocons regress // cons not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller D2bank if group == 6, trend regress // trend not sig
dfuller D2bank if group == 6, regress // cons not sig
dfuller D2bank if group == 6, nocons regress // cons not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller D2lbank if group == 6, trend regress // trend not sig
dfuller D2lbank if group == 6, regress // cons not sig
dfuller D2lbank if group == 6, nocons regress // cons not sig
*CCL: t stat < t crit
*we reject H0 and have a stationary process

*int_paid_per = dintpaid
dfuller int_paid_per if group == 6, trend regress // trend not sig
dfuller int_paid_per if group == 6, regress // cons not sig, 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lintpaid if group == 6, trend regress // trend not sig
dfuller lintpaid if group == 6, regress // cons not sig, 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dintpaid if group == 6, trend regress // trend not sig
dfuller Dintpaid if group == 6, regress // cons not sig, 
dfuller Dintpaid if group == 6, nocons regress //
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* fixed_per = Dfixed
dfuller fixed_per if group == 6, trend regress // trend not sig
dfuller fixed_per if group == 6, regress // cons not sig, 
dfuller fixed_per if group == 6, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lfixed if group == 6, trend regress // trend not sig
dfuller lfixed if group == 6, regress // cons not sig, 
dfuller lfixed if group == 6, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dfixed if group == 6, trend regress // trend not sig
dfuller Dfixed if group == 6, regress
dfuller Dfixed if group == 6, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process


* app_int_rate = level

dfuller app_int_rate if group == 6, trend regress // trend sig
dfuller app_int_rate if group == 6, regress 
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* stkmktcap = Dstk
dfuller stkmktcap if group == 6, trend regress // trend not sig
dfuller stkmktcap if group == 6, regress // 
dfuller stkmktcap if group == 6, nocons regress 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lstk if group == 6, trend regress // trend not sig
dfuller lstk if group == 6, regress // cons sig, 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dstk if group == 6, trend regress // trend not sig
dfuller Dstk if group == 6, regress // cons not sig, 
dfuller Dstk if group == 6, nocons regress //
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* debt to gdp = Ddgdp
dfuller debt_to_gdp if group == 6, trend regress
dfuller debt_to_gdp if group == 6, regress 
dfuller debt_to_gdp if group == 6, nocons regress 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller ldgdp if group == 6, trend regress
dfuller ldgdp if group == 6, regress
dfuller ldgdp if group == 6, nocons regress 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Ddgdp if group == 6, trend regress // trend not sig
dfuller Ddgdp if group == 6, regress
dfuller Ddgdp if group == 6, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process

// Stationary variables to use
* debt_to_value = Ddval
* gdp = Dlgdp
* bank_size = D2lbank
* int_paid_per = Dintpaid
* fixed_per = Dfixed
* app_int_rate = level
* stkmktcap = Dstk
* debt_to_gdp = Ddgdp

regress Ddval Dlgdp D2lbank Dintpaid Dfixed app_int_rate Dstk Ddgdp if group == 6
estat vif // we're ok
estat hettest // ok
estimates store dk
******************************************************************************************
* 4. Sweden (25)
******************************************************************************************



// Variables
* debt_to_value = Ddval
dfuller debt_to_value if group == 25, trend regress
dfuller debt_to_value if group == 25, regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller ldval if group == 25, trend regress
dfuller ldval if group == 25, regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Ddval if group == 25, trend regress
dfuller Ddval if group == 25, regress
dfuller Ddval if group == 25, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process


* gdp = dlgdp
dfuller lgdp if group == 25, trend regress // trend not sig
dfuller lgdp if group == 25, regress
dfuller lgdp if group == 25, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process


dfuller Dlgdp if group == 25, trend regress // trend not sig
dfuller Dlgdp if group == 25, regress // cons sig, 
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* bank_size = D2lbank
dfuller bank_size if group == 25, trend regress // trend not sig
dfuller bank_size if group == 25, regress // cons not sig 
dfuller bank_size if group == 25, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lbank if group == 25, trend regress // trend not sig
dfuller lbank if group == 25, regress // cons not sig
dfuller lbank if group == 25, nocons regress // cons not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dbank if group == 25, trend regress // trend not sig
dfuller Dbank if group == 25, regress // cons not sig
dfuller Dbank if group == 25, nocons regress // cons not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dlbank if group == 25, trend regress // trend not sig
dfuller Dlbank if group == 25, regress // cons not sig
dfuller Dlbank if group == 25, nocons regress // cons not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller D2bank if group == 25, trend regress // trend not sig
dfuller D2bank if group == 25, regress // cons not sig
dfuller D2bank if group == 25, nocons regress // cons not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller D2lbank if group == 25, trend regress // trend not sig
dfuller D2lbank if group == 25, regress // cons not sig
dfuller D2lbank if group == 25, nocons regress // cons not sig
*CCL: t stat < t crit
*we reject H0 and have a stationary process

*int_paid_per = level
dfuller int_paid_per if group == 25, trend regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* fixed_per = Dfixed
dfuller fixed_per if group == 25, trend regress // trend not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lfixed if group == 25, trend regress // trend not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dfixed if group == 25, trend regress // trend not sig
dfuller Dfixed if group == 25, regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process


* app_int_rate = level

dfuller app_int_rate if group == 25, trend regress // trend sig
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* stkmktcap = lstk
dfuller stkmktcap if group == 25, trend regress // trend not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lstk if group == 25, trend regress // trend not sig
dfuller lstk if group == 25, regress // cons sig, 
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* debt to gdp = ldgdp
dfuller debt_to_gdp if group == 25, trend regress
dfuller debt_to_gdp if group == 25, regress 
dfuller debt_to_gdp if group == 25, nocons regress 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller ldgdp if group == 25, trend regress
dfuller ldgdp if group == 25, regress
dfuller ldgdp if group == 25, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process

// Stationary variables to use
* debt_to_value = Ddval
* gdp = Dlgdp
* bank_size = D2lbank
* int_paid_per = level
* fixed_per = Dfixed
* app_int_rate = level
* stkmktcap = lstk
* debt_to_gdp = ldgdp

regress Ddval Dlgdp D2lbank int_paid_per Dfixed app_int_rate lstk ldgdp if group == 25
estat vif // app int rate, ldgdp, dfixed,dlgdp all have collinearity, so we remove highest
regress Ddval Dlgdp D2lbank int_paid_per Dfixed lstk ldgdp if group == 25
estat vif // ok
estat hettest // ok
estimates store sw


// Eastern
******************************************************************************************
* 1. Hungary* (12)
******************************************************************************************


// Variables
* debt_to_value = Ddval
dfuller debt_to_value if group == 12, trend regress
dfuller debt_to_value if group == 12, regress
dfuller debt_to_value if group == 12, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller ldval if group == 12, trend regress
dfuller ldval if group == 12, regress
dfuller ldval if group == 12, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Ddval if group == 12, trend regress
dfuller Ddval if group == 12, regress
dfuller Ddval if group == 12, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process


* gdp = lgdp
dfuller lgdp if group == 12, trend regress // trend not sig
dfuller lgdp if group == 12, regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* bank_size = D2lbank
dfuller bank_size if group == 12, trend regress // trend not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lbank if group == 12, trend regress // trend not sig
dfuller lbank if group == 12, regress // cons not sig
dfuller lbank if group == 12, nocons regress // cons not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dbank if group == 12, trend regress // trend not sig
dfuller Dbank if group == 12, regress // cons not sig
dfuller Dbank if group == 12, nocons regress // cons not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dlbank if group == 12, trend regress // trend not sig
dfuller Dlbank if group == 12, regress // cons not sig
dfuller Dlbank if group == 12, nocons regress // cons not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller D2bank if group == 12, trend regress // trend not sig
dfuller D2bank if group == 12, regress // cons not sig
dfuller D2bank if group == 12, nocons regress // cons not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller D2lbank if group == 12, trend regress // trend not sig
dfuller D2lbank if group == 12, regress // cons not sig
dfuller D2lbank if group == 12, nocons regress // cons not sig
*CCL: t stat < t crit
*we reject H0 and have a stationary process

*int_paid_per = Dintpaid
dfuller int_paid_per if group == 12, trend regress
dfuller int_paid_per if group == 12, regress
dfuller int_paid_per if group == 12, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lintpaid if group == 12, trend regress
dfuller lintpaid if group == 12, regress
dfuller lintpaid if group == 12, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dintpaid if group == 12, trend regress
dfuller Dintpaid if group == 12, regress
dfuller Dintpaid if group == 12, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* fixed_per = D2fixed
dfuller fixed_per if group == 12, trend regress
dfuller fixed_per if group == 12, regress
dfuller fixed_per if group == 12, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lfixed if group == 12, trend regress
dfuller lfixed if group == 12, regress
dfuller lfixed if group == 12, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dfixed if group == 12, trend regress // trend not sig
dfuller Dfixed if group == 12, regress
dfuller Dfixed if group == 12, nocons 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dlfixed if group == 12, trend regress // trend not sig
dfuller Dlfixed if group == 12, regress
dfuller Dlfixed if group == 12, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller D2fixed if group == 12, trend regress // trend not sig
dfuller D2fixed if group == 12, regress
dfuller D2fixed if group == 12, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process


* app_int_rate = level

dfuller app_int_rate if group == 12, trend regress
dfuller app_int_rate if group == 12, regress
dfuller app_int_rate if group == 12, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* stkmktcap = lstk
dfuller stkmktcap if group == 12, trend regress
dfuller stkmktcap if group == 12, regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lstk if group == 12, trend regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* debt to gdp = Ddgdp
dfuller debt_to_gdp if group == 12, trend regress
dfuller debt_to_gdp if group == 12, regress 
dfuller debt_to_gdp if group == 12, nocons regress 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller ldgdp if group == 12, trend regress
dfuller ldgdp if group == 12, regress
dfuller ldgdp if group == 12, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Ddgdp if group == 12, trend regress
dfuller Ddgdp if group == 12, regress
dfuller Ddgdp if group == 12, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process

// Stationary variables to use
* debt_to_value = Ddval
* gdp = lgdp
* bank_size = D2lbank
*int_paid_per = Dintpaid
* fixed_per = D2fixed
* app_int_rate = level
* stkmktcap = lstk
* debt to gdp = Ddgdp

regress Ddval lgdp D2lbank Dintpaid D2fixed app_int_rate lstk L1.Ddgdp if group == 12
estat vif // ok
estat hettest // ok
estimates store hu



******************************************************************************************
* 2. Czechia* (5)
******************************************************************************************

// Variables
* debt_to_value = Ddval
dfuller debt_to_value if group == 5, trend regress
dfuller debt_to_value if group == 5, regress
dfuller debt_to_value if group == 5, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller ldval if group == 5, trend regress
dfuller ldval if group == 5, regress
dfuller ldval if group == 5, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Ddval if group == 5, trend regress
dfuller Ddval if group == 5, regress
dfuller Ddval if group == 5, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process


* gdp = lgdp
dfuller lgdp if group == 5, trend regress // trend not sig
dfuller lgdp if group == 5, regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* bank_size = D2lbank
dfuller bank_size if group == 5, trend regress // trend not sig
dfuller bank_size if group == 5, regress // cons not sig 
dfuller bank_size if group == 5, nocons regress //
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lbank if group == 5, trend regress // trend not sig
dfuller lbank if group == 5, regress // cons not sig
dfuller lbank if group == 5, nocons regress // cons not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dbank if group == 5, trend regress // trend not sig
dfuller Dbank if group == 5, regress // cons not sig
dfuller Dbank if group == 5, nocons regress // cons not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dlbank if group == 5, trend regress // trend not sig
dfuller Dlbank if group == 5, regress // cons not sig
dfuller Dlbank if group == 5, nocons regress // cons not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller D2bank if group == 5, trend regress // trend not sig
dfuller D2bank if group == 5, regress // cons not sig
dfuller D2bank if group == 5, nocons regress // cons not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller D2lbank if group == 5, trend regress // trend not sig
dfuller D2lbank if group == 5, regress // cons not sig
dfuller D2lbank if group == 5, nocons regress // cons not sig
*CCL: t stat < t crit
*we reject H0 and have a stationary process

*int_paid_per = Dintpaid
dfuller int_paid_per if group == 5, trend regress
dfuller int_paid_per if group == 5, regress
dfuller int_paid_per if group == 5, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lintpaid if group == 5, trend regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dintpaid if group == 5, trend regress
dfuller Dintpaid if group == 5, regress
dfuller Dintpaid if group == 5, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* fixed_per = Dfixed
dfuller fixed_per if group == 5, trend regress // trend not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lfixed if group == 5, trend regress // trend not sig
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dfixed if group == 5, trend regress // trend not sig
dfuller Dfixed if group == 5, regress
dfuller Dfixed if group == 5, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process


* app_int_rate = level

dfuller app_int_rate if group == 5, trend regress
dfuller app_int_rate if group == 5, regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* stkmktcap = Dstk
dfuller stkmktcap if group == 5, trend regress // trend not sig
dfuller stkmktcap if group == 5, regress
dfuller stkmktcap if group == 5, nocons regress
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller lstk if group == 5, trend regress // trend not sig
dfuller lstk if group == 5, regress // cons not sig,
dfuller lstk if group == 5, nocons regress 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller Dstk if group == 5, trend regress // trend not sig
dfuller Dstk if group == 5, regress // cons not sig,
dfuller Dstk if group == 5, nocons regress 
*CCL: t stat < t crit
*we reject H0 and have a stationary process

* debt to gdp = Ddgdp
dfuller debt_to_gdp if group == 5, trend regress
dfuller debt_to_gdp if group == 5, regress 
dfuller debt_to_gdp if group == 5, nocons regress 
*CCL: t stat > t crit
*H0 fail to reject have non stationary process

dfuller ldgdp if group == 5, trend regress
dfuller ldgdp if group == 5, regress
dfuller ldgdp if group == 5, nocons regress

dfuller Ddgdp if group == 5, trend regress
dfuller Ddgdp if group == 5, regress
dfuller Ddgdp if group == 5, nocons regress
*CCL: t stat < t crit
*we reject H0 and have a stationary process

// Stationary variables to use
* debt_to_value = Ddval
* gdp = lgdp
* bank_size = D2lbank
*int_paid_per = Dintpaid
* fixed_per = Dfixed
* app_int_rate = level
* stkmktcap = Dstk
* debt_to_gdp = Ddgdp

regress Ddval lgdp D2lbank Dintpaid Dfixed app_int_rate Dstk Ddgdp if group == 5
estat vif // ok
estat hettest // ok
estimates store cz


*Not included Bulgaria (3)
*Cyprus (4)
*Estonia (7)
*Ireland (13)
*Latvia (15)
*Lith (16)
*Lux(17)
*Slovenia (23)
*Spain (24)



* final regressions


// Czechia
regress Ddval lgdp D2lbank Dintpaid Dfixed app_int_rate Dstk L1.Ddgdp if group == 5
estat vif // ok
estat hettest // ok
estimates store cz
rvfplot
ovfplot

// Hungary
regress Ddval lgdp D2lbank Dintpaid D2fixed app_int_rate lstk L1.Ddgdp if group == 12
estat vif // ok
estat hettest // ok
estimates store hu
rvfplot
ovfplot

// Sweden
regress Ddval Dlgdp D2lbank int_paid_per Dfixed app_int_rate lstk L1.ldgdp if group == 25
estat vif // app int rate, ldgdp, dfixed,dlgdp all have collinearity, so we remove highest
regress Ddval Dlgdp D2lbank int_paid_per app_int_rate lstk L1.ldgdp if group == 25
estat vif // ok
estat hettest // ok
estimates store sw
rvfplot
ovfplot

// Denmark
regress Ddval Dlgdp D2lbank Dintpaid Dfixed app_int_rate Dstk L1.Ddgdp if group == 6
estat vif // we're ok
estat hettest // ok
estimates store dk
rvfplot
ovfplot

// Finland
regress Ddval Dlgdp D2lbank Dintpaid fixed_per app_int_rate Dstk L1.Ddgdp if group == 8
estat vif // we're ok
estat hettest // we're ok
estimates store fl
rvfplot
ovfplot

// Norway
regress Ddval Dlgdp D2lbank Dintpaid Dfixed app_int_rate Dstk L1.ldgdp if group == 19
estat vif // Dlgdp app int rate and dfixed show colienearity, remove highest
estat hettest // ok
regress Ddval D2lbank Dintpaid Dfixed app_int_rate Dstk L1.ldgdp if group == 19
estat vif //ok 
estat hettest // no hsk
estimates store nw
rvfplot
ovfplot

// Germany
regress Ddval Dlgdp lbank int_paid_per Dfixed app_int_rate Dstk L1.Ddgdp if group == 10
estat vif // int paid per and lbank are collinear, so we remove highest
regress Ddval Dlgdp lbank Dfixed app_int_rate Dstk L1.Ddgdp if group == 10
estat vif //ok
estat hettest //ok
estimates store de
rvfplot
ovfplot

// Belgium
regress Ddval Dlgdp bank_size Dintpaid Dfixed Dappint Dstk L1.Ddgdp if group == 2
estat vif // we're ok
estat hettest // ok
estimates store be
rvfplot
ovfplot

// Austria
regress Ddval Dlgdp Dbank Dintpaid Dfixed Dappint Dstk L1.Ddgdp if group == 1
estat vif // we're ok
estat hettest // ok
estimates store at
rvfplot
ovfplot

// United Kingdom
regress Ddval Dlgdp D2lbank Dintpaid Dfixed app_int_rate Dstk L1.ldgdp if group == 26
estat vif // we're ok
estat hettest // ok
estimates store uk
rvfplot
ovfplot

// Netherlands
regress debt_to_value lgdp lbank Dintpaid Dfixed lappint Dstk L1.Dldgdp if group == 18
estat vif // we're ok
estat hettest // ok
estimates store nl
rvfplot
ovfplot

// France
regress debt_to_value Dlgdp Dlbank Dintpaid Dfixed Dappint Dstk L1.Ddgdp if group == 9
estat vif // we're ok
estat hettest // ok
estimates store fr
rvfplot
ovfplot

// Western and Central
estimates table fr nl uk at be de, star(.05 .01 .001) stats(N r2)
estimates table fr nl uk at be de, b se p stats(N r2)

// Northern
estimates table nw fl dk sw, star(.05 .01 .001) stats(N r2)
estimates table nw fl dk sw, b se p stats(N r2)


// Eastern
estimates table cz hu, star(.05 .01 .001) stats(N r2)
estimates table cz hu, b se p stats(N r2)
