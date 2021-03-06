## ----warning=FALSE,message=FALSE,fig.height=5,fig.width=5,fig.align='center'----
library(R2MCDS)

### Import and filter data
data(laridae)
d <- mcds.filter(laridae, transect.id = "WatchID", distance.field = "Distance", 
                     distance.labels = c("A", "B", "C", "D"), 
                     distance.midpoints = c(25, 75, 150, 250), 
                     effort.field = "WatchLenKm", lat.field = "LatStart", 
                     long.field = "LongStart", sp.field = "Alpha", date.field = "Date")

### Run analysis with the MCDS engine. Here, the WatchID is used as the sample.
x <- mcds.wrap(d,SMP_EFFORT="WatchLenKm",DISTANCE="Distance",SIZE="Count",
               units=list(Type="Line",Distance="Perp",Length_units="Kilometers",
                          Distance_units="Meters",Area_units="Square kilometers"),
               breaks=c(0,50,100,200,300), estimator=list(c("HN","CO")),
               lsub=list(Alpha=c("GBBG","BLKI","HERG")), split=TRUE,
               STR_LABEL="STR_LABEL",STR_AREA="STR_AREA",SMP_LABEL="WatchID",
               path="c:/temp/distance",
               pathMCDS="C:/Distance 6",verbose=FALSE)
x

##output for the Black-legged Kittiwake
summary(x[[1]])
predicted_hist(x[[1]])
#output for the Great Black-backed Gull 
summary(x[[2]])
predicted_hist(x[[2]])
##output for the Herring gull
summary(x[[3]])
predicted_hist(x[[3]])

## ----warning=FALSE,message=FALSE-----------------------------------------
#'### 
library(R2MCDS)

### Import and filter data
data(laridae)
d <- mcds.filter(laridae, transect.id = "WatchID", distance.field = "Distance", distance.labels = c("A", "B", "C", "D"), 
                     distance.midpoints = c(25, 75, 150, 250), effort.field = "WatchLenKm", lat.field = "LatStart", 
                     long.field = "LongStart", sp.field = "Alpha", date.field = "Date")

### Run analysis with the MCDS engine. Here, the WatchID is used as the sample.
x <- mcds.wrap(d,SMP_EFFORT="WatchLenKm",DISTANCE="Distance",SIZE="Count",
               units=list(Type="Line",Distance="Perp",Length_units="Kilometers",
                          Distance_units="Meters",Area_units="Square kilometers"),
               breaks=c(0,50,100,200,300), estimator=list(c("HN","CO")),
               lsub=list(Alpha=c("HERG")), rare= list(Alpha=c("RBGU")), split=TRUE,
               STR_LABEL="STR_LABEL",STR_AREA="STR_AREA",SMP_LABEL="WatchID",
               path="c:/temp/distance",
               pathMCDS="C:/Distance 6",verbose=FALSE)
x
##output for the Ring-billed Gull
summary(x)

