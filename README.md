---
title: "BellaBeat_Analysis"
author: "Praveen Choragudi"
date: "`r Sys.Date()`"
output:
  pdf_document: default
  html_document: default
---
## Table of Contents

* Introduction
* Ask phase
* Prepare phase
* Process phase
* Analyze phase
* Share Phase
* Act Phase
* Conclusion

## Introduction

 Bellabeat is a high-tech producer of goods with an emphasis on tracking and enhancing women's health. They are a prosperous small business with the potential to dominate the global market for smart devices. As a junior data analyst for Bellabeat's marketing analyst team, I will be examining some fitness data from smart devices that could open up new business options for the organisation.
 
### Characters and products

#### Characters

* Urška Sršen: Bellabeat’s cofounder and Chief Creative Officer
* Sando Mur: Mathematician and Bellabeat’s cofounder; key member of the Bellabeat executive team.

* Bellabeat marketing analytics team: A team of data analysts responsible for collecting, analyzing, and reporting data that helps guide Bellabeat’s marketing strategy. You joined this team six months ago and have been busy learning about Bellabeat’’s mission and business goals — as well as how you, as a junior data analyst, can help Bellabeat achieve them.

#### Products

* Bellabeat app: The Bellabeat app provides users with health data related to their activity, sleep, stress, menstrual cycle, and mindfulness habits. This data can help users better understand their current habits and make healthy decisions. The Bellabeat app connects to their line of smart wellness products.

* Leaf: Bellabeat’s classic wellness tracker can be worn as a bracelet, necklace, or clip. The Leaf tracker connects to the Bellabeat app to track activity, sleep, and stress.

* Time: This wellness watch combines the timeless look of a classic timepiece with smart technology to track user activity, sleep, and stress. The Time watch connects to the Bellabeat app to provide you with insights into your daily wellness.

* Spring: This is a water bottle that tracks daily water intake using smart technology to ensure that you are appropriately hydrated throughout the day. The Spring bottle connects to the Bellabeat app to track your hydration levels.

#### Installing and loading common packages and libraries

 We install and load packages along the way as we may discover we need different packages after we start our analysis. If you already have some of these packages installed and loaded, you can skip those ones - or you can choose to run those specific lines of code anyway. It may take a few moments to run.
 
## Ask phase
Questions guiding the analysis

* What are some trends in the smart device usage?
* How could these trends apply to bellabeat customers
* How could these trends help influence Bellabeat marketing strategy?

### Business Task

Analyze fitness data from smart devices to spot patterns in consumer usage, then make suggestions on how these patterns can influence Bellabeat's marketing strategy.

## Prepare phase

 This dataset was created by participants in a distributed survey who used Amazon Mechanical Turk between December 3, 2016, and December 5, 2016. Thirty eligible Fitbit users agreed to submit their personal tracker data, which included minute-level output for heart rate, sleep, and physical activity monitoring. 

 Reports can be analysed individually using the export session ID (column A) or timestamp (column B). The difference in output reflects the use of various Fitbit tracker models and personal monitoring habits and preferences.

### Data Organization

There are 18 CSV files in the structured dataset. It is set up in a long data format, which means that none of the values in the first column repeat.

### Data Credibility/Limitations

 Since the statistics were obtained from a third party, it is difficult to confirm their accuracy. Additionally, important participant demographics were left out, making it impossible to determine whether or not the data is representative of the population. Only current Fitbit users are represented in the data, which could lead to sample bias. 
 Due to only 33 people reporting their data, the sample size is extremely tiny. Since the previous update was made two years ago, the data is no longer accurate. I will however continue to examine the dataset to find trends in the users' everyday usage.

### Data liscensing/privacy

 Our dataset's metadata includes information about licencing and privacy. Open-source data with a CCO:public domain licence. The general public has access to it and can use and reuse it.
## Process phase

 In this phase, I'll make sure my data is accurate by cleaning it up, which includes date formatting, looking for duplicates, ensuring that column names are consistent, looking for missing data, etc. My data will be prepared and perfectly suited to the business task thanks to this. 

 I'll be utilising the programming language R throughout for all of my data cleaning, analysis, and visualisation because I enjoyed studying it and I want to put it to use and show forth my skills.
 
## Analysis phase

I will not be using the sleep_day and daily_intensities for analysis because while exploring the datasets, i noticed that the daily_activity table contains the consolidated information from both tables.

## Share phase

## Act Phase

#### Recommendations: 

* Sleep Journal: The Bellabeat app may offer a customised sleep journal for each user in addition to the health information it offers. The user will be able to see trends and alter their behaviour to improve their sleep if they use this notebook to track their sleep for a certain period of time. 

* Client segmentation Being in the healthcare industry, Bellabeat Company understands the value of "understanding your consumer." Bellabeat Company may take advantage of the growing need in the healthcare sector for individualised treatment and value-based care. It would be wonderful to include essential consumer demographic information like age and occupation!

* Customized notifications and alarms: Bellabeat can use the app's notifications and alarms to remind users to go to bed or exercise. Additionally, this needs to be tailored. 

* Periodic report: Users can receive thorough evaluations of their weekly performance, which will both inspire them and help them identify their strongest points for development.

## Conclusion

 Bellabeat Firm understands the value of data collecting and analysis in enhancing business choices. Bellabeat Company is a high-tech company with significant potential to become a worldwide smart device market. In this case study, I used fitbit data to learn how Bellabeat customers interact with non-Bellabeat products, spot some usage patterns for smart devices, analyse how Bellabeat customers might be affected by these patterns, and then offer suggestions that could have an impact on Bellabeat's marketing strategy.
