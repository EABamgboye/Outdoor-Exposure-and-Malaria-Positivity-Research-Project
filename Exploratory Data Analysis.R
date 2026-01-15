

#------------------------------------------------------------------
#  1. Total number of pregnant women interviewed in each state
#-----------------------------------------------------------------
 ##Summarize data by state and count number of pregnant women in each state 
 state_counts <- project_data %>%
  group_by(state) %>%
  summarise(
    total_pregnant_women = n()
  )

print(state_counts)
#---------------------------------------------------------------------------------------------------------------
## 2. What is the age distribution, educational, marital status and employment staus of the pregnant women(overall and by state) 
#----------------------------------------------------------------------------------------------------------------

# -------------------------------
#---Age distribution(Overall)
#-------------------------------
#Visualize the age distribution using a histogram 

##Plot histogram(overall)
ggplot(project_data, aes(x = age_years)) +
  geom_histogram(bins = 10) +
  labs(
    title = "Age Distribution of Pregnant Women",
    x = "Age (years)",
    y = "Frequency"
  ) +
  theme_manuscript()

#-----------------------------------
#Age distribution by state
#-----------------------------------
##Plot histogram(state)
ggplot(project_data, aes(x = age_years)) +
  geom_histogram(bins = 10) +
  facet_wrap(~ state) +
  labs(
    title = "Age Distribution of Pregnant Women by State",
    x = "Age (years)",
    y = "Count"
  )+
  theme_manuscript()

##Create Age Category 
project_data <- project_data %>%
  mutate(
    age_group = cut(
      age_years,
      breaks = c(0, 17, 24, 34, 49),
      labels = c("<18", "18–24", "25–34", "35–49"),
      right = TRUE
    )
  )

table(project_data$age_group)

#--------------------------------------------------------------
# Education (Overall)
#--------------------------------------------------------------
#Visualize using a barplot

##Barplot Overall
ggplot(project_data, aes(x = education)) +
  geom_bar() +
  labs(
    title = "Educational Status of Pregnant Women",
    x = "Education",
    y = "Count"
  )+
  theme_manuscript()

#-------------------------------
# Education (By state)
#-------------------------------

##Dodged Barplot (State)
ggplot(project_data, aes(x = education, fill = state)) +
  geom_bar(position = "dodge") +
  labs(
    title = "Educational Status by State",
    x = "Education",
    y = "Count"
  )+
  theme_manuscript()


#-------------------------------
# Marital status(Overall)-------
#-------------------------------
#Visualize using a barplot

##Barplot Overall
  ggplot(project_data, aes(x = marital_status)) +
  geom_bar() +
  labs(
    title = "Marital Status of Pregnant Women",
    x = "Marital Status",
    y = "Count"
  )+
  theme_manuscript()

##-----------------------------------
#Marital Status(by state)
##-----------------------------------

##Dodged Barplot (State)
ggplot(project_data, aes(x = marital_status, fill= state)) +
  geom_bar(position = "dodge") +
  labs(
    title = "Marital Status of Pregnant Women",
    x = "Marital Status",
    y = "Count"
  )+
  theme_manuscript()


#-------------------------------
 # Employment status(Overall)
#-------------------------------
#Visualize using a barplot

##Barplot Overall
ggplot(project_data, aes(x = employed)) +
  geom_bar() +
  labs(
    title = "Employment Status of Pregnant Women",
    x = "Employment Status",
    y = "Count"
  )+
  theme_manuscript()

#-------------------------------
# Employment status(by State)
#-------------------------------

##Dodged Barplot (State)
ggplot(project_data, aes(x = employed, fill = state)) +
  geom_bar(position = "dodge") +
  labs(
    title = "Employment Status of Pregnant Women",
    x = "Employment Status",
    y = "Count"
  )+
  theme_manuscript()


#-------------------------------
#  3. What is the prevalence of malaria among the pregnant women (overall, state)
#-------------------------------


#  Overall malaria prevalence
#Compute malaria prevalence from the malaria outcome variable "malaria_rdt" where 1 is positive , 0 is negative
overall_malaria_prev <- project_data %>%
  summarise(
    malaria_prevalence = mean(malaria_rdt, na.rm = TRUE)
  )

print(overall_malaria_prev)

# Malaria prevalence by state
#Summarize the data by state and then compute prevalence

state_malaria_prev <- project_data %>%
  group_by(state) %>%
  summarise(
    malaria_prevalence = mean(malaria_rdt, na.rm = TRUE)
  )

print(state_malaria_prev)

##Plot malaria positivity
ggplot(state_malaria_prev, aes(x = state, y = malaria_prevalence)) +
  geom_col() +
  labs(
    title = "Malaria Prevalence Among Pregnant Women by State",
    x = "State",
    y = "Prevalence"
  )+
  theme_manuscript()

#--------------------------------------------------------------------------------------
# 4. What is the prevalence of malaria by age, education, marital and employment status
#--------------------------------------------------------------------------------------
##Stratify the prevalence by the categories of the selected socio-demographic variables and make a bar(col) plot 

#--------------------------------------
#-------By age group-------------------
#--------------------------------------
project_data %>%
  group_by(age_group) %>%
  summarise(
    malaria_prevalence = mean(malaria_rdt, na.rm = TRUE)
  ) %>%
  ggplot(aes(x = age_group, y = malaria_prevalence)) +
  geom_col() +
  labs(
    title = "Malaria Prevalence by Age Group",
    x = "Age Group",
    y = "Prevalence"
  )+
  theme_manuscript()

#-------------------------------------#
##--------By education----------------#
#-------------------------------------#
project_data %>%
  group_by(education) %>%
  summarise(
    malaria_prevalence = mean(malaria_status, na.rm = TRUE)
  ) %>%
  ggplot(aes(x = education, y = malaria_prevalence)) +
  geom_col() +
  labs(
    title = "Malaria Prevalence by Education",
    x = "Education",
    y = "Prevalence"
  ) + 
  theme_manuscript()

#--------------------------------------#
##----By marital status----------------##
#---------------------------------------#
project_data %>%
  group_by(marital_status) %>%
  summarise(
    malaria_prevalence = mean(malaria_rdt, na.rm = TRUE)
  ) %>%
  ggplot(aes(x = marital_status, y = malaria_prevalence)) +
  geom_col() +
  labs(
    title = "Malaria Prevalence by Marital Status",
    x = "Marital Status",
    y = "Prevalence"
  ) + 
  theme_manuscript()

#------------------------------------------#
#----------By employment status------------#
#------------------------------------------#
project_data %>%
  group_by(employed) %>%
  summarise(
    malaria_prevalence = mean(malaria_rdt, na.rm = TRUE)
  ) %>%
  ggplot(aes(x = employed, y = malaria_prevalence)) +
  geom_col() +
  labs(
    title = "Malaria Prevalence by Employment Status",
    x = "Employment Status",
    y = "Prevalence"
  ) + 
  theme_manuscript()

