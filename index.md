---
title       : Survivor - Titanic Editon
subtitle    : Data Product Presentation
author      : James Lin
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

### Shiny App: Survivor - Titanic Edition

#### An infamous tragedy event.
On April 15, 1912, the RMS Tatanic sank after colloding with an iceberg at her maiden voyage. 1502 out of 2224 passengers and crew were killed in this tragedy. One of the reasons for such loss of life was that there were not enough lifeboats. 

#### Well Known Data Science Competition Site.
Kaggle is a well known data science competitin site. Titanic: Machine Learning from Disaster is its "getting started" Competition for people who are new to Data Science. It has samll but highly structed data set. It is an idea case for a machine learining Shiny application runs on web server.

#### Motivation
I was looking for an interesting subject for data product shiny application project. At the meantime, I am exploring resource to enhance Data Science knowledge after JUH DS Courses. I discovered Kaggle and its "getting Started" competition page. The Kaggle Titanic data set provides an opportunity to find out who has bette chance to survive in this disaster.


---

## User Guide
Your challenge is to compile a passenger profile who is likely to survive in this diaster. 
You can ajust any passenger profile varilables in the sidebar to improve the passenger survive rate. Any of the variable change will trigger prediction engine to generate result. The result is display at the main panel with an image to present prediction result. A athentic Titanic lifesavor image for the survivor. A R.I.P (rest in peace) image indicts the tragedy ending the passenger. 

NOTE: We all know most of the survivors are women and children. Can you figure out how to constructor a survivor profile for male?

#### Passenger Profile 
* Gender 
* Socio-economic status
* Age
* Number of Siblings/Spouses Aboard
* Number of Parents/Children Aboard

---

## Kaggle Titanic Data Set
The data set is provided by Kaggle (https://www.kaggle.com/c/titanic/data).  

#### VARIABLE DESCRIPTIONS:  
* survival        Survival (0 = No; 1 = Yes)
* pclass          Passenger socio-economic status (1 = 1st; 2 = 2nd; 3 = 3rd)
* name            Name
* sex             Sex
* age             Age If the Age is Estimated, it is in the form xx.5
* sibsp           Number of Siblings/Spouses Aboard
* parch           Number of Parents/Children Aboard
* ticket          Ticket Number
* fare            Passenger Fare
* cabin          Cabin
* embarked       Port of Embarkation (C = Cherbourg; Q = Queenstown; S = Southampton)  


-----

## Survivor Prediction Model: Random forest
Machine learning Algorithm RandomForest is chosen to predict passenger fate. Mean of Age is applied to the Age variable is null and only critical variables are selected to build the prediction model. The same variables are used as input variables in the Shiny applicatin sildbar to predict the result. 

#### Sample Data

```
##   PassengerId Survived Pclass                    Name  Sex Age SibSp Parch
## 1           1        0      3 Braund, Mr. Owen Harris male  22     1     0
##      Ticket Fare Cabin Embarked
## 1 A/5 21171 7.25              S
```

#### Model Performance 

```
##  Accuracy     Kappa 
## 0.8288288 0.6295125
```

