
  CREATE TABLE user(
    id INT PRIMARY KEY, 
    firstName VARCHAR(255), 
    lastName VARCHAR(255), 
    email VARCHAR(255) UNIQUE, 
    cultureID INT, 
    deleted bit, 
    country VARCHAR(255), 
    isRevokeAccess bit, 
    created DATETIME 
  )


  INSERT INTO user values 
  (1, 'Victor', 'Shevchenko', 'vs@ gmail.com', 1033, 1, 'US', 0, '2011-04-05'), 
  (2, 'Oleksandr', 'Petrenko', 'op@ gmail.com', 1034, 0, 'UA', 0, '2014-05-01'), 
  (3, 'Victor', 'Tarasenko', 'vt@gmail.com', 1033, 1, 'US', 1, '2015-07-03'), 
  (4, 'Sergiy', 'Ivanenko', 'sergiy@gmail.com', 1046, 0, 'UA', 1, '2010-02-02'), 
  (5, 'Vitalii', 'Danilchenko', 'shumko@ gmail.com', 1031, 0, 'UA', 1, '2014-05-01'), 
  (6, 'Joe', 'Dou', 'joe@ gmail.com', 1032, 0, 'US', 1, '2009-01-01'), 
  (7, 'Marko', 'Polo', 'marko@gmail.com', 1033, 1, 'UA', 1, '2015-07-03');


  // renamed 'grpup' to 'groups' since group is reserved keyword

  CREATE TABLE groups(
      id INT PRIMARY KEY, 
      name varchar(255), 
      created DATETIME
  );

  INSERT INTO group VALUES
  (10, 'Support', '2010-02-02'), 
  (12, 'Dev team', '2010-02-03'), 
  (13, 'Apps team', '2011-05-06'), 
  (14, 'TEST- dev team', '2013-05-06'), 
  (15, 'Guest', '2014-02-02'), 
  (16, 'TEST-QA-team', '2014-02-02'), 
  (17, 'TEST-team', '2011-01-07');


  CREATE TABLE groupMembership(
      id INT PRIMARY KEY, 
      userID int, 
      groupID int, 
      created DATETIME 
      FOREIGN KEY userId REFERENCES user.id
      FOREIGN KEY groupId REFERENCES group.id
  );

  INSERT INTO groupMembership values
  (110, 2, 10, '2010-02-02'), 
  (112, 3, 15, '2010-02-03'), 
  (114, 1, 10, '2014-02-02'), 
  (115, 1, 17, '2011-05-02'), 
  (117, 4, 12, '2014-07-13'), 
  (120, 5, 15, '2014-06-15');




  1 - SELECT groups.name from groups WHERE name LIKE 'TEST-%';

  2 - SELECT user.firstName, user.lastName from user
  LEFT JOIN groupMembership ON groupMembership.userID == user.id
  LEFT JOIN groups ON groups.id == groupMembership.groupID
  WHERE user.firstName == 'Victor' AND (groups.name NOT LIKE 'Test-%' OR groups.name IS NULL);

  3 - SELECT user.firstName, groups.name from user
  JOIN groupMembership on user.id == groupMembership.userID
  JOIN groups on groupMembership.groupID == groups.id
  where user.created < groups.created;
  