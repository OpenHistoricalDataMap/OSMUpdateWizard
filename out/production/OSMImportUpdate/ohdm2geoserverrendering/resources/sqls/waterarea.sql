
INSERT INTO

target_schema_to_be_replaced.my_waterarea(geometry, object_id, geom_id, classid, type, name, valid_since, valid_until, tags, user_id, area)

SELECT 

g.geometry, o.id as object_id, g.id as geom_id, c.id as classid, c.subclassname, o.name, gg.valid_since, gg.valid_until, gg.tags, gg.user_id, ST_Area(g.geometry, true)
FROM

 (SELECT id, name from source_schema_to_be_replaced.geoobject) as o, 
 
 (SELECT id_target, classification_id, type_target, id_geoobject_source, valid_since, valid_until, tags, source_user_id as user_id FROM source_schema_to_be_replaced.geoobject_geometry) as gg,
 
 (SELECT id, polygon as geometry FROM source_schema_to_be_replaced.polygons WHERE ST_IsValid(polygon) = '1') as g,
 
 /* hier jeweils source_schema_to_be_replaced.polygons, lines, points*/
 
 (SELECT id, subclassname FROM source_schema_to_be_replaced.classification where subclassname = 'water') as c
 
 WHERE gg.type_target = 3 AND g.id = gg.id_target AND o.id = gg.id_geoobject_source AND c.id = gg.classification_id;
 
 /* gg.type_target = 3 AND  aus WHERE entnommen */
 
 /* LINE */
INSERT INTO

target_schema_to_be_replaced.my_waterarea(geometry, object_id, geom_id, classid, type, name, valid_since, valid_until, tags, user_id)

SELECT 

g.geometry, o.id as object_id, g.id as geom_id, c.id as classid, c.subclassname, o.name, gg.valid_since, gg.valid_until, gg.tags, gg.user_id

FROM

 (SELECT id, name from source_schema_to_be_replaced.geoobject) as o, 
 
 (SELECT id_target, classification_id, type_target, id_geoobject_source, valid_since, valid_until, tags, source_user_id as user_id FROM source_schema_to_be_replaced.geoobject_geometry) as gg,
 
 (SELECT id, line as geometry FROM source_schema_to_be_replaced.lines) as g,
 
 /* hier jeweils source_schema_to_be_replaced.polygons, lines, points*/
 
 (SELECT id, subclassname FROM source_schema_to_be_replaced.classification where subclassname = 'water') as c
 
 WHERE gg.type_target = 2 AND g.id = gg.id_target AND o.id = gg.id_geoobject_source AND c.id = gg.classification_id;
 
 /* gg.type_target = 3 AND  aus WHERE entnommen */
 
 
 /* POINT */
INSERT INTO

target_schema_to_be_replaced.my_waterarea(geometry, object_id, geom_id, classid, type, name, valid_since, valid_until, tags, user_id)

SELECT 

g.geometry, o.id as object_id, g.id as geom_id, c.id as classid, c.subclassname, o.name, gg.valid_since, gg.valid_until, gg.tags, gg.user_id

FROM

 (SELECT id, name from source_schema_to_be_replaced.geoobject) as o, 
 
 (SELECT id_target, classification_id, type_target, id_geoobject_source, valid_since, valid_until, tags, source_user_id as user_id FROM source_schema_to_be_replaced.geoobject_geometry) as gg,
 
 (SELECT id, point as geometry FROM source_schema_to_be_replaced.points) as g,
 
 /* hier jeweils source_schema_to_be_replaced.polygons, lines, points*/
 
 (SELECT id, subclassname FROM source_schema_to_be_replaced.classification where subclassname = 'water') as c
 
 WHERE gg.type_target = 1 AND g.id = gg.id_target AND o.id = gg.id_geoobject_source AND c.id = gg.classification_id;
 
 /* gg.type_target = 3 AND  aus WHERE entnommen */
