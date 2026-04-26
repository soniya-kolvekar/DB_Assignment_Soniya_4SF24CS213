CREATE TABLE Users (
        user_id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
                email TEXT UNIQUE,
                    phone TEXT,
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                        );

                        CREATE TABLE Categories (
                            category_id INTEGER PRIMARY KEY AUTOINCREMENT,
                                category_name TEXT
                                );

                                CREATE TABLE Products (
                                    product_id INTEGER PRIMARY KEY AUTOINCREMENT,
                                        name TEXT,
                                            price REAL,
                                                stock INTEGER,
                                                    category_id INTEGER,
                                                        FOREIGN KEY (category_id) REFERENCES Categories(category_id)
                                                        );

                                                        CREATE TABLE Orders (
                                                            order_id INTEGER PRIMARY KEY AUTOINCREMENT,
                                                                user_id INTEGER,
                                                                    order_date DATE,
                                                                        total_amount REAL,
                                                                            FOREIGN KEY (user_id) REFERENCES Users(user_id)
                                                                            );

                                                                            CREATE TABLE Order_Items (
                                                                                order_id INTEGER,
                                                                                    product_id INTEGER,
                                                                                        quantity INTEGER,
                                                                                            price REAL,
                                                                                                PRIMARY KEY (order_id, product_id),
                                                                                                    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
                                                                                                        FOREIGN KEY (product_id) REFERENCES Products(product_id)
                                                                                                        );

                                                                                                        CREATE TABLE Cart (
                                                                                                            cart_id INTEGER PRIMARY KEY AUTOINCREMENT,
                                                                                                                user_id INTEGER,
                                                                                                                    FOREIGN KEY (user_id) REFERENCES Users(user_id)
                                                                                                                    );

                                                                                                                    CREATE TABLE Cart_Items (
                                                                                                                        cart_id INTEGER,
                                                                                                                            product_id INTEGER,
                                                                                                                                quantity INTEGER,
                                                                                                                                    PRIMARY KEY (cart_id, product_id),
                                                                                                                                        FOREIGN KEY (cart_id) REFERENCES Cart(cart_id),
                                                                                                                                            FOREIGN KEY (product_id) REFERENCES Products(product_id)
                                                                                                                                            );

                                                                                                                                            CREATE TABLE Reviews (
                                                                                                                                                review_id INTEGER PRIMARY KEY AUTOINCREMENT,
                                                                                                                                                    user_id INTEGER,
                                                                                                                                                        product_id INTEGER,
                                                                                                                                                            rating INTEGER,
                                                                                                                                                                comment TEXT,
                                                                                                                                                                    FOREIGN KEY (user_id) REFERENCES Users(user_id),
                                                                                                                                                                        FOREIGN KEY (product_id) REFERENCES Products(product_id)
                                                                                                                                                                        );

                                                                                                                                                     INSERT INTO Users (name,email,phone) VALUES
                                                                                                                                                     ('Soniya','soniya@gmail.com','9000000001'),
                                                                                                                                                     ('Rahul','rahul@gmail.com','9000000002'),
                                                                                                                                                     ('Priya','priya@gmail.com','9000000003'),
                                                                                                                                                     ('Amit','amit@gmail.com','9000000004'),
                                                                                                                                                     ('Neha','neha@gmail.com','9000000005'),
                                                                                                                                                     ('Kiran','kiran@gmail.com','9000000006'),
                                                                                                                                                     ('Ravi','ravi@gmail.com','9000000007'),
                                                                                                                                                     ('Pooja','pooja@gmail.com','9000000008'),
                                                                                                                                                     ('Arjun','arjun@gmail.com','9000000009'),
                                                                                                                                                     ('Meena','meena@gmail.com','9000000010');

                                                                                                                                                     INSERT INTO Categories (category_name) VALUES
                                                                                                                                                     ('Electronics'),('Clothing'),('Books'),
                                                                                                                                                     ('Home'),('Sports'),('Beauty'),('Stationery');

                                                                                                                                                     INSERT INTO Products (name,price,stock,category_id) VALUES
                                                                                                                                                     ('Laptop',55000,10,1),('Headphones',2000,50,1),
                                                                                                                                                     ('T-Shirt',500,100,2),('Novel Book',300,40,3),
                                                                                                                                                     ('Chair',1500,20,4),('Football',800,30,5),
                                                                                                                                                     ('Smartphone',20000,25,1),('Jeans',1200,60,2),
                                                                                                                                                     ('Cookware',2500,15,4),('Cricket Bat',1800,35,5);

                                                                                                                                                     INSERT INTO Orders (user_id,order_date,total_amount) VALUES
                                                                                                                                                     (1,'2025-04-01',57000),(2,'2025-04-02',2000),
                                                                                                                                                     (3,'2025-04-03',500),(4,'2025-04-04',300),
                                                                                                                                                     (5,'2025-04-05',1500),(6,'2025-04-06',800),
                                                                                                                                                     (7,'2025-04-07',20000),(8,'2025-04-08',1200),
                                                                                                                                                     (9,'2025-04-09',2500),(10,'2025-04-10',1800);

                                                                                                                                                     INSERT INTO Order_Items VALUES
                                                                                                                                                     (1,1,1,55000),(1,2,1,2000),(2,2,1,2000),
                                                                                                                                                     (3,3,1,500),(4,4,1,300),(5,5,1,1500),
                                                                                                                                                     (6,6,1,800),(7,7,1,20000),(8,8,1,1200),
                                                                                                                                                     (9,9,1,2500);

                                                                                                                                                     INSERT INTO Cart (user_id) VALUES
                                                                                                                                                     (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);

                                                                                                                                                     INSERT INTO Cart_Items VALUES
                                                                                                                                                     (1,3,2),(2,1,1),(3,5,1),(4,2,2),(5,4,1),
                                                                                                                                                     (6,6,3),(7,7,1),(8,8,2),(9,9,1),(10,10,1);

                                                                                                                                                     INSERT INTO Reviews (user_id,product_id,rating,comment) VALUES
                                                                                                                                                     (1,1,5,'Excellent'),(2,2,4,'Good'),
                                                                                                                                                     (3,3,3,'Average'),(4,4,5,'Nice'),
                                                                                                                                                     (5,5,4,'Worth'),(6,6,3,'Ok'),
                                                                                                                                                     (7,7,5,'Great'),(8,8,4,'Good'),
                                                                                                                                                     (9,9,5,'Useful'),(10,10,4,'Nice');



SELECT name, price
FROM Products;

SELECT name, price
FROM Products
WHERE price > 1000;

SELECT Products.name, Categories.category_name
FROM Products
JOIN Categories ON Products.category_id = Categories.category_id;

SELECT Users.name, Orders.order_id
FROM Users
JOIN Orders ON Users.user_id = Orders.user_id;

SELECT Orders.order_id, Products.name
FROM Order_Items
JOIN Orders ON Order_Items.order_id = Orders.order_id
JOIN Products ON Order_Items.product_id = Products.product_id;

SELECT Products.name, Reviews.rating
FROM Reviews
JOIN Products ON Reviews.product_id = Products.product_id;

SELECT Users.name, Products.name
FROM Cart
JOIN Users ON Cart.user_id = Users.user_id
JOIN Cart_Items ON Cart.cart_id = Cart_Items.cart_id
JOIN Products ON Cart_Items.product_id = Products.product_id;

SELECT COUNT(order_id)
FROM Orders;
