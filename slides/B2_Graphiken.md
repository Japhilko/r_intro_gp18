Eine Graphik sagt mehr als 1000 Worte.
--------------------------------------

### Aussagen zu Graphen in R

-   Die grafische Datenanalyse ist groÃŸartig.
-   Gute Graphiken kÃ¶nnen zu einem besseren VerstÃ¤ndnis beitragen.
-   Die Erzeugung eines Plot ist einfach.
-   Einen guten Plot zu erstellen, kann sehr lange dauern.
-   Das Erstellen von Plots mit R macht SpaÃŸ.
-   Mit R erstellte Diagramme haben eine hohe QualitÃ¤t.
-   Fast jedes Graphikformat wird von R unterstÃ¼tzt.
-   Eine groÃŸe Anzahl von Exportformaten ist in R verfÃ¼gbar.

Nicht alle Diagramme sind gleich.
---------------------------------

-   Das Basispaket enthÃ¤lt bereits eine Vielzahl von Plotfunktionen.
-   Andere Pakete wie `lattice`, `ggplot2`, etc. erweitern diese
    FunktionalitÃ¤t.

### HandbÃ¼cher, die weit Ã¼ber diese EinfÃ¼hrung hinausgehen:

-   Murrell, P (2006): R Graphics.
-   R Development Core Group [**Graphiken mit
    R**](https://csg.sph.umich.edu/docs/R/graphics-1.pdf)
-   Wiki zu [**R
    Programmierung/Graphiken**](https://en.wikibooks.org/wiki/R_Programming/Graphics)
-   Martin Meermeyer [**Creating Reproducible Publication Quality
    Graphics with R: A
    Tutorial**](http://elpub.bib.uni-wuppertal.de/edocs/dokumente/fbb/wirtschaftswissenschaft/sdp/sdp15/sdp15006.pdf)
-   Institute for Quantitative Social Science at Harvard - [**R Graphik
    Tutorial**](https://tutorials.iq.harvard.edu/R/Rgraphics/Rgraphics.html)

<!--
mentioned later:
https://cran.r-project.org/doc/contrib/usingR.pdf

to specific:
https://www.stat.auckland.ac.nz/~paul/R/graphicsqc.pdf
-->
Task View fÃ¼r [Graphiken](https://cran.r-project.org/web/views/Graphics.html)
------------------------------------------------------------------------------

![](figure/ctv_graphics.PNG)

<https://cran.r-project.org/web/views/Graphics.html>

GESIS Panel Daten importieren
-----------------------------

-   Zum importieren nutzen wir die Funktion `read.dta13` aus dem Paket
    `readstata13`

<!-- -->

    dat <- readstata13::read.dta13(
      "../data/ZA5666_v1-0-0_Stata14.dta")

<!--
## Datensatz





```r
library(mlmRev)
data(Chem97)
```

- [lea] Local Education Authority - a factor
- [school] School identifier - a factor
- [student] Student identifier - a factor
- [score] Point score on A-level Chemistry in 1997
- [gender] Student's gender
- [age] Age in month, centred at 222 months or 18.5 years
- [gcsescore] Average GCSE score of individual.
- [gcsecnt] Average GCSE score of individual, centered at mean.
-->
GeschÃ¤tzte Dauer (bfzq020a)
----------------------------

### Wie lange haben Sie gebraucht, um den Fragebogen auszufÃ¼llen?

    dat <- readstata13::read.dta13("ZA5666_v1-0-0_Stata14.dta")
    summary(dat$duration)

    dat$duration <- as.numeric(dat$bfzq020a)

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
    ##  -99.00   10.00   16.00   10.02   25.00  156.00      16

Histogramm - Die Funktion `hist()`
----------------------------------

Wir erstellen ein Histogramm der Variablen `Dauer`:

    ?hist

    hist(dat$duration)

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-15-1.png)
<!--
![](figure/hist_duration.PNG)
-->

Export mit Rstudio
------------------

![](figure/saveGraphic.PNG)

Befehl zum Speichern der Grafik
-------------------------------

-   Alternativ auch mit den Befehlen `png`, `pdf` oder `jpeg` zum
    Beispiel.

<!-- -->

    png("Histogramm.png")
      hist(dat$duration)
    dev.off()

    pdf("Histogramm.pdf")
      hist(dat$duration)
    dev.off()

    jpeg("Histogramm.jpeg")
      hist(dat$duration)
    dev.off()

Histogramm
----------

-   Der Befehl `hist()` zeichnet ein Histogramm.
-   Mindestens ein Beobachtungsvektor muss an die Funktion Ã¼bergeben
    werden.
-   `hist()` hat viele weitere Argumente, die alle (sinnvolle)
    Standardwerte haben.

<!-- -->

    hist(dat$duration,col="blue",
         main="Duration of interview",ylab="Frequency", 
         xlab="Duration")

<!--
## Histogram
-->
Rstudio Addin `colourpicker`
----------------------------

    install.packages("colourpicker")

![](figure/colourpicker.PNG)

Weitere Argumente:
------------------

    ?plot
    # or
    ?par

![](figure/helppagepar.PNG)

Das `xlim` Argument
-------------------

    hist(dat$duration,col="blue",
         main="Duration interview",ylab="Freq", xlab="Duration",
         xlim=c(0,90))

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-23-1.png)

<!--
![](figure/xlimargument.PNG)
-->
Das `breaks` Argument
---------------------

-   WÃ¤hrend die vorherigen Argumente fÃ¼r viele Grafikfunktionen
    gelten, gilt das Folgende hauptsÃ¤chlich fÃ¼r Histogramme:

<!-- -->

    hist(dat$duration,col="red",
         main="Duration of interview", xlab="Duration",
         xlim=c(0,90),breaks=60)

-   Mit `breaks` kann man die Zahl der Balken kontrollieren:

<!--
![](figure/breaksargument.PNG)
-->
Tabellieren und `barplot`
-------------------------

    sex <- as.character(dat$a11d054a)
    sex[dat$a11d054a=="MÃ¤nnlich"] <- "m"
    sex[dat$a11d054a=="Weiblich"] <- "f"

-   Der Befehl `barplot()` erzeugt einen Barplot aus einer
    Frequenztabelle.
-   Wir erhalten die Tabelle mit dem folgenden Befehl:

<!-- -->

    tab_sex <- table(sex)

    barplot(tab_sex)

Mehr Farbe:
-----------

    barplot(tab_sex,col=rgb(0,0,1))

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-28-1.png)

GrÃ¼ne Farbe
------------

    barplot(tab_sex,col=rgb(0,1,0))

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-29-1.png)

Rote Farbe
----------

    barplot(tab_sex,col=rgb(1,0,0))

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-30-1.png)

Transparent
-----------

    barplot(tab_sex,col=rgb(1,0,0,.3))

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-31-1.png)

Eine zweidimensionale Tabelle
-----------------------------

Internet-Suche nach Infos: Freunde (bbzc024a) und Geschlecht (a11d054a)

-   Wenn das Ã¼bergebene Tabellenobjekt zweidimensional ist, wird ein
    bedingter Barplot erstellt.

<!-- -->

    table(dat$bbzc024a,sex)

    ##                    sex
    ##                       f Männlich
    ##   Item nonresponse   25       27
    ##   Missing by filter  66       50
    ##   Not reached         1        1
    ##   Unit nonresponse   79       91
    ##   Not in panel        4        6
    ##   Nein              220      213
    ##   Ja                231      208

Fehlende Werte rekodieren
-------------------------

    transform_miss <- function(x){
      x[x%in%c(-11,-22,-33,-44,-55,-66,-77,-88,-99,-111)] <- NA
      x[x%in%c("Item nonresponse","Missing by filter",
               "Not reached","Unit nonresponse",
               "Not in panel")] <- NA
      return(x)
    }

    Inetfriends <- as.character(transform_miss(dat$bbzc024a))
    (tab2dim <- table(Inetfriends,sex))

    ##            sex
    ## Inetfriends   f Männlich
    ##        Ja   231      208
    ##        Nein 220      213

Bedingter `barplot`
-------------------

    barplot(tab2dim,col=1:2)

<!--
![](figure/condtable.PNG)
-->
    barplot(tab2dim,col=3:4,beside=T)

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-36-1.png)

<!--
![](figure/barplotbeside.PNG)
-->
Horizontaler Boxplot
--------------------

-   Ein einfacher
    [**boxplot**](http://edoc.hu-berlin.de/dissertationen/gruenwald-andreas-2005-01-17/HTML/chapter2.html)
    kann mit `boxplot()` erstellt werden.
-   FÃ¼r den Befehl `boxplot()` muss mindestens ein Beobachtungsvektor
    Ã¼bergeben werden.

<!-- -->

    ?boxplot

    boxplot(dat$duration,horizontal=TRUE)

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-38-1.png)

<!--
![](figure/boxplot.PNG)
-->
Gruppierte Boxplots
-------------------

-   Ein sehr einfacher Weg, sich einen ersten Eindruck von bedingten
    Verteilungen zu verschaffen, ist Ã¼ber sogenannte gruppierte
    Boxplots.
-   Dazu muss ein sogenanntes Formelobjekt an die Funktion `boxplot()`
    Ã¼bergeben werden.
-   Die bedingte Variable befindet sich auf der rechten Seite einer
    Tilde.

<!-- -->

    boxplot(dat$duration~sex,horizontal=TRUE)

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-39-1.png)

<!--
![](figure/boxplot_sex.PNG)
-->
Boxplot Alternativen - `vioplot`
--------------------------------

-   Baut auf dem `boxplot` auf - Zusatzinformationen zur Dichte
-   Die Dichte wird mit der Kernel-Methode berechnet.
-   Je weiter die Ausdehnung, desto hÃ¶her ist die Dichte an dieser
    Stelle.
-   WeiÃŸer Punkt - Medianwert

<!-- -->

    library(vioplot)
    vioplot(na.omit(dat$duration))

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-41-1.png)

<!--
![](figure/vioplot.PNG)
-->
Alternativen zum `boxplot()`
----------------------------

    library(beanplot)
    par(mfrow = c(1,2))
    boxplot(dat$duration~dat$a11d054a,data=dat,col="blue")
    beanplot(dat$duration~dat$a11d054a,data=dat,col="orange")

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-44-1.png)

Bedingte, bi- und multivariate Graphiken - Scatterplots
-------------------------------------------------------

-   Ein einfaches Streudiagramm kann mit der Funktion `plot()` erstellt
    werden.
-   Um ein Scatterplot zu erstellen, mÃ¼ssen x und y als
    Beobachtungsvektoren Ã¼bergeben werden.
-   Argument `col` - Farbe als Zeichen oder numerisch
-   Argument `pch` - Plotsymbol als Zeichen oder numerisch
-   Achsenbeschriftung wird mit `xlab` und `ylab` definiert.

Scatterplot
-----------

    plot(runif(100),rnorm(100))

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-46-1.png)

<!--
![](figure/scatterplot.PNG)
-->
B2A Ãœbung - einfache Grafiken
------------------------------

-   Laden Sie den Datensatz `VADeaths` und erstellen Sie die folgende
    Darstellung:

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-47-1.png)

Das `lattice`-Paket
-------------------

### [**Definition einer `lattice` Graphik**](http://stat.ethz.ch/R-manual/R-devel/library/lattice/html/Lattice.html)

> It is designed to meet most typical graphics needs with minimal
> tuning, but can also be easily extended to handle most nonstandard
> requirements.

### Beispiele fÃ¼r `lattice` Graphiken

![](figure/latticeexamples.PNG)

[Ein weiteres Addin fÃ¼r RStudio](https://github.com/homerhanumat/addinplots/)
------------------------------------------------------------------------------

-   das `addinplots`-Paket installieren - den Datensatz markieren, der
    visualisiert werden soll, und einen Plottyp wÃ¤hlen:

<!-- -->

    devtools::install_github("homerhanumat/addinplots")

![](figure/addinplots.PNG)

Benutzer Interface fÃ¼r `addinplots`
------------------------------------

![](figure/HistogramCodeHelper.PNG)

    iris # Beispieldatensatz

Ein Beispieldatensatz - Testergebnisse bei A-level Chemie Test aus dem Jahr 1997
--------------------------------------------------------------------------------

    library("mlmRev")
    data(Chem97)

<table>
<thead>
<tr>
<th style="text-align:left;">
variables
</th>
<th style="text-align:left;">
categories
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
lea
</td>
<td style="text-align:left;">
Local Education Authority
</td>
</tr>
<tr>
<td style="text-align:left;">
school
</td>
<td style="text-align:left;">
School identifier
</td>
</tr>
<tr>
<td style="text-align:left;">
student
</td>
<td style="text-align:left;">
Student identifier
</td>
</tr>
<tr>
<td style="text-align:left;">
score
</td>
<td style="text-align:left;">
Point score on A-level Chemistry in 1997
</td>
</tr>
<tr>
<td style="text-align:left;">
gender
</td>
<td style="text-align:left;">
Student's gender
</td>
</tr>
<tr>
<td style="text-align:left;">
age
</td>
<td style="text-align:left;">
Age in month, centred at 222 months or 18.5 years
</td>
</tr>
<tr>
<td style="text-align:left;">
gcsescore
</td>
<td style="text-align:left;">
Average GCSE score of individual
</td>
</tr>
<tr>
<td style="text-align:left;">
gcsecnt
</td>
<td style="text-align:left;">
Average GCSE score of individual, centered at mean
</td>
</tr>
</tbody>
</table>
Histogramm mit `lattice`
------------------------

    library("lattice")
    histogram(~ gcsescore, data = Chem97)

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-53-1.png)

Mehr Histogramme mit `lattice`
------------------------------

    histogram(~ gcsescore | score,data = Chem97)

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-54-1.png)

Die Dichte plotten mit einer Legende
------------------------------------

    densityplot(~ gcsescore | score, Chem97, 
        groups=gender,auto.key=TRUE)

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-55-1.png)

[**EinfÃ¼hrung in das `lattice`
Paket**](http://www.isid.ac.in/~deepayan/R-tutorials/labs/04_lattice_lab.pdf)

Einen Boxplot mit `lattice` erzeugen
------------------------------------

    Chem97$score <- as.factor(Chem97$score)

    bwplot(score ~ gcsescore | gender, Chem97)

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-57-1.png)

Bedingte Boxplots mit `lattice` erzeugen
----------------------------------------

    bwplot(gcsescore ~ gender | score, Chem97,
     layout = c(6, 1))

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-58-1.png)

<!--
## Univariate plots




-->
Ein `densityplot`
-----------------

    densityplot(~height|voice.part,data=singer,layout = c(2,4),
                xlab = "Height (inches)",bw = 5)

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-61-1.png)

Bivariate Plots - Quantile-Quantile Plot
----------------------------------------

    qq(gender ~ gcsescore | score, Chem97)

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-62-1.png)

Scatterplot mit `lattice` - `xyplot`
------------------------------------

    xyplot(Sepal.Length+Sepal.Width~Petal.Length+Petal.Width 
           | Species,data = iris, auto.key = T)

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-64-1.png)

<!--
![](figure/lattice_xyplot.PNG)
-->
Zusammenhang zwischen Variablen - `pairs` Plot
----------------------------------------------

    pairs(iris[,1:4])

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-65-1.png)

Den `pairs`Plot erweitert
-------------------------

    library("psych")
    pairs.panels(iris[,1:4],
                 bg=c("red","yellow","blue")[iris$Species],
                 pch=21,main="")

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-66-1.png)

<!--
![](figure/psychplot.PNG)
-->
Multivariate Plots - `splom`
----------------------------

    splom(~iris[,1:4], groups = Species, data = iris)

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-67-1.png)

Mehr Argumente im `splom` Befehl
--------------------------------

    super.sym <- trellis.par.get("superpose.symbol")
    splom(~iris[1:4], groups = Species, data = iris,
          panel = panel.superpose,
          key = list(title = "Three Varieties of Iris",
                     columns = 3, 
                     points = list(pch = super.sym$pch[1:3],
                     col = super.sym$col[1:3]),
                     text = list(c("Setosa", "Versicolor", 
                                   "Virginica"))))

Der Beispieldatensatz `BankWages`
---------------------------------

    install.packages("AER")

    library("AER")
    data(BankWages)

    head(BankWages)

    ##      job education gender minority
    ## 1 manage        15   male       no
    ## 2  admin        16   male       no
    ## 3  admin        12 female       no
    ## 4  admin         8 female       no
    ## 5  admin        15   male       no
    ## 6  admin        15   male       no

`levelplot`
-----------

-   `education` in Jahren

<!-- -->

    library("lattice")
    levelplot(table(BankWages$education,BankWages$job),
              xlab="education",ylab="job")

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-72-1.png)

<!--
![](figure/levelplotBankWages.PNG)
-->
Nutzung sozialer Netzwerke: Facebook (bbzc041a)
-----------------------------------------------

-   1 - Nein, bin kein Mitglied; 2 - Ja, nutze es aber nie; 3 - Ja,
    nutze es manchmal; 4 - Ja, nutze es oft

<!-- -->

    facebook <- transform_miss(datf$bbzc041a)
    table(facebook)

    ## facebook
    ##   1   2   3   4 
    ## 512  57 178 188

Nutzung sozialer Netzwerke: Twitter (bbzc042a)
----------------------------------------------

-   1 - Nein, bin kein Mitglied; 2 - Ja, nutze es aber nie; 3 - Ja,
    nutze es manchmal; 4 - Ja, nutze es oft

<!-- -->

    twitter <- as.character(transform_miss(datf$bbzc042a))
    table(twitter)

    ## twitter
    ##   1   2   3   4 
    ## 791  38  20   6

`levelplot` mit GESIS Panel Daten
---------------------------------

    levelplot(table(facebook,twitter),
    col.regions=colorRampPalette(c("blue","white","red")))

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-75-1.png)

<!--
![](figure/levelplot_twitterfacebook.PNG)
-->
Internet Nutzung (GESIS Panel)
------------------------------

-   a11c035a: HÃ¤ufigkeit private Internetnutzung: Tischcomputer

<!-- -->

    internet <- transform_miss(datf$a11c035a)

-   a11c037a: HÃ¤ufigkeit private Internetnutzung: Smartphone

<!-- -->

    smartphone <- transform_miss(datf$a11c037a)

1 - Mehrmals tÃ¤glich; 2 - Etwa einmal tÃ¤glich; 3 - Mehrmals die Woche;
4 - Etwa einmal die Woche; 5 - Seltener; 6 - Nie; 98 - WeiÃŸ nicht

    tab2 <- table(internet,smartphone)

Zusammenhang - kategoriale Variablen
------------------------------------

    mosaicplot(tab2, color = TRUE,main="")

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-79-1.png)

<!--
![](figure/mosaicplot_internet.PNG)
-->
<!--
## Making the plot clearer


```r
table(dat$a11c036a)
```

```
## 
##  Item nonresponse Missing by filter                Ja              Nein 
##                 2               178               505               537 
##        Weiß nicht 
##                 0
```

```r
missings<-c("Item nonresponse","Missing by filter","WeiÃŸ nicht")
dat$a11c034a[dat$a11c034a %in% missings] <- NA
dat$a11c036a[dat$a11c036a %in% missings] <- NA

table(dat$a11c034a)
```

```
## 
##                              Item nonresponse 
##                                             0 
##         Ja, nutzt Internet für private Zwecke 
##                                          1044 
## Nein, nutzt Internet nicht für private Zwecke 
##                                           177 
##                                    Weiß nicht 
##                                             1
```

```r
dat$a11c034a <- as.character(dat$a11c034a)
dat$a11c036a <- as.character(dat$a11c036a)
```
-->
Die FlÃ¤chen werden anhand der Residuen eingefÃ¤rbt:
----------------------------------------------------

    mosaicplot(tab2, main=F,shade = TRUE)

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-81-1.png)

<!--
## Pearson residuals

- Chi-squared-Statistic of Pearson

$$
r_{p,i}=\dfrac{y_i - \hat{\mu_{i}}}{\sqrt{V(\hat{\mu_i})}}
$$
-->
`parallelplot()`
----------------

    parallelplot(~iris[,1:4] | Species, iris)

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-82-1.png)

Das `ggplot2` Paket
-------------------

### [**EinfÃ¼hrung `ggplot2`**](https://www.statmethods.net/advgraphs/ggplot2.html)

> The ggplot2 package, created by Hadley Wickham, offers a powerful
> graphics language for creating elegant and complex plots. Its
> popularity in the R community has exploded in recent years. Origianlly
> based on Leland Wilkinson's The Grammar of Graphics, ggplot2 allows
> you to create graphs that represent both univariate and multivariate
> numerical and categorical data in a straightforward manner.

<!--
Grouping can be represented by color, symbol, size, and transparency. The creation of trellis plots (i.e., conditioning) is relatively simple. 
-->
### Beispiele `ggplot2` Graphiken

![](figure/examples_ggplot2.PNG)

Ein erstes Beispiel `ggplot2`
-----------------------------

    library(ggplot2)
    ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + 
      geom_point()

![](B2_Graphiken_files/figure-markdown_strict/unnamed-chunk-83-1.png)

<!--
![](figure/ggplot2ex.PNG)
-->
Einige schÃ¶ne Rstudio Addins
-----------------------------

-   Eine `ggplot` Grafik muss im Quellcode markiert werden, um die
    folgenden Addins zu verwenden

<!-- -->

    install.packages("ggThemeAssist")

![](figure/ggThemeAssist.PNG)

    install.packages('ggedit')

![](figure/ggedit.PNG)

RStudio Addin zum Erzeugen von `ggplot2` Graphiken
--------------------------------------------------

    devtools::install_github("dreamRs/esquisse")

![](figure/ggplot2builder.PNG)

Shiny App - R Graphik Katalog
-----------------------------

<http://shinyapps.stat.ubc.ca/r-graph-catalog/>

![](figure/RgraphCatalog.PNG)

<!--
More shiny apps




the following apps do not work:
https://www.showmeshiny.com/ggplot-gui/
https://www.showmeshiny.com/ggplot2-theme-builder/
http://www.michalm.net/shiny/easyPlot/

http://www.michalm.net/shiny/easyPlot/
-->
Ein Beispieldatensatz zu Diamanten
----------------------------------

> A dataset containing the prices and other attributes of almost 54,000
> diamonds.

-   price - price in US dollars ($326â€“$18,823)

-   carat - weight of the diamond (0.2â€“5.01)

-   cut - quality of the cut (Fair, Good, Very Good, Premium, Ideal)

-   color - diamond colour, from J (worst) to D (best)

-   clarity - a measurement of how clear the diamond is (I1 (worst),
    SI2, SI1, VS2, VS1, VVS2, VVS1, IF (best))

<!--
- x - length in mm (0â€“10.74)

- y - width in mm (0â€“58.9)

- z - depth in mm (0â€“31.8)

- depth - total depth percentage = z / mean(x, y) = 2 * z / (x + y) (43â€“79)

- table - width of top of diamond relative to widest point (43â€“95)
-->
    data(diamonds)

-   Der Datensatz ist zu groÃŸ fÃ¼r unsere Anwendungszwecke:

<!-- -->

    d <- diamonds[sample(nrow(diamonds), 1000), ]

Das Paket `plotly`
------------------

> Create Interactive Web Graphics via 'plotly.js'

    library(plotly)

![](figure/Beispiele_plotly.PNG)

[InteraktivitÃ¤t hinzufÃ¼gen](https://moderndata.plot.ly/interactive-r-visualizations-with-d3-ggplot2-rstudio/)
---------------------------------------------------------------------------------------------------------------

    p <- ggplot(data = d, aes(x = carat, y = price)) +
      geom_point(aes(text = clarity,size = 4)) +
      geom_smooth(aes(colour = cut, fill = cut))+ 
      facet_wrap(~ cut)

### Es wird eine ggplot Graphik erzeugt

Das Ergebnis - eine interaktive Graphik
---------------------------------------

    ggplotly(p)

![](figure/plotly_diamonds.PNG)

Links
-----

-   J H Maindonald - [**Lattice and Other Graphics in
    R**](https://maths-people.anu.edu.au/~johnm/r-book/2edn/xtras/rgraphics.pdf)

-   Deepayan Sarkar - [**An introduction to R - lattice
    lab**](https://www.isid.ac.in/~deepayan/R-tutorials/labs/04_lattice_lab.pdf)

-   Flowingdata - [**Comparing ggplot2 and R Base
    Graphics**](https://flowingdata.com/2016/03/22/comparing-ggplot2-and-r-base-graphics/)

-   [**Quick R -
    ggplot2**](https://www.statmethods.net/advgraphs/ggplot2.html)

-   [**Top 50 ggplot2
    Visualizations**](http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html)

-   [**Bioconductor R
    manual**](http://manuals.bioinformatics.ucr.edu/home/R_BioCondManual)
    with an extensive part on graphics

-   Shiny app to visualize [**ggplot2
    internals**](https://gallery.shinyapps.io/ggtree/)

-   [**Shiny app**](https://www.showmeshiny.com/ggedit/) for
    [**interactive plot
    editing**](https://metrumrg.shinyapps.io/ggedit/)

<!--
https://www.ae.be/blog-en/combining-the-power-of-r-and-d3-js/
-->
