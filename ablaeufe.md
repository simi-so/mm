# Ablauf der Metadatenerfassung

## Bisheriger Ablauf

![Bisheriger Ablauf](puml_output/ablauf_alt.png)

## Neuer Ablauf

![Bisheriger Ablauf](puml_output/ablauf_neu.png)

## Ablaufanpassungen des bisherigen auf den neuen Ablauf
* Schemaerstellung wird durch Modellerstellung abgelöst
* Beidseitiges Vieraugenprinzip:
  * Fachamt prüft, ob das technische Setup korrekt ist - Sprich ob eine Kartenebene grundsätzlich geladen wird
  * AGI prüft, ob die vom Fachamt gesetzte Darstellung, Bezeichnungen, Beschreibungen den Richtlinien entspricht
* AGI gibt die Publikation auf allen "Kanälen" frei. Wenn nicht anders definiert werden die Daten sowohl für den 
Bezug in Rohdatenform (Datenabgabe, WF) wie auch für den Bezug in Kartenform (WMS, WGC, QGIS Desktop) freigegeben.
