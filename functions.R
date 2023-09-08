# script that contains all the functions

shift <- function(x, n){
  c(x[-(seq(n))], rep(NA, n))
}

# created date
clean_created_date <- function(doja) {
  doja$V1 <- gsub('Created', NA, doja$V1)
  doja$V7 <- paste(doja$V4, doja$V3, doja$V6)
  doja$V7 <- as.Date(doja$V7, "%d %b %Y")
  doja <- doja[,c("V1", "V7")]
  doja$date <- shift(doja$V7, 1)
  doja <- doja[,c("V1", "date")]
  colnames(doja) <- c("project_name", "created_date")
  doja = doja[rowSums(is.na(doja)) != ncol(doja),]
  return(doja)
}
# modified date
clean_modified_date <- function(florence){
  florence$V1 <- gsub('Last', NA, florence$V1)
  florence$V2 <- gsub('modified', NA, florence$V2)
  florence$V8 <- paste(florence$V5, florence$V4, florence$V7)
  florence$V8 <- as.Date(florence$V8, "%d %b %Y")
  florence <- florence[,c("V1", "V8")]
  florence$date <- shift(florence$V8, 1)
  florence <- florence[,c("V1", "date")]
  florence$date <- gsub('NA', NA, florence$date)
  colnames(florence) <- c("project_name", "modified_date")
  florence = florence[rowSums(is.na(florence)) != ncol(florence),]
  florence$modified_date <- as.Date(florence$modified_date)
  return(florence)
}
#storage cost
clean_storage_cost <- function(aurora){
  aurora$V1 <- gsub('Storage', NA, aurora$V1)
  aurora <- aurora[,c("V1", "V3")]
  aurora$cost <- rep(NA, nrow(aurora)) 
  aurora$cost <-  shift(aurora$V3, 1)
  aurora <- aurora[,c("V1", "cost")]
  aurora$cost <- gsub(' ', NA, aurora$cost)
  colnames(aurora) <- c("project_name", "storage_cost")
  aurora <- aurora[!apply(is.na(aurora) | aurora == "", 1, all),]
  aurora$storage_cost <- gsub('/month', '', aurora$storage_cost)
  aurora$storage_cost <- gsub('[$]', '', aurora$storage_cost)
  aurora$storage_cost <-as.numeric(aurora$storage_cost)
  return(aurora)
}
# merge all 3 dataframes
merge_all <- function(doja, florence, aurora){
  all <- merge(doja, florence, by = "project_name")
  all <- merge(all, aurora, by = "project_name")
  all$date_diff <- round(difftime(all$modified_date, all$created_date, units = c("days")), 3)
  all$storage_cost <- gsub('/month', '', all$storage_cost)
  all$storage_cost <- gsub('[$]', '', all$storage_cost)
  all$storage_cost <- as.numeric(all$storage_cost)
  all$modified_date <- as.Date(all$modified_date)
  all$created_date_MY <- format(all$created_date,"%Y %b")
  all$modified_date_MY <- format(all$modified_date,"%Y %b")
  all$project_type <- gsub('\\_.*','',all$project_name)
  return(all)
}
