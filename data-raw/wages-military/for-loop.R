week_conversion <- tibble(w0 = "1977") %>%
  for (val in 1:53) {
    mutate(paste("w", val, sep = '') =(w0 + 1))
  }
for(val in 54:105){
  add_row(raw_week = val, year = "1978")
} %>%
  for(val in 106:157){
    add_row(raw_week = val, year = "1978")
  } %>%
  for(val in 158:209){
    add_row(raw_week = val, year = "1978")
  } %>%
  for(val in 210:261){
    add_row(raw_week = val, year = "1978")
  } %>%
  for(val in 262:313){
    add_row(raw_week = val, year = "1978")
  } %>%
  for(val in 314:366){
    add_row(raw_week = val, year = "1978")
  } %>%
  for(val in 367:418){
    add_row(raw_week = val, year = "1978")
  } %>%
  for(val in 419:470){
    add_row(raw_week = val, year = "1978")
  } %>%
  for(val in 471:522){
    add_row(raw_week = val, year = "1978")
  } %>%
  for(val in 523:574){
    add_row(raw_week = val, year = "1978")
  } %>%
  for(val in 575:627){
    add_row(raw_week = val, year = "1978")
  } %>%
  for(val in 628:679){
    add_row(raw_week = val, year = "1978")
  } %>%
  for(val in 680:731){
    add_row(raw_week = val, year = "1978")
  } %>%
  for(val in 732:783){
    add_row(raw_week = val, year = "1978")
  } %>%
  for(val in 784:835){
    add_row(raw_week = val, year = "1978")
  } %>%
  for(val in 836:887){
    add_row(raw_week = val, year = "1978")
  } %>%
  for(val in 888:940){
    add_row(raw_week = val, year = "1978")
  } %>%
  for(val in 941:992){
    add_row(raw_week = val, year = "1978")
  } %>%
  for(val in 993:1044){
    add_row(raw_week = val, year = "1978")
  } %>%
  for(val in 1045:1096){
    add_row(raw_week = val, year = "1978")
  }

