# Customer Profit Prediction using Multiple Linear Regression and PCA

**Author:** Muskan Jiwani   
**Tools & Technologies:** R, ggplot2, caTools, MASS, leaps  
**Project Type:** Personal Data Analytics Project  

---

## Project Overview
This project focuses on predictive analytics to estimate company profits using **Multiple Linear Regression (MLR)** and **Principal Component Analysis (PCA)**.  
It demonstrates skills in **data preprocessing**, **exploratory data analysis (EDA)**, **statistical modeling**, and **dimensionality reduction** using R.  
The analysis identifies the most significant business drivers of profitability, supporting **data-driven decision making** and **business strategy optimization**.

---

## Objectives
- Perform **data exploration** and **visual analysis** to understand key variables impacting profit.  
- Build and evaluate **multiple regression models** to predict profit outcomes.  
- Implement **feature selection techniques**: forward, backward, stepwise, and exhaustive search.  
- Apply **PCA (Principal Component Analysis)** for dimensionality reduction and feature interpretation.  
- Select the optimal model using **Cp**, **AIC**, and **Adjusted R²** metrics.  

---

## Dataset
Dataset: `SME_Profit.csv`  
Contains information on small-business expenditures and profits.  
**Variables:**
- R&D Spend  
- Administration  
- Marketing Spend  
- State (California, Florida, New York)  
- Profit (Target Variable)

If the dataset cannot be shared publicly, a sample or synthetic dataset may be used for demonstration.

---


## Methodology

### 1. Data Exploration and Visualization
- Conducted **exploratory data analysis (EDA)** using scatter plots and correlation checks.  
- Identified strong positive correlation between **R&D Spend** and **Profit**.  
- Observed weaker relationships for Administration and Marketing Spend.  
- Evaluated profit distribution across states using visual analytics.

### 2. Model Development
- Implemented **Multiple Linear Regression** with predictors: R&D Spend, Administration, Marketing Spend, and State.  
- Assessed model fit using R² and Adjusted R² values.  
- Determined **R&D Spend** as the most statistically significant variable (p < 0.05).

### 3. Model Selection and Evaluation
- Applied four feature selection algorithms:
  - Forward Selection  
  - Backward Elimination  
  - Stepwise Regression  
  - Exhaustive Search  
- Compared models using **Cp**, **AIC**, and **BIC** criteria.  
- The **Exhaustive Search model** achieved the best balance between accuracy and simplicity.

### 4. Principal Component Analysis (PCA)
- Conducted PCA to identify principal components driving variance in the data.  
- PC1 explained **58.5%** and PC2 explained **34.0%** of total variance (cumulative **92.5%**).  
- Demonstrated effective **dimensionality reduction** while retaining interpretability.

---

## Results Summary
| Model Type | Predictors | Adjusted R² | AIC | BIC | Cp |
|-------------|-------------|--------------|------|------|------|
| Exhaustive Search | R&D Spend, Marketing Spend | 0.959 | — | — | 1.216 |
| Forward Selection | R&D Spend, Marketing Spend | 0.959 | 731.45 | 737.67 | 731.45 |
| Backward Elimination | R&D Spend, Administration, Marketing Spend | 0.959 | 731.45 | 737.67 | 731.45 |
| Stepwise Regression | R&D Spend, Marketing Spend | 0.959 | 731.45 | 737.67 | 731.45 |

---

## Key Insights and Findings
- **R&D Spend** is the most influential factor in determining company profit.  
- All model selection techniques yielded similar **Adjusted R² (~0.96)**, confirming model reliability.  
- **PCA** reduced features effectively while maintaining **92% of variance** in the dataset.  
- Demonstrates ability to perform **predictive modeling**, **statistical interpretation**, and **business insight generation** from real data.

---

## Technical Skills Demonstrated
- **Programming:** R, data visualization, and statistical analysis  
- **Machine Learning:** Regression analysis, model selection, PCA  
- **Data Analytics:** EDA, feature engineering, model validation  
- **Business Analytics:** Profitability analysis, data-driven recommendations  
- **Reporting:** Communicating technical findings through clear documentation and visualization

---

## Repository
GitHub Repository: [Customer-Profit-Prediction](https://github.com/muskanjiwani111/Customer-Profit-Prediction)

---

## Contact
**Muskan Jiwani**   
**Email:** muskanjiwani111@gmail.com  
**LinkedIn:** http://www.linkedin.com/in/muskan-jiwani
**GitHub:** [github.com/muskanjiwani111](https://github.com/muskanjiwani111)


