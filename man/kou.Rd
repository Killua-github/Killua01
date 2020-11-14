\name{kou}
\alias{kou}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Make light and temperature info as a png file
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
It makes light and temperature info for DAMsleep2 results as a png file.
}
\usage{
kou(light, colour, temp1, temp2, temp3)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{light}{
%%     ~~Describe \code{light} here~~
Write "LD" or "DD" with double quotation marks.
This depend on the result of analysis. 
LD means 12 hours lighting and 12 hours off.
DD means 12 hours lighting time but off and 12 hours off.
}
  \item{colour}{
%%     ~~Describe \code{colour} here~~
Write "B", "R", "BRB" or "RBR" with double quotation marks.
This depend on the result of analysis.
B means no temperature changing and low temperature.
R means no temperature changing and high temperature.
BRB means low high low temperature changing.
RBR means high low high temperature changing.
}
  \item{temp1}{
%%     ~~Describe \code{temp1} here~~
Write Celsius temperature.
This temperature is for first phase if you write BRB or RBR as colour argument.
}
  \item{temp2}{
%%     ~~Describe \code{temp2} here~~
Write Celsius temperature.
This temperature is for second phase if you write BRB or RBR as colour argument.
You don't have to write this argument if you write B or R.
}
  \item{temp3}{
%%     ~~Describe \code{temp3} here~~
Write Celsius temperature.
This temperature is for third phase if you write BRB or RBR as colour argument.
You don't have to write this argument if you write B or R.
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
function (light, colour, temp1, temp2, temp3) 
{
    if (light == "LD") {
        if (colour == "B") {
            png(file = paste(light, "_", colour, "_", temp1, 
                ".png", sep = ""), width = 1000, height = 400)
            COWorRAT(light)
            par(new = T)
            arrow(colour, temp1, temp2, temp3)
            dev.off()
        }
        else if (colour == "R") {
            png(file = paste(light, "_", colour, "_", temp1, 
                ".png", sep = ""), width = 1000, height = 400)
            COWorRAT(light)
            par(new = T)
            arrow(colour, temp1, temp2, temp3)
            dev.off()
        }
        else if (colour == "BRB") {
            png(file = paste(light, "_", colour, "_", temp1, 
                temp2, temp3, ".png", sep = ""), width = 1000, 
                height = 400)
            COWorRAT(light)
            par(new = T)
            arrow(colour, temp1, temp2, temp3)
            dev.off()
        }
        else if (colour == "RBR") {
            png(file = paste(light, "_", colour, "_", temp1, 
                temp2, temp3, ".png", sep = ""), width = 1000, 
                height = 400)
            COWorRAT(light)
            par(new = T)
            arrow(colour, temp1, temp2, temp3)
            dev.off()
        }
        else {
            noquote("error colour argument")
        }
    }
    else if (light == "DD") {
        if (colour == "B") {
            png(file = paste(light, "_", colour, "_", temp1, 
                ".png", sep = ""), width = 1000, height = 400)
            COWorRAT(light)
            par(new = T)
            arrow(colour, temp1, temp2, temp3)
            dev.off()
        }
        else if (colour == "R") {
            png(file = paste(light, "_", colour, "_", temp1, 
                ".png", sep = ""), width = 1000, height = 400)
            COWorRAT(light)
            par(new = T)
            arrow(colour, temp1, temp2, temp3)
            dev.off()
        }
        else if (colour == "BRB") {
            png(file = paste(light, "_", colour, "_", temp1, 
                temp2, temp3, ".png", sep = ""), width = 1000, 
                height = 400)
            COWorRAT(light)
            par(new = T)
            arrow(colour, temp1, temp2, temp3)
            dev.off()
        }
        else if (colour == "RBR") {
            png(file = paste(light, "_", colour, "_", temp1, 
                temp2, temp3, ".png", sep = ""), width = 1000, 
                height = 400)
            COWorRAT(light)
            par(new = T)
            arrow(colour, temp1, temp2, temp3)
            dev.off()
        }
        else {
            noquote("error colour argument")
        }
    }
    else {
        noquote("error light argument")
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
