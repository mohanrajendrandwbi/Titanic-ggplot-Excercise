install.packages("ggplot2")
library("ggplot2")
install.packages("dplyr")
library("dplyr")
install.packages("tidyr")
library("tidyr")

# 0: Load the data in RStudio
titanicOrginal <- read.csv("titanic_clean.csv")
titanic <- select (titanicOrginal, pclass, survived, sex, age, has_cabin_number)
titanic <- filter(titanic, !is.na(pclass) )
titanic <- mutate(titanic, survived = ifelse(survived == 1, "Survived", "Not Survived"), pclass = factor(pclass), has_cabin_number = factor(ifelse(has_cabin_number == 1, "Has Cabin Number", "No Cabin Number")))
#View(df)

# Check out the structure of titanic
str(titanic)

# Use ggplot() for the first instruction
ggplot(titanic, aes(fill = sex, x = pclass)) +
  geom_bar(position = "dodge")

# Use ggplot() for the second instruction
ggplot(titanic, aes(fill = sex, x = pclass)) +
  geom_bar(position = "dodge") + 
  facet_grid(". ~ survived")

# Position jitter (use below)
posn.j <- position_jitter(0.5, 0)

# Use ggplot() for the last instruction
ggplot(titanic, aes(col = sex, x = pclass, y = age)) +
  geom_jitter(size = 3, alpha = .5, position = posn.j) + 
  facet_grid(". ~ survived")

# Use ggplot() for the last instruction
ggplot(titanic, aes(col = survived, x = pclass, y = age)) +
  geom_jitter(size = 3, alpha = .5, position = posn.j) + 
  facet_grid(". ~ sex")

# Did cabin number got any significance on survival? data wrangling question
ggplot(titanic, aes(col = survived, x = pclass, y = age)) +
  geom_jitter(size = 3, alpha = .5, position = posn.j) + 
  facet_grid(". ~ has_cabin_number")
