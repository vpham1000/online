create table users (
    user_id int identity (1,1)  not null,
    first_name varchar(30)  not null,
    last_name varchar(30)  not null,
    email varchar(200)  not null,
    password varchar(350) not null,
    dob date  not null,
    phone_num varchar(12)  not null,
    constraint pk_user_id primary key (user_id),
    constraint u_email unique (email)
)

create table addresses (
    address_id int identity (1,1)  not null,
    fk_user_id int not null,
    address_street varchar(20)  not null,
    address_street2 varchar(20) null,
    address_city varchar(20)  not null,
    address_state char(2)  not null,
    address_zip varchar(10)  not null,
    constraint pk_addresses primary key (address_id),
    constraint fk_user_id foreign key (fk_user_id) references users (user_id)
)

create table orders (
    order_num int identity (1,1)  not null,
    fk_user_id int not null,
    fk_address_id int not null,
    order_date date not null,
    shipping_method int not null,
    subtotal money not null,
    tax money not null,
    shipping_price money not null,
    total money  not null,
    fk_payment_id int  not null,
    order_fulfilled varchar(3) not null,
    constraint pk_orders primary key (order_num),
    constraint fk_address_id foreign key (fk_address_id) references addresses (address_id),
    constraint fk_user_id foreign key (fk_user_id) references users (user_id),
    constraint fk_payment_id foreign key (fk_payment_id) references payment_methods (payment_id)
)

create table order_line_items (
    orderitem_id int identity (1,1) not null,
    fk_order_num int not null,
    fk_product_id int not null ,
    quantity int not null,
    unit_price money not null,
    total money not null,
    constraint pk_order_line_items primary key  (orderitem_id),
    constraint fk_order_num foreign key (fk_order_num) references orders (order_num),
    constraint fk_product_id foreign key (fk_product_id) references products (product_id)
)

create table payment_methods (
    payment_id int identity (1,1) not null,
    payment_type varchar(10)  not null,
    constraint pk_payment_methods primary key (payment_id)
)

create table products (
    product_id int identity (1,1)  not null,
    product_num int  not null,
    product_name varchar(max)  not null,
    description varchar(max)  null,
    unit_price money  not null,
    size varchar(10)  not null,
    color varchar(30)  null,
    units_in_stock int not null,
    fk_category_id int  not null,
    constraint pk_products primary key (product_id),
    constraint fk_category_id foreign key (fk_category_id) references categories (category_id)
)

create table categories (
    category_id int identity (1,1) not null,
    category_type varchar(100)  not null,
    constraint pk_categories primary key  (category_id),
    constraint u_category_type unique (category_type)
)

insert users (
    first_name,
    last_name,
    email,
    password,
    dob,
    phone_num
)

values
('Maria','Serrano','mserrano12@gmail.com','loveDOGS!', '10/29/1999','215-928-2341'),
('Lisa','Coleman','colemangirl@aol.com','cupcakes1', '04/3/1993','782-834-1234'),
('Jenny','Matejka','jenmatejka1002@yahoo.com','makeupluvr334', '07/12/1985','423-556-6734'),
('Hallie','Byers','missbyers@aol.com','Seugli5', '12/25/2000','901-234-8425'),
('Selena','Peach','selenalovespeaches@gail.com','vegan4Ever', '03/13/1998','315-123-4568'),
('Maxine','Pham','maxiegirlh3h3@gmail.com','PeanutButter&jelly', '09/30/1992','240-129-4852')

insert into addresses (
    fk_user_id,
    address_street,
    address_street2,
    address_city,
    address_state,
    address_zip
)

values
(2, '752 Newbridge Dr.', null, 'Strongsville','OH','44136'),
(3, '860 Fawn Street.', null, 'Greenwood','SC','29646'),
(3, '82 Elm St.', 'Floor 4 Room 420', 'Brooklyn','NY','11214'),
(4, '993 Myers Lane', null, 'Orlando','FL','32818'),
(6, '7811 Brier St.', 'Floor 6 Room 605', 'Philadelphia','PA','19152')

insert into orders (
    fk_user_id,
    fk_address_id,
    order_date,
    shipping_method,
    subtotal,
    tax,
    shipping_price,
    total,
    fk_payment_id,
    order_fulfilled
)

values
(2, 1, '03/10/2020','standard', '54.00','4.32','4.99','63.31',3,'yes'),
(3, 3, '03/23/2020','expedited', '57.00','4.56','20.00','81.56',2,'yes'),
(6, 5, '04/04/2020','standard', '126.00','10.08','0.00','136.08',1,'no')

insert into payment_methods (
   payment_type
)

values
('Paypal'),
('VISA'),
('Master Card'),
('American Express')



insert into order_line_items (
    fk_order_num,
    fk_product_id,
    quantity,
    unit_price,
    total
)

values
(1, 4, 1, '24.00', '24.00'),
(1, 10, 1, '12.00', '12.00'),
(1, 17, 1, '18.00', '18.00'),
(2, 9, 2, '16.00', '32.00'),
(2, 25, 2, '25.00', '25.00'),
(3, 14, 1, '18.00','18.00'),
(3, 6, 1, '12.00','12.00'),
(3, 5, 1, '12.00','12.00'),
(3, 18, 1, '18.00','18.00'),
(3, 24, 3, '22.00','66.00')


insert into products (
    product_num,
    product_name,
    description,
    unit_price,
    size,
    color,
    units_in_stock,
    fk_category_id
)

values
(1, 'Futuredew', 'oil serum hybrid', '24.00','1 fl oz',null, 1234, 1 ),
(2, 'Milky Jelly Cleanser', 'conditioning face wash', '18.00','6 fl oz',null, 7283, 1 ),
(2, 'Milky Jelly Cleanser', 'conditioning face wash', '9.00','2 fl oz',null, 6003, 1),
(3, 'Solution', 'exfolitating skin perfector', '24.00','4.4 fl oz',null, 2340, 1),
(4, 'Milky Jelly Cleanser', 'conditioning face wash', '9.00','2 fl oz',null, 7283, 1),
(5, 'Balm Dotcom', 'universal skin salve', '12.00','0.5 fl oz','birthday', 3948, 1),
(5, 'Balm Dotcom', 'universal skin salve', '12.00','0.5 fl oz','coconut', 3849, 1),
(5, 'Balm Dotcom', 'universal skin salve', '12.00','0.5 fl oz','rose', 3019, 1),
(5, 'Balm Dotcom', 'universal skin salve', '12.00','0.5 fl oz','berry', 3928, 1),
(5, 'Balm Dotcom', 'universal skin salve', '12.00','0.5 fl oz','mint', 3086, 1),
(6, 'Lask Flick', 'film form mascara', '16.00','0.29 fl oz','black', 7820, 2),
(7, 'Generation G', 'sheer matte lipstick', '18.00','0.1 fl oz','cake', 6291, 2),
(7, 'Generation G', 'sheer matte lipstick', '18.00','0.1 fl oz','crush', 5932, 2),
(7, 'Generation G', 'sheer matte lipstick', '18.00','0.1 fl oz','like', 2348, 2),
(7, 'Generation G', 'sheer matte lipstick', '18.00','0.1 fl oz','jam', 3491, 2),
(8, 'Cloud Paint', 'seamless cheek color', '18.00','0.33 fl oz','storm', 5918, 2),
(8, 'Cloud Paint', 'seamless cheek color', '18.00','0.33 fl oz','dawn', 3462, 2),
(8, 'Cloud Paint', 'seamless cheek color', '18.00','0.33 fl oz','puff', 1092, 2),
(9, 'Boy Brow', 'grooming pomade', '16.00','0.11 fl oz','black', 1298, 2),
(9, 'Boy Brow', 'grooming pomade', '16.00','0.11 fl oz','clear', 3028, 2),
(9, 'Boy Brow', 'grooming pomade', '16.00','0.11 fl oz','brown', 2038, 2),
(9, 'Boy Brow', 'grooming pomade', '16.00','0.11 fl oz','blonde', 2581, 2),
(10, 'Body Hero Daily Oil Wash', 'daily oil wash', '18.00','8.4 fl oz',null, 5273, 3),
(11, 'Body Hero Daily Perfecting Cream', 'daily perfecting cream', '22.00','8.4 fl oz',null, 4619, 3),
(13, 'Baseball Cap', null, '25.00','one size','white', 3028, 4),
(14, 'Glossier Sweatshirt', null, '40.00','XS','grey', 7253, 4),
(14, 'Glossier Sweatshirt', null, '40.00','S','grey', 7198, 4),
(14, 'Glossier Sweatshirt', null, '40.00','M','grey', 8163, 4),
(14, 'Glossier Sweatshirt', null, '40.00','L','grey', 5893, 4),
(14, 'Glossier Sweatshirt', null, '40.00','XL','grey', 6028, 4),
(12, 'Glossier You', 'eau de parfum', '60.00','1.7 fl oz',null, 7001, 5)


insert into categories (
    category_id,
    category_type
)

values
(1, 'skincare'),
(2, 'makeup'),
(3, 'body'),
(4, 'merch'),
(5, 'fragrance')


