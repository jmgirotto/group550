library(ggplot2)
library(dplyr)
library(gtsummary)
library(readxl)

here::i_am(
  "code/code_mm/code_mm.R"
)

data <- read_excel(here::here("data/nba_data.xlsx"))

# Model 1: Do Games Started predict 3-Pointers?
model_3p_mm <- lm(`3P` ~ GS, data = data)
summary_3p <- summary(model_3p_mm)

saveRDS(summary_3p,
        here::here("output/output_mm/summary_3p_mm.rds"))

# Scatterplot for the 3-Pointers   
scatterplot_3pbgs <- ggplot(data,
                            aes(x = GS, 
                                y = `3P`)) +
  geom_point(alpha = 0.5, color = "darkblue") + 
  geom_smooth(method = "lm", color = "red") +  
  labs(title = "Effect of Games Started on 3-Pointers Made",
       x = "Games Started (GS)",
       y = "3-Pointers Made (3P)") +
  theme_minimal()

saveRDS(scatterplot_3pbgs,
        here::here("output/output_mm/scatterplot_3pbgs_mm.rds"))

# Model 2: Do Games Started predict Free Throw accuracy?
model_ft_mm <- lm(`FT%` ~ GS, data = data)
summary_ft <- summary(model_ft_mm)

saveRDS(summary_ft,
        here::here("output/output_mm/summary_ft_mm.rds"))

# Scatterplot for the summary tables 
scatterplot_ftbgs <- ggplot(data,
                    aes(x = GS, 
                        y = `FT%`)) +
  geom_point(alpha = 0.5, color = "darkgreen") + 
  geom_smooth(method = "lm", color = "pink") +  
  labs(title = "Effect of Games Started on Free Throw Percentage",
       x = "Games Started (GS)",
       y = "Free Throw precentage Made (FT%)") +
  theme_minimal()

saveRDS(scatterplot_ftbgs,
        here::here("output/output_mm/scatterplot_ftbgs_mm.rds"))


