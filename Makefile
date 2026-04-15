
.PHONY: all
all: report.html mm_all all_pe

# Compiling final html report - need to add other code!
report.html: report.Rmd code/render_report.R
	Rscript code/render_report.R
	
# PE Outputs
.PHONY: all_pe
all_pe: output/PE_output/PFbT_anova_tbl.rds \
        output/PE_output/PFbT_sum_tbl.rds \
        output/PE_output/PFbT_boxplot.rds \
        output/PE_output/PFbT_bar.rds

output/PE_output/PFbT_anova_tbl.rds \
output/PE_output/PFbT_sum_tbl.rds \
output/PE_output/PFbT_boxplot.rds \
output/PE_output/PFbT_bar.rds: code/PE_code/01_PE_code.R
	Rscript code/PE_code/01_PE_code.R

# Marian's Outputs

.PHONY: mm_all

mm_all: output/output_mm/summary_3p_mm.rds \
             output/output_mm/summary_ft_mm.rds \
             output/output_mm/scatterplot_3p_mm.rds \
             output/output_mm/scatterplot_ft_mm.rds

output/output_mm/summary_3p_mm.rds \
output/output_mm/summary_ft_mm.rds \
output/output_mm/scatterplot_3p_mm.rds \
output/output_mm/scatterplot_ft_mm.rds: code/code_mm/code_mm.R
	Rscript code/code_mm/code_mm.R

# Clean Command - needs to be edited to account for other folders
.PHONY: clean
clean:
	rm -f output/PE_output/*.rds && rm -f output/output_mm/*.rds && rm -f report.html

# Renv install command - delete #s once ready
#.PHONY: install
#install:
#	Rscript -e "renv::restore(prompt = FALSE)"