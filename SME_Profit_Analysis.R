# SME Profit Analysis: MLR, Model Selection, PCA

# ========================
# 1. Load Libraries
# ========================
library(readr)
library(ggplot2) 
library(caTools)
library(leaps)
library(MASS)
library(dplyr)

# ========================
# 2. Load Dataset
# ========================
data <- read_csv("C:/Users/muska/Downloads/SME_Profit.csv")
View(data)
head(data)
colnames(data)

# ========================
# 3. Exploratory Analysis
# ========================
# Scatter plots for numerical predictors
plot(data$`R&D Spend`, data$Profit, main="R&D Spend vs Profit", xlab="R&D Spend", ylab="Profit")
plot(data$Administration, data$Profit, main="Administration vs Profit", xlab="Administration", ylab="Profit")
plot(data$`Marketing Spend`, data$Profit, main="Marketing Spend vs Profit", xlab="Marketing Spend", ylab="Profit")

# State vs Profit
ggplot(data, aes(x = State, y = Profit, color = State)) + 
  geom_point() + 
  ggtitle("State vs Profit")

# ========================
# 4. Split Dataset
# ========================
set.seed(123)
split <- sample.split(data$Profit, SplitRatio = 0.7)
train_data <- subset(data, split == TRUE)
test_data <- subset(data, split == FALSE)

# ========================
# 5. Multiple Linear Regression
# ========================
mlr_model <- lm(Profit ~ `R&D Spend` + Administration + `Marketing Spend` + State, data=train_data)
summary(mlr_model)

# Residual plot
plot(mlr_model$fitted.values, mlr_model$residuals, main="Residuals vs Fitted", xlab="Fitted values", ylab="Residuals")
abline(h=0, col="red")

# ========================
# 6. Model Selection
# ========================
# Exhaustive search
exhaustive_model <- regsubsets(Profit ~ `R&D Spend` + Administration + `Marketing Spend` + State, data=train_data, nvmax=4)
exhaustive_summary <- summary(exhaustive_model)

# Stepwise regression
forward_model <- stepAIC(lm(Profit ~ 1, data=train_data), scope=list(upper=mlr_model), direction="forward")
backward_model <- stepAIC(mlr_model, direction="backward")
stepwise_model <- stepAIC(mlr_model, direction="both")

# AIC/BIC comparison table
comparison_table <- data.frame(
  Model = c("Exhaustive Search", "Forward Selection", "Backward Elimination", "Stepwise Regression"),
  Predictors = c("R&D Spend, Marketing Spend",
                 "R&D Spend, Marketing Spend", 
                 "R&D Spend, Administration, Marketing Spend", 
                 "R&D Spend, Marketing Spend"),
  Cp = c(exhaustive_summary$cp[which.min(exhaustive_summary$cp)],
         AIC(forward_model),
         AIC(backward_model),
         AIC(stepwise_model)),
  Adjusted_R2 = c(exhaustive_summary$adjr2[which.max(exhaustive_summary$adjr2)],
                  summary(forward_model)$adj.r.squared,
                  summary(backward_model)$adj.r.squared,
                  summary(stepwise_model)$adj.r.squared),
  AIC = c(NA, AIC(forward_model), AIC(backward_model), AIC(stepwise_model)),
  BIC = c(NA, BIC(forward_model), BIC(backward_model), BIC(stepwise_model))
)

print(comparison_table)

# ========================
# 7. Principal Component Analysis (PCA)
# ========================
pca_data <- data %>% select(`R&D Spend`, Administration, `Marketing Spend`)
pca_result <- prcomp(pca_data, scale.=TRUE)
summary(pca_result)
