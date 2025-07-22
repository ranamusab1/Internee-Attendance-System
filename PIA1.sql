USE PIA;

CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    Role VARCHAR(20) NOT NULL, -- 'DepartmentAdmin' or 'Intern'
    Department VARCHAR(50) NOT NULL
);
INSERT INTO Users (Username, Password, Role, Department)
VALUES
('admin_hr', 'admin123', 'DepartmentAdmin', 'HR'),
('intern_john', 'pass123', 'Intern', 'HR'),
('admin_it', 'admin456', 'DepartmentAdmin', 'IT'),
('intern_sara', 'pass456', 'Intern', 'IT');

select *from Users;
-- drop table  Interns ;
CREATE TABLE Interns (
    InternID VARCHAR(10) PRIMARY KEY,
    InternName VARCHAR(100),
    CNIC VARCHAR(15),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    UniversityName VARCHAR(100),
    UniversityRollNumber VARCHAR(50),
    Department VARCHAR(50)
);
select * from Interns;


CREATE TABLE Attendance (
    AttendanceID INT IDENTITY(1,1) PRIMARY KEY,
    InternID vARCHAR(10) NOT NULL,
    Date DATE NOT NULL,
    Status NVARCHAR(20) NOT NULL,
    CONSTRAINT FK_Attendance_Interns FOREIGN KEY (InternID) REFERENCES Interns(InternID)
);
 SELECT 
    A.AttendanceID,
    A.InternID,
    I.InternName,
    I.CNIC,
    A.Date,
    A.Status
FROM 
    Attendance A
INNER JOIN 
    Interns I ON A.InternID = I.InternID;


SELECT * FROM Attendance;

