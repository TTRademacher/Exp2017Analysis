#========================================================================================
# Script with variables and functions relevant for ploting figuresin R
#----------------------------------------------------------------------------------------

# Load dependencies
#----------------------------------------------------------------------------------------
library ('tidyverse')

# function for calculate the standard error
#----------------------------------------------------------------------------------------
se <-  function (x) {
  sd (x, na.rm = TRUE) / sqrt (sum (!is.na (x)))
}

# Create %notin% operator
#----------------------------------------------------------------------------------------
`%notin%` <- Negate (`%in%`)

# set colours for treatments: control, girdled, compressed, double compressed and chilled
#----------------------------------------------------------------------------------------
tColours <- tibble (colour = c ('#91b9a4','#C0334D','#F18904','#5C4A72','#23345C'),
                    treatment = c ('control','girdled','compressed','double compressed',
                                   'chilled'))

# set colours for carbon sinks: growth, respiration, change in NSC concentrations. 
#----------------------------------------------------------------------------------------
sColours <- tibble (colour   = c ('#8073ac','#f3bd48','#aab300'), 
                    variable = c ('NSC'    ,'resp'   ,'SC'))

# function to add opacity to a colour
#----------------------------------------------------------------------------------------
addOpacity <- function (colour, alpha = 1) {
  if (missing (colour)) stop ("Please provide a colour or vector of colours.")
  apply (sapply (colour, col2rgb) / 255, 2, 
         function (x) rgb (x [1], x [2], x [3], alpha = alpha))
}

# y-axis positions of treatment and sampling height combinations
#----------------------------------------------------------------------------------------
yPositions <- c (0.8, 1.8, 2.3, 3.3, 3.8, 4.8, 5.3, 5.8)

# Function to plot critical dates
#----------------------------------------------------------------------------------------
criticalDates <- function (group) {
  
  # Figure out critical date and plot them (control and girdled groups have no end dates)
  #--------------------------------------------------------------------------------------
  if (group == 'double compressed') {
    abline (v = as_date ('2017-07-05'), col = '#99999999', lty = 2) # start date
    abline (v = as_date ('2017-08-13'), col = '#99999999', lty = 2) # re-tightening date
    abline (v = as_date ('2017-10-08'), col = '#99999999', lty = 2) # end date
  } else if (group == 'compressed') {
    abline (v = as_date ('2017-07-04'), col = '#99999999', lty = 2) # start date
    abline (v = as_date ('2017-08-09'), col = '#99999999', lty = 2) # end date
  } else {
    abline (v = as_date ('2017-07-04'), col = '#99999999', lty = 2) # start date
  }
  
  # Return zero exit status
  #----------------------------------------------------------------------------------------
  return (0)
}
#========================================================================================