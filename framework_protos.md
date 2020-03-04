# Prototypes

## Goals for the protoypes:

Feel how the work is accomplished with the frameworks.

Get "hands-on" experience on some (in our eyes) crucial functionalities of the framework:
1. Design "fitting" UI's featuring high usability by writing only few lines of code (loc)
1. "Good" UI-Components
1. Freedom to create intuitive distribution of the components on the screen
1. Well placed validation feedback. Writing the rules with few loc
1. Good "end to end" ORM solution (inheritance and associations). With trying out different inheritance mappings "down" to the db.
1. Traceability of last change to an entity
1. Setting permissions to screens
1. Migrating the data-model "in production"
   
Additionally, document valid ways to integrate "Non-CRUD" functionalities into the UI:
1. Upload and strip xml file via custom code. Store stripped xml in entity field (non binary).
1. Integrate postgres metadata catalogue queries and store results in entity fields.
1. For a small part of the data model - the master data resides in another application. Create a data service interface that will be used by the other application to keep copies of the master data up to data in the "cuba db".
1. Create a screen or report showing all dependent configurations for a geodata table.
    
## Data model

The used data model is a stripped and compressed subset of the origin models "map" and "data". 
See ![Modelle](modelle.md) concerning the documentation of the origin models (in german).

### Model V1
![Model V1](puml_output/proto_model_v1.png)

### Model V2

Changes since V1:
* New entity DataSetList (DSL)
* New mandatory field "qml_content" on PostgresDS. With "select file from disc" functionality.
* Moved the identifier field from SA and PS up to DP

![Model V2](puml_output/proto_model_v2.png)

Cuba: Script to move identifier from SingleActor to DataProduct makes two steps:
* Rename the column in update script --> Data is still available
* Drop the column in specific drop script at the end

**update script:**
    **alter table SIMI_SINGLE_ACTOR rename column identifier to identifier__u80113 ;**
    alter table SIMI_SINGLE_ACTOR alter column identifier__u80113 drop not null ;
    alter table SIMI_SINGLE_ACTOR add column DELETED_BY varchar(50) ;
    alter table SIMI_SINGLE_ACTOR add column TITLE varchar(255) ;
    alter table SIMI_SINGLE_ACTOR add column REMARKS text ;
    alter table SIMI_SINGLE_ACTOR add column IN_WGC boolean ^
    update SIMI_SINGLE_ACTOR set IN_WGC = false where IN_WGC is null ;
    alter table SIMI_SINGLE_ACTOR alter column IN_WGC set not null ;
    alter table SIMI_SINGLE_ACTOR add column UPDATE_TS timestamp ;
    alter table SIMI_SINGLE_ACTOR add column DTYPE varchar(31) ;
    alter table SIMI_SINGLE_ACTOR add column DELETE_TS timestamp ;
    alter table SIMI_SINGLE_ACTOR add column UPDATED_BY varchar(50) ;
    alter table SIMI_SINGLE_ACTOR add column CREATED_BY varchar(50) ;
    alter table SIMI_SINGLE_ACTOR add column CREATE_TS timestamp ;
    alter table SIMI_SINGLE_ACTOR add column VERSION integer ^
    update SIMI_SINGLE_ACTOR set VERSION = 0 where VERSION is null ;
    alter table SIMI_SINGLE_ACTOR alter column VERSION set not null ;
    -- alter table SIMI_SINGLE_ACTOR add column IDENTIFIER varchar(255) ^
    -- update SIMI_SINGLE_ACTOR set IDENTIFIER = <default_value> ;
    -- alter table SIMI_SINGLE_ACTOR alter column identifier set not null ;
    alter table SIMI_SINGLE_ACTOR add column IDENTIFIER varchar(255) ;

**drop script:**
    **alter table SIMI_SINGLE_ACTOR drop column IDENTIFIER__U80113 cascade ;**

Remarks:
* As DataProduct is rewritten to a mapped superclass, dropping the identifier and recreating is not necessary - this would need to be corrected manually.
* Data migration code would need to be inserted manually between the update and delete scripts
