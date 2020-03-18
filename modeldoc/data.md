# Data

![Data](../puml_output/simi_data.png)

Stellt die Klassen des Datenkonfigurationsteils dar
* Tabellarische Daten aus Postgres/PostGIS mit und ohne Geometrie
* Rasterdaten aus einem File / einem Katalog

## Attribute

Umfasst die Eigenschaften eines Attributs einer PostgresDS. 

Bemerkungen:
* Die Namen der Attribute werden mittels Katalogabfrage aus Postgres gelesen.
* Zwei PostgresDS können auf dasselbe Attribut verweisen. Da dies aber nicht häufig vorkommt, wird auf diese 
Normalisierung verzichtet. Der Vorteil des einfachen Modelles überwiegt den Nachteil der punktuellen Doppelerfassung
von Beispielsweise des Feldes "description". 
* Der Attributname ist innerhalb eines PostgresDS unique. 

Attributbeschreibungen:
* cat_synced: Gibt an, ob das Attribut bei der letzten Katalogabfrage in der Datenbank vorhanden war.
(Zeitpunkt der letzten Synchronisation: PostgresDS.cat_sync_stamp)
* wgc_format: Formattierungs-String für die Darstellung im Web GIS Client
* json_displayprops: Definiert Alias, Reihenfolge, Wertformatierung für die Properties eines Json-Feldes. 
* jinja_template: Template, welches ein Custom-Rendering für das Attribut definiert. $td: Definition auf DS oder Attribut?
* Von den Felder wgc_format, json_displayprops, jinja_template darf nur eines "not null" sein.

## Dataset

Bei Vektor- oder tabellarischen Daten entspricht ein Dataset-Eintrag einer (Geo-)Tabelle. 
Bei Rasterdaten entspricht er einem Rasterlayer (Es werden keine nicht georeferenzierten Bilder erfasst).

### Beschreibung der Subklassen
* **PostgresDS:** Definiert basierend auf einer Postgres-Tabelle, welche Tabellenzeilen und -spalten gelesen.
 (und geschrieben) werden können. Die sprechenden Namen der Spalten (=Attribute) sind in der Klasse "Attributes" definiert.
* **VectorDS:** Repräsentiert eine PostGIS-Ebene. Erweitert PostgresDS mit den Darstellungseigenschaften.
* **RasterDS:** Repräsentiert eine dateibasierte Raster-Ebene. 

### Versionierung

Pro SingleLayer können maximal drei DataSet-Objekte mit jeweils anderer Versions-Enum vorkommen:
* Enum "current": Das aktuell "scharfe" DataSet für den Singlelayer. 
* Enum "next": Das kommende DataSet für den Singlelayer.
* Enum "previous": Das vorherige DataSet für den Singlelayer.

**Unique-Bedingung:** Mittels Unique-Key wird sichergestellt, dass für einen SingleLayer eine DataSet in beispielsweise der Version "next"
maximal einmal vorkommt.

## PostgresDS

Siehe Dataset

## PostgresSchema

Enthält die Eigenschaften eines Postgres-Schema. Eingeführt, um der hohen Wichtigkeit des Schema als "Nachführungseinheit"
Rechnung zu tragen.

## RasterDS

Siehe Dataset

## VectorDS

Siehe Dataset



