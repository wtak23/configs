dvecinv <- function(xvec){
  p <- length(xvec)          # number of edges
  d <- (1+sqrt(1+8*p))/2 # number of rois
  
  Xsymm <- matrix(0, d,d)
  Xsymm[lower.tri(Xsymm)] <- xvec
  Xsymm <- Xsymm + t(Xsymm)
  return(Xsymm)
}

# Multiple plot function ----
#
# ggplot objects can be passed in ..., or to plotlist (as a list of ggplot objects)
# - cols:   Number of columns in layout
# - layout: A matrix specifying the layout. If present, 'cols' is ignored.
#
# If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
# then plot 1 will go in the upper left, 2 will go in the upper right, and
# 3 will go all the way across the bottom.
#
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}

# showPackageContents ----

# Using search() in a new R session says that these packages are 
# loaded by default:
# "package:stats"     "package:graphics" 
# "package:grDevices" "package:utils"     "package:datasets" 
# "package:methods"   "package:base"  

# Others that are useful:
# gplots
# ggplot2, reshape, plyr

showPackageContents <- function (packageName) {
  
  # Get a list of things contained in a particular package
  funlist <- objects(packageName)
  
  # Remove things that don't start with a letter
  idx <- grep('^[a-zA-Z][a-zA-Z0-9._]*', funlist)
  funlist <- funlist[idx]
  
  # Remove things that contain arrow <-
  idx <- grep('<-', funlist)
  if (length(idx)!=0)
    funlist <- funlist[-idx]
  
  # Make a data frame to keep track of status
  objectlist <- data.frame(name=funlist,
                           primitive=FALSE,
                           func=FALSE,
                           object=FALSE,
                           constant=FALSE,
                           stringsAsFactors=F)
  
  for (i in 1:nrow(objectlist)) {
    fname <- objectlist$name[i]
    if (exists(fname)) {
      obj <- get(fname)
      if (is.primitive(obj)) {
        objectlist$primitive[i] <- TRUE
      }
      if (is.function(obj)) {
        objectlist$func[i] <- TRUE
      }
      if (is.object(obj)) {
        objectlist$object[i] <- TRUE
      }
      
      # I think these are generally constants
      if (is.vector(obj)) {
        objectlist$constant[i] <- TRUE
      }
      
      
    }  
  }
  
  cat(packageName)
  
  cat("\n================================================\n")
  cat("Primitive functions: \n")
  cat(objectlist$name[objectlist$primitive])
  cat("\n")
  
  cat("\n================================================\n")
  cat("Non-primitive functions: \n")
  cat(objectlist$name[objectlist$func  &  !objectlist$primitive])
  cat("\n")
  
  cat("\n================================================\n")
  cat("Constants: \n")
  cat(objectlist$name[objectlist$constant])
  cat("\n")
  
  cat("\n================================================\n")
  cat("Objects: \n")
  cat(objectlist$name[objectlist$object])
  cat("\n")
}


# Run the function using base package
# showPackageContents("package:base")

normalize_tobpnc <- function(X,df) {
  # --- note: this function assumes df contains site information --- #
  
  # get median matrices for each site
  Xpnc <- X[df$site=='pnc',] # pnc
  Xtob <- X[df$site=='tob',] # tob
  
  # get max-median edge
  Xpnc_maxmed <- max(apply(Xpnc,2,median))
  Xtob_maxmed <- max(apply(Xtob,2,median))
  
  # normalize
  Xpnc_n <- Xpnc/Xpnc_maxmed
  Xtob_n <- Xtob/Xtob_maxmed
  X_norm <- rbind(Xpnc_n,Xtob_n)
  return(X_norm)
}

get_cmap_RdBu_r <- function(){
  ## output from t_1104_tob_pnc_check_R.py
  #cmap <- as.character(read.table('cmap_RdBu_r.txt')[[1]])
  c("#053061",
    "#063264",
    "#073467",
    "#08366a",
    "#09386d",
    "#0a3b70",
    "#0c3d73",
    "#0d3f76",
    "#0e4179",
    "#0f437b",
    "#10457e",
    "#114781",
    "#124984",
    "#134c87",
    "#144e8a",
    "#15508d",
    "#175290",
    "#185493",
    "#195696",
    "#1a5899",
    "#1b5a9c",
    "#1c5c9f",
    "#1d5fa2",
    "#1e61a5",
    "#1f63a8",
    "#2065ab",
    "#2267ac",
    "#2369ad",
    "#246aae",
    "#266caf",
    "#276eb0",
    "#2870b1",
    "#2a71b2",
    "#2b73b3",
    "#2c75b4",
    "#2e77b5",
    "#2f79b5",
    "#307ab6",
    "#327cb7",
    "#337eb8",
    "#3480b9",
    "#3681ba",
    "#3783bb",
    "#3885bc",
    "#3a87bd",
    "#3b88be",
    "#3c8abe",
    "#3e8cbf",
    "#3f8ec0",
    "#408fc1",
    "#4291c2",
    "#4393c3",
    "#4695c4",
    "#4997c5",
    "#4c99c6",
    "#4f9bc7",
    "#529dc8",
    "#569fc9",
    "#59a1ca",
    "#5ca3cb",
    "#5fa5cd",
    "#62a7ce",
    "#65a9cf",
    "#68abd0",
    "#6bacd1",
    "#6eaed2",
    "#71b0d3",
    "#75b2d4",
    "#78b4d5",
    "#7bb6d6",
    "#7eb8d7",
    "#81bad8",
    "#84bcd9",
    "#87beda",
    "#8ac0db",
    "#8dc2dc",
    "#90c4dd",
    "#93c6de",
    "#96c7df",
    "#98c8e0",
    "#9bc9e0",
    "#9dcbe1",
    "#a0cce2",
    "#a2cde3",
    "#a5cee3",
    "#a7d0e4",
    "#a9d1e5",
    "#acd2e5",
    "#aed3e6",
    "#b1d5e7",
    "#b3d6e8",
    "#b6d7e8",
    "#b8d8e9",
    "#bbdaea",
    "#bddbea",
    "#c0dceb",
    "#c2ddec",
    "#c5dfec",
    "#c7e0ed",
    "#cae1ee",
    "#cce2ef",
    "#cfe4ef",
    "#d1e5f0",
    "#d2e6f0",
    "#d4e6f1",
    "#d5e7f1",
    "#d7e8f1",
    "#d8e9f1",
    "#dae9f2",
    "#dbeaf2",
    "#ddebf2",
    "#deebf2",
    "#e0ecf3",
    "#e1edf3",
    "#e3edf3",
    "#e4eef4",
    "#e6eff4",
    "#e7f0f4",
    "#e9f0f4",
    "#eaf1f5",
    "#ecf2f5",
    "#edf2f5",
    "#eff3f5",
    "#f0f4f6",
    "#f2f5f6",
    "#f3f5f6",
    "#f5f6f7",
    "#f6f7f7",
    "#f7f6f6",
    "#f7f5f4",
    "#f8f4f2",
    "#f8f3f0",
    "#f8f2ef",
    "#f8f1ed",
    "#f9f0eb",
    "#f9efe9",
    "#f9eee7",
    "#f9ede5",
    "#f9ebe3",
    "#faeae1",
    "#fae9df",
    "#fae8de",
    "#fae7dc",
    "#fbe6da",
    "#fbe5d8",
    "#fbe4d6",
    "#fbe3d4",
    "#fce2d2",
    "#fce0d0",
    "#fcdfcf",
    "#fcdecd",
    "#fdddcb",
    "#fddcc9",
    "#fddbc7",
    "#fdd9c4",
    "#fcd7c2",
    "#fcd5bf",
    "#fcd3bc",
    "#fbd0b9",
    "#fbceb7",
    "#fbccb4",
    "#facab1",
    "#fac8af",
    "#f9c6ac",
    "#f9c4a9",
    "#f9c2a7",
    "#f8bfa4",
    "#f8bda1",
    "#f8bb9e",
    "#f7b99c",
    "#f7b799",
    "#f7b596",
    "#f6b394",
    "#f6b191",
    "#f6af8e",
    "#f5ac8b",
    "#f5aa89",
    "#f5a886",
    "#f4a683",
    "#f3a481",
    "#f2a17f",
    "#f19e7d",
    "#f09c7b",
    "#ef9979",
    "#ee9677",
    "#ec9374",
    "#eb9172",
    "#ea8e70",
    "#e98b6e",
    "#e8896c",
    "#e6866a",
    "#e58368",
    "#e48066",
    "#e37e64",
    "#e27b62",
    "#e17860",
    "#df765e",
    "#de735c",
    "#dd7059",
    "#dc6e57",
    "#db6b55",
    "#da6853",
    "#d86551",
    "#d7634f",
    "#d6604d",
    "#d55d4c",
    "#d35a4a",
    "#d25849",
    "#d05548",
    "#cf5246",
    "#ce4f45",
    "#cc4c44",
    "#cb4942",
    "#c94741",
    "#c84440",
    "#c6413e",
    "#c53e3d",
    "#c43b3c",
    "#c2383a",
    "#c13639",
    "#bf3338",
    "#be3036",
    "#bd2d35",
    "#bb2a34",
    "#ba2832",
    "#b82531",
    "#b72230",
    "#b61f2e",
    "#b41c2d",
    "#b3192c",
    "#b1182b",
    "#ae172a",
    "#ab162a",
    "#a81529",
    "#a51429",
    "#a21328",
    "#9f1228",
    "#9c1127",
    "#991027",
    "#960f27",
    "#930e26",
    "#900d26",
    "#8d0c25",
    "#8a0b25",
    "#870a24",
    "#840924",
    "#810823",
    "#7f0823",
    "#7c0722",
    "#790622",
    "#760521",
    "#730421",
    "#700320",
    "#6d0220",
    "#6a011f",
    "#67001f")
}

imconn <- function(conn){
  # in progress
  if( is.null(dim(conn))){
    # convert vector into (nROI x nROI) matrix
    conn <- dvecinv(conn)
  }
  nROI <- nrow(conn)
  cmap <- get_cmap_RdBu_r()
  fields::image.plot(1:nROI,1:nROI,conn,col = cmap,
                     ylim = c( 0.5+nROI, 0.5) # flip y-axis
  )
}