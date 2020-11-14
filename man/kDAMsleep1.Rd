\name{kDAMsleep1}
\alias{kDAMsleep1}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Edit original DAM datas and analyse them by DAMsleep1
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
It is similar to DAM File Scan and DAMsleep1.
}
\usage{
kDAMsleep1(yy, MM, dd, hours, mins)
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
    DAMFileScan(yy, MM, dd, hours, mins)
    library(flysleep)
    x <- DAMsleep1()
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
