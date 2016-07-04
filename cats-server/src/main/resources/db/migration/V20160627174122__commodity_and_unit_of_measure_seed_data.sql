-- Migration file V20160627174122__commodity_and_unit_of_measure_seed_data.sql created at --
/*
  Commodity type seed data
 */

INSERT INTO commodity_type (name, description) VALUES ('Food','Food commodity type');
INSERT INTO commodity_type (name, description) VALUES ('Non Food','Non-food commodity type');


/*
  Unit of measure category seed data
 */
INSERT INTO uom_category (name) VALUES ('Unit');
INSERT INTO uom_category (name) VALUES ('Weight');
INSERT INTO uom_category (name) VALUES ('Volume');
INSERT INTO uom_category (name) VALUES ('Length');

/*
  Unit of measure seed data
 */
INSERT INTO unit_of_measure (name,code,uom_category_id,type,ratio) VALUES ('Killogram','KG',2,'REF',1);
INSERT INTO unit_of_measure (name,code,uom_category_id,type,ratio) VALUES ('Quintal','QTL',2,'BIG',100);
INSERT INTO unit_of_measure (name,code,uom_category_id,type,ratio) VALUES ('Metric Ton','MT',2,'BIG',1000);
INSERT INTO unit_of_measure (name,code,uom_category_id,type,ratio) VALUES ('Meter','M',4,'REF',1);
INSERT INTO unit_of_measure (name,code,uom_category_id,type,ratio) VALUES ('Cubic meter','M3',3,'REF',1);
INSERT INTO unit_of_measure (name,code,uom_category_id,type,ratio) VALUES ('Unit','U',1,'REF',1);
INSERT INTO unit_of_measure (name,code,uom_category_id,type,ratio) VALUES ('Dozen','DOZ',1,'BIG',12);
INSERT INTO unit_of_measure (name,code,uom_category_id,type,ratio) VALUES ('Gross','GRS',1,'BIG',144);