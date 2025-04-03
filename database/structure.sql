create schema product_variants_db collate utf8mb4_general_ci;

create table product_variants_db.products
(
	product_id int not null primary key,
	product_name varchar(50) not null,
	constraint products_product_name_uindex
		unique (product_name)
);

create table product_variants_db.options
(
	option_id int not null primary key,
	option_name varchar(50) not null,
	constraint options_option_name_uindex
		unique (option_name)
);

create table product_variants_db.option_values
(
	option_fk int not null,
	value_id int not null,
	value_name varchar(50) not null,
	price double(10,2) DEFAULT NULL,
    constraint option_values_option_fk_value_name_uindex
		unique (option_fk, value_name),
	constraint option_values_pk
		primary key (option_fk, value_id),
	constraint option_values_option_id_fk
		foreign key (option_fk) references options (option_id)
);

create table product_variants_db.product_options
(
	product_fk int not null,
	option_fk int not null,
	constraint product_options_pk
		primary key (product_fk, option_fk),
    constraint product_options_product_fk_fk
		foreign key (product_fk) references products (product_id),
    constraint product_options_option_fk_fk
		foreign key (option_fk) references options (option_id)
);

create table product_variants_db.product_variants
(
	product_fk int not null,
	variant_id int not null,
	sku varchar(10) not null,
	default tinyint(4) DEFAULT NULL,
	constraint product_variants_pk
		primary key (product_fk, variant_id),
    constraint product_variants_sku_uindex
		unique (sku),
	constraint product_variants_product_id_fk
		foreign key (product_fk) references products (product_id)
);

create table product_variants_db.variant_values
(
	product_fk int not null,
	variant_fk int not null,
	option_fk int not null,
	value_fk int not null,
	constraint variant_values_pk
		primary key (product_fk, variant_fk, option_fk),
    constraint variant_values_product_variants_fk
		foreign key (product_fk, variant_fk) references product_variants (product_fk, variant_id),
    constraint variant_values_option_values_fk
		foreign key (option_fk, value_fk) references option_values (option_fk, value_id),
    constraint variant_values_product_options_fk
		foreign key (product_fk, option_fk) references product_options (product_fk, option_fk)    	
);

