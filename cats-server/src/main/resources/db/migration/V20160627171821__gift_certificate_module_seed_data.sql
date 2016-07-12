-- Migration file V20160627171821__gift_certificate_module_seed_data.sql created at --
/*
  Currency seed data
 */
INSERT INTO currency (name, symbol) VALUES ('Ethiopian Birr','ETB');
INSERT INTO currency (name, symbol) VALUES ('US Dollar','USD');
INSERT INTO currency (name, symbol) VALUES ('Euro','EUR');
INSERT INTO currency (name, symbol) VALUES ('UK Pound','GBP');

/*
  Budget type seed data
 */

INSERT INTO budget_type (name, description) VALUES ('Regular','Regular budget');
INSERT INTO budget_type (name, description) VALUES ('Capital','Capital budget');

/*
  Fund source seed data
 */

INSERT INTO fund_source (name, description) VALUES ('Treasury','Treasury fund source');
INSERT INTO fund_source (name, description) VALUES ('Loan','Loan fund source');
INSERT INTO fund_source (name, description) VALUES ('Donation','Donation fund source');

/*
  Program seed data
 */

INSERT INTO program (name, short_name) VALUES ('Relief Program','RELIEF');
INSERT INTO program (name, short_name) VALUES ('Productive SafetyNet Program','PSNP');
INSERT INTO program (name, short_name) VALUES ('Internally Displaced People','IDPS');

/*
  Mode of transport seed data
 */
INSERT INTO mode_of_transport (name) VALUES ('Ship');
INSERT INTO mode_of_transport (name) VALUES ('Air');
INSERT INTO mode_of_transport (name) VALUES ('Land(Truck)');
INSERT INTO mode_of_transport (name) VALUES ('Land(Train)');

/*
  Donor
 */
INSERT INTO donor(name,short_name,code) VALUES ('United Nations World Food Program','UNWFP','WFP');
INSERT INTO donor(name,short_name,code) VALUES ('USAID','USAID','USAID');
INSERT INTO donor(name,short_name,code) VALUES ('Catholic Relief Service','CRS','CRS');
INSERT INTO donor(name,short_name,code) VALUES ('Government of Ethiopia','FDRE','FDRE');

