insert into product_variants_db.products
    (product_id, product_name)
values
    (1, 'Dell Inspiron 15'),
    (2, 'HP 15-fd1004nl');


insert into product_variants_db.options
    (option_id, option_name)
values
    (1, 'Processore'),
    (2, 'S.O.'),
    (3, 'Scheda Grafica'),
    (4, 'RAM'),
    (5, 'Hard Disk'),
    (6, 'Colore');

insert into product_variants_db.option_values
    (option_fk,
     value_id,
     value_name, 
     price)
values
    (1, 1, 'Intel Core i3', 54.99),
    (1, 2, 'Intel Core i5', 69.00),
    (1, 3, 'Intel Core i7', 133.99),
    (2, 4, 'Win 10', 26.90),
    (2, 5, 'Win 11', 35.99),
    (3, 6, 'NVIDIA GeForce RTX', 659.00),
    (3, 7, 'Intel Iris Xe', 309.99),
    (4, 8, '16 GB', 79.99),
    (4, 9, '8 GB', 41.99),
    (5, 10, '512 GB', 15.99),
    (5, 11, '1 TB', 27.99),
    (6, 12, 'Bianco', 10.00),
    (6, 13, 'Nero', 25.00),
    (6, 14, 'Rosso', 10.00);

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
    (product_fk, variant_fk, option_fk, value_fk, default)
values
    (1, 1, 1, 1),
    (1, 1, 1, 2),
    (1, 1, 2, 4),
    (1, 1, 2, 5),
    (1, 1, 3, 6),
    (1, 1, 4, 9),
    (1, 1, 5, 10),
    (1, 1, 6, 12),
    (1, 1, 6, 13),
    (1, 1, 6, 14),
    (1, 2, 1, 2),
    (1, 2, 1, 3),
    (1, 2, 2, 5),
    (1, 2, 3, 7),
    (1, 2, 4, 8),
    (1, 2, 4, 9),
    (1, 2, 5, 10),
    (1, 2, 5, 11),
    (1, 2, 6, 12),
    (1, 2, 6, 13),
    (1, 2, 6, 14);