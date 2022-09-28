/* Import dataset */
LIBNAME project 'E:\Users\jxs210024\Desktop\project';

PROC IMPORT OUT= project.Telco2
            DATAFILE= "E:\Users\jxs210024\Desktop\project\Telco2.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;

/* generating the working dataset in Work library */
data Telco2;
 set project.Telco2;
run; 
/* Summary Statistics of numerical variables*/
proc tabulate data= TelcoCustomerChurn ;
var tenure MonthlyCharges TotalCharges; *variables described by the table; 
table tenure MonthlyCharges TotalCharges,(N Mean StdDev Min p25 Median p75 Max); 
title 'Summary Statistics of Numerical variables'; 
run;
/*********************************************************************************************************************/

/* Histograms of numerical variables*/
proc sgplot data= Telco2;
 histogram tenure / binstart = 0 binwidth = 1 ; 
 title 'Tenure Distribution';
run;
proc sgplot data= Telco2;
 histogram MonthlyCharges / binstart = 0 binwidth = 5 ; 
 title 'MonthlyCharges Distribution';
run;
proc sgplot data= Telco2;
 histogram TotalCharges / binstart = 0 binwidth = 100 ; 
 title 'TotalCharges Distribution';
run;

/*********************************************************************************************************************/
/*BoxPlot of Churn by numerical variables*/

proc sgplot data= Telco2;
 hbox tenure  / category= Churn; 
 title 'Churn by Tenure';
run;
proc sgplot data= Telco2;
 hbox TotalCharges  / category= Churn; 
 title 'Churn by TotalCharges';
run;
proc sgplot data= Telco2;
 hbox MonthlyCharges  / category= Churn; 
 title 'Churn by MonthlyCharges';
run;
/*********************************************************************************************************************/
/*Bar Chart of categoracal variables*/
proc sgplot data= Telco2;
 vbar SeniorCitizen; 
run;
proc sgplot data= Telco2;
 vbar Dependents; 
title 'How many customers have dependents';
run;
proc sgplot data= Telco2;
 vbar Partner; 
title 'How many customers have partner';
run;
proc sgplot data= Telco2;
 vbar gender; 
run;
proc sgplot data= Telco2;
 vbar PhoneService; 
 title 'Yes or No PhoneService';
run;
proc sgplot data= Telco2;
 vbar MultipleLines; 
 title 'Yes or No MultipleLines';
run;
proc sgplot data= Telco2;
 vbar InternetService; 
title 'InternetService frequency';
run;
proc sgplot data= Telco2;
 vbar PaymentMethod; 
title 'PaymentMethod frequency';
run;
proc sgplot data= Telco2;
 vbar PaperlessBilling; 
 title 'PaperlessBilling frequency';
run;
proc sgplot data= Telco2;
 vbar Contract; 
 title 'Contract Type frequency';
run;

/*********************************************************************************************************************/
/*Barchart: Churn by different categorical variables*/

proc sgplot data= Telco2;
 vbar SeniorCitizen / group= Churn groupdisplay=cluster; 
 title 'Churn by Yes and No SeniorCitizen';
run;
proc sgplot data= Telco2;
 vbar Dependents / group= Churn groupdisplay=cluster; 
 title 'Churn by Yes or No Dependents';
run;
proc sgplot data= Telco2;
 vbar Partner / group= Churn groupdisplay=cluster; 
 title 'Churn by Yes or No Partner';
run;
proc sgplot data= Telco2;
 vbar gender / group= Churn groupdisplay=cluster; 
 title 'Churn by different gender';
run;
proc sgplot data= Telco2;
 vbar PhoneService / group= Churn groupdisplay=cluster; 
 title 'Churn by Yes or No PhoneService';
run;
proc sgplot data= Telco2;
 vbar MultipleLines / group= Churn groupdisplay=cluster; 
 title 'Churn by Yes or No MultipleLines';
run;
proc sgplot data= Telco2;
 vbar InternetService / group= Churn groupdisplay=cluster; 
 title 'Churn by InternetService';
run;
proc sgplot data= Telco2;
 vbar PaymentMethod / group= Churn groupdisplay=cluster; 
 title 'Churn by PaymentMethod';
run;
proc sgplot data= Telco2;
 vbar PaperlessBilling / group= Churn groupdisplay=cluster; 
 title 'Churn by Yes or No PaperlessBilling';
run;
proc sgplot data= Telco2;
 vbar Contract / group= Churn groupdisplay=cluster; 
 title 'Churn by different contract';
run;

proc sgplot data= Telco2;
 vbar PaperlessBilling / group= SeniorCitizen groupdisplay=cluster; 
 title 'SeniorCitizen by PaperlessBilling';
run;

/*********************************************************************************************************************/
/* transform data*/
data Telco2;
 set Telco2;
 if Partner ='Yes'  then Partnernew = 1;
 if Partner ='No'  then Partnernew = 0;

 if Dependents ='Yes'  then Dependents = 1;
 if Dependents ='No'  then Dependents = 0;

 if PhoneService ='Yes'  then PhoneService = 1;
 if PhoneService ='No'  then PhoneService = 0;

 if PaperlessBilling ='Yes'  then PaperlessBilling = 1;
 if PaperlessBilling ='No'  then PaperlessBilling = 0;

 if Churn ='Yes'  then Churn = 1;
 if Churn ='No'  then Churn = 0;

 if OnlineSecurity ='Yes'  then OnlineSecurity = 1;
 if OnlineSecurity ='No'  then OnlineSecurity = 0;
 if OnlineSecurity ='No internet service'  then OnlineSecurity = 0;

 if OnlineBackup ='Yes'  then OnlineBackup = 1;
 if OnlineBackup ='No'  then OnlineBackup = 0;
 if OnlineBackup ='No internet service'  then OnlineBackup = 0;

 if DeviceProtection ='Yes'  then DeviceProtection = 1;
 if DeviceProtection ='No'  then DeviceProtection = 0;
 if DeviceProtection ='No internet service'  then DeviceProtection = 0;

 if TechSupport ='Yes'  then TechSupport = 1;
 if TechSupport ='No'  then TechSupport = 0;
 if TechSupport ='No internet service'  then TechSupport = 0;

 if StreamingTV ='Yes'  then StreamingTV = 1;
 if StreamingTV ='No'  then StreamingTV = 0;
 if StreamingTV ='No internet service'  then StreamingTV = 0;

 if StreamingMovies ='Yes'  then StreamingMovies = 1;
 if StreamingMovies ='No'  then StreamingMovies = 0;
 if StreamingMovies ='No internet service'  then StreamingMovies = 0;

 if MultipleLines ='Yes'  then MultipleLines = 1;
 if MultipleLines ='No'  then MultipleLines = 0;
if MultipleLines ='No phone service'  then MultipleLines = 0;

if gender='Female'  then gender= 1;
if gender='Male'  then gender= 0;

if InternetService ='DSL' then ServiceDSL = 1;
if InternetService ='DSL' then ServiceFiber = 0;
if InternetService ='Fiber optic' then ServiceDSL = 0;
if InternetService ='Fiber optic' then ServiceFiber = 1;
if InternetService ='No' then ServiceDSL = 0;
if InternetService ='No' then ServiceFiber = 0;

if Contract ='Month-to-month' then ContractMonth = 1; 
if Contract ='Month-to-month' then ContractOneyear =0; 
if Contract ='Month-to-month' then ContractTwoyear = 0;
if Contract ='One year' then ContractMonth = 0;
if Contract ='One year' then ContractOneyear =1;
if Contract ='One year' then ContractTwoyear = 0;
if Contract ='Two year' then ContractMonth = 0;
if Contract ='Two year' then ContractOneyear =0;
if Contract ='Two year' then ContractTwoyear = 1;

if PaymentMethod = 'Electronic check' then PaymentMethodElec = 1;
if PaymentMethod = 'Electronic check' then PaymentMethodMAil = 0;
if PaymentMethod = 'Electronic check' then PaymentMethodBank = 0;
if PaymentMethod = 'Electronic check' then PaymentMethodCredit = 0;
if PaymentMethod = 'Mailed check' then PaymentMethodElec = 0;
if PaymentMethod = 'Mailed check' then PaymentMethodMAil = 1;
if PaymentMethod = 'Mailed check' then PaymentMethodBank = 0;
if PaymentMethod = 'Mailed check' then PaymentMethodCredit = 0;
if PaymentMethod = 'Bank transfer (automatic)' then PaymentMethodElec = 0;
if PaymentMethod = 'Bank transfer (automatic)' then PaymentMethodMAil = 0;
if PaymentMethod = 'Bank transfer (automatic)' then PaymentMethodBank = 1;
if PaymentMethod = 'Bank transfer (automatic)' then PaymentMethodCredit = 0;
if PaymentMethod = 'Credit card (automatic)' then PaymentMethodElec = 0;
if PaymentMethod = 'Credit card (automatic)' then PaymentMethodMAil = 0;
if PaymentMethod = 'Credit card (automatic)' then PaymentMethodBank = 0;
if PaymentMethod = 'Credit card (automatic)' then PaymentMethodCredit = 1;
run;
 

/* Summary Statistics using PROC tabulate */
proc tabulate data= Telco2 ;
 var gender SeniorCitizen Partner Dependents tenure PhoneService MultipleLines OnlineSecurity OnlineBackup DeviceProtection TechSupport StreamingTV StreamingMovies PaperlessBilling MonthlyCharges TotalCharges Churn ServiceDSL ServiceFiber ContractMonth ContractOneyear ContractTwoyear PaymentMethodElec PaymentMethodMAil PaymentMethodBank PaymentMethodCredit; *variables described by the table; 
 table gender SeniorCitizen Partner Dependents tenure PhoneService MultipleLines OnlineSecurity OnlineBackup DeviceProtection TechSupport StreamingTV StreamingMovies PaperlessBilling MonthlyCharges TotalCharges Churn ServiceDSL ServiceFiber ContractMonth ContractOneyear ContractTwoyear PaymentMethodElec PaymentMethodMAil PaymentMethodBank PaymentMethodCredit,(N Mean StdDev Min p25 Median p75 Max); 
 title 'Sum of each variable'; 
run;

/*********************************************************************************************************************/

/* choosing the 80% of sample. Seed = 2 will help you have same randome samples if you repeat the analysis */
/* Create training and test datasets. 80% of sample in training  */
proc surveyselect data=Telco2 out=Telco_sampled outall samprate=0.8 seed=2;
run;

data Telco_training Telco_test;
 set Telco_sampled;
 if selected then output Telco_training; /* Tell SAS that only keep the 80% selected one in sample. The rest will be in test data */
 else output Telco_test;
run;

/* Logistic Regression */
proc logistic data=Telco_sampled;
class gender(ref='0') SeniorCitizen(ref='0') Partner(ref='0') Dependents(ref='0') PhoneService(ref='0') MultipleLines(ref='0') OnlineSecurity(ref='0') OnlineBackup(ref='0') DeviceProtection(ref='0') TechSupport(ref='0') StreamingTV(ref='0') StreamingMovies(ref='0') PaperlessBilling(ref='0') ServiceDSL(ref='0') ServiceFiber(ref='0') ContractMonth(ref='0') ContractOneyear(ref='0') ContractTwoyear(ref='0') PaymentMethodElec(ref='0') PaymentMethodMAil(ref='0') PaymentMethodBank(ref='0') PaymentMethodCredit(ref='0');
 logit: model Churn (event='1') =gender SeniorCitizen Partner Dependents tenure PhoneService MultipleLines OnlineSecurity OnlineBackup DeviceProtection TechSupport StreamingTV StreamingMovies PaperlessBilling MonthlyCharges TotalCharges ServiceDSL ServiceFiber ContractMonth ContractOneyear ContractTwoyear PaymentMethodElec PaymentMethodMAil PaymentMethodBank PaymentMethodCredit;
 weight selected; /*only training sample is used for estimation, since selected = 0 for test sample */
run;
quit;

/* ROC curve*/
proc logistic data=Telco_sampled plots=roc(id=prob);
class gender(ref='0') SeniorCitizen(ref='0') Partner(ref='0') Dependents(ref='0') PhoneService(ref='0') MultipleLines(ref='0') OnlineSecurity(ref='0') OnlineBackup(ref='0') DeviceProtection(ref='0') TechSupport(ref='0') StreamingTV(ref='0') StreamingMovies(ref='0') PaperlessBilling(ref='0') ServiceDSL(ref='0') ServiceFiber(ref='0') ContractMonth(ref='0') ContractOneyear(ref='0') ContractTwoyear(ref='0') PaymentMethodElec(ref='0') PaymentMethodMAil(ref='0') PaymentMethodBank(ref='0') PaymentMethodCredit(ref='0');
 logit: model Churn (event='1') =gender SeniorCitizen Partner Dependents tenure PhoneService MultipleLines OnlineSecurity OnlineBackup DeviceProtection TechSupport StreamingTV StreamingMovies PaperlessBilling MonthlyCharges TotalCharges ServiceDSL ServiceFiber ContractMonth ContractOneyear ContractTwoyear PaymentMethodElec PaymentMethodMAil PaymentMethodBank PaymentMethodCredit/nofit;
 roc 'all' gender SeniorCitizen Partner Dependents tenure PhoneService MultipleLines OnlineSecurity OnlineBackup DeviceProtection TechSupport StreamingTV StreamingMovies PaperlessBilling MonthlyCharges TotalCharges ServiceDSL ServiceFiber ContractMonth ContractOneyear ContractTwoyear PaymentMethodElec PaymentMethodMAil PaymentMethodBank PaymentMethodCredit;
 roc 'tenure' tenure;
 roc  'PaperlessBilling' PaperlessBilling;
 roc  'TotalCharges' TotalCharges;
 roc 'ContractMonth' ContractMonth;
 roc  'PaymentMethodElec' PaymentMethodElec;
 where selected=0;
run;




