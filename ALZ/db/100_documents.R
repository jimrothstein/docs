library(data.table)
library(kableExtra)

dt  <- data.table::fread(file="documents.csv")
dt



##	create .html document and open with browser
dt |> kbl(booktabs=T) |> kable_styling(full_width = F) %>%
column_spec(1, bold = T, color = "red") %>%
column_spec(2, width = "30em")



