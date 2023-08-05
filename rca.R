### Revealed Comparative Advantage (RCA) Function ###
library(tidyverse)
library(collapse)

rca_matrix <- function(data, 
                       discrete = TRUE, 
                       cutoff = 1,
                       location = "location", 
                       flow = "flow", 
                       value = "value") {
  
  # 1. Sanity checks -----
  
  ## Class of the data set
  if (!(is.data.frame(data) == TRUE)) {
    stop(deparse(substitute(data)), " must be a data.frame or tbl")
  }
  
  ## Class of the arguments
  if (!(is.character(location) == TRUE) || 
      !(is.character(flow) == TRUE) || 
      !(is.character(value) == TRUE)) {
    stop("'location', 'flow' and 'value' arguments must be of type character")
  }
  
  if (!(is.logical(discrete) == TRUE)) {
    stop("'discrete' argument must be TRUE or FALSE")
  }
  
  if (!(is.numeric(cutoff) == TRUE)) {
    stop("'cutoff' argument must be numeric")
  }
  
  ## NAs in the data set
  data %>%
    select(all_of(location)) %>%
    {if (any(is.na(.)) == TRUE) warning(paste0("NAs in ", location))}
  
  data %>%
    select(all_of(flow)) %>%
    {if (any(is.na(.)) == TRUE) warning(paste0("NAs in ", flow))}
  
  data %>%
    select(all_of(value)) %>%
    {if (any(is.na(.)) == TRUE) warning(paste0("NAs in ", value))}
  
  ## Class of 'value' column in the data set
  data %>%
    select(all_of(value)) %>%
    unlist() %>%
    {if (!(is.numeric(.) == TRUE)) stop(paste0(value, " must be numeric"))}
  
  # 2. Collapse and reshape the data set -----
  m <- data %>%
    collap(as.formula(paste0(value, "~", flow, "+", location)), FUN = sum) %>%
    pivot_wider(id_cols = all_of(location),
                names_from = all_of(flow),
                values_from = all_of(value)) %>%
    arrange(.data[[location]])
  
  # 3. Generate a matrix and replace NAs with Os -----
  mtx <- m[,-1] %>% 
    as.matrix()
  
  mtx[is.na(mtx)] <- 0
  
  # 4. Generate RCA matrix ---- 
  rca <- (mtx/rowSums(mtx))%*%(diag(1/(colSums(mtx)/sum(mtx))))
  
  if (discrete == TRUE) {
    rca[rca >= cutoff] <- 1
    rca[rca < cutoff] <- 0
  }
  
  # 5. Rename rows and columns, and return RCA matrix ----
  rownames(rca) <- m[,1] %>% as.matrix()
  colnames(rca) <- colnames(m[,-1])
  
  return(rca) 
  
}
