#!/usr/bin/env Rscript

# On Mac OS X you may have to run as follows:
#
#    CPPFLAGS="-I /opt/X11/include" Rscript bin/install-pkgs.r

install.packages('optparse', repos="http://cran.wustl.edu")
install.packages('chron', repos="http://cran.wustl.edu")
install.packages('Cairo', repos="http://cran.wustl.edu")
install.packages('ggplot2', repos="http://cran.wustl.edu")
install.packages('reshape', repos="http://cran.wustl.edu")
install.packages('scales', repos="http://cran.wustl.edu")
install.packages('lubridate', repos="http://cran.wustl.edu")
