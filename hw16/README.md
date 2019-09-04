Домашнее задание
Индексы
Варианты:
1)
В материалах приложен дамп с 4 таблицами по продуктам

select * from
positions_models pm,
ppi_position_import ppi,
technical_details td,
technical_details_fields tdf
where pm.mod_ppi_id=ppi.ppi_id
and tdf.tdf_id=td.tch_property_id
and td.tch_mod_id=pm.mod_id

Задача - сделать полнотекстовый индекс, который ищет по свойствам, названию товара и названию модели

Решение - https://github.com/ugaidmitry/RDBMS/blob/master/hw16/sql/fulltext.sql


2) добавляем индексы в свой проект - 

Ставим индекс на FULLTEXT на post_content,post_title ,comment_content - для ускорения полнотекстового поиска


