---
title: 
author: 
output:
  pdf_document: default
  html_document:
    df_print: paged
  pdf_documentt: default
  word_document: default
---


<h3><b>Etapa 1 - Coletando os Dados</h3></b>

<h5>Aqui está a coleta de dados.</h5>



```r
# Coletando dados
dados <- read.csv("dataset.csv", stringsAsFactors = FALSE)
str(dados)
```

```
## 'data.frame':	569 obs. of  32 variables:
##  $ id               : int  87139402 8910251 905520 868871 9012568 906539 925291 87880 862989 89827 ...
##  $ diagnosis        : chr  "B" "B" "B" "B" ...
##  $ radius_mean      : num  12.3 10.6 11 11.3 15.2 ...
##  $ texture_mean     : num  12.4 18.9 16.8 13.4 13.2 ...
##  $ perimeter_mean   : num  78.8 69.3 70.9 73 97.7 ...
##  $ area_mean        : num  464 346 373 385 712 ...
##  $ smoothness_mean  : num  0.1028 0.0969 0.1077 0.1164 0.0796 ...
##  $ compactness_mean : num  0.0698 0.1147 0.078 0.1136 0.0693 ...
##  $ concavity_mean   : num  0.0399 0.0639 0.0305 0.0464 0.0339 ...
##  $ points_mean      : num  0.037 0.0264 0.0248 0.048 0.0266 ...
##  $ symmetry_mean    : num  0.196 0.192 0.171 0.177 0.172 ...
##  $ dimension_mean   : num  0.0595 0.0649 0.0634 0.0607 0.0554 ...
##  $ radius_se        : num  0.236 0.451 0.197 0.338 0.178 ...
##  $ texture_se       : num  0.666 1.197 1.387 1.343 0.412 ...
##  $ perimeter_se     : num  1.67 3.43 1.34 1.85 1.34 ...
##  $ area_se          : num  17.4 27.1 13.5 26.3 17.7 ...
##  $ smoothness_se    : num  0.00805 0.00747 0.00516 0.01127 0.00501 ...
##  $ compactness_se   : num  0.0118 0.03581 0.00936 0.03498 0.01485 ...
##  $ concavity_se     : num  0.0168 0.0335 0.0106 0.0219 0.0155 ...
##  $ points_se        : num  0.01241 0.01365 0.00748 0.01965 0.00915 ...
##  $ symmetry_se      : num  0.0192 0.035 0.0172 0.0158 0.0165 ...
##  $ dimension_se     : num  0.00225 0.00332 0.0022 0.00344 0.00177 ...
##  $ radius_worst     : num  13.5 11.9 12.4 11.9 16.2 ...
##  $ texture_worst    : num  15.6 22.9 26.4 15.8 15.7 ...
##  $ perimeter_worst  : num  87 78.3 79.9 76.5 104.5 ...
##  $ area_worst       : num  549 425 471 434 819 ...
##  $ smoothness_worst : num  0.139 0.121 0.137 0.137 0.113 ...
##  $ compactness_worst: num  0.127 0.252 0.148 0.182 0.174 ...
##  $ concavity_worst  : num  0.1242 0.1916 0.1067 0.0867 0.1362 ...
##  $ points_worst     : num  0.0939 0.0793 0.0743 0.0861 0.0818 ...
##  $ symmetry_worst   : num  0.283 0.294 0.3 0.21 0.249 ...
##  $ dimension_worst  : num  0.0677 0.0759 0.0788 0.0678 0.0677 ...
```

```r
head(dados)
```

```
##         id diagnosis radius_mean texture_mean perimeter_mean area_mean
## 1 87139402         B       12.32        12.39          78.85     464.1
## 2  8910251         B       10.60        18.95          69.28     346.4
## 3   905520         B       11.04        16.83          70.92     373.2
## 4   868871         B       11.28        13.39          73.00     384.8
## 5  9012568         B       15.19        13.21          97.65     711.8
## 6   906539         B       11.57        19.04          74.20     409.7
##   smoothness_mean compactness_mean concavity_mean points_mean symmetry_mean
## 1         0.10280          0.06981        0.03987     0.03700        0.1959
## 2         0.09688          0.11470        0.06387     0.02642        0.1922
## 3         0.10770          0.07804        0.03046     0.02480        0.1714
## 4         0.11640          0.11360        0.04635     0.04796        0.1771
## 5         0.07963          0.06934        0.03393     0.02657        0.1721
## 6         0.08546          0.07722        0.05485     0.01428        0.2031
##   dimension_mean radius_se texture_se perimeter_se area_se smoothness_se
## 1        0.05955    0.2360     0.6656        1.670   17.43      0.008045
## 2        0.06491    0.4505     1.1970        3.430   27.10      0.007470
## 3        0.06340    0.1967     1.3870        1.342   13.54      0.005158
## 4        0.06072    0.3384     1.3430        1.851   26.33      0.011270
## 5        0.05544    0.1783     0.4125        1.338   17.72      0.005012
## 6        0.06267    0.2864     1.4400        2.206   20.30      0.007278
##   compactness_se concavity_se points_se symmetry_se dimension_se radius_worst
## 1       0.011800      0.01683  0.012410     0.01924     0.002248        13.50
## 2       0.035810      0.03354  0.013650     0.03504     0.003318        11.88
## 3       0.009355      0.01056  0.007483     0.01718     0.002198        12.41
## 4       0.034980      0.02187  0.019650     0.01580     0.003442        11.92
## 5       0.014850      0.01551  0.009155     0.01647     0.001767        16.20
## 6       0.020470      0.04447  0.008799     0.01868     0.003339        13.07
##   texture_worst perimeter_worst area_worst smoothness_worst compactness_worst
## 1         15.64           86.97      549.1           0.1385            0.1266
## 2         22.94           78.28      424.8           0.1213            0.2515
## 3         26.44           79.93      471.4           0.1369            0.1482
## 4         15.77           76.53      434.0           0.1367            0.1822
## 5         15.73          104.50      819.1           0.1126            0.1737
## 6         26.98           86.43      520.5           0.1249            0.1937
##   concavity_worst points_worst symmetry_worst dimension_worst
## 1         0.12420      0.09391         0.2827         0.06771
## 2         0.19160      0.07926         0.2940         0.07587
## 3         0.10670      0.07431         0.2998         0.07881
## 4         0.08669      0.08611         0.2102         0.06784
## 5         0.13620      0.08178         0.2487         0.06766
## 6         0.25600      0.06664         0.3035         0.08284
```

```r
tail(dados)
```

```
##            id diagnosis radius_mean texture_mean perimeter_mean area_mean
## 564    894855         B       12.86        13.32          82.82     504.8
## 565 911320502         B       13.17        18.22          84.28     537.3
## 566    898677         B       10.26        14.71          66.20     321.6
## 567    873885         M       15.28        22.41          98.92     710.6
## 568    911201         B       14.53        13.98          93.86     644.2
## 569   9012795         M       21.37        15.10         141.30    1386.0
##     smoothness_mean compactness_mean concavity_mean points_mean symmetry_mean
## 564         0.11340          0.08834        0.03800     0.03400        0.1543
## 565         0.07466          0.05994        0.04859     0.02870        0.1454
## 566         0.09882          0.09159        0.03581     0.02037        0.1633
## 567         0.09057          0.10520        0.05375     0.03263        0.1727
## 568         0.10990          0.09242        0.06895     0.06495        0.1650
## 569         0.10010          0.15150        0.19320     0.12550        0.1973
##     dimension_mean radius_se texture_se perimeter_se area_se smoothness_se
## 564        0.06476    0.2212     1.0420        1.614   16.57      0.005910
## 565        0.05549    0.2023     0.6850        1.236   16.89      0.005969
## 566        0.07005    0.3380     2.5090        2.394   19.33      0.017360
## 567        0.06317    0.2054     0.4956        1.344   19.53      0.003290
## 568        0.06121    0.3060     0.7213        2.143   25.70      0.006133
## 569        0.06183    0.3414     1.3090        2.407   39.06      0.004426
##     compactness_se concavity_se points_se symmetry_se dimension_se radius_worst
## 564        0.02016      0.01902  0.010110     0.01202     0.003107        14.04
## 565        0.01493      0.01564  0.008463     0.01093     0.001672        14.90
## 566        0.04671      0.02611  0.012960     0.03675     0.006758        10.88
## 567        0.01395      0.01774  0.006009     0.01172     0.002575        17.80
## 568        0.01251      0.01615  0.011360     0.02207     0.003563        15.80
## 569        0.02675      0.03437  0.013430     0.01675     0.004367        22.69
##     texture_worst perimeter_worst area_worst smoothness_worst compactness_worst
## 564         21.08           92.80      599.5           0.1547            0.2231
## 565         23.89           95.10      687.6           0.1282            0.1965
## 566         19.48           70.89      357.1           0.1360            0.1636
## 567         28.03          113.80      973.1           0.1301            0.3299
## 568         16.93          103.10      749.9           0.1347            0.1478
## 569         21.84          152.10     1535.0           0.1192            0.2840
##     concavity_worst points_worst symmetry_worst dimension_worst
## 564         0.17910      0.11550         0.2382         0.08553
## 565         0.18760      0.10450         0.2235         0.06925
## 566         0.07162      0.04074         0.2434         0.08488
## 567         0.36300      0.12260         0.3175         0.09772
## 568         0.13730      0.10690         0.2606         0.07810
## 569         0.40240      0.19660         0.2730         0.08666
```

<a name="2"> </a>
<h3><b>Etapa 2 - Pré-Processamento</h3></b>

<h5>Excluindo a coluna ID</h5>
<h5>Independentemente do método de aprendizagem de máquina, deve sempre ser excluídas variáveis de <b>"ID"</B>. Caso contrário, isso pode levar a resultados errados porque o <b>ID</b> pode ser usado para unicamente <b>"prever"</b> cada exemplo. Por conseguinte, um modelo que inclui um  identificador pode sofrer de superajuste (overfitting), e será muito difícil usá-lo para generalizar outros dados.</h5>


```r
dados$id <- NULL

# Ajustando o label da variável alvo
dados$diagnosis = sapply(dados$diagnosis, function(x){ifelse(x=="M", "Maligno", "Benigno")})

head(dados)
```

```
##   diagnosis radius_mean texture_mean perimeter_mean area_mean smoothness_mean
## 1   Benigno       12.32        12.39          78.85     464.1         0.10280
## 2   Benigno       10.60        18.95          69.28     346.4         0.09688
## 3   Benigno       11.04        16.83          70.92     373.2         0.10770
## 4   Benigno       11.28        13.39          73.00     384.8         0.11640
## 5   Benigno       15.19        13.21          97.65     711.8         0.07963
## 6   Benigno       11.57        19.04          74.20     409.7         0.08546
##   compactness_mean concavity_mean points_mean symmetry_mean dimension_mean
## 1          0.06981        0.03987     0.03700        0.1959        0.05955
## 2          0.11470        0.06387     0.02642        0.1922        0.06491
## 3          0.07804        0.03046     0.02480        0.1714        0.06340
## 4          0.11360        0.04635     0.04796        0.1771        0.06072
## 5          0.06934        0.03393     0.02657        0.1721        0.05544
## 6          0.07722        0.05485     0.01428        0.2031        0.06267
##   radius_se texture_se perimeter_se area_se smoothness_se compactness_se
## 1    0.2360     0.6656        1.670   17.43      0.008045       0.011800
## 2    0.4505     1.1970        3.430   27.10      0.007470       0.035810
## 3    0.1967     1.3870        1.342   13.54      0.005158       0.009355
## 4    0.3384     1.3430        1.851   26.33      0.011270       0.034980
## 5    0.1783     0.4125        1.338   17.72      0.005012       0.014850
## 6    0.2864     1.4400        2.206   20.30      0.007278       0.020470
##   concavity_se points_se symmetry_se dimension_se radius_worst texture_worst
## 1      0.01683  0.012410     0.01924     0.002248        13.50         15.64
## 2      0.03354  0.013650     0.03504     0.003318        11.88         22.94
## 3      0.01056  0.007483     0.01718     0.002198        12.41         26.44
## 4      0.02187  0.019650     0.01580     0.003442        11.92         15.77
## 5      0.01551  0.009155     0.01647     0.001767        16.20         15.73
## 6      0.04447  0.008799     0.01868     0.003339        13.07         26.98
##   perimeter_worst area_worst smoothness_worst compactness_worst concavity_worst
## 1           86.97      549.1           0.1385            0.1266         0.12420
## 2           78.28      424.8           0.1213            0.2515         0.19160
## 3           79.93      471.4           0.1369            0.1482         0.10670
## 4           76.53      434.0           0.1367            0.1822         0.08669
## 5          104.50      819.1           0.1126            0.1737         0.13620
## 6           86.43      520.5           0.1249            0.1937         0.25600
##   points_worst symmetry_worst dimension_worst
## 1      0.09391         0.2827         0.06771
## 2      0.07926         0.2940         0.07587
## 3      0.07431         0.2998         0.07881
## 4      0.08611         0.2102         0.06784
## 5      0.08178         0.2487         0.06766
## 6      0.06664         0.3035         0.08284
```

```r
# Muitos classificadores requerem que as variáveis sejam do tipo Fator
table(dados$diagnosis)
```

```
## 
## Benigno Maligno 
##     357     212
```

```r
dados$diagnosis <- factor(dados$diagnosis, levels = c('Benigno', "Maligno"), labels = c("Benigno", "Maligno"))
str(dados$diagnosis)
```

```
##  Factor w/ 2 levels "Benigno","Maligno": 1 1 1 1 1 1 1 2 1 1 ...
```

```r
# Verificando a proporção
round(prop.table(table(dados$diagnosis))*100, digits = 1)
```

```
## 
## Benigno Maligno 
##    62.7    37.3
```

```r
library(ggplot2)

ggplot(dados, aes(x=diagnosis)) + ggtitle('Tipos de Câncer: Benigno e Maligno') + xlab("Tipo de Cancer") +
  geom_bar(aes(y = 100*(..count..)/sum(..count..)), width = 0.5) + ylab("Percentual") + coord_flip() + theme_minimal()
```

![](site_files/figure-latex/p.processamento-1.pdf)<!-- --> 


<b>Medida de Tendência Central</b>

Ao detectar um problema de escala entre os dados, é preciso realizar a normalização do modelo, ou seja, deixar todas as variáveis numéricas em uma mesma escala.
O cálculo de distância feito pelo kNN é dependente das medidas de escala nos dados de entrada.


```r
summary(dados)
```

```
##    diagnosis    radius_mean      texture_mean   perimeter_mean  
##  Benigno:357   Min.   : 6.981   Min.   : 9.71   Min.   : 43.79  
##  Maligno:212   1st Qu.:11.700   1st Qu.:16.17   1st Qu.: 75.17  
##                Median :13.370   Median :18.84   Median : 86.24  
##                Mean   :14.127   Mean   :19.29   Mean   : 91.97  
##                3rd Qu.:15.780   3rd Qu.:21.80   3rd Qu.:104.10  
##                Max.   :28.110   Max.   :39.28   Max.   :188.50  
##    area_mean      smoothness_mean   compactness_mean  concavity_mean   
##  Min.   : 143.5   Min.   :0.05263   Min.   :0.01938   Min.   :0.00000  
##  1st Qu.: 420.3   1st Qu.:0.08637   1st Qu.:0.06492   1st Qu.:0.02956  
##  Median : 551.1   Median :0.09587   Median :0.09263   Median :0.06154  
##  Mean   : 654.9   Mean   :0.09636   Mean   :0.10434   Mean   :0.08880  
##  3rd Qu.: 782.7   3rd Qu.:0.10530   3rd Qu.:0.13040   3rd Qu.:0.13070  
##  Max.   :2501.0   Max.   :0.16340   Max.   :0.34540   Max.   :0.42680  
##   points_mean      symmetry_mean    dimension_mean      radius_se     
##  Min.   :0.00000   Min.   :0.1060   Min.   :0.04996   Min.   :0.1115  
##  1st Qu.:0.02031   1st Qu.:0.1619   1st Qu.:0.05770   1st Qu.:0.2324  
##  Median :0.03350   Median :0.1792   Median :0.06154   Median :0.3242  
##  Mean   :0.04892   Mean   :0.1812   Mean   :0.06280   Mean   :0.4052  
##  3rd Qu.:0.07400   3rd Qu.:0.1957   3rd Qu.:0.06612   3rd Qu.:0.4789  
##  Max.   :0.20120   Max.   :0.3040   Max.   :0.09744   Max.   :2.8730  
##    texture_se      perimeter_se       area_se        smoothness_se     
##  Min.   :0.3602   Min.   : 0.757   Min.   :  6.802   Min.   :0.001713  
##  1st Qu.:0.8339   1st Qu.: 1.606   1st Qu.: 17.850   1st Qu.:0.005169  
##  Median :1.1080   Median : 2.287   Median : 24.530   Median :0.006380  
##  Mean   :1.2169   Mean   : 2.866   Mean   : 40.337   Mean   :0.007041  
##  3rd Qu.:1.4740   3rd Qu.: 3.357   3rd Qu.: 45.190   3rd Qu.:0.008146  
##  Max.   :4.8850   Max.   :21.980   Max.   :542.200   Max.   :0.031130  
##  compactness_se      concavity_se       points_se         symmetry_se      
##  Min.   :0.002252   Min.   :0.00000   Min.   :0.000000   Min.   :0.007882  
##  1st Qu.:0.013080   1st Qu.:0.01509   1st Qu.:0.007638   1st Qu.:0.015160  
##  Median :0.020450   Median :0.02589   Median :0.010930   Median :0.018730  
##  Mean   :0.025478   Mean   :0.03189   Mean   :0.011796   Mean   :0.020542  
##  3rd Qu.:0.032450   3rd Qu.:0.04205   3rd Qu.:0.014710   3rd Qu.:0.023480  
##  Max.   :0.135400   Max.   :0.39600   Max.   :0.052790   Max.   :0.078950  
##   dimension_se        radius_worst   texture_worst   perimeter_worst 
##  Min.   :0.0008948   Min.   : 7.93   Min.   :12.02   Min.   : 50.41  
##  1st Qu.:0.0022480   1st Qu.:13.01   1st Qu.:21.08   1st Qu.: 84.11  
##  Median :0.0031870   Median :14.97   Median :25.41   Median : 97.66  
##  Mean   :0.0037949   Mean   :16.27   Mean   :25.68   Mean   :107.26  
##  3rd Qu.:0.0045580   3rd Qu.:18.79   3rd Qu.:29.72   3rd Qu.:125.40  
##  Max.   :0.0298400   Max.   :36.04   Max.   :49.54   Max.   :251.20  
##    area_worst     smoothness_worst  compactness_worst concavity_worst 
##  Min.   : 185.2   Min.   :0.07117   Min.   :0.02729   Min.   :0.0000  
##  1st Qu.: 515.3   1st Qu.:0.11660   1st Qu.:0.14720   1st Qu.:0.1145  
##  Median : 686.5   Median :0.13130   Median :0.21190   Median :0.2267  
##  Mean   : 880.6   Mean   :0.13237   Mean   :0.25427   Mean   :0.2722  
##  3rd Qu.:1084.0   3rd Qu.:0.14600   3rd Qu.:0.33910   3rd Qu.:0.3829  
##  Max.   :4254.0   Max.   :0.22260   Max.   :1.05800   Max.   :1.2520  
##   points_worst     symmetry_worst   dimension_worst  
##  Min.   :0.00000   Min.   :0.1565   Min.   :0.05504  
##  1st Qu.:0.06493   1st Qu.:0.2504   1st Qu.:0.07146  
##  Median :0.09993   Median :0.2822   Median :0.08004  
##  Mean   :0.11461   Mean   :0.2901   Mean   :0.08395  
##  3rd Qu.:0.16140   3rd Qu.:0.3179   3rd Qu.:0.09208  
##  Max.   :0.29100   Max.   :0.6638   Max.   :0.20750
```

```r
summary(dados[c("radius_mean", "area_mean", "smoothness_mean")])
```

```
##   radius_mean       area_mean      smoothness_mean  
##  Min.   : 6.981   Min.   : 143.5   Min.   :0.05263  
##  1st Qu.:11.700   1st Qu.: 420.3   1st Qu.:0.08637  
##  Median :13.370   Median : 551.1   Median :0.09587  
##  Mean   :14.127   Mean   : 654.9   Mean   :0.09636  
##  3rd Qu.:15.780   3rd Qu.: 782.7   3rd Qu.:0.10530  
##  Max.   :28.110   Max.   :2501.0   Max.   :0.16340
```

<b>Criando uma Função de Normalização</b>


```r
normalizar <- function(x){
  return ((x - min(x)) / (max(x) - min(x)))
}
```

<b>Normalizando os Dados<b>


```r
dados_norm <- as.data.frame(lapply(dados[2:31], normalizar))
head(dados_norm)
```

```
##   radius_mean texture_mean perimeter_mean  area_mean smoothness_mean
## 1   0.2526859    0.0906324      0.2422777 0.13599152       0.4529205
## 2   0.1712812    0.3124789      0.1761454 0.08606575       0.3994764
## 3   0.1921056    0.2407846      0.1874784 0.09743372       0.4971563
## 4   0.2034644    0.1244505      0.2018520 0.10235419       0.5756974
## 5   0.3885182    0.1183632      0.3721927 0.24106045       0.2437483
## 6   0.2171896    0.3155225      0.2101444 0.11291622       0.2963799
##   compactness_mean concavity_mean points_mean symmetry_mean dimension_mean
## 1        0.1546838     0.09341612  0.18389662     0.4540404      0.2019798
## 2        0.2923747     0.14964855  0.13131213     0.4353535      0.3148694
## 3        0.1799276     0.07136832  0.12326044     0.3303030      0.2830666
## 4        0.2890007     0.10859888  0.23836978     0.3590909      0.2266217
## 5        0.1532421     0.07949859  0.13205765     0.3338384      0.1154170
## 6        0.1774124     0.12851453  0.07097416     0.4904040      0.2676917
##    radius_se texture_se perimeter_se    area_se smoothness_se compactness_se
## 1 0.04508419 0.06749470   0.04301937 0.01985065     0.2152497     0.07170968
## 2 0.12275937 0.18493635   0.12594826 0.03791198     0.1957032     0.25203533
## 3 0.03085280 0.22692716   0.02756443 0.01258503     0.1171092     0.05334665
## 4 0.08216549 0.21720297   0.05154785 0.03647380     0.3248802     0.24580166
## 5 0.02418975 0.01155852   0.02737596 0.02039231     0.1121460     0.09461652
## 6 0.06333514 0.23864038   0.06827498 0.02521115     0.1891763     0.13682519
##   concavity_se points_se symmetry_se dimension_se radius_worst texture_worst
## 1   0.04250000 0.2350824   0.1598188   0.04675041    0.1981501    0.09648188
## 2   0.08469697 0.2585717   0.3821410   0.08371682    0.1405194    0.29104478
## 3   0.02666667 0.1417503   0.1308324   0.04502301    0.1593739    0.38432836
## 4   0.05522727 0.3722296   0.1114144   0.08800077    0.1419424    0.09994670
## 5   0.03916667 0.1734230   0.1208420   0.03013280    0.2942014    0.09888060
## 6   0.11229798 0.1666793   0.1519390   0.08444233    0.1828531    0.39872068
##   perimeter_worst area_worst smoothness_worst compactness_worst concavity_worst
## 1       0.1820808 0.08943669        0.4446279        0.09635106      0.09920128
## 2       0.1388017 0.05888714        0.3310440        0.21752966      0.15303514
## 3       0.1470193 0.07034015        0.4340619        0.11730749      0.08522364
## 4       0.1300862 0.06114825        0.4327412        0.15029446      0.06924121
## 5       0.2693859 0.15579532        0.2735918        0.14204771      0.10878594
## 6       0.1793914 0.08240759        0.3548174        0.16145181      0.20447284
##   points_worst symmetry_worst dimension_worst
## 1    0.3227148      0.2487680      0.08310376
## 2    0.2723711      0.2710428      0.13662600
## 3    0.2553608      0.2824759      0.15590975
## 4    0.2959107      0.1058545      0.08395645
## 5    0.2810309      0.1817465      0.08277581
## 6    0.2290034      0.2897694      0.18234291
```


<a name="3"> </a>
<h3><b>Etapa 3 - Treinando o modelo com knn</h3></b>


```r
library(class)
library(caTools)

# Criando dados de treino e dados de teste

dados_treino <- dados_norm[1:469, ]
dados_teste <- dados_norm[470:569, ]

# Criando os labels para os dados de treino e de teste
dados_treino_labels <- dados[1:469, 1]
dados_teste_labels <- dados[470:569, 1]
length(dados_treino_labels)
```

```
## [1] 469
```

```r
length(dados_teste_labels)
```

```
## [1] 100
```

```r
# Criando o modelo
modelo_knn_v1 <- knn(train = dados_treino, 
                     test = dados_teste,
                     cl = dados_treino_labels, 
                     k = 21)

# A função knn() retorna um objeto do tipo fator com as previsões para cada exemplo no dataset de teste

summary(modelo_knn_v1)
```

```
## Benigno Maligno 
##      63      37
```

<a name="3.1"> </a>
<h3><b>Etapa 3.1 - Avaliando o Modelo 1 - knn</h3></b>



```r
library(gmodels)

# Criando uma tabela cruzada dos dados previstos x dados atuais
# Usaremos amostra com 100 observações: length(dados_teste_labels)
CrossTable(x = dados_teste_labels, y = modelo_knn_v1, prop.chisq = FALSE)
```

```
## 
##  
##    Cell Contents
## |-------------------------|
## |                       N |
## |           N / Row Total |
## |           N / Col Total |
## |         N / Table Total |
## |-------------------------|
## 
##  
## Total Observations in Table:  100 
## 
##  
##                    | modelo_knn_v1 
## dados_teste_labels |   Benigno |   Maligno | Row Total | 
## -------------------|-----------|-----------|-----------|
##            Benigno |        61 |         0 |        61 | 
##                    |     1.000 |     0.000 |     0.610 | 
##                    |     0.968 |     0.000 |           | 
##                    |     0.610 |     0.000 |           | 
## -------------------|-----------|-----------|-----------|
##            Maligno |         2 |        37 |        39 | 
##                    |     0.051 |     0.949 |     0.390 | 
##                    |     0.032 |     1.000 |           | 
##                    |     0.020 |     0.370 |           | 
## -------------------|-----------|-----------|-----------|
##       Column Total |        63 |        37 |       100 | 
##                    |     0.630 |     0.370 |           | 
## -------------------|-----------|-----------|-----------|
## 
## 
```

<a name="3.2"> </a>
<h3><b>Etapa 3.2 - Interpretando os resultados do modelo 1 - knn</h3></b>

<h5> A tabela cruzada mostra 4 possíveis valores, que representam os falso/verdadeiro positivo e negativo.
Temos duas colunas listando os labels originais nos dados observados. Temos duas linhas listando os labels dos dados de teste

<b>Temos:</b>
<h5>* Cenário 1: Célula Benigno (Observado) x Benigno (Previsto) - 61 casos - true positive;
* Cenário 2: Célula Maligno (Observado) x Benigno (Previsto) - 00 casos - false positive (o modelo errou);
* Cenário 3: Célula Benigno (Observado) x Maligno (Previsto) - 02 casos - false negative (o modelo errou);
* Cenário 4: Célula Maligno (Observado) x Maligno (Previsto) - 37 casos - true negative;</h5> 

<b>Lendo a Confusion Matrix (Perspectiva de ter ou não a doença):</b>

<h5>* True Negative  = nosso modelo previu que a pessoa NÃO tinha a doença e os dados mostraram que realmente a pessoa NÃO tinha a doença;
* False Positive = nosso modelo previu que a pessoa tinha a doença e os dados mostraram que NÃO, a pessoa tinha a doença
+ False Negative = nosso modelo previu que a pessoa NÃO tinha a doença e os dados mostraram que SIM, a pessoa tinha a doença
* True Positive = nosso modelo previu que a pessoa tinha a doença e os dados mostraram que SIM, a pessoa tinha a doença</h5>

<h5>Falso Positivo - Erro Tipo I
Falso Negativo - Erro Tipo II</h5>

<b>Taxa de acerto do Modelo: 98% (acertou 98 em 100)</b>

<a name="3.3"> </a>
<h3><b>Etapa 3.3 - Otimizando a Performance - Modelo 2 - knn</h3></b>

<h5>Usando a função scale() para padronizar o z-score <h5>




```r
dados_z <- as.data.frame(scale(dados[-1]))

# Confirmando transformação realizada com sucesso
summary(dados$area_mean)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   143.5   420.3   551.1   654.9   782.7  2501.0
```

```r
# Criando novos datasets de treino e de teste

dados_treino1 <- dados_z[1:469, ]
dados_teste1 <- dados_z[470:569, ]

dados_treino1_labels <- dados[1:469, 1]
dados_teste1_labels <- dados[470:569, 1]

modelo_knn_v2 <- knn(train = dados_treino1,
                     test = dados_teste1,
                     cl = dados_treino1_labels,
                     k = 21)

# Criando uma tabela cruzada dos dados previstos x dados atuais

CrossTable(x = dados_teste1_labels, modelo_knn_v2, prop.chisq = FALSE)
```

```
## 
##  
##    Cell Contents
## |-------------------------|
## |                       N |
## |           N / Row Total |
## |           N / Col Total |
## |         N / Table Total |
## |-------------------------|
## 
##  
## Total Observations in Table:  100 
## 
##  
##                     | modelo_knn_v2 
## dados_teste1_labels |   Benigno |   Maligno | Row Total | 
## --------------------|-----------|-----------|-----------|
##             Benigno |        61 |         0 |        61 | 
##                     |     1.000 |     0.000 |     0.610 | 
##                     |     0.924 |     0.000 |           | 
##                     |     0.610 |     0.000 |           | 
## --------------------|-----------|-----------|-----------|
##             Maligno |         5 |        34 |        39 | 
##                     |     0.128 |     0.872 |     0.390 | 
##                     |     0.076 |     1.000 |           | 
##                     |     0.050 |     0.340 |           | 
## --------------------|-----------|-----------|-----------|
##        Column Total |        66 |        34 |       100 | 
##                     |     0.660 |     0.340 |           | 
## --------------------|-----------|-----------|-----------|
## 
## 
```

<a name="3.4"> </a>
<h3><b>Etapa 3.4 - Interpretando os resultados do modelo 2 - knn</h3></b>

<b>Temos:</b>
<h5>* Cenário 1: Célula Benigno (Observado) x Benigno (Previsto) - 61 casos - true positive;
* Cenário 2: Célula Maligno (Observado) x Benigno (Previsto) - 00 casos - false positive (o modelo errou);
* Cenário 3: Célula Benigno (Observado) x Maligno (Previsto) - 05 casos - false negative (o modelo errou);
* Cenário 4: Célula Maligno (Observado) x Maligno (Previsto) - 34 casos - true negative;</h5> 
<h5>Podemos observar que aumentou a quantidade de erros em nosso modelo.</h5>
<b>Taxa de acerto do Modelo: 95%;</b>
<h5>Comparamos apenas o primeiro e o segundo modelo ficaremos por enquanto com o primeiro modelo.</h5>

<a name="4"> </a>
<h3><b>Etapa 4 - Construindo um Modelo com Algoritmo Support Vector Machine (svm) - modelo 3</h3></b>


```r
# Prepara o dataset

dados1 <- read.csv("dataset.csv", stringsAsFactors = FALSE)
dados1$id = NULL
dados1[,'index'] <- ifelse(runif(nrow(dados1)) < 0.8,1,0)
head(dados1)
```

```
##   diagnosis radius_mean texture_mean perimeter_mean area_mean smoothness_mean
## 1         B       12.32        12.39          78.85     464.1         0.10280
## 2         B       10.60        18.95          69.28     346.4         0.09688
## 3         B       11.04        16.83          70.92     373.2         0.10770
## 4         B       11.28        13.39          73.00     384.8         0.11640
## 5         B       15.19        13.21          97.65     711.8         0.07963
## 6         B       11.57        19.04          74.20     409.7         0.08546
##   compactness_mean concavity_mean points_mean symmetry_mean dimension_mean
## 1          0.06981        0.03987     0.03700        0.1959        0.05955
## 2          0.11470        0.06387     0.02642        0.1922        0.06491
## 3          0.07804        0.03046     0.02480        0.1714        0.06340
## 4          0.11360        0.04635     0.04796        0.1771        0.06072
## 5          0.06934        0.03393     0.02657        0.1721        0.05544
## 6          0.07722        0.05485     0.01428        0.2031        0.06267
##   radius_se texture_se perimeter_se area_se smoothness_se compactness_se
## 1    0.2360     0.6656        1.670   17.43      0.008045       0.011800
## 2    0.4505     1.1970        3.430   27.10      0.007470       0.035810
## 3    0.1967     1.3870        1.342   13.54      0.005158       0.009355
## 4    0.3384     1.3430        1.851   26.33      0.011270       0.034980
## 5    0.1783     0.4125        1.338   17.72      0.005012       0.014850
## 6    0.2864     1.4400        2.206   20.30      0.007278       0.020470
##   concavity_se points_se symmetry_se dimension_se radius_worst texture_worst
## 1      0.01683  0.012410     0.01924     0.002248        13.50         15.64
## 2      0.03354  0.013650     0.03504     0.003318        11.88         22.94
## 3      0.01056  0.007483     0.01718     0.002198        12.41         26.44
## 4      0.02187  0.019650     0.01580     0.003442        11.92         15.77
## 5      0.01551  0.009155     0.01647     0.001767        16.20         15.73
## 6      0.04447  0.008799     0.01868     0.003339        13.07         26.98
##   perimeter_worst area_worst smoothness_worst compactness_worst concavity_worst
## 1           86.97      549.1           0.1385            0.1266         0.12420
## 2           78.28      424.8           0.1213            0.2515         0.19160
## 3           79.93      471.4           0.1369            0.1482         0.10670
## 4           76.53      434.0           0.1367            0.1822         0.08669
## 5          104.50      819.1           0.1126            0.1737         0.13620
## 6           86.43      520.5           0.1249            0.1937         0.25600
##   points_worst symmetry_worst dimension_worst index
## 1      0.09391         0.2827         0.06771     0
## 2      0.07926         0.2940         0.07587     1
## 3      0.07431         0.2998         0.07881     1
## 4      0.08611         0.2102         0.06784     1
## 5      0.08178         0.2487         0.06766     1
## 6      0.06664         0.3035         0.08284     1
```

```r
# Dados de treino e teste
trainset <- dados1[dados1$index==1,]
testset <- dados1[dados1$index==0,]

# Obter o índice 
trainColNum <- grep('index', names(trainset))

# Remover o índice dos datasets
trainset <- trainset[,-trainColNum]
testset <- testset[,-trainColNum]

# Obter índice de coluna da variável target no conjunto de dados
typeColNum <- grep('diag',names(dados1))

# Cria o modelo
# Nós ajustamos o kernel para radial, já que este conjunto de dados não tem um 
# plano linear que pode ser desenhado
library(e1071)
set.seed(50) 

modelo_svm_v1 <- svm(diagnosis ~ ., 
                     data = trainset, 
                     type = 'C-classification', 
                     kernel = 'radial')
```


<a name="4.1"> </a>
<h3><b>Etapa 4.1 - Avaliando o Modelo 3 (svm)</h3></b>


```r
# Previsões nos dados de treino
pred_train <- predict(modelo_svm_v1, trainset) 

# Percentual de previsões corretas com dataset de treino
acuracia_modelo3 <- mean(pred_train == trainset$diagnosis)  
acuracia_modelo3
```

```
## [1] 0.984375
```

```r
# Previsões nos dados de teste
pred_test <- predict(modelo_svm_v1, testset) 

# Percentual de previsões corretas com dataset de teste
mean(pred_test == testset$diagnosis)  
```

```
## [1] 0.9834711
```

```r
# Confusion Matrix
table(pred_test, testset$diagnosis)
```

```
##          
## pred_test  B  M
##         B 75  1
##         M  1 44
```

<a name="4.2"> </a>
<h3><b>Etapa 4.2 - Interpretando os resultados do o Modelo 3 (svm)</h3></b>

<b> Taxa de acerto do Modelo:</b>

```r
acuracia_modelo3
```

```
## [1] 0.984375
```

<h5>Comparamos apenas o primeiro e o segundo modelo ficaremos por enquanto com o primeiro modelo.</h5>

<a name="5"> </a>
<h3><b>Etapa 5 - Construindo o Modelo  4 - Random Forest</h3></b>


```r
 # Criando o modelo
library(rpart)
modelo_rf_v1 = rpart(diagnosis ~ ., data = trainset, control = rpart.control(cp = .0005)) 

# Previsões nos dados de teste
tree_pred = predict(modelo_rf_v1, testset, type='class')

# Percentual de previsões corretas com dataset de teste
acuracia_modelo4 <- mean(tree_pred==testset$diagnosis) 
acuracia_modelo4
```

```
## [1] 0.9669421
```

```r
# Confusion Matrix
table(tree_pred, testset$diagnosis)
```

```
##          
## tree_pred  B  M
##         B 74  2
##         M  2 43
```
 
 

<a name="5.1"> </a>
<h3><b>Etapa 5.1 - Interpretando os resultados do o Modelo 4 (Random Forest)</h3></b>

<b> Taxa de acerto do Modelo:</b>


```r
mean(tree_pred==testset$diagnosis) 
```

```
## [1] 0.9669421
```



<h5>Comparamos apenas o primeiro e o segundo modelo ficaremos por enquanto com o primeiro modelo.</h5>

<a name="6"> </a>
<h3><b>Etapa 6 - Conclusão</h3></b>
