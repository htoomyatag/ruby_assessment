An API server for SimpleShop

FOR USER REGISTRATION JWT
-------------------------

- **POST** /users/sign_up
**PARAMETER** email,password
**SCOPE** user registration

- **POST** /users/sign_in
**PARAMETER** email,password
**SCOPE** user sign in

- **POST** /user/change_password
**PARAMETER** new_password
**SCOPE** change password

- **POST** /user/change_email
**PARAMETER** new_email
**SCOPE** change email

FOR ADMIN MANAGE CURRENCY/TAX/COUNTRY
-------------------------------------

- **GET**  /api/v1/countries
**PARAMETER** null
**SCOPE** - Get the list of countries

- **POST** /api/v1/add_countries
**PARAMETER** title,country_code
**SCOPE** add country

- **DELETE** /api/v1/remove_countries
**PARAMETER** id
**SCOPE** - Delete country

- **GET**  /api/v1/currencies
**PARAMETER** null
**SCOPE** - Get the list of currencies

- **POST** /api/v1/add_currencies
**PARAMETER** title,currency_code
**SCOPE** add currency

- **DELETE** /api/v1/remove_currencies
**PARAMETER** id
**SCOPE** - Delete currency

- **GET**  /api/v1/taxes
**PARAMETER** null
**SCOPE** - Get the list of taxes

- **POST** /api/v1/add_taxes
**PARAMETER** tax_rate,tax_category
**SCOPE** add tax

- **DELETE** /api/v1/remove_taxes
**PARAMETER** id
**SCOPE** remove tax 

FOR ADMIN MANAGE REGIONS/PRODUCTS/STORES
----------------------------------------

- **GET**  /api/v1/regions
**PARAMETER** null
**SCOPE** - Get the list of regions

- **POST** /api/v1/add_regions
**PARAMETER** title,country_id,currency_id,tax_id
**SCOPE** add region 

- **DELETE** /api/v1/remove_regions
**PARAMETER** id
**SCOPE** remove region 

- **GET**  /api/v1/stores
**PARAMETER** null
**SCOPE** - Get the list of stores

- **POST** /api/v1/add_stores
**PARAMETER** title,region_id
**SCOPE** add store

- **DELETE** /api/v1/remove_stores
**PARAMETER** id
**SCOPE** remove store 

- **GET**  /api/v1/products
**PARAMETER** null
**SCOPE** - Get the list of products

- **GET**  /api/v1/product
**PARAMETER** id
**SCOPE** - **GET** individual product

- **POST** /api/v1/add_products
**PARAMETER** title,description,image_url,price,sku,stock,region_id
**SCOPE** add product

- **DELETE** /api/v1/remove_products
**PARAMETER** id
**SCOPE** remove product


FOR CUSTOMER ADD PRODUCTS TO CART, ORDER AND MAKE PAYMENT
----------------------------------------------------------

- **POST** /api/v1/add_to_cart
**PARAMETER** product_id,quantity
**SCOPE** add product to cart

- **POST** /api/v1/add_quantity
**PARAMETER** id
**SCOPE** plus one to quantity

- **POST** /api/v1/reduce_quantity
**PARAMETER** id
**SCOPE** minus one to quantity

- **POST** /api/v1/remove_allproduct_in_cart
**PARAMETER** cart_id
**SCOPE** remove all products in cart

- **POST** /api/v1/remove_product_in_cart
**PARAMETER** cart_id,product_id
**SCOPE** remove desire product in cart

- **GET** /api/v1/line_items
**PARAMETER** cart_id
**SCOPE** - Get the list of added products in cart 

- **POST** /api/v1/add_to_order
**PARAMETER** first_name,last_name,shipping_address,cart_id
**SCOPE** add product in cart to order

- **POST** /checkout/payment
**PARAMETER** number,month,year,verification_value,order_id,currency_code
**SCOPE** online payment


FOR ADMIN CRUD ORDERS
---------------------

- **GET** /api/v1/orders
**PARAMETER** null
**SCOPE** - Get the list of orders

- **POST** /api/v1/orders
**PARAMETER** first_name,last_name,shipping_address,order_total,paid_at,payment_status
**SCOPE** create order by admin

- **DELETE** /api/v1/remove_orders
**PARAMETER** id
**SCOPE** removed order by admin

- **PUT** /api/v1/update_order
**PARAMETER** id,first_name,last_name,shipping_address,order_total,paid_at,payment_status
**SCOPE** update order information by admin

--------------------------------------------------------
under /public folder api_doc.pdf is an **API DOCUMENTATION **
with POST MAN UI.
https://github.com/htoomyatag/SimpleShop/blob/main/public/postman_api.pdf
