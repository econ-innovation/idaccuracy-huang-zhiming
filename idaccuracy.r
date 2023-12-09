library(readr)

# 设置工作路径
setwd("/Users/hwangtsimin/R/assignment_idaccuracy/Aminer")

# 创建一个空的data frames
merged_df <- data.frame()

# for循环读取所有csv文件
for (file in list.files()) {
  data <- read.csv(file,header = TRUE, stringsAsFactors = FALSE, na.strings = "", fill = TRUE)
  merged_df <- rbind(merged_df, data)
}
merged_df <- merged_df[,c("doi", "年份", "期刊", "标题")]

# 输出数据框
print(merged_df)
summary(merged_df)

#apply家族其他方法
merged_df <- list.files("/Users/hwangtsimin/R/assignment_idaccuracy/Aminer", full.names = TRUE)
data <- lapply(merged_df, read.csv)
merged_df <- do.call(rbind, data)
merged_df <- merged_df[,c("doi", "年份", "期刊", "标题")]
print(merged_df)
