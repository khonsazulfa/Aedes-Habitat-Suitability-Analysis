# Habitat Suitability Variables of Aedes Mosquitos
1. Urbanization and vegetation index  have significant influence on the occurrences of Ae. aegypti and Ae. albopictus
2. Aedes aegypti is more prevalent in highly urbanized and densely populated neighborhoods, while Aedes albopictus is more prevalent in rural, suburban, and forested urban areas. High population density has performed strong positive correlation with the habitat suitability of Aedes.
3. Socioeconomic factor such as population density, house characteristic, and household income level were also found to play a signiﬁcant role in predicting Aedes presence and abundance.
4. Temperatures between 20°C and 31°C could improve the metabolic rate of mosquitoes, which leads to increased mosquito abundance when larval habitats become available
5. Precipitation affects in increased numbers of outdoor rain-ﬁlled containers such as tires, drums and buckets where female Aedes mosquitoes usually place their eggs on those spots and remains for several days. However, up until recently, there is no exact amount of suitable precipitation for Aedes habitat mentioned in the related studies.

# Data Collection
The global occurrences of Aedes aegypti and Aedes albopictus have been compiled and published by [Kraemer et al. (2015b)](https://doi.org/10.7554/eLife). These previous publications provide data on the known global occurrences of Aedes between 1960 and 2014. The dataset stores 19.930 spatially unique occurrence records for Aedes aegypti and 22.137 for Aedes albopictus. 

In this study, the author used average 1 kilometer squared of gridded-cell precipitation and temperature data in December from 1970 until 2000. The data were taken from [WolrdClim](www.wolrdclim.org) version 2.1. December data for climate variable is chosen since it is the peak period of Aedes infestation. In addition, this study also used world population density per grid-cell data from [WorldPop][www.worldpop.org] with 1 kilometer resolution.

# Data Analysis
This study used ArcMap version 10.3 to do mapping of Aedes occurrences and habitat suitability variables.  To know the categorical level of the Aedes occurrences and habitat suitability variables, the author used quantities classification tool. The classification tool used is natural breaks for three categories. Since the variables (temperature, precipitation and population density) are in raster form, the author did some data processing first before going into classification.

1. Firstly, the author did Extract by Mask, to clip the variables (precipitation, temperature and population density) into the Brazil boundary.
2. Secondly, the author used Statistic as Table, to clip the variables data from in Brazil scale into municipalities boundary. The value of each municipality was calculated from the sum of the values in each grids divided by number of grids in one municipality. Aside of getting the spatial data in municipality level for each variable, this tool also provided the attribute table for each variables and each municipalities that can be used for the next analysis (regression model).
3. For the mosquitos occurrences data, the author used Spatial Joint Analysis to clip the points of geolocation into municipality level.
4. After that, the mosquitos data was classified with the same methodology as the other variables.

Finally, this study use R studio to do Pearson’s r correlation and multivariable linear regression analysis to know how much precipitation, temperature and population density affects the occurrence of mosquitos. Pearson’s r correlation aims to know whether there is relationship between two scale variables and to measure how strong the relationship. Before doing correlation and regression, the author run normality test as the both correlation and regression are parametric methods. However, if the data is not normally distributed, the data transformation would be run using square root or log.

![A1](https://github.com/user-attachments/assets/67c11a9a-2fc4-4bfd-8089-7eb42d233880)

# Results

## Historical Occurences of Aedes
![A2](https://github.com/user-attachments/assets/e64f485c-dce1-41b3-b69c-817e78c5ee17)

Figure above depicts the number of Aedes occurrences in Brazil from 1960 until 2014. Rio de Janeiro, which located in the south of Brazil, records the highest occurrence with 82 records in those range of years. 

![B1](https://github.com/user-attachments/assets/1a967fd8-16a3-4f8e-ba1a-764a475e299b)

The summary of Aedes Occurrences shows that the mean and median look similar. However, the distribution curve depicts the data does not perform bell-shaped. Hence, we can conclude that the data is not normally distributed. The author did square root transformation to the occurrences data to make the data normally distributed. The square root transformation succeed to make the data normally distributed as the curve performs bell-shaped.


## Precipitation
![A3](https://github.com/user-attachments/assets/08e105a9-ea86-46b2-a678-527fd24e28cc)

Figure above presents the distribution of rainfall in Brazil Municipalities on December between 1970 until 2020. From the figure we can see that high level of precipitation takes place on the middle area of Brazil which cover 869 municipalities.

![B2](https://github.com/user-attachments/assets/054ffb6a-fd7e-46bb-9b68-94f4bcea782d)

We conclude that Average Precipitation data is normally distributed

![C1](https://github.com/user-attachments/assets/8bd358da-7745-4e2f-94df-4a0746d5468d)

Figure above depicts the result of Correlation Test between Square Root Aedes Occurrences and Average Precipitation. It shows that the correlation coefficient is -0.05. The p-value is less than 0.05. Therefore, we conclude that this negative relationship is statistically significant


## Temperature
![A4](https://github.com/user-attachments/assets/724664d0-8e09-487b-9b8a-639038ef5a3d)

Figure above describes the average temperature in Brazil municipalities on December between 1970 until 2020. From the figure we can see that most of municipalities have mean of temperature range between 25 until 28 degree celcius.

![B3](https://github.com/user-attachments/assets/a59fbb6e-22a9-4cd0-8629-002a07c52f5b)

We conclude that Average Temperature data is normally distributed

![C2](https://github.com/user-attachments/assets/772003f3-8537-4242-8db5-01dd47cb368a)

Figure above depicts the result of Correlation Test between Square Root Aedes Occurrences and Average Temperature. It shows that the correlation coefficient is -0.017. The p-value is more than 0.05. Therefore, we conclude that this negative relationship is not statistically significant

## Population Density
![A5](https://github.com/user-attachments/assets/e004b90f-851b-414e-ac0b-eb7a9e436f29)

Figure above describes the population density in Brazil municipalities on 2020. From the figure we can see that moderate and high population density of municipalities are distributed on the coastal area of Brazil, range from 100 people per kilometer square until more than 1000 people per kilometer square.

![B4](https://github.com/user-attachments/assets/49750ac3-ebb5-4921-b2c1-15e25c52c4ef)

The summary of Population Density shows that the mean and median does not look similar. In addition, the distribution curve depicts the data does not perform bell-shaped. Therefore, the author did log transformation to the population density data. The log transformation succeed to make the data normally distributed as the curve performs bell shaped

![C3](https://github.com/user-attachments/assets/542027b7-6ddb-4d4a-a693-8a2295e30c56)

Figure above depicts the result of Correlation Test between Square Root Aedes Occurrences and Population Density. It shows that the correlation coefficient is 0.078. The p-value is far less than 0.05. Therefore, we conclude that this positive relationship is statistically significant.

## Multivariable linear regression model

![D1](https://github.com/user-attachments/assets/62ea43a5-386e-418c-9334-69a8461b3d35)

Figure above show the result of multivariable linear regression with 95% of confidence interval. R-squared is 0.0086 which indicates that 0.8% of the variation in square root of Aedes occurrences is explained using average precipitation, average temperature and log population density. The result indicates the poor model but that does not mean the model is invalid. The regression equation is:

√Aedes  Occurrences = 1.35 - 0.0003 [Average Temperature] - 0.009 [Average Precipitation] + 0.024 log⁡[Population Density]


![image](https://github.com/user-attachments/assets/7caab82e-c031-407d-8687-9a35755bf97b)

# Conclusion

Based on correlation test and regression modelling, we can see that average precipitation has negative correlation with Aedes occurrence significantly, while population density has positive correlation. That means lower precipitation and higher population density will affect to the higher Aedes occurrences. 

![D2](https://github.com/user-attachments/assets/fbf376d1-f73b-4f79-bbbe-904450b1f2de)

The overlay analysis results 14 municipalities that met the criteria of high suitability habitat according to regression model and literature review (see red area on Figure above). Those are Anahy, Umuarama, Madre de deus, Lauro de Freitas, Campina Grande, Belem, Macae, Poco Fundo, Salvador, Forquilha, Ribeirao das Neves, Jussara and Mataraca. They are mostly located in the coastal area of Brazil.

This study has limitation in terms of data collection, while the author did not incorporate land cover data such as built area and vegetation index and socioeconomic data such as income level.

However, despite the limitation, the finding of this study could help national government to predict the high risk municipalities of Aedes disease in particular time. Having the information of high risk area helps prepare government to do preparedness action such as spraying of resting sites of Aedes and strengthening the capacity of regional healthcare in those area (WHO, 2016). This study finds the benefit of environmental open data (i.e. climate and population data) utilization for public health emergency. This method will be an opportunity to predict any other diseases trigger by environmental variables.
