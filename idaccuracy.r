library(readr)

# 设置工作路径
setwd("/Users/hwangtsimin/R/assignment_idaccuracy/Aminer")

# 创建一个空的data frames
data_list <- list()

# for循环读取所有csv文件
for (file in list.files(pattern = "\\.csv$")) {
  print(file)
  
  # Read each CSV file and append to the list
  file_path <- file.path("/Users/hwangtsimin/R/assignment_idaccuracy/Aminer", file)
  temp <- read_csv(file_path)
  data_list[[file]] <- temp
}

# 合并成一个dataframe
data <- do.call(rbind, data_list)

# 输出列名
print(names(data))

# 输出合并后数据框
print(data)

#apply家族其他方法
file_list <- list.files("/Users/hwangtsimin/R/assignment_idaccuracy/Aminer", full.names = TRUE)
data_list <- lapply(file_list, read.csv)
data <- do.call(rbind, data_list)
print(head(data)
