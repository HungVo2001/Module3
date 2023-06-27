CREATE TABLE `class` (
  `ClassID` INT NOT NULL AUTO_INCREMENT,
  `ClassName` VARCHAR(60) NOT NULL,
  `StartDate` DATETIME NOT NULL,
  `Status` BIT NULL,
  PRIMARY KEY (`ClassID`)
  );
  
  CREATE TABLE `student` (
  `StudentID` INT NOT NULL AUTO_INCREMENT,
  `StudentName` VARCHAR(30) NOT NULL,
  `Address` VARCHAR(50) NULL,
  `Phone` VARCHAR(20) NULL,
  `Status` BIT NULL,
  `ClassID` INT NOT NULL,
  PRIMARY KEY (`StudentID`),
  FOREIGN KEY (ClassID) REFERENCES class (ClassID)
  );
  
  CREATE TABLE `subject` (
  `SubID` INT NOT NULL,
  `SubName` VARCHAR(30) NOT NULL,
  `Credit` TINYINT NOT NULL DEFAULT 1 CHECK(Credit >=1) ,
  `Status` BIT DEFAULT 1,
  PRIMARY KEY (`SubID`)
  );


CREATE TABLE `quanlysinhvien`.`mark` (
  `MarkID` INT NOT NULL AUTO_INCREMENT,
  `SubID` INT NOT NULL,
  `StudentID` INT NOT NULL,
  `Mark` FLOAT NULL DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
  `ExamTimes` TINYINT DEFAULT 1,
  PRIMARY KEY (`MarkID`),
  UNIQUE (SubID, StudentID),
  FOREIGN KEY (SubID) REFERENCES subject (SubID),
  FOREIGN KEY (StudentID) REFERENCES student (StudentID)
  );
  
  