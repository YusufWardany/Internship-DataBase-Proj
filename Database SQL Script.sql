CREATE DATABASE project2;
USE project2;

-- Create the Person table
CREATE TABLE Person (
    person_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create the Phone_num table
CREATE TABLE Phone_num (
    phone_num VARCHAR(20) NOT NULL,
    person_id INT,
    PRIMARY KEY (phone_num),
    FOREIGN KEY (person_id) REFERENCES Person(person_id)
);

-- Create the Internal_mentor table
CREATE TABLE Internal_mentor (
    office_location VARCHAR(255),
    availability BOOLEAN,
    specification VARCHAR(255),
    person_id INT,
    PRIMARY KEY (person_id),
    FOREIGN KEY (person_id) REFERENCES Person(person_id)
);

-- Create the External_mentor table
CREATE TABLE External_mentor (
    linked_in_profile VARCHAR(255),
    work_email VARCHAR(255),
    position VARCHAR(255),
    person_id INT,
    PRIMARY KEY (person_id),
    FOREIGN KEY (person_id) REFERENCES Person(person_id)
);

-- Create the Internship_coordinator table
CREATE TABLE Internship_coordinator (
    id INT PRIMARY KEY,
    email VARCHAR(255),
    name VARCHAR(255),
    department VARCHAR(255)
);

-- Create the Organization table
CREATE TABLE Organization (
    id INT PRIMARY KEY,
    rating DECIMAL(3, 2),
    industry_type VARCHAR(255),
    location VARCHAR(255),
    name VARCHAR(255),
    internship_coordinator_id INT,
    FOREIGN KEY (internship_coordinator_id) REFERENCES Internship_coordinator(id)
);

-- Create the Internship table
CREATE TABLE Internship (
    id INT PRIMARY KEY,
    company_name VARCHAR(255),
    date_start DATE,
    date_end DATE,
    internship_coordinator_id INT,
    organization_id INT,
    FOREIGN KEY (internship_coordinator_id) REFERENCES Internship_coordinator(id),
    FOREIGN KEY (organization_id) REFERENCES Organization(id)
);

-- Create the Student table
CREATE TABLE Student (
    id INT PRIMARY KEY,
    email VARCHAR(255),
    F_name VARCHAR(255),
    middle_name VARCHAR(255),
    last_name VARCHAR(255),
    grades VARCHAR(255),
    internal_mentor_id INT,
    external_mentor_id INT,
    internship_id INT,
    registration_date DATE,
    FOREIGN KEY (internal_mentor_id) REFERENCES Internal_mentor(person_id),
    FOREIGN KEY (external_mentor_id) REFERENCES External_mentor(person_id),
    FOREIGN KEY (internship_id) REFERENCES Internship(id)
);

-- Create the Report table
CREATE TABLE Report (
    report_id INT PRIMARY KEY,
    report_data TEXT,
    grade VARCHAR(10),
    sid INT,
    internship_id INT,
    FOREIGN KEY (sid) REFERENCES Student(id),
    FOREIGN KEY (internship_id) REFERENCES Internship(id)
);

-- Create the Generate_report table
CREATE TABLE Generate_report (
    report_id INT,
    sid INT,
    internship_id INT,
    PRIMARY KEY (report_id, sid, internship_id),
    FOREIGN KEY (report_id) REFERENCES Report(report_id),
    FOREIGN KEY (sid) REFERENCES Student(id),
    FOREIGN KEY (internship_id) REFERENCES Internship(id)
);
INSERT INTO Person (person_id, name) VALUES
(1, 'hamed mohamed'),
(2, 'mohamed ahmed'),
(3, 'ahmed ali'),
(4, 'safa hazem'),
(5, 'merna ali'),
(6, 'wessaf mohamed'),
(7, 'omar ali'),
(8, 'ahmed farid');

INSERT INTO Phone_num (phone_num, person_id) VALUES
('123-456-7890', 1),
('987-654-3210', 2),
('456-789-1234', 3),
('789-123-4567', 4),
('321-654-9870', 5),
('654-987-1230', 6),
('987-123-6543', 7),
('123-789-4561', 8);

INSERT INTO Internal_mentor (office_location, availability, specification, person_id) VALUES
('Building A, Room 101', TRUE, 'Software Engineering', 1),
('Building B, Room 202', FALSE, 'Data Science', 2),
('Building C, Room 303', TRUE, 'Cybersecurity', 3),
('Building D, Room 404', TRUE, 'Cloud Computing', 4),
('Building E, Room 505', FALSE, 'Machine Learning', 5),
('Building F, Room 606', TRUE, 'AI Research', 6),
('Building G, Room 707', FALSE, 'Networking', 7),
('Building H, Room 808', TRUE, 'DevOps', 8);

INSERT INTO External_mentor (linked_in_profile, work_email, position, person_id) VALUES
('linkedin.com/in/mohammed', 'mohammed@company.com', 'Senior Engineer', 1),
('linkedin.com/in/ali', 'ali@company.com', 'Project Manager', 2),
('linkedin.com/in/ahmed', 'ahmed@company.com', 'Tech Lead', 3),
('linkedin.com/in/hatem', 'hatem@company.com', 'Data Scientist', 4),
('linkedin.com/in/nour', 'nour@company.com', 'Research Analyst', 5),
('linkedin.com/in/bassem', 'bassem@company.com', 'Software Developer', 6),
('linkedin.com/in/alaa', 'alaa@company.com', 'Consultant', 7),
('linkedin.com/in/hatem', 'hatem@company.com', 'Team Lead', 8);

INSERT INTO Internship_coordinator (id, email, name, department) VALUES
(1, 'coordinator1@university.com', 'alaa', 'Computer Science'),
(2, 'coordinator2@university.com', 'ali', 'Engineering'),
(3, 'coordinator3@university.com', 'ahmed', 'Data Analytics'),
(4, 'coordinator4@university.com', 'hatem', 'AI and Robotics'),
(5, 'coordinator5@university.com', 'nour', 'Physics'),
(6, 'coordinator6@university.com', 'ziad', 'Mathematics'),
(7, 'coordinator7@university.com', 'adel shakel', 'Business Administration'),
(8, 'coordinator8@university.com', 'omar', 'Biotechnology');


INSERT INTO Organization (id, rating, industry_type, location, name, internship_coordinator_id) VALUES
(1, 4.5, 'Software', 'alex', 'TechCorp', 1),
(2, 4.0, 'Finance', 'alex', 'FinServe', 2),
(3, 3.8, 'Education', 'cairo', 'EduSmart', 3),
(4, 4.2, 'Healthcare', 'cairo', 'MediCare', 4),
(5, 3.5, 'Retail', 'cairo', 'ShopEase', 5),
(6, 4.8, 'Automotive', 'agami', 'AutoDrive', 6),
(7, 4.1, 'Energy', 'cairo', 'PowerGrid', 7),
(8, 4.3, 'Consulting', 'alex', 'ConsultPro', 8);


INSERT INTO Internship (id, company_name, date_start, date_end, internship_coordinator_id, organization_id) VALUES
(1, 'ITI', '2024-01-01', '2024-06-30', 1, 1),
(2, 'FinServe', '2024-02-01', '2024-07-31', 2, 2),
(3, 'EduSmart', '2024-03-01', '2024-08-31', 3, 3),
(4, 'MediCare', '2024-04-01', '2024-09-30', 4, 4),
(5, 'ShopEase', '2024-05-01', '2024-10-31', 5, 5),
(6, 'AutoDrive', '2024-06-01', '2024-11-30', 6, 6),
(7, 'PowerGrid', '2024-07-01', '2024-12-31', 7, 7),
(8, 'ConsultPro', '2024-08-01', '2025-01-31', 8, 8);

INSERT INTO Student (id, email, F_name, middle_name, last_name, grades, internal_mentor_id, external_mentor_id, internship_id, registration_date) VALUES
(1, 'student1@university.com', 'alaa', 'mohammed', 'ali', 'A', 1, 1, 1, '2023-12-01'),
(2, 'student2@university.com', 'nour', 'mohammed', 'karim', 'B', 2, 2, 2, '2023-12-02'),
(3, 'student3@university.com', 'mazen', 'ahmed', 'nour', 'D', 3, 3, 3, '2023-12-03'),
(4, 'student4@university.com', 'merna', 'ali', 'sawy', 'B+', 4, 4, 4, '2023-12-04'),
(5, 'student5@university.com', 'mohammed', 'ahmed', 'wessaf', 'A-', 5, 5, 5, '2023-12-05'),
(6, 'student6@university.com', 'retag', 'mohammed', 'ziad', 'B', 6, 6, NULL, '2023-12-06'), -- No internship
(7, 'student7@university.com', 'karim', 'mohammed', 'jamil', 'A', 7, 7, 7, '2023-12-07'),
(8, 'student8@university.com', 'rowan', 'mohammed', 'ahmed', 'A+', 8, 8, 1, '2023-12-08'); -- Linked to ITI




INSERT INTO Report (report_id, report_data, grade, sid, internship_id) VALUES
(1, 'Report Data for alaa', 'A+', 1, 1), -- Alaa has grade >= 90
(2, 'Report Data for nour', 'B', 2, 2),
(3, 'Report Data for mazen', 'D', 3, 3), -- Mazen has grade < 50
(4, 'Report Data for merna', 'B+', 4, 4),
(5, 'Report Data for mohammed', 'A-', 5, 5),
(6, 'Report Data for retag', 'B', 6, 6),
(7, 'Report Data for karim', 'A', 7, 7),
(8, 'Report Data for rowan', 'A+', 8, 1); -- Rowan linked to 'ITI'


INSERT INTO Generate_report (report_id, sid, internship_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8);
 
SELECT * FROM Person;

SELECT * FROM Phone_num;

SELECT * FROM Internal_mentor;

SELECT * FROM External_mentor;

SELECT * FROM Internship_coordinator;

SELECT * FROM Organization;

SELECT * FROM Internship;

SELECT * FROM Student;

SELECT * FROM Report;

SELECT * FROM Generate_report;

 -- Q1
SELECT distinct Internship.company_name
FROM Internship
INNER JOIN Report ON Internship.id = Report.internship_id
WHERE Report.grade IN ('A', 'A+');

 -- Q2

SELECT Person.name
FROM Person
INNER JOIN Internal_mentor ON Person.person_id = Internal_mentor.person_id
INNER JOIN Report ON Internal_mentor.person_id = Report.sid
WHERE Report.grade IN ('A', 'A+');


 -- Q3

INSERT INTO Student (id, email, F_name, middle_name, last_name, grades, internal_mentor_id, external_mentor_id, internship_id, registration_date)
VALUES 
(9, 'student9@university.com', 'failing', 'student', 'test', 'F', 1, 2, 3, '2023-12-09');

INSERT INTO Report (report_id, report_data, grade, sid, internship_id)
VALUES 
(9, 'Report Data for failing student', 'F', 9, 3);

SELECT distinct Person.name
FROM Person
INNER JOIN External_mentor ON Person.person_id = External_mentor.person_id
INNER JOIN Student ON External_mentor.person_id = Student.external_mentor_id
INNER JOIN Report ON Student.id = Report.sid
WHERE Report.grade IN ('F');



 -- Q4

SELECT *
FROM Internship
WHERE company_name = 'ITI';


 -- Q5

SELECT COUNT(*)
FROM Internship
INNER JOIN Report ON Internship.id = Report.internship_id
WHERE Internship.company_name = 'ITI' AND not Report.grade IN  ('F');

 -- Q6

SELECT COUNT(*)
FROM Report
WHERE Report.grade IN ('F');

 -- Q7

SELECT F_name, middle_name, last_name
FROM Student
WHERE internship_id IS NULL;


CREATE VIEW StudentView AS
SELECT 
    s.id AS StudentID, 
    CONCAT(s.F_name, ' ', s.middle_name, ' ', s.last_name) AS FullName,
    s.email AS Email,
    s.grades AS Grades,
    i.company_name AS InternshipCompany,
    im.specification AS InternalMentorSpecialization,
    exm.position AS ExternalMentorPosition
FROM 
    Student s
LEFT JOIN Internship i ON s.internship_id = i.id
LEFT JOIN Internal_mentor im ON s.internal_mentor_id = im.person_id
LEFT JOIN External_mentor exm ON s.external_mentor_id = exm.person_id;

select*from StudentView ;



CREATE VIEW CoordinatorView AS
SELECT 
    ic.name AS CoordinatorName,
    o.name AS OrganizationName,
    s.F_name AS StudentFirstName,
    s.last_name AS StudentLastName,
    r.grade AS ReportGrade
FROM 
    Internship_coordinator ic
JOIN Organization o ON ic.id = o.internship_coordinator_id
JOIN Internship i ON i.internship_coordinator_id = ic.id
JOIN Student s ON s.internship_id = i.id
JOIN Report r ON r.sid = s.id;

select*from CoordinatorView;

CREATE VIEW AdminView AS
SELECT 
    s.id AS StudentID,
    CONCAT(s.F_name, ' ', s.middle_name, ' ', s.last_name) AS StudentName,
    s.email AS StudentEmail,
    s.grades AS StudentGrades,
    im.specification AS InternalMentorSpecialization,
    CONCAT(p.name, ' (', e.position, ')') AS ExternalMentorDetails,
    i.company_name AS InternshipCompany,
    i.date_start AS InternshipStartDate,
    i.date_end AS InternshipEndDate,
    o.name AS OrganizationName,
    r.report_id AS ReportID,
    r.grade AS ReportGrade
FROM 
    Student s
LEFT JOIN Internal_mentor im ON s.internal_mentor_id = im.person_id
LEFT JOIN External_mentor e ON s.external_mentor_id = e.person_id
LEFT JOIN Person p ON e.person_id = p.person_id
LEFT JOIN Internship i ON s.internship_id = i.id
LEFT JOIN Organization o ON i.organization_id = o.id
LEFT JOIN Report r ON s.id = r.sid;


select * from AdminView ;



DELIMITER $$

CREATE PROCEDURE CountFailingStudents()
BEGIN
    -- Count the number of students with grade 'F'
    SELECT COUNT(*) AS FailingStudents
    FROM Report
    WHERE grade = 'F';
END$$

DELIMITER ;

CALL CountFailingStudents();




