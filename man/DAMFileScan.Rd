\name{DAMFileScan}
\alias{DAMFileScan}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Edit original DAM datas for DAM analysis 
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
It is similar to the app named DAM File Scan.
}
\usage{
DAMFileScan(yy, MM, dd, hours, mins)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{yy}{
%%     ~~Describe \code{yy} here~~
}
  \item{MM}{
%%     ~~Describe \code{MM} here~~
}
  \item{dd}{
%%     ~~Describe \code{dd} here~~
}
  \item{hours}{
%%     ~~Describe \code{hours} here~~
}
  \item{mins}{
%%     ~~Describe \code{mins} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (yy, MM, dd, hours, mins) 
{
    mm <- Month(MM)
    time <- 1 + hours * 60 + mins
    DAMfileList <- list.files(pattern = "Monitor...txt")
    library(data.table)
    for (i in 1:length(DAMfileList)) {
        DAMdata <- DAMfileList[i]
        DAMfile <- fread(DAMdata)
        c1 <- DAMfile[DAMfile$V2 == paste(dd, mm, yy, sep = " "), 
            ]
        c2 <- DAMfile[DAMfile$V2 == paste(dd + 1, mm, yy, sep = " "), 
            ]
        c3 <- DAMfile[DAMfile$V2 == paste(dd + 2, mm, yy, sep = " "), 
            ]
        c4 <- DAMfile[DAMfile$V2 == paste(dd + 3, mm, yy, sep = " "), 
            ]
        cutDAMfile <- rbindlist(list(c1, c2, c3, c4))
        CutDAMFile <- cutDAMfile[time:(time - 1 + (3 * 24 * 60)), 
            ]
        Y <- formatC(yy, width = 2, flag = "0")
        M <- formatC(MM, width = 2, flag = "0")
        D <- formatC(dd, width = 2, flag = "0")
        name <- substr(list(DAMdata), start = 8, stop = 9)
        write.table(CutDAMFile, paste(Y, M, D, "CtM", 0, name, 
            ".txt", sep = ""), sep = "\t", row.names = FALSE, 
            col.names = FALSE, quote = FALSE)
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
