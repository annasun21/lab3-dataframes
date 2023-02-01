### -------------------- Lab 3 --------------------
### This lab is designed to prepare you for PS3

## Create a vector of the number of points the Seahawks scored in the
## first (at least) 5 games
## Hint: google "Seahawks scores", or check the football database:
## http://www.footballdb.com/teams/nfl/seattle-seahawks/results
## here 'Final' displays scores
## Use an appropriate variable name for the scores
## 
## Hint: feel free to invent if you cannot figure this out
seahawks_score <- c(17, 7, 23, 48, 32)

## Create a vector of the number of points the opponent
## scored against Seahawks in the first 5 games
## use an appropriate variable name
opponent_score <- c(16, 27, 27, 45, 39)

## Combine your two vectors into a dataframe
football_scores <- data.frame(seahawks_score, opponent_score)
football_scores

## Create a new column "diff" that is the difference in points
## (in favor of Hawks)
football_scores$diff <- seahawks_score - opponent_score
football_scores

## Create a new column "won" which is TRUE if the Seahawks won,
## ie if Seahawks scored more than the opponent scored against them
football_scores$won <- football_scores$diff > 0
football_scores

## Create a vector of the opponents name (such as "Denver Broncos")
opponent_names <- c("Denver", "San Francisco", "Atlanta", "Detroit", "New Orleans")

## Add the vector of opponents into the data frame
football_scores$opp_name <- opponent_names 
football_scores

## Compute the average score of Seahawks
mean(football_scores$seahawks_score)

## Compute how many games did Seahawks won
## (use the 'won' variable to compute it)
sum(football_scores$won)

## What was the largest difference in scores (in favor of Seahawks)?
max(football_scores$diff)

## How many different opponents did Seahawks have in these games?
## Hint: use `unique()` and `length()`
length(unique(football_scores$opp_name))

## Print the variable names in your data frame
names(football_scores)

## Write a loop over all variables in your data frame
## print the variable name inside the loop
for (elements in names(football_scores)) {
  cat(elements, "\n")
}

## Write a loop over all variables in your data frame
## print the variable name inside the loop,
## and true/false, depending if the variable is numeric
## check out 'is.numeric()'
for (elements in names(football_scores)) {
  cat(elements, "\n")
  if (is.numeric(football_scores[[elements]])) {
    cat(TRUE, "\n")
  } else {
    cat(FALSE, "\n")
  }
}

## Write a loop over all variables in your data frame
## print the variable name inside the loop,
## and the average value of the variable
## if the variable is numeric
for (elements in names(football_scores)) {
  cat(elements, "\n")
  if (is.numeric(football_scores[[elements]])) {
    cat(TRUE, mean(football_scores[[elements]]), "\n")
  } else {
    cat(FALSE, "\n")
  }
}

##
## HR data
## You are working in HR for a large firm with 100 employees.
## You are analyzing their salaries.

## Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee
## 100")
## Hint: use 'paste()` or `str_c`
employees <- c(paste("Employee", 1:100))

## Create a random vector of their 2021 salaries.
## Hint: you may use the runif function to create uniform random numbers,
## e.g. 'runif(100, 60, 120)' creates 100 random numbers between 60 and 120
salaries_2021 <- runif(100, 60, 120)

## Create a random vector of 2022 salaries that are typically
## higher than the 2021 salaires (use runif again).
## For instance, if you create random numbers between 65 and 130, then 2022
## salaries tend to be larger than 2021 salaries.
salaries_2022 <- runif(100, 80, 140)

## Create a data.frame 'salaries' by combining the vectors you just made
salaries <- data.frame(employees, salaries_2021, salaries_2022)

## Create a column 'raise' that stores the size of the
## raise between 2021 and 2022
salaries$raise <- salaries_2022 - salaries_2021

## Retrieve values from your data frame to answer the following questions:
##
## What was the 2022 salary of employee 57
salaries[57, "salaries_2022"]

## Now round the answer down to two digits after comma
## check out 'round()' function
round(salaries[5, "salaries_2022"], 2)

## How many employees got a raise?
salaries$got_raise <- salaries$raise > 0
sum(salaries$got_raise)

## What was the value of the highest raise?
## Round the number to two digits!
round(max(salaries$raise), 2)

## What was the name of the employee who recieved the highest raise?
salaries$employees[salaries$raise == max(salaries$raise)]

## What was the average salary increase?
## Round the number!
round(mean(salaries$raise[salaries$got_raise]), 2)

## For people who did not get a raise, how much money did they lose?
## Round the number!
round(mean(salaries$raise[-salaries$got_raise]), 2)
