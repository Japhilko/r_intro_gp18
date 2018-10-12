#' ---
#' title: "A2 Wie bekomme ich Hilfe?"
#' author: "Jan-Philipp Kolb"
#' date: "15 Oktober 2018"
#' output:
#'   beamer_presentation:
#'     colortheme: beaver
#'     fig_caption: no
#'     fonttheme: structurebold
#'     highlight: tango
#'     theme: CambridgeUS
#'   pdf_document:
#'     toc: yes
#'   html_document:
#'     keep_md: yes
#'   slidy_presentation:
#'     keep_md: yes
#' ---
#' 
## ---- include=FALSE------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

#' 
#' ## Wie bekomme ich Hilfe?
#' 
#' -  [**Um Hilfe im Allgemeinen zu bekommen:**](http://itfeature.com/tag/how-to-get-help-in-r)
#' 
#' 
## ----eval=F--------------------------------------------------------------
## help.start()

#' 
#' -  [**Online-Dokumentation für die meisten Funktionen:**](https://www.r-project.org/help.html)
#' 
## ----eval=F--------------------------------------------------------------
## help(name)

#' 
#' -  Benutze `?`, um Hilfe zu bekommen 
#' 
## ----eval=F--------------------------------------------------------------
## ?mean

#' 
#' -  `example(lm)` liefert ein Beispiel für die lineare Regression 
#' 
## ----eval=F--------------------------------------------------------------
## example(lm)

#' 
#' 
#' ## Vignetten
#' 
#' - Eine Vignette ist ein Papier, das die wichtigsten Funktionen eines Pakets darstellt. 
#' - Sie enthalten viele reproduzierbare Beispiele.
#' - Vignetten sind ein neues Werkzeug, deshalb hat nicht jedes Paket eine Vignette.
#' 
#' 
## ----eval=F--------------------------------------------------------------
## browseVignettes()

#' 
#' - Um eine Vignette zu bekommen:
#' 
## ----eval=F--------------------------------------------------------------
## vignette("osmdata")

#' 
#' 
#' ## Ein Beispiel für eine Vignette - Das Paket `osmdata`
#' 
#' ![](figure/ex_osmdata_vignette.PNG)
#' 
#' ## [**Demos**](http://r-pkgs.had.co.nz/demo.html)
#' 
#' - für manche Pakete gibt es Demos:
#' 
## ----eval=F--------------------------------------------------------------
## demo() # zeigt alle verfügbaren Demos
## demo(package = "httr") # Zeigt alle Demos in einem Paket
## 
## # Ein spezifisches Demo laufen lassen:
## demo("oauth1-twitter", package = "httr")

#' 
#' - Wenn ein Demo gestartet wird, ist der zugehörige Code in der Konsole sichtbar
#' 
#' 
## ----eval=F--------------------------------------------------------------
## demo(nlm)

#' 
#' ![](figure/demonlm.PNG)
#' 
#' ## Die Funktion `apropos`
#' 
#' - durchsucht alles über den angegebenen String:
#' 
## ------------------------------------------------------------------------
apropos("lm")

#' 
#' - diese Funktion kann auch in Kombination mit [**regulären Ausdrücken**](https://de.wikipedia.org/wiki/Regul%C3%A4rer_Ausdruck) verwendet werden...
#' 
#' 
## ----eval=F--------------------------------------------------------------
## ?"regular expression"

#' 
#' 
## ----eval=F--------------------------------------------------------------
## help.search("^glm")

#' 
#' - `??` ist ein Synonym für `help.search`
#' 
#' ## [**Suchmaschine für die R-Seite**](http://search.r-project.org/cgi-bin/namazu.cgi?query=glm&max=20&result=normal&sort=score&idxname=functions&idxname=vignettes&idxname=views)
#' 
## ----eval=F--------------------------------------------------------------
## RSiteSearch("glm")

#' 
#' ![](figure/rsitesearch.PNG)
#' 
#' ## Nutzung von Suchmaschinen
#' 
#' -  Ich nutze [**duckduckgo.de:**]()
#' 
#' ```
#' R-project + "was ich schon immer wissen wollte" 
#' ```
#' -  das funktioniert natürlich für alle Suchmaschinen!
#' 
#' 
#' ![](figure/duckduckgo.PNG)
#' 
#' 
#' ## [**Stackoverflow**](http://stackoverflow.com/)
#' 
#' -  Für alle Fragen zum programmieren
#' -  Ist nicht auf R fokussiert - aber es gibt [**viele Diskussionen zu R-Fragen**](https://stackoverflow.com/tags/r/info)
#' -  Sehr detailierte Diskussionen
#' 
#' ![Stackoverflow Beispiel](figure/StackoverflowEx.PNG)
#' 
#' 
#' ## Ein Schummelzettel für Basis R
#' 
#' <https://www.rstudio.com/resources/cheatsheets/>
#' 
#' ![**Cheatsheet BaseR**](figure/basercheatsheet.PNG)
#' 
#' ## Mehr Schummelzettel
#' 
#' ![](figure/cheatsheets.PNG)
#' 
#' ## [**Quick R**](http://www.statmethods.net/interface/help.html)
#' 
#' - Immer mit vielen Beispielen und Hilfen bezüglich eines Themas
#' - Beispiel: [**Quick R - Getting Help**](http://www.statmethods.net/interface/help.html)
#' 
#' ![](figure/quickR.PNG)
#' 
#' 
#' ## Weitere Links
#' 
#' - [**Überblick - wie bekommt man Hilfe in R**](https://www.r-project.org/help.html)
#' 
#' ![](figure/gettingHelp.PNG)
#' 
#' - [**Eine Liste mit HowTo`s**](http://rprogramming.net/)
#' 
#' - [**Eine Liste mit den wichtigsten R-Befehlen**](https://www.personality-project.org/r/r.commands.html)
#' 
#' ## Aufgabe A2A [**Hilfe bekommen**](http://web.math.ku.dk/~helle/R-intro/exercises.pdf)
#' 
#' - Versuchen Sie den Befehl `?which.min`. Dies öffnet eine Hilfeseite im unteren rechten Fenster von RStudio. Was macht die Funktion?
#' 
#' - Sie müssen den Namen der Funktion kennen, um die Hilfeseite wie oben beschrieben zu öffnen. Manchmal (oft, sogar) kennen Sie den Namen der R-Funktionen nicht; dann kann Ihnen eine [**Suchmaschine**](https://duckduckgo.com/) helfen. Versuchen Sie zum Beispiel, den Text `R minimum vector` zu suchen.
#' 
#' [**Quelle für diese Aufgabe**](http://web.math.ku.dk/~helle/R-intro/übungen.pdf)
