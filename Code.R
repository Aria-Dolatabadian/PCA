# Load required libraries
library(factoextra)
library(FactoMineR)
library(dplyr)
library(gt)

# Read data from CSV file
data <- read.csv("PCA_example.csv")

# Extract Genotype names
genotype_names <- data[, 1]

# Perform PCA
pca_res <- PCA(data[, -c(1, 2)], graph = FALSE)

# Generate biplot with Genotype names as labels on dots
biplot <- fviz_pca_biplot(pca_res, geom.ind = "text", labels.ind = genotype_names,
 col.ind = "black", pointshape = 21, pointsize = 2,
 palette = "jco", addEllipses = TRUE,
 alpha.var = "contrib", col.var = "contrib",
 gradient.cols = "RdYlBu",
 legend.title = list(fill = colnames(data)[2], color = "Contrib",
 alpha = "Contrib"))

# Save biplot
ggsave(plot = biplot, filename = "biplot_with_genotype_labels.pdf", width = 10, height = 10)



# Load required libraries
library(factoextra)
library(FactoMineR)
library(dplyr)
library(gt)
library(ggrepel)

# Read data from CSV file
data <- read.csv("PCA_example.csv")

# Extract Genotype names
genotype_names <- data[, "Genotype"]  # Assuming "Genotype" is the actual column name

# Perform PCA
pca_res <- PCA(data[, -c(1, 2)], graph = FALSE)

# Generate biplot and manually add labels
biplot <- fviz_pca_biplot(pca_res, geom = "point", pointshape = 21, pointsize = 2,
                          palette = "jco", addEllipses = TRUE,
                          alpha.var = "contrib", col.var = "contrib",
                          gradient.cols = "RdYlBu",
                          legend.title = list(fill = colnames(data)[2], color = "Contrib",
                                             alpha = "Contrib"))

# Manually add labels to the biplot using ggrepel
biplot <- biplot + geom_text_repel(aes(label = genotype_names), size = 3, max.overlaps = Inf)

# Save biplot
ggsave(plot = biplot, filename = "biplot_with_genotype_names.pdf", width = 10, height = 10)
