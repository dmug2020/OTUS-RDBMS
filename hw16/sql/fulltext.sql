CREATE FULLTEXT INDEX ppi_namedesc ON ppi_position_import(ppi_name,ppi_description);
CREATE FULLTEXT INDEX mod_name ON positions_models(mod_name);
CREATE FULLTEXT INDEX tdfname ON technical_details_fields(tdf_name);

select * from ppi_position_import ,
positions_models

WHERE MATCH (ppi_name,ppi_description) AGAINST ('культиватор');
