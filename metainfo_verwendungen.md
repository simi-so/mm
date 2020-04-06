# Master Data Management (MDM)

Das MDM gestaltet sich einfach. Zusammenfassend ausgedrückt befindet sich der Master aller
Informationen in der Metadatenbank.

**Abwägungen und Ausnahmen:**
* Der Master der Attributbeschreibungen befindet sich in der Meta-DB. Die zeitlich erste 
Attributbeschreibung erfolgt jedoch im Rahmen der INTERLIS-Modellerstellung. Für diese Tatsache
wird im Hauptprojekt (Metadatenpflege) die beste Lösung gefunden. Idee: Initiales Auslesen der
Attributbeschreibungen aus dem Modell in die Meta-DB.
* Die INTERLIS-Modelle "per se" werden nicht in die Meta-DB aufgenommen, sondern geeignet referenziert.
Grund: Würde umfangreiche Anpassungen des heute etablierten Workflows der Modellerstellung erfordern.
Der Arbeitsablauf würde im Vergleich mit dem heute etablierten komplizierter (DB-GUI, ...). 
Dies wird durch den Vorteil der gewonnenen höheren Konsistenz nicht aufgewogen.
* Der Master der Quell- und Zieldatensätze von GRETL-Jobs ist der GRETL-Job selber 
(Der Ordner im git repo). 
Gründe für die Ausnahme: 
    * Der "Sourcecode"-Aspekt ist in GRETL sehr wichtig --> Git mit Branches, ... ein muss.
    * Master Meta-DB würde umfangreiche Anpassungen des etablierten Workflows auslösen.
     

## Verwendung von Metainformationen in der GDI-SO

### Begriffsdefinition "Metainformationen"

Mit Metainformationen sind immer 
* sowohl konfigurative Metainformationen wie beispielsweise ein QML
* wie auch die "klassischen" beschreibenden Metadaten für den Menschen

### Verwendungen

![Verwendung von Metainformationen](puml_output/metainfo_verwendungen.png)

**Offene Fragen:** 
* Der "globale" Layer-Rollout wird nach Abschluss der Modellisierung weniger 
häufig vorkommen, da die Änderungsdichte abnimmt. Dies wird bedeuten, dass zwischen
der Anpassung einer Attributbeschreibung und dem "sichtbar werden" für Kunden bis
zu einem Monat Zeit verstreichen kann. **Ist dies weiterhin zielführend?**