
CREATE DATABASE TASK14
USE TASK14

CREATE TABLE Groups
(
ID INT PRIMARY KEY IDENTITY ,
Name NVARCHAR (100),

)

CREATE TABLE Students
(
ID INT PRIMARY KEY IDENTITY ,
Name NVARCHAR (100),
Surname  NVARCHAR (100),
GroupID INT FOREIGN KEY REFERENCES Groups(ID),
[Grant] INT ,
ISDELETED BIT
)

INSERT INTO Groups VALUES 
('BB201'),
('BB23'),
('BB206')


INSERT INTO Students VALUES 
('Mehemmed','Memmedov',1,150,0),
('Kamil','Memmedov',2,250,0),
('Arzu','Memmedov',3,350,0),
('sahil','Memmedov',1,450,0),
('vakil','Memmedov',2,550,0),
('tekir','Memmedov',3,650,0)


CREATE TRIGGER TTRG
ON Students
INSTEAD OF DELETE
AS
SELECT * FROM Students
INNER JOIN deleted
ON Students.ID = deleted.ID
UPDATE  Students
SET ISDELETED = 1
WHERE Students.ID IN (SELECT ID FROM deleted)



DELETE FROM Students 
WHERE ID =1

SELECT *FROM Students



CREATE DATABASE QUIZ
USE QUIZ



CREATE TABLE Catagories
(
ID INT PRIMARY KEY IDENTITY ,
Name NVARCHAR (100) NOT NULL UNIQUE

)

CREATE TABLE Tags
(
ID INT PRIMARY KEY IDENTITY ,
Name NVARCHAR (100) NOT NULL UNIQUE
)

CREATE TABLE Users
(
ID INT PRIMARY KEY IDENTITY ,
Username NVARCHAR (100) NOT NULL UNIQUE,
Fullname NVARCHAR (100) NOT NULL ,
Age INT CHECK (Age>0 AND Age<150)


)

CREATE TABLE Comments
(
ID INT PRIMARY KEY IDENTITY ,
Content NVARCHAR (250) NOT NULL ,
UserId INT FOREIGN KEY REFERENCES Users(ID),
BlogId INT FOREIGN KEY REFERENCES Blogs(ID)

)

CREATE TABLE Blogs
(
ID INT PRIMARY KEY IDENTITY ,
Title NVARCHAR (50) NOT NULL, 
[Description] NVARCHAR (200) NOT NULL,
UserId INT FOREIGN KEY REFERENCES Users(ID),
CatId INT FOREIGN KEY REFERENCES Catagories(ID)
)

CREATE TABLE TagBlog
(
ID INT PRIMARY KEY IDENTITY ,
BlogId INT FOREIGN KEY REFERENCES Blogs(ID),
TagId INT FOREIGN KEY REFERENCES Tags(ID) 
)

CREATE VIEW BLOG_AND_USER AS
SELECT b.Title,u.Username , u.Fullname FROM Blogs AS b
JOIN Users as u
on b.ID = u.ID

SELECT * FROM BLOG_AND_USER

CREATE VIEW BLOG_AND_CATAGORIES AS
SELECT b.Title, c.Name FROM Blogs AS b
JOIN Catagories as c
on b.ID = c.ID

SELECT * FROM BLOG_AND_CATAGORIES


CREATE PROCEDURE USP_USER_COMMENT @userID INT
AS
SELECT * FROM Comments
WHERE userID = @userID

EXEC USP_USER_COMMENT 1


CREATE PROCEDURE USP_USER_BLOG @userID INT
AS
SELECT * FROM Blogs
WHERE userID = @userID



CREATE DATABASE QUIZ1
USE QUIZ1


CREATE TABLE Catagories
(
ID INT PRIMARY KEY IDENTITY ,
Name NVARCHAR (100) NOT NULL UNIQUE

)

CREATE TABLE Tags
(
ID INT PRIMARY KEY IDENTITY ,
Name NVARCHAR (100) NOT NULL UNIQUE
)

CREATE TABLE Users
(
ID INT PRIMARY KEY IDENTITY ,
Username NVARCHAR (100) NOT NULL UNIQUE,
Fullname NVARCHAR (100) NOT NULL ,
Age INT CHECK (Age>0 AND Age<150)


)

CREATE TABLE Comments
(
ID INT PRIMARY KEY IDENTITY ,
Content NVARCHAR (250) NOT NULL ,
UserId INT FOREIGN KEY REFERENCES Users(ID),
BlogId INT FOREIGN KEY REFERENCES Blogs(ID)

)

CREATE TABLE Blogs
(
ID INT PRIMARY KEY IDENTITY ,
Title NVARCHAR (50) NOT NULL, 
[Description] NVARCHAR (200) NOT NULL,
UserId INT FOREIGN KEY REFERENCES Users(ID),
CatId INT FOREIGN KEY REFERENCES Catagories(ID)
)

CREATE TABLE TagBlog
(
ID INT PRIMARY KEY IDENTITY ,
BlogId INT FOREIGN KEY REFERENCES Blogs(ID),
TagId INT FOREIGN KEY REFERENCES Tags(ID) 
)

CREATE VIEW BLOG_AND_USER AS
SELECT b.Title,u.Username , u.Fullname FROM Blogs AS b
JOIN Users as u
on b.ID = u.ID

SELECT * FROM BLOG_AND_USER

CREATE VIEW BLOG_AND_CATAGORIES AS
SELECT b.Title, c.Name FROM Blogs AS b
JOIN Catagories as c
on b.ID = c.ID

SELECT * FROM BLOG_AND_CATAGORIES


CREATE PROCEDURE USP_USER_COMMENT @userID INT
AS
SELECT * FROM Comments
WHERE userID = @userID

EXEC USP_USER_COMMENT 1


CREATE PROCEDURE USP_USER_BLOG @userID INT
AS
SELECT * FROM Blogs
WHERE userID = @userID


EXEC USP_USER_BLOG 1


CREATE FUNCTION func(@catagoryId INT)
RETURNS INT
AS
BEGIN 
	DECLARE @count INT;
    SELECT @count = COUNT(*)
    FROM Blogs
    WHERE Blogs.CatId = @catagoryId

    RETURN @count;
END 


INSERT INTO Users VALUES 
('Kamil','Memmedov',22),
('Arzu','Memmedov',33),
('sahil','Memmedov',11),
('vakil','Memmedov',22),
('tekir','Memmedov',33)

INSERT INTO Catagories
VALUES 
('design')

INSERT INTO Tags
VALUES 
('qorxu')

INSERT INTO Comments
VALUES 
('heyvan',3,2)

INSERT INTO Blogs
VALUES 
('heyvanlar alemi' ,'heyatda qalma',2,3)
