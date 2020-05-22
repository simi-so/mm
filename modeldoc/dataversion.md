
# Versionierung alt

**Achtung: Versionierung ist aufgrund der Auftrennung in DS und DSV deutlich komplexer geworden. Es ist fraglich, ob so noch sinnvoll.**

Als Ablösung des improvisierten Tag "Bearbeitung" und zwecks Entschärfung des "Point of no return" bezüglich des 
Layer-Rollouts wird eine saubere Versionierung der DataSetViews eingeführt.

Dabei können einem SingleLayer maximal drei DataSetViews zugewiesen werden:
* **Previous:** Enthält die vorhergehende, nicht mehr gültige Konfiguration. Nutzen: Auf der Integration kann "Previous" 
kurzfristig reaktiviert werden, sofern "Current" stark verbockt ist. Sprich alle Aenderungen verwerfen und basierend
auf "Previous" neu starten.
* **Current:** Enthält die aktuell gültige Konfiguration.
* **Next:** Enthält die Entwurfsversion der neuen Konfiguration, welche auf der Integrationsumgebung aktuell 
erarbeitet wird.

Das Verhalten des zukünftigen "Magic-Button" wird damit von der Umgebung abhängen:
* In der Produktivumgbung wird immer "Current" verwendet
* In der Integrationsumgebung wird "Next" verwendet. Falls kein "Next" vorhanden ist, wird "Current" deployt

Im GUI des SingleLayer steht entsprechende Funktionalität zur Verfügung:
* Entwurfsversion anlegen
    * Stellt sicher, dass noch kein "Next" existiert. Falls existierend --> Abbruch
    * Erstellt ein neues "Next" und kopiert alle Eigenschaften des Current in das neue "Next"
* Entwurfsversion löschen
    * Löscht "Next", sofern dieses vorhanden ist
* Entwurfsversion publizieren
    * Löscht "Previous", sofern dieses vorhanden ist
    * Rename "Current" auf "Previous"
    * Rename "Next" auf "Current"
* "Previous" wieder herstellen
    * Löscht "Next", sofern vorhanden
    * Rename "Current" auf "Next"
    * Rename "Previous" auf "Current"

**Unique-Bedingung:** Mittels Unique-Key wird sichergestellt, dass für einen SingleLayer eine DataSet in beispielsweise der Version "next"
maximal einmal vorkommt.

# Versionierung neu

Idee, falls die Versionierung genügend attraktiv ist:

Zu einem DS mit zugehörigen DSV kann maximal eine Version gesichert werden. Damit müssen die Aenderungen nicht 
auf den Termin des Rollouts wieder konsistent sein.

Datenmodell dazu:

DataVersion 1 : 1 DS
DataVersion 1 : n DSV




