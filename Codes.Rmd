hist(dataset$`Geolocation of Aedes Aegypti`)
```
```{r}
hist(dataset$`Mean Population Density/km2`)
```
```{r}
hist(dataset$`Mean Temperature`)
```
```{r}
hist (dataset$`Monthly Mean Precipitation`)
```
```{r}
dataset$logpop <- log(dataset$`Mean Population Density/km2`)
dataset$logae <- log(dataset$`Geolocation of Aedes Aegypti`)
```


```{r}
hist(dataset$logpop)
dataset$sqrtae <- sqrt(dataset$"Geolocation.of.Aedes.Aegypti")
hist(dataset$sqrtae)
```


```{r}
dataset$sqrtpop <- sqrt(dataset$"Mean.Population.Density.km2")
hist(dataset$sqrtpop)
```


```{r}
cor.test(dataset$sqrtae, dataset$Mean.Temperature)
```
```{r}
cor.test(dataset$Geolocation.of.Aedes.Aegypti, dataset$Monthly.Mean.Precipitation)
```
```{r}
cor.test(dataset$sqrtae, dataset$logpop)
```
```{r}
cor.test(dataset$Geolocation.of.Aedes.Aegypti, dataset$Mean.Population.Density.km2)
```
```{r}
cor.test(dataset$Geolocation.of.Aedes.Aegypti, dataset$Mean.Temperature)
```

```{r}
cor.test(dataset$Geolocation.of.Aedes.Aegypti, dataset$Mean.Temperature)
```

```{r}
hist(dataset$logae)
```
```{r}
hist(dataset$logpop)
```


```{r}
dataset$log.pop <- log(dataset$Mean.Population.Density.km2)
hist(dataset$log.pop)
```


```{r}
model1 <- lm(sqrtae ~ logpop , data = dataset1)
model2 <- lm(sqrtae ~ Mean.Temperature + Monthly.Mean.Precipitation, data = dataset)
summary(model2)
```


```{r}
model3 <- lm(sqrtae ~ Mean.Temperature + log.pop + Monthly.Mean.Precipitation, data = dataset)

summary(model3)
confint(model1)

```

```{r}
dataset1 <- dataset
dataset1[is.na(dataset1) | dataset1 == "-Inf"] <- NA
View(dataset1)
```

```{r}
cor.test(dataset1$sqrtae, dataset1$logpop)
```
```{r}
cor.test(dataset1$sqrtae, dataset1$Mean.Temperature)
```
```{r}
cor.test(dataset1$sqrtae, dataset1$Monthly.Mean.Precipitation)
```
```{r}
cor.test(dataset1$sqrtae, dataset1$logpop)
```

```{r}
model4 <- lm(sqrtae ~ Mean.Temperature + logpop + Monthly.Mean.Precipitation, data = dataset1)
summary(model4)
```
```{r}
confint(model4)
```
```{r}
dataset1$X <- NULL
dataset4 <- na.omit(dataset1)
```


```{r}
model5 <- lm(sqrtae ~ Mean.Temperature + logpop + Monthly.Mean.Precipitation, data = dataset4)
summary(model5)
```


```{r}
View (dataset4)
dataset4$residuals <- model5$residuals
dataset4$predictions <- model5$fitted.values
plot(dataset4$predictions, dataset4$residuals, frame.plot = FALSE)
```
