***************************************************************************************************************************************
Subject Linear Models
Professor: Dr. Mario A. García
Student: G.Angelina López
***************************************************************************************************************************************

DataSet Description:
     This data contains the CO2 emissions of diferent vehicle models. Variables included are
     - Maker
     - Model
     - Vehicle Class
     - Engine Size
     - Quantity of Cylinders
     - Transmission model
     - Fuel type (used during test)
     - Fuel Consumption at City (in liters per 100 km)
     - Fuel Consumption at Highway (in liters per 100 km)
     - Total Fuel Consumption (in liters per 100 km)*continous
     - CO2 Emissions (in grams per Kilometer)*continous

In order to describe the Dataset a summary was performed and several graps were created
	-Histograms of CO2 emissions and Total Fuel Consumption
	-Scatter plot Total Fuel Consumption vs CO2 emissions, colored by Fuel Type
	-Boxplots of CO2 emissions by Fuel Type and Cylinder

Before model construction an Anderson-Darling test was performed to the variables Total Fuel Consumption and CO2 emissions
Results showed a p-value<<0.05 and the nule Hipotesis of normality was rejected
logaritmic and boxcoc transformations were applied to data with poor results



Two different models were proposed:

# 1st Proposed Model:
   The target varible is CO2emissions in grams per kilometer
   Indepedent variables are:
     -Fuel consumption in liters by every 100km: meassured in highway and city
     -Number of cilinders: 4, 6, 8
     -Size of the engine: bigger engines may have higher fuel consuption 
     -Vehicle Class: sedan, SUV, etc may have different weight 
     -Transmission: 
     -Fuel Type
   ***Coeficients: Shown at the end of readme file


# 2nd Proposed Model:
   The target varible is Fuel consumption in liters by every 100km: meassured in highway and city
   Indepedent variables are:
     -Number of cilinders: 4, 6, 8
     -Size of the engine: bigger engines may have higher fuel consuption 
     -Vehicle Class: sedan, SUV, etc may have different weight 
     -Transmission: 
     -Fuel Type
   ***Coeficients: Shown at the end of readme file

Even though second model seems to improve. Both models show consistent results 

ASSUMPTIONS
According to graphs, non of the assumptions for linear models are true... 
   -Residuals plot shows evident paterns 
   -Q-Q is not linear
   -Leverage has some observations exactly on 1 

HETEROCEDASTICITY
Goldfeld-Quadnt Heterocedasticity test gives P-values << 0.05 for both models proving the existance of heterocedasticity
a similar result is given by Breusch-Pagan test.

Conclusions:
This model is not an ideal linear model. Better normalization of data is suggested for further analisys


MODEL 1********************************************************************************************************************

                                        Estimate Std. Error  t value Pr(>|t|)    
(Intercept)                             38.29383    3.86573    9.906  < 2e-16 ***
Fuel.Consumption.Comb..L.100.km.        22.17684    0.06489  341.778  < 2e-16 ***
as.character(Cylinders)12                6.71868    1.79404    3.745 0.000182 ***
as.character(Cylinders)16               21.36810    4.74420    4.504 6.77e-06 ***
as.character(Cylinders)3                -3.89260    2.26188   -1.721 0.085301 .  
as.character(Cylinders)4                -4.68346    2.12523   -2.204 0.027574 *  
as.character(Cylinders)5                -5.63663    2.33512   -2.414 0.015810 *  
as.character(Cylinders)6                -4.70874    1.88451   -2.499 0.012488 *  
as.character(Cylinders)8                -3.11381    1.70833   -1.823 0.068387 .  
as.character(Engine.Size.L.)1            4.45810    3.21462    1.387 0.165539    
as.character(Engine.Size.L.)1.2          4.37329    3.09813    1.412 0.158113    
as.character(Engine.Size.L.)1.3          5.63556    3.36663    1.674 0.094184 .  
as.character(Engine.Size.L.)1.4          6.04096    3.03793    1.989 0.046792 *  
as.character(Engine.Size.L.)1.5          6.24529    2.99399    2.086 0.037018 *  
as.character(Engine.Size.L.)1.6          5.81623    3.02642    1.922 0.054667 .  
as.character(Engine.Size.L.)1.8          6.41130    3.03078    2.115 0.034430 *  
as.character(Engine.Size.L.)2            7.58814    3.02186    2.511 0.012058 *  
as.character(Engine.Size.L.)2.1          7.49415    3.79767    1.973 0.048493 *  
as.character(Engine.Size.L.)2.2          8.93885    5.84217    1.530 0.126046    
as.character(Engine.Size.L.)2.3          8.73419    3.11375    2.805 0.005044 ** 
as.character(Engine.Size.L.)2.4          8.67693    3.03354    2.860 0.004244 ** 
as.character(Engine.Size.L.)2.5          7.54805    3.03014    2.491 0.012761 *  
as.character(Engine.Size.L.)2.7          8.35271    3.11223    2.684 0.007295 ** 
as.character(Engine.Size.L.)2.8         16.20255    3.26265    4.966 6.99e-07 ***
as.character(Engine.Size.L.)2.9         10.73803    3.35418    3.201 0.001374 ** 
as.character(Engine.Size.L.)3            9.60989    3.17414    3.028 0.002474 ** 
as.character(Engine.Size.L.)3.2          6.37836    3.28673    1.941 0.052340 .  
as.character(Engine.Size.L.)3.3         12.05402    3.21539    3.749 0.000179 ***
as.character(Engine.Size.L.)3.4          7.53532    3.24159    2.325 0.020122 *  
as.character(Engine.Size.L.)3.5          9.42173    3.17409    2.968 0.003004 ** 
as.character(Engine.Size.L.)3.6         10.61284    3.18215    3.335 0.000857 ***
as.character(Engine.Size.L.)3.7          8.96018    3.20349    2.797 0.005171 ** 
as.character(Engine.Size.L.)3.8          9.88793    3.21432    3.076 0.002104 ** 
as.character(Engine.Size.L.)4           10.22026    3.26295    3.132 0.001742 ** 
as.character(Engine.Size.L.)4.2          7.70493    3.54640    2.173 0.029842 *  
as.character(Engine.Size.L.)4.3          9.55123    3.26127    2.929 0.003415 ** 
as.character(Engine.Size.L.)4.4          9.59602    3.31073    2.898 0.003761 ** 
as.character(Engine.Size.L.)4.6          8.42257    3.39969    2.477 0.013255 *  
as.character(Engine.Size.L.)4.7          9.82643    3.32523    2.955 0.003136 ** 
as.character(Engine.Size.L.)4.8         11.45778    3.40806    3.362 0.000778 ***
as.character(Engine.Size.L.)5            6.34874    3.29891    1.924 0.054331 .  
as.character(Engine.Size.L.)5.2          8.90387    3.62333    2.457 0.014019 *  
as.character(Engine.Size.L.)5.3          8.09353    3.30098    2.452 0.014235 *  
as.character(Engine.Size.L.)5.4         -5.03600    3.75916   -1.340 0.180397    
as.character(Engine.Size.L.)5.5          9.96155    3.36909    2.957 0.003119 ** 
as.character(Engine.Size.L.)5.6         11.66375    3.40875    3.422 0.000626 ***
as.character(Engine.Size.L.)5.7         10.46380    3.32815    3.144 0.001673 ** 
as.character(Engine.Size.L.)5.8          6.94160    5.96807    1.163 0.244817    
as.character(Engine.Size.L.)5.9          1.39676    4.19005    0.333 0.738879    
as.character(Engine.Size.L.)6            3.42439    3.49044    0.981 0.326588    
as.character(Engine.Size.L.)6.2          9.29530    3.31039    2.808 0.005000 ** 
as.character(Engine.Size.L.)6.3          4.51039    4.54476    0.992 0.321017    
as.character(Engine.Size.L.)6.4         10.85576    3.37743    3.214 0.001314 ** 
as.character(Engine.Size.L.)6.5          4.51774    3.75585    1.203 0.229071    
as.character(Engine.Size.L.)6.6          3.34144    3.65195    0.915 0.360236    
as.character(Engine.Size.L.)6.7          3.68715    3.67600    1.003 0.315877    
as.character(Engine.Size.L.)6.8         15.49918    3.78247    4.098 4.22e-05 ***
as.character(Engine.Size.L.)8                 NA         NA       NA       NA    
as.character(Engine.Size.L.)8.4          7.64986    4.33257    1.766 0.077494 .  
Vehicle.ClassFULL-SIZE                   1.01564    0.27701    3.666 0.000248 ***
Vehicle.ClassMID-SIZE                   -0.18202    0.22570   -0.806 0.419990    
Vehicle.ClassMINICOMPACT                -0.42702    0.39704   -1.076 0.282177    
Vehicle.ClassMINIVAN                     0.06808    0.62089    0.110 0.912686    
Vehicle.ClassPICKUP TRUCK - SMALL        2.54305    0.53794    4.727 2.32e-06 ***
Vehicle.ClassPICKUP TRUCK - STANDARD     1.79851    0.37751    4.764 1.93e-06 ***
Vehicle.ClassSPECIAL PURPOSE VEHICLE     4.42754    0.61785    7.166 8.48e-13 ***
Vehicle.ClassSTATION WAGON - MID-SIZE    0.11309    0.71941    0.157 0.875096    
Vehicle.ClassSTATION WAGON - SMALL       0.29094    0.36347    0.800 0.423475    
Vehicle.ClassSUBCOMPACT                  0.25079    0.26829    0.935 0.349952    
Vehicle.ClassSUV - SMALL                 1.00906    0.24747    4.078 4.60e-05 ***
Vehicle.ClassSUV - STANDARD              1.21639    0.31030    3.920 8.93e-05 ***
Vehicle.ClassTWO-SEATER                  0.74992    0.32101    2.336 0.019511 *  
Vehicle.ClassVAN - CARGO               -10.39578    1.40410   -7.404 1.47e-13 ***
Vehicle.ClassVAN - PASSENGER            -5.93240    0.92469   -6.416 1.49e-10 ***
TransmissionA4                          -6.95420    1.26912   -5.480 4.41e-08 ***
TransmissionA5                          -4.38251    1.13501   -3.861 0.000114 ***
TransmissionA6                          -3.81025    0.98285   -3.877 0.000107 ***
TransmissionA7                          -2.11914    1.19929   -1.767 0.077272 .  
TransmissionA8                          -2.54653    0.97252   -2.618 0.008851 ** 
TransmissionA9                          -1.57406    1.00932   -1.560 0.118917    
TransmissionAM5                         -6.08364    3.00177   -2.027 0.042731 *  
TransmissionAM6                         -3.29333    1.07110   -3.075 0.002115 ** 
TransmissionAM7                         -2.67141    1.00913   -2.647 0.008132 ** 
TransmissionAM8                         -3.53233    1.17819   -2.998 0.002726 ** 
TransmissionAM9                          1.36426    3.05757    0.446 0.655472    
TransmissionAS10                        -0.51791    1.03573   -0.500 0.617061    
TransmissionAS4                         -6.69363    3.67794   -1.820 0.068809 .  
TransmissionAS5                         -4.45821    1.43887   -3.098 0.001953 ** 
TransmissionAS6                         -2.84370    0.98043   -2.900 0.003737 ** 
TransmissionAS7                         -3.57823    1.02390   -3.495 0.000477 ***
TransmissionAS8                         -2.57386    0.97696   -2.635 0.008443 ** 
TransmissionAS9                         -2.51935    1.12526   -2.239 0.025193 *  
TransmissionAV                          -5.02398    1.02054   -4.923 8.72e-07 ***
TransmissionAV10                        -4.68015    1.79647   -2.605 0.009201 ** 
TransmissionAV6                         -6.07128    1.07866   -5.629 1.89e-08 ***
TransmissionAV7                         -3.50813    1.08378   -3.237 0.001214 ** 
TransmissionAV8                         -3.82667    1.25696   -3.044 0.002340 ** 
TransmissionM5                          -3.37829    1.04657   -3.228 0.001252 ** 
TransmissionM6                          -3.04044    0.98551   -3.085 0.002042 ** 
TransmissionM7                          -2.35668    1.12850   -2.088 0.036802 *  
Fuel.TypeE                            -138.99466    0.65889 -210.953  < 2e-16 ***
Fuel.TypeN                            -109.81801    5.01259  -21.908  < 2e-16 ***
Fuel.TypeX                             -27.82643    0.47320  -58.805  < 2e-16 ***
Fuel.TypeZ                             -28.06619    0.47258  -59.390  < 2e-16 ***


MODEL 2***************************************************************************************************************************

Coefficients: (1 not defined because of singularities)
                                      Estimate Std. Error t value Pr(>|t|)    
(Intercept)                            5.45399    0.72881   7.483 8.09e-14 ***
as.character(Cylinders)12             -0.43369    0.34906  -1.242 0.214118    
as.character(Cylinders)16             14.19229    0.91562  15.500  < 2e-16 ***
as.character(Cylinders)3              -1.17438    0.43846  -2.678 0.007414 ** 
as.character(Cylinders)4              -1.55772    0.41217  -3.779 0.000158 ***
as.character(Cylinders)5               0.03470    0.45590   0.076 0.939331    
as.character(Cylinders)6              -0.97997    0.36480  -2.686 0.007240 ** 
as.character(Cylinders)8              -0.42728    0.33432  -1.278 0.201277    
as.character(Engine.Size.L.)1          0.79918    0.61582   1.298 0.194409    
as.character(Engine.Size.L.)1.2        0.57425    0.60523   0.949 0.342750    
as.character(Engine.Size.L.)1.3        2.22945    0.65798   3.388 0.000707 ***
as.character(Engine.Size.L.)1.4        2.12792    0.59387   3.583 0.000342 ***
as.character(Engine.Size.L.)1.5        1.50742    0.58545   2.575 0.010049 *  
as.character(Engine.Size.L.)1.6        2.11449    0.59245   3.569 0.000361 ***
as.character(Engine.Size.L.)1.8        2.11878    0.59362   3.569 0.000360 ***
as.character(Engine.Size.L.)2          2.84806    0.59070   4.821 1.45e-06 ***
as.character(Engine.Size.L.)2.1        3.59131    0.74175   4.842 1.31e-06 ***
as.character(Engine.Size.L.)2.2        3.44310    1.15149   2.990 0.002798 ** 
as.character(Engine.Size.L.)2.3        4.27194    0.60673   7.041 2.08e-12 ***
as.character(Engine.Size.L.)2.4        3.09292    0.59249   5.220 1.84e-07 ***
as.character(Engine.Size.L.)2.5        2.69434    0.59197   4.552 5.41e-06 ***
as.character(Engine.Size.L.)2.7        3.87991    0.60760   6.386 1.81e-10 ***
as.character(Engine.Size.L.)2.8        4.27132    0.63644   6.711 2.07e-11 ***
as.character(Engine.Size.L.)2.9        4.41862    0.65235   6.773 1.36e-11 ***
as.character(Engine.Size.L.)3          4.07312    0.61951   6.575 5.21e-11 ***
as.character(Engine.Size.L.)3.2        3.70707    0.64091   5.784 7.59e-09 ***
as.character(Engine.Size.L.)3.3        4.26811    0.62780   6.799 1.14e-11 ***
as.character(Engine.Size.L.)3.4        3.71535    0.63310   5.868 4.59e-09 ***
as.character(Engine.Size.L.)3.5        3.91036    0.61997   6.307 3.00e-10 ***
as.character(Engine.Size.L.)3.6        4.54985    0.62011   7.337 2.42e-13 ***
as.character(Engine.Size.L.)3.7        4.80531    0.62439   7.696 1.59e-14 ***
as.character(Engine.Size.L.)3.8        5.15716    0.62692   8.226 2.27e-16 ***
as.character(Engine.Size.L.)4          5.36515    0.63299   8.476  < 2e-16 ***
as.character(Engine.Size.L.)4.2        7.23678    0.68697  10.534  < 2e-16 ***
as.character(Engine.Size.L.)4.3        5.18423    0.63495   8.165 3.76e-16 ***
as.character(Engine.Size.L.)4.4        5.66942    0.64239   8.825  < 2e-16 ***
as.character(Engine.Size.L.)4.6        5.86333    0.66061   8.876  < 2e-16 ***
as.character(Engine.Size.L.)4.7        5.87289    0.64477   9.109  < 2e-16 ***
as.character(Engine.Size.L.)4.8        5.62153    0.66115   8.503  < 2e-16 ***
as.character(Engine.Size.L.)5          5.78815    0.64025   9.041  < 2e-16 ***
as.character(Engine.Size.L.)5.2        7.19861    0.70258  10.246  < 2e-16 ***
as.character(Engine.Size.L.)5.3        5.13474    0.64085   8.012 1.30e-15 ***
as.character(Engine.Size.L.)5.4        7.49820    0.73003  10.271  < 2e-16 ***
as.character(Engine.Size.L.)5.5        6.37600    0.65059   9.800  < 2e-16 ***
as.character(Engine.Size.L.)5.6        6.19769    0.65806   9.418  < 2e-16 ***
as.character(Engine.Size.L.)5.7        6.36860    0.64368   9.894  < 2e-16 ***
as.character(Engine.Size.L.)5.8        5.84871    1.17318   4.985 6.33e-07 ***
as.character(Engine.Size.L.)5.9        8.52018    0.81252  10.486  < 2e-16 ***
as.character(Engine.Size.L.)6          8.12393    0.67345  12.063  < 2e-16 ***
as.character(Engine.Size.L.)6.2        6.33042    0.64067   9.881  < 2e-16 ***
as.character(Engine.Size.L.)6.3        7.48819    0.88702   8.442  < 2e-16 ***
as.character(Engine.Size.L.)6.4        6.27357    0.65315   9.605  < 2e-16 ***
as.character(Engine.Size.L.)6.5       11.99264    0.71743  16.716  < 2e-16 ***
as.character(Engine.Size.L.)6.6        8.99855    0.70484  12.767  < 2e-16 ***
as.character(Engine.Size.L.)6.7        9.54524    0.70864  13.470  < 2e-16 ***
as.character(Engine.Size.L.)6.8       10.93536    0.72824  15.016  < 2e-16 ***
as.character(Engine.Size.L.)8               NA         NA      NA       NA    
as.character(Engine.Size.L.)8.4        8.35229    0.84211   9.918  < 2e-16 ***
Vehicle.ClassFULL-SIZE                 0.16326    0.05338   3.059 0.002232 ** 
Vehicle.ClassMID-SIZE                 -0.18638    0.04397  -4.238 2.28e-05 ***
Vehicle.ClassMINICOMPACT              -0.23500    0.07083  -3.318 0.000912 ***
Vehicle.ClassMINIVAN                   1.15763    0.12006   9.642  < 2e-16 ***
Vehicle.ClassPICKUP TRUCK - SMALL      2.22408    0.10035  22.164  < 2e-16 ***
Vehicle.ClassPICKUP TRUCK - STANDARD   1.56459    0.06628  23.604  < 2e-16 ***
Vehicle.ClassSPECIAL PURPOSE VEHICLE   1.54632    0.11885  13.011  < 2e-16 ***
Vehicle.ClassSTATION WAGON - MID-SIZE -0.01012    0.14020  -0.072 0.942485    
Vehicle.ClassSTATION WAGON - SMALL     0.31899    0.07066   4.514 6.46e-06 ***
Vehicle.ClassSUBCOMPACT                0.09633    0.05271   1.828 0.067650 .  
Vehicle.ClassSUV - SMALL               1.06063    0.04512  23.507  < 2e-16 ***
Vehicle.ClassSUV - STANDARD            1.69017    0.05487  30.801  < 2e-16 ***
Vehicle.ClassTWO-SEATER                0.32548    0.06203   5.247 1.59e-07 ***
Vehicle.ClassVAN - CARGO               4.65552    0.22420  20.765  < 2e-16 ***
Vehicle.ClassVAN - PASSENGER           4.94137    0.16536  29.883  < 2e-16 ***
Fuel.TypeE                             6.09493    0.10467  58.229  < 2e-16 ***
Fuel.TypeN                             3.86252    0.98993   3.902 9.63e-05 ***
Fuel.TypeX                             1.64164    0.08990  18.261  < 2e-16 ***
Fuel.TypeZ                             2.22825    0.08824  25.252  < 2e-16 ***
