-- This file is to bootstrap a database for the CS3200 project. 

-- Create a new database.  You can change the name later.  You'll
-- need this name in the FLASK API file(s),  the AppSmith 
-- data source creation.
create database yLibrary_db;

-- Via the Docker Compose file, a special user called webapp will 
-- be created in MySQL. We are going to grant that user 
-- all privilages to the new database we just created. 
-- If you changed the name of the database above, you need
-- to change it here too.
grant all privileges on yLibrary_db.* to 'webapp'@'%';
flush privileges;

-- Move into the database we just created.
-- If you changed the name of the database above, you need to
-- change it here too. 
use yLibrary_db;

-- Put your DDL
DROP TABLE IF EXISTS operator;
CREATE TABLE operator
(
    op_id   VARCHAR(10) PRIMARY KEY,
    op_name VARCHAR(10)
);

INSERT INTO operator
    (op_id, op_name)
VALUES ('1', 'jklaus0'),
       ('2', 'jrobker1'),
       ('3', 'yforgie2'),
       ('4', 'smaunder3'),
       ('5', 'jrostron4'),
       ('6', 'audrey6');

DROP TABLE IF EXISTS file_info;
CREATE TABLE file_info
(
    isbn         VARCHAR(17) PRIMARY KEY,
    first_name   VARCHAR(10) NOT NULL,
    last_name    VARCHAR(10) NOT NULL,
    title        VARCHAR(50) NOT NULL,
    lang         VARCHAR(15),
    image        VARCHAR(10000),
    descriptions VARCHAR(500),
    text_type    BOOL        NOT NULL, -- is it a book? false(0) = article, true(1) = book
    op_id        VARCHAR(10) NOT NULL,
    CONSTRAINT fk_1
        FOREIGN KEY (op_id) REFERENCES operator (op_id)
);

INSERT INTO file_info
(isbn, first_name, last_name, title, lang, descriptions, text_type, op_id)
VALUES ('754913225-9', 'Tallulah', 'Pimlock', 'No Time for Love', 'Aymara',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', false, 1),
       ('494148641-2', 'Ravid', 'Shallo', 'Find Me Guilty', 'Nepali', 'Vestibulum rutrum rutrum neque.', true,
        2),
       ('576803059-X', 'Ertha', 'Teape', 'Gotti', 'Quechua', 'Nunc purus.', false, 3),
       ('932129418-X', 'Adriena', 'Bony', 'Scusa ma ti chiamo amore', 'Somali',
        'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', false, 1),
       ('953697338-3', 'Catharina', 'Madgett', 'Kid With a Bike, The', 'Catalan',
        'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', false, 2),
       ('169059861-1', 'Rollo', 'Dumingo', 'Deadfall', 'Italian', 'Nulla tempus.', false, 3),
       ('599692065-4', 'Colet', 'Coundley', 'Queen of the Mountains', 'Swedish', 'In eleifend quam a odio.', true,
        1),
       ('137750414-X', 'Yolande', 'Durtnell', 'Drinking Buddies', 'Kashmiri', 'Nullam porttitor lacus at turpis.',
        true, 2),
       ('956019183-7', 'Korrie', 'Coveley', 'City Under Siege', 'West Frisian',
        'Aenean fermentum. Donec ut mauris eget massa tempor convallis.', true, 3),
       ('706533674-3', 'Clevey', 'Camois', 'Hobson''s Choice', 'Kyrgyz',
        'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.',
        true, 1),
       ('876899167-3', 'Ariadne', 'Evans', 'Goodbye, 20th Century', 'Hungarian',
        'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', false, 2),
       ('490722269-6', 'Gaynor', 'Barten', 'Sputnik', 'Somali',
        'Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.',
        false, 3),
       ('845237886-6', 'Orville', 'Hallgath', 'Shepard & Dark', 'Romanian', 'Morbi porttitor lorem id ligula.',
        false, 1),
       ('715097478-3', 'Scottie', 'Brizland', 'book title', 'Guaraní',
        'Donec quis orci eget orci vehicula condimentum.', false, 2),
       ('647779125-0', 'Lenna', 'Gawthrope', 'Lipstick', 'Guaraní',
        'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.',
        false, 3),
       ('120612359-1', 'Ellery', 'Jakoubec', 'Dolls and Angels', 'Northern Sotho', 'Nulla tellus.', true, 1),
       ('319183851-1', 'Ferdinande', 'Benkin', 'Livid (Livide)', 'Telugu', 'Nullam molestie nibh in lectus.',
        true, 2),
       ('893554240-7', 'Vernon', 'Wickenden', '13 Fighting Men', 'Bislama', 'Morbi porttitor lorem id ligula.',
        true, 3),
       ('643054475-3', 'Peadar', 'Lauks', 'Lupin III: Sweet Lost Night', 'Chinese',
        'Cras pellentesque volutpat dui.', false, 1),
       ('865571247-7', 'Kimbell', 'Gaggen', 'Bronson', 'Georgian',
        'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.',
        false, 2);

INSERT INTO file_info
(isbn, first_name, last_name, title, lang, image, descriptions, text_type, op_id)
VALUES ('460769331-6', 'Mark', 'Fontenot', 'How to database', 'English',
        'https://i0.wp.com/learn.onemonth.com/wp-content/uploads/2019/07/image2-1.png?fit=600%2C315&ssl=1',
        'Lets learn about databases! They can be cool.', true, 6),
       ('123145678-9', 'Mark', 'Fonno', 'How to Deesign', 'Spanish',
        'https://w7.pngwing.com/pngs/724/446/png-transparent-design-words-graphic-designer-designers-english-floating-web-design-free-logo-design-template.png',
        'Forget about databases, lets Design APPPPS! So Much more fun!', true, 6);

DROP TABLE IF EXISTS users;
CREATE TABLE users
(
    acct_num     VARCHAR(10) PRIMARY KEY,
    username     VARCHAR(20) NOT NULL,
    email        VARCHAR(30) NOT NULL,
    donation_amt INT         DEFAULT 0,
    join_date    DATE        NOT NULL,
    op_id        VARCHAR(10) DEFAULT 1,
    CONSTRAINT fk_2
        FOREIGN KEY (op_id) REFERENCES operator (op_id)
);

INSERT INTO users
    (acct_num, username, email, donation_amt, join_date, op_id)
VALUES ('16-3420560', 'cdebrett0', 'npesik0@opensource.org', 0, '2022-05-21', 1),
       ('85-8960440', 'wdockray1', 'hgapper1@printfriendly.com', 0, '2022-12-11', 2),
       ('70-2996341', 'hcarlson2', 'gmatveiko2@hatena.ne.jp', 0, '2022-09-01', 3),
       ('95-0952709', 'qabate3', 'amansbridge3@narod.ru', 35, '2022-04-08', 1),
       ('74-1260029', 'ykrollmann4', 'tmcelrath4@pen.io', 425, '2022-02-23', 2),
       ('28-2120272', 'emurfill5', 'cthompson5@hexun.com', 90, '2022-08-30', 3),
       ('75-5298396', 'enare6', 'nworsfold6@si.edu', 2, '2022-03-07', 1),
       ('40-0310308', 'hstaves7', 'tdrohun7@theatlantic.com', 65, '2022-09-06', 2),
       ('89-4608688', 'csqueers8', 'tconningham8@pbs.org', 35, '2022-07-11', 3),
       ('27-2063356', 'zyeiles9', 'rdaborne9@cbsnews.com', 76, '2021-09-03', 1),
       ('00-3866289', 'eloucha', 'aschneidara@moonfruit.com', 56, '2022-05-14', 2),
       ('21-4880786', 'avinnicombeb', 'aiacovuccib@yandex.ru', 43, '2022-08-31', 2),
       ('81-8424900', 'gkasbyec', 'mroggec@amazon.co.jp', 6, '2022-12-31', 1),
       ('17-0890712', 'mdavenhalld', 'ebattyd@istockphoto.com', 2, '2022-08-22', 2),
       ('93-9445225', 'orawoode', 'bbaulche@livejournal.com', 5, '2022-03-19:', 3),
       ('68-3065169', 'xbispof', 'cshirrellf@archive.org', 7, '2021-11-26:', 1),
       ('96-1907557', 'twescottg', 'wwychardg@microsoft.com', 8, '2022-04-04', 2),
       ('30-0597103', 'ishuttleh', 'bsimkovitzh@auda.org.au', 10, '2022-09-30:', 3),
       ('92-2267148', 'wkippingi', 'hniesseni@ca.gov', 15, '2022-07-13:', 1),
       ('98-0333301', 'jhearseyj', 'acathiej@examiner.com', 43, '2022-04-16:', 2);

DROP TABLE IF EXISTS download;
CREATE TABLE download
(
    acct_num  VARCHAR(10),
    isbn      VARCHAR(17),
    date_down DATE,
    Primary Key (acct_num, isbn),
    CONSTRAINT fk_3
        FOREIGN KEY (isbn) REFERENCES file_info (isbn),
    CONSTRAINT fk_4
        FOREIGN KEY (acct_num) REFERENCES users (acct_num)
);

INSERT INTO download
    (acct_num, isbn, date_down)
VALUES ('16-3420560', '865571247-7', '2022-07-31'),
       ('85-8960440', '706533674-3', '2022-10-15'),
       ('70-2996341', '876899167-3', '2022-03-13'),
       ('27-2063356', '599692065-4', '2022-03-19'),
       ('85-8960440', '599692065-4', '2022-05-20'),
       ('70-2996341', '893554240-7', '2022-01-05'),
       ('17-0890712', '706533674-3', '2022-05-05'),
       ('00-3866289', '893554240-7', '2022-02-27'),
       ('93-9445225', '876899167-3', '2022-07-27'),
       ('70-2996341', '754913225-9', '2022-03-02'),
       ('16-3420560', '599692065-4', '2021-12-14'),
       ('85-8960440', '754913225-9', '2022-02-03'),
       ('16-3420560', '706533674-3', '2022-09-03'),
       ('70-2996341', '599692065-4', '2022-03-21'),
       ('85-8960440', '876899167-3', '2022-01-11'),
       ('17-0890712', '576803059-X', '2022-02-12'),
       ('85-8960440', '715097478-3', '2022-03-14'),
       ('27-2063356', '715097478-3', '2022-08-16'),
       ('85-8960440', '576803059-X', '2022-09-06'),
       ('00-3866289', '576803059-X', '2022-09-25');

DROP TABLE IF EXISTS upload_edit;
CREATE TABLE upload_edit
(
    acct_num  VARCHAR(10),
    isbn      VARCHAR(17),
    date_up   DATETIME DEFAULT CURRENT_TIMESTAMP,
    date_edit DATETIME DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,
    Primary Key (acct_num, isbn),
    CONSTRAINT fk_5
        FOREIGN KEY (isbn) REFERENCES file_info (isbn),
    CONSTRAINT fk_6
        FOREIGN KEY (acct_num) REFERENCES users (acct_num)
);

INSERT INTO upload_edit
    (acct_num, isbn, date_up, date_edit)
VALUES ('75-5298396', '754913225-9', '2022-10-12 13:14:22', '2022-10-12 13:14:22'),
       ('75-5298396', '494148641-2', '2022-04-10 12:12:12', '2022-10-12 13:14:22'),
       ('75-5298396', '576803059-X', '2022-10-24 15:30:22', '2022-10-12 13:14:22'),
       ('75-5298396', '932129418-X', '2022-07-08 17:55:56', '2022-10-12 13:14:22'),
       ('75-5298396', '953697338-3', '2021-12-25 15:45:45', '2022-12-25 13:14:22'),
       ('75-5298396', '169059861-1', '2022-09-12 15:45:45', '2022-10-14 13:14:22'),
       ('75-5298396', '599692065-4', '2021-12-01 15:45:45', '2022-10-16 13:14:22'),
       ('75-5298396', '137750414-X', '2022-07-26 15:45:45', '2022-11-12 13:14:22'),
       ('75-5298396', '956019183-7', '2022-06-13 15:45:45', '2022-09-12 13:14:22'),
       ('75-5298396', '706533674-3', '2022-10-13 15:45:45', '2022-10-16 13:14:22'),
       ('75-5298396', '876899167-3', '2021-11-25 15:45:45', '2022-12-25 13:14:22'),
       ('75-5298396', '490722269-6', '2021-11-15 15:45:45', '2022-11-29 13:14:22'),
       ('75-5298396', '845237886-6', '2022-11-01 15:45:45', '2022-12-12 13:14:22'),
       ('75-5298396', '715097478-3', '2022-08-16 15:45:45', '2022-09-12 13:14:22'),
       ('75-5298396', '647779125-0', '2022-09-16 15:45:45', '2022-10-12 13:14:22'),
       ('75-5298396', '120612359-1', '2022-05-14 15:45:45', '2022-10-12 13:14:22'),
       ('75-5298396', '319183851-1', '2021-11-25 15:45:45', '2022-01-12 13:14:22'),
       ('75-5298396', '893554240-7', '2022-04-13 15:45:45', '2022-10-12 13:14:22'),
       ('75-5298396', '643054475-3', '2022-04-04 15:45:45', '2022-10-12 13:14:22'),
       ('75-5298396', '865571247-7', '2022-01-15 15:45:45', '2022-10-12 13:14:22'),
       ('75-5298396', '460769331-6', '2022-04-04 15:45:45', '2022-10-12 13:14:22'),
       ('75-5298396', '123145678-9', '2022-01-15 15:45:45', '2022-10-12 13:14:22');

DROP TABLE IF EXISTS rate;
CREATE TABLE rate
(
    acct_num VARCHAR(10),
    isbn     VARCHAR(17),
    rating   INT,
    Primary Key (acct_num, isbn),
    CONSTRAINT fk_7
        FOREIGN KEY (isbn) REFERENCES file_info (isbn),
    CONSTRAINT fk_8
        FOREIGN KEY (acct_num) REFERENCES users (acct_num)
);

INSERT INTO rate
    (acct_num, isbn, rating)
VALUES ('70-2996341', '865571247-7', 1),
       ('96-1907557', '494148641-2', 2),
       ('40-0310308', '576803059-X', 3),
       ('70-2996341', '706533674-3', 4),
       ('68-3065169', '706533674-3', 5),
       ('40-0310308', '120612359-1', 1),
       ('95-0952709', '956019183-7', 2),
       ('68-3065169', '643054475-3', 3),
       ('70-2996341', '643054475-3', 4),
       ('96-1907557', '956019183-7', 5);

DROP TABLE IF EXISTS file_type;
CREATE TABLE file_type
(
    isbn     VARCHAR(17),
    fileType VARCHAR(10),
    PRIMARY KEY (isbn, fileType),
    CONSTRAINT fk_9
        FOREIGN KEY (isbn) REFERENCES file_info (isbn)
);

INSERT INTO file_type
    (isbn, fileType)
VALUES ('754913225-9', 'epub'),
       ('494148641-2', 'epub'),
       ('576803059-X', 'pdf'),
       ('932129418-X', 'pdf'),
       ('932129418-X', 'epub'),
       ('953697338-3', 'pdf'),
       ('953697338-3', 'epub'),
       ('169059861-1', 'pdf'),
       ('599692065-4', 'epub'),
       ('137750414-X', 'epub'),
       ('137750414-X', 'pdf'),
       ('956019183-7', 'epub'),
       ('956019183-7', 'pdf'),
       ('706533674-3', 'pdf'),
       ('706533674-3', 'epub'),
       ('876899167-3', 'epub'),
       ('876899167-3', 'pdf'),
       ('490722269-6', 'epub'),
       ('490722269-6', 'pdf'),
       ('845237886-6', 'pdf'),
       ('845237886-6', 'epub'),
       ('715097478-3', 'pdf'),
       ('647779125-0', 'epub'),
       ('120612359-1', 'pdf'),
       ('319183851-1', 'pdf'),
       ('893554240-7', 'pdf'),
       ('643054475-3', 'pdf'),
       ('319183851-1', 'epub'),
       ('893554240-7', 'epub'),
       ('643054475-3', 'epub'),
       ('865571247-7', 'pdf');

DROP TABLE IF EXISTS genre;
CREATE TABLE genre
(
    isbn       VARCHAR(17),
    genre_name VARCHAR(15),
    PRIMARY KEY (isbn, genre_name),
    CONSTRAINT fk_10
        FOREIGN KEY (isbn) REFERENCES file_info (isbn)
);


INSERT INTO genre
    (isbn, genre_name)
VALUES ('754913225-9', 'Drama'),
       ('494148641-2', 'Mystery'),
       ('494148641-2', 'Thriller'),
       ('576803059-X', 'Comedy'),
       ('576803059-X', 'Drama'),
       ('932129418-X', 'Drama'),
       ('953697338-3', 'Comedy'),
       ('953697338-3', 'Biography'),
       ('169059861-1', 'Adventure'),
       ('169059861-1', 'Animation'),
       ('169059861-1', 'Children'),
       ('599692065-4', 'Comedy'),
       ('599692065-4', 'Drama'),
       ('599692065-4', 'War'),
       ('137750414-X', 'Drama'),
       ('137750414-X', 'Horror'),
       ('137750414-X', 'Thriller'),
       ('956019183-7', 'Thriller'),
       ('956019183-7', 'Horror'),
       ('706533674-3', 'Drama'),
       ('706533674-3', 'Western'),
       ('876899167-3', 'Horror'),
       ('876899167-3', 'Thriller'),
       ('490722269-6', 'Mystery'),
       ('845237886-6', 'Adventure'),
       ('845237886-6', 'Fantasy'),
       ('715097478-3', 'Thriller'),
       ('647779125-0', 'Drama'),
       ('120612359-1', 'Comedy'),
       ('120612359-1', 'Drama'),
       ('120612359-1', 'Romance'),
       ('319183851-1', 'Action'),
       ('319183851-1', 'Adventure'),
       ('319183851-1', 'Animation'),
       ('319183851-1', 'Children'),
       ('319183851-1', 'Comedy'),
       ('319183851-1', 'Sci-Fi'),
       ('893554240-7', 'Adventure'),
       ('893554240-7', 'Animation'),
       ('893554240-7', 'Children'),
       ('893554240-7', 'Comedy'),
       ('643054475-3', 'Action'),
       ('643054475-3', 'Adventure'),
       ('643054475-3', 'Sci-Fi'),
       ('643054475-3', 'Thriller'),
       ('865571247-7', 'Fantasy'),
       ('865571247-7', 'Mystery'),
       ('865571247-7', 'Sci-Fi'),
       ('865571247-7', 'Thriller'),
       ('460769331-6', 'Educational'),
       ('460769331-6', 'Thriller'),
       ('123145678-9', 'Educational'),
       ('123145678-9', 'Comedy');
