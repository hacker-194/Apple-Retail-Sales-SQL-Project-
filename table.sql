
create table stores(
store_id varchar(10) primary key,
Store_Name varchar(30),
City varchar(25),
Country varchar(25)
);

create table category(
category_id	varchar(10) primary key,
category_name varchar(30)
);

create table products(
product_id varchar(10) primary key,
Product_Name varchar(35),
category_id varchar(10),
Launch_Date date,
Price float,
constraint fk_category foreign key (category_id) references category(category_id)
);

create table sales(
sale_id varchar(10) primary key,
sale_date date,
store_id varchar(10),
product_id varchar(10),
quantity int,
constraint fk_sales foreign key (store_id) references stores(store_id),
constraint fk_products foreign key(product_id) references products(product_id)
);

create table warranty(
claim_id varchar(10) primary key,
claim_date date,
sale_id varchar(10),
repair_status varchar(50),
constraint fk_warranty foreign key(sale_id) references sales(sale_id)
);

SET datestyle = 'ISO, DMY';  -- date is not in standard formate so we change it into standard formate

copy stores from 'D:\archive\stores.csv' delimiter ',' header csv;
copy category from 'D:\archive\category.csv' delimiter ',' header csv;
copy products from 'D:\archive\products.csv' delimiter ',' header csv;
copy sales from 'D:\archive\sales.csv' delimiter ',' header csv;
copy warranty from 'D:\archive\warranty.csv' delimiter ',' header csv;
