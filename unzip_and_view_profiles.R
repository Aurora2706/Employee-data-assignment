# unzip_and_view_profiles.R

# Set working directory (change if needed)
# setwd("path/to/your/folder")

zipfile <- "Employee Profile.zip"
out_dir <- "Employee_Profile_Unzipped"

# Create output directory if it doesn't exist
if (!dir.exists(out_dir)) {
  dir.create(out_dir)
}

# Unzip
unzip(zipfile, exdir = out_dir)
cat("Unzipped files to:", out_dir, "\n")

# List all CSV files
csv_files <- list.files(out_dir, pattern = "\\.csv$", full.names = TRUE)
cat("Found", length(csv_files), "CSV files\n\n")

# Read and display each file
for (f in csv_files) {
  cat("======================================\n")
  cat("File:", basename(f), "\n")
  cat("======================================\n")
  data <- read.csv(f, stringsAsFactors = FALSE)
  print(data)
  cat("\n\n")
}
