insert into product_variants_db.products
    (product_name)
values
    ('Dell Inspiron 15'),
    ('HP 15-fd1004nl');


insert into product_variants_db.options
    (option_name)
values
    ('Processore'),
    ('S.O.'),
    ('Scheda Grafica'),
    ('RAM'),
    ('Hard Disk'),
    ('Colore');

insert into product_variants_db.option_values
    (option_fk,
     value_id,
     value_name)
values
    (1, 1, 'Intel Core i3'),
    (1, 2, 'Intel Core i5'),
    (1, 3, 'Intel Core i7'),
    (2, 4, 'Win 10'),
    (2, 5, 'Win 11'),
    (3, 6, 'NVIDIA GeForce RTX'),
    (3, 7, 'Intel Iris Xe'),
    (4, 8, '16 GB'),
    (4, 9, '8 GB'),
    (5, 10, '512 GB'),
    (5, 11, '1 TB'),
    (6, 12, 'Bianco'),
    (6, 13, 'Nero'),
    (6, 14, 'Rosso');

insert into product_variants_db.product_options
    (product_fk, option_fk)
values
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (1, 6),
    (2, 1),
    (2, 2),
    (2, 3),
    (2, 4),
    (2, 5);

insert into product_variants_db.product_variants
    (product_fk, variant_id, sku)
values
    (1, 1, 'DELLV1'),
    (1, 2, 'DELLV2'),
    (2, 1, 'HPVAR1'),
    (2, 2, 'HPVAR2');

insert into product_variants_db.variant_values
    (product_fk, variant_fk, option_fk, value_fk)
values
    (1, 1, 1, 1),
    (1, 1, 2, 4),
    (1, 1, 3, 6),
    (1, 1, 4, 9),
    (1, 1, 5, 10),
    (1, 1, 6, 13),
    (1, 2, 1, 2),
    (1, 2, 2, 5),
    (1, 2, 3, 7),
    (1, 2, 4, 8),
    (1, 2, 5, 11),
    (1, 2, 6, 12);