% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utilities.R
\name{TranslateStateCodes}
\alias{TranslateStateCodes}
\title{Translate standard state names, abbreviations, and codes.}
\usage{
TranslateStateCodes(inVector, returnVal = c("STATE", "STUSAB",
  "STATE_NAME", "STATENS")[2])
}
\arguments{
\item{inVector}{integer or character, a vector of one of the types of to convert. Not case sensitive for strings.}

\item{returnVal}{Character string for the desired output format. Defaults to STUSAB and this choice overrides when the output type is the same as the input type.}
}
\description{
\code{TranslateStateCodes} particularly translates USGS state_cd to other formats.
Data from:
https://www.census.gov/geo/reference/ansi_statetables.html
and particularly
http://www2.census.gov/geo/docs/reference/state.txt
The returnVal choice determines the format returned. Choices are: 
  "STATE" is the FISP state code in the range of 1-78 (with some missing).
  "STUSAB" is the common or postal 2 letter abreviation.
  "STATE_NAME" is the full name.
  "STATENS" is Geographic Names Information System Identifier (GNISID)
}
\details{
See internals of code to get the details of the data frame used for the translation.
}
\examples{
stNums <- c(1,15,25, 5, 50, NA)
ab <- tolower(TranslateStateCodes(stNums))
ab
names <- TranslateStateCodes(ab); names  ## note default for abs in is names out
gnis <- TranslateStateCodes(tolower(names),'STATENS'); gnis
num <- TranslateStateCodes(gnis,'STATE'); num
all(num==stNums, na.rm=TRUE)
}
\keyword{utilities}
