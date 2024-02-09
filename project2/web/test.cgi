#!/usr/bin/python3
import cgi
import psycopg2
import psycopg2.extras

## SGBD configs
DB_HOST = "db.tecnico.ulisboa.pt"
DB_USER = "ist1103449"
DB_DATABASE = DB_USER
DB_PASSWORD = "idmc3787"
DB_CONNECTION_STRING = "host=%s dbname=%s user=%s password=%s" % (DB_HOST, DB_DATABASE, DB_USER, DB_PASSWORD)

#!/usr/bin/python3
print("Content-type: text/html\n\n")
print('''<!DOCTYPE html>
<html>
<head>
    <title>Newton DataBase</title>
    <style>
        body {
            background-color: rgb(246, 201, 157);
            font-family: Helvetica, Arial, sans-serif;
            text-align: center;
        }

        h1 {
            font-size: 36px;
            font-weight: bold;
        }

        .title-image {
            display: block;
            margin: 0 auto;
            width: 100px;
            padding-top: 20px;
        }

        form {
            margin-top: 40px;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"],
        textarea {
            width: 300px;
            padding: 5px;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }

        .error {
            color: red;
            margin-bottom: 10px;
        }
        <link rel="icon" type="image/x-icon" href="icon.ico">
    </style>
</head>
<body>
    <div>
        <img class="title-image" src="icon.ico" alt="Icon">
        <h1>Newton DataBase</h1>
    </div>

    <h2>Register Product</h2>
    <form action="test.cgi" method="POST">
        <input type='hidden' name='action' value='new_product'>
        
        <label for="sku">SKU:</label>
        <input type="text" id="sku" name="sku" required>
        <br>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <br>
        <label for="description">Description:</label>
        <textarea id="description" name="description" rows="4" required></textarea>
        <br>
        <label for="price">Price:</label>
        <input type="text" id="price" name="price" required>
        <br>
        <label for="ean">EAN:</label>
        <input type="text" id="ean" name="ean">
        <br>
        <input type="submit" value="Register Product">
    </form>
    
    <h2>Register Customer</h2>
    <form action="test.cgi" method="POST">
        <input type='hidden' name='action' value='new_customer'>
        
        <label for="cust_no">Cust_no:</label>
        <input type="text" id="cust_no" name="cust_no" required>
        <br>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <br>
        <label for="email">Email:</label>
        <textarea id="email" name="email" rows="4" required></textarea>
        <br>
        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" required>
        <br>
        <label for="address">Address:</label>
        <textarea id="address" name="address" rows="4" required></textarea>
        <br>
        <input type="submit" value="Register Customer">
    </form>
    
    <h2>Register Supplier</h2>
    <form action="test.cgi" method="POST">
        <input type='hidden' name='action' value='new_supplier'>

        <label for="tin">TIN:</label>
        <input type="text" id="tin" name="tin" required>
        <br>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <br>
        <label for="address">Address:</label>
        <textarea id="address" name="address" rows="4" required></textarea>
        <br>
        <label for="sku">SKU:</label>
        <input type="text" id="sku" name="sku" required>
        <br>
        <label for="date">Date:</label>
        <input type="date" id="date" name="date" required>
        <br>
        <input type="submit" value="Register Supplier">
    </form>
    
    <h2>Remove Customer</h2>
    <form action="test.cgi" method="POST">
        <input type='hidden' name='action' value='customer_to_remove'>
        
        <label for="cust_no">Cust_no:</label>
        <input type="text" id="cust_no" name="cust_no" required>
        <br>
        <input type="submit" value="Remove">
    </form>

    <h2>Remove Product</h2>
    <form action="test.cgi" method="POST">
        <input type='hidden' name='action' value='product_to_remove'>
        
        <label for="sku">SKU:</label>
        <input type="text" id="sku" name="sku" required>
        <br>
        <input type="submit" value="Remove">
    </form>
    
    <h2>Remove Supplier</h2>
    <form action="test.cgi" method="POST">
        <input type='hidden' name='action' value='supplier_to_remove'>

        <label for="tin">TIN:</label>
        <input type="text" id="tin" name="tin" required>
        <br>
        <input type="submit" value="Remove">
    </form>

    <h2>Place Order</h2>
    <form action="test.cgi" method="POST">
        <input type='hidden' name='action' value='new_contains'>
        
        <label for="cust_no">Cust_no:</label>
        <input type="text" id="cust_no" name="cust_no" required>
        <br>
        <label for="sku">SKU:</label>
        <input type="text" id="sku" name="sku" required>
        <br>
        <label for="qty">Quantity:</label>
        <input type="number" id="qty" name="qty" required>
        <br>
        <input type="submit" value="Place Order">
    </form>

    <h2>Simulate Payment</h2>
    <form action="test.cgi" method="POST">
        <input type='hidden' name='action' value='order_to_remove'>
        
        <label for="order_no">order_no:</label>
        <input type="text" id="order_no" name="order_no" required>
        <br>
        <input type="submit" value="Remove">
    </form>

    <h2>Update Description of Product</h2>
    <form action="test.cgi" method="POST">
        <input type='hidden' name='action' value='product_updated'>
        <label for="sku">SKU:</label>
        <input type="text" id="sku" name="sku" required>
        <br>
        <label for="description">Description:</label>
        <textarea id="description" name="description" rows="4" required></textarea>
        <br>
        <input type="submit" value="Update">
    </form>

    <h2>Update Price of Product</h2>
    <form action="test.cgi" method="POST">
        <input type='hidden' name='action' value='product_price_updated'> 
        <label for="sku">SKU:</label>
        <input type="text" id="sku" name="sku" required>
        <br>
        <label for="price">Price:</label>
        <input type="text" id="price" name="price" required>
        <br>
        <input type="submit" value="Update">
    </form>

    <h2>Update Product</h2>
    <form action="test.cgi" method="POST">
        <input type='hidden' name='action' value='product_updated'>
        <label for="sku">SKU:</label>
        <input type="text" id="sku" name="sku" required>
        <br>
        <label for="description">Description:</label>
        <textarea id="description" name="description" rows="4" required></textarea>
        <br>
        <label for="price">Price:</label>
        <input type="text" id="price" name="price" required>
        <br>
        <input type="submit" value="Update">
    </form>

    <h2> End - Newton DataBase </h2>
</body>
</html>
''')

# Retrieve form data
form = cgi.FieldStorage()
action = form.getvalue('action')

if action == 'new_product':
    product_sku = form.getvalue('sku')
    product_name = form.getvalue('name')
    product_description = form.getvalue('description')
    product_price = form.getvalue('price')
    product_ean = form.getvalue('ean')

    try:
        # Establish database connection
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)

        # Insert New product
        cursor.execute("INSERT INTO product (sku, name, description, price, ean) VALUES (%s, %s, %s, %s, %s)",
                       (product_sku, product_name, product_description, product_price, product_ean))
        dbConn.commit()
        print("<h3>Product Registered Successfully!</h3>")

    # Error has occurred
    except psycopg2.Error as error:
        dbConn.rollback()
        print("<h3>Error registering product. Please try again.</h3>")

    # Close the database connection
    dbConn.close()

elif action == 'new_customer':
    customer_cust_no = form.getvalue('cust_no')
    customer_name = form.getvalue('name')
    customer_email = form.getvalue('email')
    customer_phone = form.getvalue('phone')
    customer_address = form.getvalue('address')

    try:
        # Establish database connection
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        # Insert New customer
        cursor.execute("INSERT INTO customer (cust_no, name, email, phone, address) VALUES (%s, %s, %s, %s, %s)",
                       (customer_cust_no, customer_name, customer_email, customer_phone, customer_address))
        dbConn.commit()
        print("<h3>Customer Registered Successfully!</h3>")

    # Error has occurred
    except psycopg2.Error as error:
        dbConn.rollback()
        print("<h3>Error registering customer. Please try again.</h3>")

    # Close the database connection
    dbConn.close()

elif action == 'new_supplier':
    supplier_tin = form.getvalue('tin')
    supplier_name = form.getvalue('name')
    supplier_address = form.getvalue('address')
    supplier_sku = form.getvalue('sku')
    supplier_date = form.getvalue('date')

    try:
        # Establish database connection
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)

        # Insert New Supplier
        cursor.execute("INSERT INTO supplier (tin, name, address, sku, date) VALUES (%s, %s, %s, %s, %s)",
                       (supplier_tin, supplier_name, supplier_address, supplier_sku, supplier_date))
        dbConn.commit()
        print("<h3>Supplier Registered Successfully!</h3>")

    # Error has occurred
    except psycopg2.Error as error:
        dbConn.rollback()
        print("<h3>Error registering supplier. Please try again.</h3>")

    # Close the database connection
    dbConn.close()

elif action == 'customer_to_remove':
    customer_cust_no = form.getvalue('cust_no')

    try:
        # Establish database connection
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)

        # Remove the customer
        cursor.execute("DELETE FROM customer WHERE cust_no = %s", (customer_cust_no,))
        dbConn.commit()
        print("<h3>Customer Removed Successfully!</h3>")

    # Error has occurred
    except psycopg2.Error as error:
        dbConn.rollback()
        print("<h3>Error removing customer. Please try again.</h3>")

    # Close the database connection
    dbConn.close()

elif action == 'product_to_remove':
    product_sku = form.getvalue('sku')

    try:
        # Establish database connection
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)

        # Remove the product
        cursor.execute("DELETE FROM product WHERE sku = %s", (product_sku,))
        cursor.execute("DELETE FROM supplier WHERE SKU = %s", (product_sku,))
        cursor.execute("DELETE FROM orders WHERE order_no IN (SELECT order_no FROM contains WHERE SKU = %s)", (product_sku,))
        cursor.execute("DELETE FROM contains WHERE SKU = %s", (product_sku,))
        dbConn.commit()
        print("<h1>Product Deleted Successfully!</h1>")

    # Error has occurred
    except psycopg2.Error as error:
        dbConn.rollback()

    # Close the database connection
    dbConn.close()

elif action == 'supplier_to_remove':
    supplier_tin = form.getvalue('tin')

    try:
        # Establish database connection
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)

        # Remove Supplier
        cursor.execute("DELETE FROM supplier WHERE tin = %s",(supplier_tin,))
        dbConn.commit()
        print("<h1>Supplier Removed Successfully!</h1>")

    # Error has occurred
    except psycopg2.Error as error:
        dbConn.rollback()

    # Close the database connection
    dbConn.close()

elif action == 'new_contains':
    contains_cust_no = form.getvalue('cust_no')
    contains_sku = form.getvalue('sku')
    contains_qty = form.getvalue('qty')
    current_date = '2023-06-21'

    # Generate order_no by incrementing the maximum existing order_no by 1
    try:
        # Establish database connection
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)

        # Get the maximum order_no
        cursor.execute("SELECT MAX(order_no) FROM orders")
        max_order_no = cursor.fetchone()[0]

        if max_order_no is None:
            order_no = 1
        else:
            order_no = max_order_no + 1

        # Insert new order
        cursor.execute("INSERT INTO orders (order_no, cust_no, date) VALUES (%s, %s, %s)",
                    (order_no, contains_cust_no, current_date))

        # Insert new contains in the contains table
        cursor.execute("INSERT INTO contains (order_no, SKU, qty) VALUES (%s, %s, %s)",
                    (order_no, contains_sku, contains_qty))

        dbConn.commit()
        print("<h1>Order Placed Successfully!</h1>")

    # Error has occurred
    except psycopg2.Error as error:
        dbConn.rollback()

    # Close the database connection
    dbConn.close()

elif action == 'order_to_remove':
    order_order_no = form.getvalue('order_no')

    try:
        # Establish database connection
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)

        # Remove the order
        cursor.execute("DELETE FROM contains WHERE order_no = %s", (order_order_no,))
        cursor.execute("DELETE FROM orders WHERE order_no = %s", (order_order_no,))
        dbConn.commit()
        print("<h1>Payment Successfully Made!</h1>")

    # Error has occurred
    except psycopg2.Error as error:
        dbConn.rollback()

    # Close the database connection
    dbConn.close()

elif action == 'product_updated':
    product_sku = form.getvalue('sku')
    product_description = form.getvalue('description')

    try:
        # Establish database connection
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)

        # Update the product
        cursor.execute("UPDATE product SET description = %s WHERE sku = %s", 
        (product_description, product_sku))
        dbConn.commit()
        print("<h1>Product Updated Successfully!</h1>")

    # Error has occurred
    except psycopg2.Error as error:
        dbConn.rollback()

    # Close the database connection
    dbConn.close()

elif action == 'product_price_updated':
    product_sku = form.getvalue('sku')
    product_price = form.getvalue('price')

    try:
        # Establish database connection
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)

        # Update the price of the product
        cursor.execute("UPDATE product SET price = %s WHERE sku = %s", 
        (product_price, product_sku))
        dbConn.commit()
        print("<h1>Product Updated Successfully!</h1>")

    # Error has occurred
    except psycopg2.Error as error:
        dbConn.rollback()

    # Close the database connection
    dbConn.close()

elif action == 'product_updated':
    product_sku = form.getvalue('sku')
    product_description = form.getvalue('description')
    product_price = form.getvalue('price')

    try:
        # Establish database connection
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)

        # Update the product
        cursor.execute("UPDATE product SET description = %s, price = %s WHERE sku = %s", 
        (product_description, product_price, product_sku))
        dbConn.commit()
        print("<h1>Product Updated Successfully!</h1>")

    # Error has occurred
    except psycopg2.Error as error:
        dbConn.rollback()

    # Close the database connection
    dbConn.close()
