**Code and tutorial to reproduce the manuscript "Exploring Co-explosive Dynamics: Bitcoin Price, Attractiveness, and Sentiment Variables"**

The aim of this paper is to estimate the determinants of Bitcoin price in the long term considering the gold price, S&P500, Google searches for Bitcoin, and the financial stress index. We use a co-explosive VAR model from Nielsen (2010) and Engsted and Nielsen (2012). Basically, we present the code focused on the main result of the paper which is the relationship between Bitcoin price and Google searches for Bitcoin. We have the following 7 codes below. We use Ox-metrics 9.06 software.

**Data**

The sample starts from the year 2013, when data are available for all the variables studied and the frequency is weekly. The sample period is from 10/04/2013 to 09/24/2021. We have 417 observations. Although there are Bitcoin transactions on Saturdays, we prefer to have the synchronization with the other series so we consider the Bitcoin price on Friday. We use the logarithm of Bitcoin price and Google Trends. 

**Files:** We use files in this sequence.

**1)** SelectLagVAR.fl: We select the number of lags of the variables at level in the VAR model from 6 lags and if there is an intercept in the model. This batch presents the information criterion and the F test for reducing the number of lags in the VAR model.

**2)** ChengePhillipsCointegrationandIntercept.fl

Run Cheng and Phillips cointegration test based on the information criterion. We analyze if we have cointegration and we define the deterministic term (without intercept, with restricted intercept or with unrestricted intercept).

**3)** Johansen test

Run Johansen test without intercept: Johansentest_withoutIntercept.fl
Run Johansen test wit restricted intercept: Johansentest_withInterceptRestricted.fl
Run Johansen test with unrestrictedt intercept: Johansentest_withInterceptUnrestricted.fl

**4)** CointegratedVAR_explosiveroot.fl

Run cointegrated VAR and obtain explosive root. Go to "Dynamics" and "Roots of Companion"

**5)** Adjusting variables to obtain error-correction form

Run AdjustingVariables.alg

**6)** CoExplosiveModel

Estimate Co-explosive VAR model

**7)** ExplosiveBTC_test_restriction

Test the null hypothesis of a nonexplosive Bitcoin price. You can calculate LR test based on log-likelihood

**8)** ExplosiveGoogle_test_restriction

Test the null hypothesis of a nonexplosive Google searches. You can calculate LR test based on log-likelihood


**References**

Engsted, T., Nielsen, B., 2012. Testing for rational bubbles in a coexplosive vector autoregression. The Econometrics Journal 15, 226–254.

Nielsen, B., 2010. Analysis of coexplosive processes. Econometric Theory, 882–915.
