USE furama;

INSERT INTO `position`
VALUES (1, 'Receptionist'),
	   (2, 'Waiter'),
       (3, 'Expert'),
       (4, 'Supervisor'),
       (5, 'Manager'),
       (6, 'Director');
       
INSERT INTO customer_type
VALUES (1, 'Diamond'),
	   (2, 'Platinum'),
       (3, 'Gold'),
       (4, 'Silver'),
       (5, 'Member');
       
INSERT INTO customer_type
VALUES (6, 'Wood');

INSERT INTO education_degree
VALUES (1, 'Intermediate'),
       (2, 'College'),
       (3, 'University'),
       (4, 'After university');
       
INSERT INTO division
VALUES (1, 'Sale marketing'),
       (2, 'Administration'),
       (3, 'Serving'),
       (4, 'Manager');

INSERT INTO username
VALUES ('benzemano1', 'realno1'),
       ('marcelopro', 'realno2'),
       ('dejongcute', 'barcano1');
       
INSERT INTO employee
VALUES (1, 'Kazim Benzema', '1993-01-01', '1945312334', 5000 ,'09413232287', 'benzama@gmail.com', 'Quang Binh', 1, 2, 3, 'benzemano1'),
       (2, 'Marcelo', '1992-05-01', '1945312168', 4000 ,'094132323121', 'marcelo@gmail.com', 'Quang Tri', 2, 2, 4, 'marcelopro'),
       (3, 'Dejong', '1998-10-01', '1945311687', 4500 ,'094132312312', 'dejong@gmail.com', 'Hue', 3, 1, 2, 'dejongcute');

INSERT INTO customer
VALUES ('KH-1234', 1, 'Khanh Tran', '1995-01-01', 0, '194531021', '09413232131', 'khanh@gmail.com', 'Quang Binh'),
       ('KH-1235', 2, 'Nguyen Lien', '1983-07-01', 1, '194531313', '09265646814', 'lien@gmail.com', 'Da Lat'),
       ('KH-1236', 4, 'Kha Nguyen', '1994-08-14', 0, '194531313', '09413234321', 'kha@gmail.com', 'Quang Ngai'),
       ('KH-1237', 3, 'Ha Vu', '1995-05-16', 0, '1945312342', '09413224141', 'vuha@gmail.com', 'Bac Lieu'),
       ('KH-1238', 1, 'Khanh Nguyen', '1995-05-05', 0, '194534314', '09413235423', 'khanhnguyen@gmail.com', 'Hue');
       

INSERT INTO service_type
VALUES (1, 'Luxury'),
       (2, 'International'),
       (3, 'Class'),
       (4, '5 stars');
       
INSERT INTO rent_type
VALUES (1, 'Anually', 5000),
       (2, 'Monthly', 500),
       (3, 'Daily', 100),
       (4, 'Hourly', 10);
       
INSERT INTO service
VALUES ('DV-1234','Villa', 80, 1000, 7, 1, 1, 'President', 'Free Kara', 40, 5),
       ('DV-1235', 'House', 100, 1500, 10, 2, 2, 'Super Star', 'Free Breakfirst', 50, 10),
       ('DV-1236', 'Room', 40, 50, 2, 3, 3, 'Vip', 'Free Bus', 0, 0);

INSERT INTO attach_service
VALUES (1, 'Free Beverage', 5, 2, 'Available'),
       (2, 'Free Bike Rent', 10, 2, 'Available');
       
INSERT INTO contract_detail(contract_id, attach_service_id, quantity)
VALUES (11, 2, 2);

       