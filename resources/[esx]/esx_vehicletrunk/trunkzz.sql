CREATE TABLE `vehicle_trunks` (

  `plate` varchar(255) NOT NULL,

  `content` varchar(255) NOT NULL,

  `junk` bit DEFAULT 1,

  PRIMARY KEY (`plate`)

);