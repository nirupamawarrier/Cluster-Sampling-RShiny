# Cluster Sampling using R Shiny

##  Project Overview
This project demonstrates **Cluster Sampling (Sampling-2)** for estimating
the **population mean** using an interactive **R Shiny application**.
The app visualizes cluster design and computes expected survey cost, time,
and discusses sampling bias.

---

##  Objectives
- Estimate population mean using cluster sampling
- Visualize experimental design
- Analyze sampling bias
- Calculate expected cost and time per cluster
- Provide an interactive statistical tool using R Shiny

---

##  Methodology
- Population divided into non-overlapping clusters
- Entire units within selected clusters are surveyed
- Randomized cluster generation using R
- Visualization using ggplot2

---

##  Features of the Shiny App
- Adjustable number of clusters and units per cluster
- Real-time population mean estimation
- Cost and time computation
- Visual cluster sampling design

---

##  Technologies Used
- R
- RStudio
- Shiny
- ggplot2

---

## ▶️ How to Run the App
```r
install.packages("shiny")
install.packages("ggplot2")
shiny::runApp()
