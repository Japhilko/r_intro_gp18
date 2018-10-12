Wie bekomme ich Hilfe?
----------------------

-   [**Um Hilfe im Allgemeinen zu
    bekommen:**](http://itfeature.com/tag/how-to-get-help-in-r)

<!-- -->

    help.start()

-   [**Online-Dokumentation fÃ¼r die meisten
    Funktionen:**](https://www.r-project.org/help.html)

<!-- -->

    help(name)

-   Benutze `?`, um Hilfe zu bekommen

<!-- -->

    ?mean

-   `example(lm)` liefert ein Beispiel fÃ¼r die lineare Regression

<!-- -->

    example(lm)

Vignetten
---------

-   Eine Vignette ist ein Papier, das die wichtigsten Funktionen eines
    Pakets darstellt.
-   Sie enthalten viele reproduzierbare Beispiele.
-   Vignetten sind ein neues Werkzeug, deshalb hat nicht jedes Paket
    eine Vignette.

<!-- -->

    browseVignettes()

-   Um eine Vignette zu bekommen:

<!-- -->

    vignette("osmdata")

Ein Beispiel fÃ¼r eine Vignette - Das Paket `osmdata`
-----------------------------------------------------

![](figure/ex_osmdata_vignette.PNG)

[**Demos**](http://r-pkgs.had.co.nz/demo.html)
----------------------------------------------

-   fÃ¼r manche Pakete gibt es Demos:

<!-- -->

    demo() # zeigt alle verfÃ¼gbaren Demos
    demo(package = "httr") # Zeigt alle Demos in einem Paket

    # Ein spezifisches Demo laufen lassen:
    demo("oauth1-twitter", package = "httr") 

-   Wenn ein Demo gestartet wird, ist der zugehÃ¶rige Code in der
    Konsole sichtbar

<!-- -->

    demo(nlm)

![](figure/demonlm.PNG)

Die Funktion `apropos`
----------------------

-   durchsucht alles Ã¼ber den angegebenen String:

<!-- -->

    apropos("lm")

    ##  [1] ".colMeans"              ".lm.fit"               
    ##  [3] "bayesglm"               "bayesglm.fit"          
    ##  [5] "colMeans"               "colMeans"              
    ##  [7] "confint.lm"             "contr.helmert"         
    ##  [9] "contr.Helmert"          "dummy.coef.lm"         
    ## [11] "getAllMethods"          "getSummary.clm"        
    ## [13] "getSummary.glm"         "getSummary.lm"         
    ## [15] "getSummary_expcoef.glm" "glance.summ.glm"       
    ## [17] "glance.summ.lm"         "glance.summ.svyglm"    
    ## [19] "glm"                    "glm.control"           
    ## [21] "glm.convert"            "glm.fit"               
    ## [23] "glm.nb"                 "glm_1"                 
    ## [25] "glm_2"                  "glmer"                 
    ## [27] "glmer.nb"               "glmerControl"          
    ## [29] "glmerLaplaceHandle"     "glmFamily"             
    ## [31] "glmmPQL"                "glmResp"               
    ## [33] "isGLMM"                 "isLMM"                 
    ## [35] "isNLMM"                 "KalmanForecast"        
    ## [37] "KalmanLike"             "KalmanRun"             
    ## [39] "KalmanSmooth"           "kappa.lm"              
    ## [41] "lm"                     "lm.fit"                
    ## [43] "lm.gls"                 "lm.influence"          
    ## [45] "lm.ridge"               "lm.wfit"               
    ## [47] "lmer"                   "lmerControl"           
    ## [49] "lmerResp"               "lmList"                
    ## [51] "lmResp"                 "lmsreg"                
    ## [53] "lmwork"                 "loglm"                 
    ## [55] "loglm1"                 "marginalModelPlot"     
    ## [57] "marginalModelPlots"     "mkGlmerDevfun"         
    ## [59] "mkLmerDevfun"           "model.matrix.lm"       
    ## [61] "nlm"                    "nlmer"                 
    ## [63] "nlmerControl"           "nlminb"                
    ## [65] "optimizeGlmer"          "optimizeLmer"          
    ## [67] "panel.lmline"           "predict.glm"           
    ## [69] "predict.lm"             "prepanel.lmline"       
    ## [71] "residuals.glm"          "residuals.lm"          
    ## [73] "rlm"                    "rollmax"               
    ## [75] "rollmax.default"        "rollmaxr"              
    ## [77] "rollmean"               "rollmean.default"      
    ## [79] "rollmeanr"              "rollmedian"            
    ## [81] "rollmedian.default"     "rollmedianr"           
    ## [83] "salmonella"             "scale_lm"              
    ## [85] "sum_glm1"               "summary.glm"           
    ## [87] "summary.lm"             "updateGlmerDevfun"     
    ## [89] "USRegionalMortality"

-   diese Funktion kann auch in Kombination mit [**regulÃ¤ren
    AusdrÃ¼cken**](https://de.wikipedia.org/wiki/Regul%C3%A4rer_Ausdruck)
    verwendet werden...

<!-- -->

    ?"regular expression"

    help.search("^glm")

-   `??` ist ein Synonym fÃ¼r `help.search`

[**Suchmaschine fÃ¼r die R-Seite**](http://search.r-project.org/cgi-bin/namazu.cgi?query=glm&max=20&result=normal&sort=score&idxname=functions&idxname=vignettes&idxname=views)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    RSiteSearch("glm")

![](figure/rsitesearch.PNG)

Nutzung von Suchmaschinen
-------------------------

-   Ich nutze [**duckduckgo.de:**]()

<!-- -->

    R-project + "was ich schon immer wissen wollte" 

-   das funktioniert natÃ¼rlich fÃ¼r alle Suchmaschinen!

![](figure/duckduckgo.PNG)

[**Stackoverflow**](http://stackoverflow.com/)
----------------------------------------------

-   FÃ¼r alle Fragen zum programmieren
-   Ist nicht auf R fokussiert - aber es gibt [**viele Diskussionen zu
    R-Fragen**](https://stackoverflow.com/tags/r/info)
-   Sehr detailierte Diskussionen

![Stackoverflow Beispiel](figure/StackoverflowEx.PNG)

Ein Schummelzettel fÃ¼r Basis R
-------------------------------

<https://www.rstudio.com/resources/cheatsheets/>

![**Cheatsheet BaseR**](figure/basercheatsheet.PNG)

Mehr Schummelzettel
-------------------

![](figure/cheatsheets.PNG)

[**Quick R**](http://www.statmethods.net/interface/help.html)
-------------------------------------------------------------

-   Immer mit vielen Beispielen und Hilfen bezÃ¼glich eines Themas
-   Beispiel: [**Quick R - Getting
    Help**](http://www.statmethods.net/interface/help.html)

![](figure/quickR.PNG)

Weitere Links
-------------

-   [**Ãœberblick - wie bekommt man Hilfe in
    R**](https://www.r-project.org/help.html)

![](figure/gettingHelp.PNG)

-   [**Eine Liste mit HowTo\`s**](http://rprogramming.net/)

-   [**Eine Liste mit den wichtigsten
    R-Befehlen**](https://www.personality-project.org/r/r.commands.html)

Aufgabe A2A [**Hilfe bekommen**](http://web.math.ku.dk/~helle/R-intro/exercises.pdf)
------------------------------------------------------------------------------------

-   Versuchen Sie den Befehl `?which.min`. Dies Ã¶ffnet eine Hilfeseite
    im unteren rechten Fenster von RStudio. Was macht die Funktion?

-   Sie mÃ¼ssen den Namen der Funktion kennen, um die Hilfeseite wie
    oben beschrieben zu Ã¶ffnen. Manchmal (oft, sogar) kennen Sie den
    Namen der R-Funktionen nicht; dann kann Ihnen eine
    [**Suchmaschine**](https://duckduckgo.com/) helfen. Versuchen Sie
    zum Beispiel, den Text `R minimum vector` zu suchen.

[**Quelle fÃ¼r diese
Aufgabe**](http://web.math.ku.dk/~helle/R-intro/Ã¼bungen.pdf)
