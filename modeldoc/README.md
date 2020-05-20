# Packages (Teilmodelle)

![Übersicht der Teilmodelle](../puml_output/model_overview.png)

* **Core** Enthält die Kernklassen für die Gruppierung und Konfiguration 
von Datenprodukten (Datasets, Productsets, ...). [[Link]](core.md)
* **Data** Enthält die Klassen für die Beschreibung der von der GDI genutzten 
Datenquellen (GIS-Tabellen, Raster, ...). [[Link]](data.md)
* **IAM** Klassen zur Konfiguration des Identity und 
Access Management (Benutzer, Gruppen, Rollen, ...). [[Link]](iam.md)
* **Contact** Teilmodell zur Definition der Kontaktinformationen 
bezüglich der genutzten Daten. [Under construction] 
* **Flow** Modelliert die Informationsflüsse zwecks Übersicht der notwendigen Anpassungen bei
Schemaänderungen etc. [[Link]](flow.md)
* **CCC** Modelliert die einzelnen CCC-Integrationen (CCC-Client)[[Link]](ccc.md)
* **Bouncer** Klassen zur Konfiguration des Bouncer-Proxy, 
welcher den Zugriff auf eine Ressource (Report, ...) einschränkt. [[Link]](bouncer.md)
* **Print** Modelliert die Metainformationen für das Erzeugen von Karten-PDF's [[Link]](print.md)
* **Dependency** Liste der Komponenten, welche von Kern-Artefakten der GDI abhängig sind [[Link]](dependency.md)

## Fragen / Pendenzen

### Konfiguration der WGC Backgroundlayer (WMTS)

Eine flexiblere Konkfigurationsvariante ist die Bereitstellung einer Rumpf-Konfiguration des config.json des Web GIS Client.
In diese werden die dynamischeren Eigenschaften von beispielsweise den Vordergrundebenen hineingeneriert.

Antwort: $td 

### Erfassungstiefe der Dependencies

Erfassen wir auch reine Identifier-Abhängigkeiten?

Beispiele:
* Map: Abhängigkeit auf den Identifier der Map aufgrund Nutzung der URL-Schnittstelle zum WGC
* FacadeLayer: Abhängigkeit aufgrund der Nutzung unseres WMS

### Pendenz: Teilmodell Dependencies modellieren

FLOW

Durch das "Runterwandern" der Abhängigkeitsbeziehung auf den SingleLayer können die verschiedenen Abhängigkeitsaspekte
vereinigt modelliert werden.

Abhängigkeitsaspekte:
* **GRETL-Jobs**, welche aus n Quelldatensätzen m Zieldatensätze berechnen.
* **Reports**, welche jeweils auf 1 bis n SingleLayer zugreifen. Die Informationen werden sowohl im Sinne von "Know your GDI"
wie auch zur Zugriffsverwaltung verwendet.
* **Fachsysteme**, welche meist via Dataservice Informationen aus der GDI beziehen (und schreiben) 

# Modellierungsfragen

|Betrifft|Frage|Wer|Antwort|
|---|---|---|---|
|data.PostgresSchema|Wann sind die verwendeten Parameter der Schemaerstellung mittels ili2pg Teil des Model-Repos?|Stefan|?|
|data.PostgresDB|Verwendung der Service-Definition verstehen. Host und Port als Attribute ok?|Michael|?|
|data und core|Transparenz-Regeln verstehen.|Michael|?|
|data|Externe WMS-Ebene einbinden|Oliver|?|
|data|Wie die Raster in die GDI einbinden? Es gibt zu viele Möglichkeiten...|Oliver|?|

Background-Layer






