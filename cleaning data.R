# Import data

codes <- read_excel("C:/Users/luna/Downloads/int_wsh.xlsx", sheet = "sub_code")
rain_low_g0 <- read_excel("C:/Users/luna/Downloads/low_wsh.xlsx", sheet = "rain_low_g0")
rain_low_g1 <- read_excel("C:/Users/luna/Downloads/low_wsh.xlsx", sheet = "rain_low_g1")
rain_low_g2 <- read_excel("C:/Users/luna/Downloads/low_wsh.xlsx", sheet = "rain_low_g2")
irr_low_g0 <- read_excel("C:/Users/luna/Downloads/low_wsh.xlsx", sheet = "irr_low_g0")
irr_low_g1 <- read_excel("C:/Users/luna/Downloads/low_wsh.xlsx", sheet = "irr_low_g1")
irr_low_g2 <- read_excel("C:/Users/luna/Downloads/low_wsh.xlsx", sheet = "irr_low_g2")

rain_int_g0 <- read_excel("C:/Users/luna/Downloads/int_wsh.xlsx", sheet = "rain_int_g0")
rain_int_g1 <- read_excel("C:/Users/luna/Downloads/int_wsh.xlsx", sheet = "rain_int_g1")
rain_int_g2 <- read_excel("C:/Users/luna/Downloads/int_wsh.xlsx", sheet = "rain_int_g2")
irr_int_g0 <- read_excel("C:/Users/luna/Downloads/int_wsh.xlsx", sheet = "irr_int_g0")
irr_int_g1 <- read_excel("C:/Users/luna/Downloads/int_wsh.xlsx", sheet = "irr_int_g1")
irr_int_g2 <- read_excel("C:/Users/luna/Downloads/int_wsh.xlsx", sheet = "irr_int_g2")

rainfed = c(rain_low_g0, rain_low_g1, rain_low_g2, rain_int_g0, rain_int_g1, rain_int_g2)
irrigated = c(irr_low_g0, irr_low_g1, irr_low_g2, irr_int_g0, irr_int_g1, irr_int_g2)


rain_low_g0$water <- "rainfed"
rain_low_g1$water <- "rainfed"
rain_low_g2$water <- "rainfed"
rain_int_g0$water <- "rainfed"
rain_int_g1$water <- "rainfed"
rain_int_g2$water <- "rainfed"

irr_low_g0$water <- "irrigated"
irr_low_g1$water <- "irrigated"
irr_low_g2$water <- "irrigated"
irr_int_g0$water <- "irrigated"
irr_int_g1$water <- "irrigated"
irr_int_g2$water <- "irrigated"

rain_low_g0$input <- "low"
rain_low_g1$input <- "low"
rain_low_g2$input <- "low"
irr_low_g0$input <- "low"
irr_low_g1$input <- "low"
irr_low_g2$input <- "low"

rain_int_g0$input <- "int"
rain_int_g1$input <- "int"
rain_int_g2$input <- "int"
irr_int_g0$input <- "int"
irr_int_g1$input <- "int"
irr_int_g2$input <- "int"


rain_low_g0 <- left_join(codes, rain_low_g0, by="gridcode")
rain_low_g1 <- left_join(codes, rain_low_g1, by="gridcode")
rain_low_g2 <- left_join(codes, rain_low_g2, by="gridcode")
rain_int_g0 <- left_join(codes, rain_int_g0, by="gridcode")
rain_int_g1 <- left_join(codes, rain_int_g1, by="gridcode")
rain_int_g2 <- left_join(codes, rain_int_g2, by="gridcode")
irr_low_g0 <- left_join(codes, irr_low_g0, by="gridcode")
irr_low_g1 <- left_join(codes, irr_low_g1, by="gridcode")
irr_low_g2 <- left_join(codes, irr_low_g2, by="gridcode")
irr_int_g0 <- left_join(codes, irr_int_g0, by="gridcode")
irr_int_g1 <- left_join(codes, irr_int_g1, by="gridcode")
irr_int_g2 <- left_join(codes, irr_int_g2, by="gridcode")


rain_low_g0 <- rain_low_g0[,c(1:2, 5:65, 79:80)]
rain_low_g1 <- rain_low_g1[,c(1:2, 5:65, 79:80)]
rain_low_g2 <- rain_low_g2[,c(1:2, 5:65, 79:80)]
rain_int_g0 <- rain_int_g0[,c(1:2, 6:71, 88:89)]
rain_int_g1 <- rain_int_g1[,c(1:2, 6:71, 88:89)]
rain_int_g2 <- rain_int_g2[,c(1:2, 5:70, 87:88)]

irr_low_g0 <- irr_low_g0[,c(1:2, 5:65, 79:80)]
irr_low_g1 <- irr_low_g1[,c(1:2, 5:65, 79:80)]
irr_low_g2 <- irr_low_g2[,c(1:2, 5:65, 79:80)]
irr_int_g0 <- irr_int_g0[,c(1:2, 5:70, 87:88)]
irr_int_g1 <- irr_int_g1[,c(1:2, 5:70, 87:88)]
irr_int_g2 <- irr_int_g2[,c(1:2, 5:70, 87:88)]

################### rain_low_g0_extension

##### Extension
rain_low_g0_extension <- rain_low_g0[, 1:12]
colnames(rain_low_g0_extension) <- c("gridcode", "subbasin", "lc_id", 
                                     "pa_id", "crop","rain_low_g0_extent", 
                                     "VS", "S", 
                                     "MS", "mS",  
                                     "vmS", "NS" )
rain_low_g0_extension <- gather(rain_low_g0_extension, "suitability", "extent", 7:12)

##### Production
rain_low_g0_production <- rain_low_g0[, c(1:5, 13:17)]
colnames(rain_low_g0_production) <- c("gridcode", "subbasin", "lc_id", 
                                     "pa_id", "crop", 
                                     "VS", "S", 
                                     "MS", "mS",  
                                     "vmS" )
rain_low_g0_production <- gather(rain_low_g0_production, "suitability", "production", 6:10)

##### Yields
rain_low_g0_yields <- rain_low_g0[, c(1:5, 18:23)]
colnames(rain_low_g0_yields) <- c("gridcode", "subbasin", "lc_id", 
                                      "pa_id", "crop", "rain_low_g0_Ymax",
                                      "VS", "S", 
                                      "MS", "mS",  
                                      "vmS" )
rain_low_g0_yields <- gather(rain_low_g0_yields, "suitability", "yields", 7:11)

