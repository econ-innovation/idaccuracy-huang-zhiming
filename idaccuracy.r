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

#将2中代码封装成为一个可以在命令行运行的脚本，脚本的唯一一个参数为aminer论文文件所在的路径
args <- commandArgs(trailingOnly = TRUE)
path <- args[1]

merge_df <- function(path) {
  setwd(path)
  merged_df <- lapply(list.files(), function(file) {
    data <- read.csv(file, sep = ",", header = TRUE)
  })
  merged_df <- do.call(rbind, data)
  merged_df <- merged_df[,c("doi", "年份", "期刊", "标题")]
  print(merged_df)
  write.csv(merged_df, file = "merged_df.csv", sep = ",", row.names = FALSE)
}

merge_df("/Users/hwangtsimin/R/assignment_idaccuracy/Aminer")
