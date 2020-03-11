# Packages (Teilmodelle)

* **Core** Enthält die Kernklassen für die Gruppierung und Konfiguration von Datenprodukten (Datasets, Productsets, ...).
* **Data** Enthält die Klassen für die Beschreibung der von der GDI genutzten Datenquellen (GIS-Tabellen, Raster, ...).
* **IAM** Klassen zur Konfiguration des Identity und Access Management (Benutzer, Gruppen, Rollen, ...).
* **Contact** Teilmodell zur Definition der Kontaktinformationen bezüglich der genutzten Daten. 

# Anpassungen gegenüber dem Metamodell

## Teilmodell Core
    
### Baumtiefe (Theoretisch unendliche Verschachtelung von DataProducts)
    
Die unendliche Verschachtelung wird aufgelöst und in die Beziehungskette PS - DSL - SL überführt. 
Maximal mögliche Verschachtelung: Layergruppe (oder Map) enthält DataSets und Facadelayer. 
Facadelayer enthalten wiederum DataSets (Ueber Beziehung FL - DS)

### DataSet - DataSetView

Die Unterscheidung, ob eine Tabelle eine Geometriespalte hat oder nicht, erfolgt neu über eine Vererbungsbeziehung
und nicht über eine Assoziation. Die DataSetView entspricht neu der Klasse VectorDS. Im eher seltenen Fall der 
Publikation einer "Geotabelle" mit mehreren Darstellungen / unterschiedlichen Berechtigungen, ... müssen 
entsprechend mehrere VectorDS-Objekte erfasst werden. 

### TableOfContents

Als neue Klasse hinzugefügt, um die Verschachtelung der DataProducts aufzulösen

### Productlist

Klassenname ProductList ersetzt ProductSet, da treffender. Grund: In der bisherigen Praxis sind die Kinder immer sortiert.

### Layerlist

Klassenname Layerlist ersetzt Layergroup, da treffender. Grund: In der bisherigen Praxis sind die Kinder immer sortiert.

# Fragen - Todos

* Wie die meist zutreffende Komposition Layergruppe - DS abbilden? Bei Komposition können viele Informationen von "Mammi" vererbt werden, ohne dass diese nochmals erfasst werden müssen.


