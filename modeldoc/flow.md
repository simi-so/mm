# Flow

![Flow](../puml_output/simi_flow.png)

Modelliert die Beziehungen des GRETL-Job zu SingleLayer.

## Klassenbeschreibung

### Job

Aus 1-n Tasks zusammengesetzter GRETL-Job. Abgebildet wird die zusammenfassende Sicht. Allfällige Staging-Zwischentabellen
sind nicht in "Flow" dokumentiert.

### LayerUsage

Attributierte Verknüpfungstabelle. 



Mit dem Attribut "usagetype" wird definiert, ob der SingleLayer vom Artifakt 
lesend oder lesend und schreibend verwendet wird.

Werte der Enumeration:
* **read** (default)
* **write_read**

### SingleLayer (SL)

Siehe package "core"
 
  
 





