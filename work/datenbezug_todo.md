## Anwendungsfälle

![UC Datenbezug](puml_output/uc_datenbezug.png)

|Anwendungsfall|Beschreibung|
|---|---|
|Spezialbestellung manuell exportieren||
|Spezialbestellung manuell exportieren||
|Spezialbestellung manuell exportieren||
|Spezialbestellung manuell exportieren||

### Alternativen für den Kunden

Aufgrund der "Bestückung" von geocat und oder der Integration in opendata.swiss stehen dem
Kunden "automatisch" die Such / Katalogfunktionen dieser beiden Applikationen ebenfalls zur Verfügung.

## Ablauf "Datenbezug zusammenstellen"

![Ablauf Datenbezug](puml_output/ablauf_datenbezug.png)

Spezialbestellungen:
* Zugriffsgeschützte (falls Anzahlmässig wenige)
* Datenherr will wissen, wozu die Daten verwendet werden 

In der Downloadübersicht sind auch die Informationen zum "Bezug" via Diensten
enthalten (WMS, GeoAPI, WFS).

## Anforderungen

|ID|Muss|Stichwort|Beschreibung|
|---|---|---|---|
| |Ja|Protokolle|Die Daten müssen via HTTP und FTP bereitgestellt werden|
| |Ja|Packetierung|Das Publikationmodell ist der kleinste thematische Umfang eines Downloads.<br>Formate, welche dies nicht leisten können, werden als zip ausgeliefert (Bsp. dxf)|
| |Ja|Formate|Angeboten werden Geopackage, INTERLIS2 für Vektordaten und GeoTif für Rasterdaten.<br>Für die Vermessungsdaten zusätzlich "dxf Geobau".|
| |Nein|Formate|Angeboten werden zusätzlich dxf und shapefile|
| |Ja|Ausdehnung|Die Ausdehnung des Angebotes richtet sich einzig nach der Nachführung und/oder der Datenmenge des entsprechenden Themas (Modelles).|
| |Ja|Benutzer-Oberflächen|Der Kunde bedient sich selbst. Ihm stehen eine kartenzentrische und eine textorientierte Benutzer-Oberfläche zur Verfügung. In der textorientierten Oberfläche sucht er sich "google-like" die Themen zusammen.|
| |Ja|Datenausschnitt|Es stehen keine kundendefinierten Ausschnitte zur Verfügung. Der Datenumfang der Downloads ist vordefiniert und statisch.|
| |Ja|Änderungsart|Der Datenbezugsdienst gibt Auskunft über die Art der Aktualisierung (manuell, periodisch), bei periodisch über das Aktualisierungs-Intervall (wöchentlich, ...) den Zeitpunkt der letzten Aktualisierung  

## Todo
* Anhand der heutigen Meta-DB und der Bestellungen das Mengengerüst der Spezialbestellungen aufgrund Zugriffsschutz verstehen.
* Anforderungen verstehen, aus welchem der heute etablierte Freigabeprozess folgt.
* Raster / Lidardaten verstehen
* Implementierung für die Zugriffsgeschützten vertiefen. Idee "Modellerweiterung" klemmt wegen den Datendiensten.
    * Dienste ausklammern?
    * MetaDb weiss neu, welches Modell welchen Klassenumfang hat. MetaDb weiss schon jetzt, welche Attribute einer Klasse
    freigeschaltet sind. Damit kann ermittelt werden, ob ein Modell zugriffsgeschützte Informationen umfasst.
        * Folglich: Zugriffsgeschütztes Modell ist Spezialbestellung? --> Mengengerüst abschätzen! 
* Ueberzeugen, dass kartenzentrisch ausreicht. Wer will Geodaten bestellen, kann aber nicht mit Karten...?
* In der WGC-Zusammenstellung wird ein geschützter DS gar nicht gefunden, wenn man sich nicht vorgängig im WGC angemeldet hat.

Ergänzen:
* Gründe für die Spezialbestellungen.
    * Gründe mit Delegation an AGI
    * Gründe ohne Delegation an AGI --> GIS-Koordinator muss es machen.
* Spezialbestellung --> GIS-Koordinator manuell in QGIS.
* Matrix bezüglich Datenbereitstellungsart und Schutzbedarf des Datensatzes.


Besprochenes einarbeiten:
* Vorberechnete Bereitstellung als xtf (Edit und Prod) und als Geopackage (nur Prod). 
* On-Demand Konvertierung in Shapefile und DXF 
* Vermessung wird zusätzlich auch als DXF Geobau bereitgestellt (Vorberechnet)
* Wichtig ist ein GUI, in welchem mittels guter Suche das Angebot ausschliesslich des Kanton Solothurn durchsucht werden kann.
    * Geocat leistet dies heute schon (fast), mit einer guten Suche, eingeschränkt auf den Kanton XY

    
