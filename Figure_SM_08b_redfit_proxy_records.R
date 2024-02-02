# Post-doc ECRU

# Packages: ====================================================================

library(dplyr)
#   # filter() -> rows, arrange()
library(dplR)
#   # redfit()

## Reading the data: ===========================================================

#   # Pathway:

setwd("/...")
record_A <- read.table(file = "oc10_IP25dw_clean.csv", header = TRUE, sep = ",", dec = ".")
record_B <- read.table(file = "oc49_IP25dw_clean.csv", header = TRUE, sep = ",", dec = ".")
record_C <- read.table(file = "oc30_IP25toc_clean.csv", header = TRUE, sep = ",", dec = ".")
record_D <- read.table(file = "oc19_IP25toc_clean.csv", header = TRUE, sep = ",", dec = ".")
record_E <- read.table(file = "oc9_IP25toc_clean.csv", header = TRUE, sep = ",", dec = ".")
record_F <- read.table(file = "oc46_IP25dw_clean.csv", header = TRUE, sep = ",", dec = ".")
record_G <- read.table(file = "oc45_IP25dw_clean.csv", header = TRUE, sep = ",", dec = ".")
record_H <- read.table(file = "oc39_IP25_clean.csv", header = TRUE, sep = ",", dec = ".")
record_I <- read.table(file = "oc23_IP25toc_clean.csv", header = TRUE, sep = ",", dec = ".")
record_K <- read.table(file = "oc44_IP25toc_clean.csv", header = TRUE, sep = ",", dec = ".")
record_L <- read.table(file = "oc48_IP25toc_clean.csv", header = TRUE, sep = ",", dec = ".")
record_M <- read.table(file = "oc47_IP25dw_clean.csv", header = TRUE, sep = ",", dec = ".")


setwd("/...")
record_I_ <- read.table(file = "dino5_SumPerc_clean.csv", header = TRUE, sep = ",", dec = ".")
record_J <- read.table(file = "dino3_SumPerc_clean.csv", header = TRUE, sep = ",", dec = ".")

list_records <- list(record_A, record_B, record_C, record_D, record_E,
                     record_F, record_G, record_H, record_I, record_I_,
                     record_J, record_K, record_L, record_M)
names(list_records)

names(list_records) <- c("record_A", "record_B", "record_C", "record_D", "record_E",
                         "record_F", "record_G", "record_H", "record_I", "record_I_",
                         "record_J", "record_K", "record_L", "record_M")


rm(list = ls(pattern = "^record_"))


# Cleaning for the last 2 kyr: -------------------------------------------------

#rec <- 91
list_records_2000 <- vector(mode = "list",
                            length = length(list_records))

for(rec in 1:length(list_records)){
    list_records_2000[[rec]] <- dplyr::filter(.data = list_records[[rec]], Age_CE >= 0)
}


names(list_records_2000) <- names(list_records)

rm(rec)
rm(list_records)


# Redfit model: ----------------------------------------------------------------

# Records that work:
#rec <- 2
#rec <- 5
#rec <- 7
#rec <- 10
#rec <- 12

rec <- 1
teste_redf <- redfit(x = list_records_2000[[rec]]$Value,
                     nsim = 500)
teste_redf$rho
# doesn't work: rec = 1 / 3 / 4 / 6 / 8 / 9 / 11 /13 /14
# good = 2 / 5 / 7 / 10 / 12


######## https://rdrr.io/cran/dplR/src/R/redfit.R#sym-redfitMinls ##################

View(redfit)
