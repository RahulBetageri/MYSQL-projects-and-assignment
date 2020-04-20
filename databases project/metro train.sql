CREATE SCHEMA `metro_train` ;

CREATE TABLE `metro_train`.`route` (
  `id` INT(11) NOT NULL,
  `route_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `metro_train`.`metro_train` (
  `id` INT(11) NOT NULL,
  `route_id` INT(11) NOT NULL,
  `position` INT(11) NOT NULL,
  `updated_time` DATETIME NOT NULL,
  `forward` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `route_id_idx` (`route_id` ASC) VISIBLE,
  CONSTRAINT `route_id`
    FOREIGN KEY (`route_id`) REFERENCES `metro_train`.`route` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);



CREATE TABLE `metro_train`.`station` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `locality` VARCHAR(100) NOT NULL,
  `is_interchange` TINYINT(1) NULL,
  PRIMARY KEY (`id`)
);



CREATE TABLE `metro_train`.`station_route` (
  `id` INT(11) NOT NULL,
  `station_id` INT(11) NOT NULL,
  `route_id` INT(11) NOT NULL,
  `position` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
    FOREIGN KEY (`station_id`)
    REFERENCES `metro_train`.`station` (`id`),
    FOREIGN KEY (`route_id`)
    REFERENCES `metro_train`.`route` (`id`)
    );



CREATE TABLE `metro_train`.`train_schedule` (
  `id` INT(11) NOT NULL,
  `metro_train_id` INT(11) NOT NULL,
  `station_id` INT(11) NOT NULL,
  `schedule_time` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `metro_train_id_idx` (`metro_train_id` ASC) VISIBLE,
  INDEX `station_id_idx` (`station_id` ASC) VISIBLE,
  CONSTRAINT `metro_train_id`
    FOREIGN KEY (`metro_train_id`)
    REFERENCES `metro_train`.`metro_train` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `station_id`
    FOREIGN KEY (`station_id`)
    REFERENCES `metro_train`.`station` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE `metro_train`.`train_arrival_time` (
  `id` INT(11) NOT NULL,
  `metro_train_id` INT(11) NOT NULL,
  `station_id` INT(11) NOT NULL,
  `train_schedule_id` INT(11) NOT NULL,
  `actual_time` DATETIME NOT NULL,
  `deviation` INT(11) NULL,
  PRIMARY KEY (`id`),
  INDEX `station_id_idx` (`station_id` ASC) VISIBLE,
  INDEX `train_schedule_id_idx` (`train_schedule_id` ASC) VISIBLE,
  INDEX `metro_train_id_idx` (`metro_train_id` ASC) VISIBLE,
    FOREIGN KEY (`metro_train_id`)
    REFERENCES `metro_train`.`metro_train` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
     FOREIGN KEY (`station_id`)
    REFERENCES `metro_train`.`station` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`train_schedule_id`)
    REFERENCES `metro_train`.`train_schedule` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);




CREATE TABLE `metro_train`.`travel_card` (
  `id` INT(11) NOT NULL,
  `person_name` VARCHAR(100) NOT NULL,
  `contact_number` VARCHAR(100) NOT NULL,
  `balance` DOUBLE NOT NULL,
  PRIMARY KEY (`id`)
);


CREATE TABLE `metro_train`.`travel_payment` (
  `id` INT(11) NOT NULL,
  `travel_card_id` INT(11) NULL,
  `entry_station_id` INT(11) NULL,
  `entry_time` DATETIME NOT NULL,
  `exit_station_id` INT(11) NULL,
  `exit_time` DATETIME NOT NULL,
  `amount` DOUBLE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `travel_card_id_idx` (`travel_card_id` ASC) VISIBLE,
  INDEX `entry_station_id_idx` (`entry_station_id` ASC) VISIBLE,
  INDEX `exit_station_id_idx` (`exit_station_id` ASC) VISIBLE,
  CONSTRAINT `travel_card_id`
    FOREIGN KEY (`travel_card_id`)
    REFERENCES `metro_train`.`travel_card` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `entry_station_id`
    FOREIGN KEY (`entry_station_id`)
    REFERENCES `metro_train`.`station` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `exit_station_id`
    FOREIGN KEY (`exit_station_id`)
    REFERENCES `metro_train`.`station` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



INSERT INTO `metro_train`.`route` (`id`, `route_name`) VALUES ('1', 'EAST WEST LINE');
INSERT INTO `metro_train`.`route` (`id`, `route_name`) VALUES ('2', 'NORTH SOUTH LINE');
INSERT INTO `metro_train`.`route` (`id`, `route_name`) VALUES ('3', 'NORTH EAST LINE');
INSERT INTO `metro_train`.`route` (`id`, `route_name`) VALUES ('4', 'CIRCLE LINE');
INSERT INTO `metro_train`.`route` (`id`, `route_name`) VALUES ('5', 'DOWNTOWN LINE');
INSERT INTO `metro_train`.`route` (`id`, `route_name`) VALUES ('6', 'DOWNTOWN TOWN');

INSERT INTO `metro_train`.`metro_train` (`id`, `route_id`, `position`, `updated_time`, `forward`) VALUES ('1001', '1', '3', '2017-12-21 09:10:20.0', '1');
INSERT INTO `metro_train`.`metro_train` (`id`, `route_id`, `position`, `updated_time`, `forward`) VALUES ('1002', '2', '5', '2017-12-22 14:50:15.0', '0');
INSERT INTO `metro_train`.`metro_train` (`id`, `route_id`, `position`, `updated_time`, `forward`) VALUES ('1003', '3', '4', '2017-12-21 09:15:15.0', '0');
INSERT INTO `metro_train`.`metro_train` (`id`, `route_id`, `position`, `updated_time`, `forward`) VALUES ('1004', '4', '1', '2017-12-21 09:15:15.0', '1');
INSERT INTO `metro_train`.`metro_train` (`id`, `route_id`, `position`, `updated_time`, `forward`) VALUES ('1005', '5', '5', '2017-12-21 09:15:15.0', '0');
INSERT INTO `metro_train`.`metro_train` (`id`, `route_id`, `position`, `updated_time`, `forward`) VALUES ('1006', '1', '1', '2017-12-23 10:15:25.0', '1');
INSERT INTO `metro_train`.`metro_train` (`id`, `route_id`, `position`, `updated_time`, `forward`) VALUES ('1007', '2', '1', '2017-12-22 09:00:15.0', '1');
INSERT INTO `metro_train`.`metro_train` (`id`, `route_id`, `position`, `updated_time`, `forward`) VALUES ('1008', '3', '1', '2017-12-21 10:15:15.0', '1');
INSERT INTO `metro_train`.`metro_train` (`id`, `route_id`, `position`, `updated_time`, `forward`) VALUES ('1009', '4', '4', '2017-12-21 09:10:15.0', '0');
INSERT INTO `metro_train`.`metro_train` (`id`, `route_id`, `position`, `updated_time`, `forward`) VALUES ('1010', '5', '2', '2017-12-23 22:45:15.0', '0');
INSERT INTO `metro_train`.`metro_train` (`id`, `route_id`, `position`, `updated_time`, `forward`) VALUES ('1011', '6', '2', '2017-12-23 22:45:15.0', '0');


INSERT INTO `metro_train`.`station` (`id`, `name`, `locality`, `is_interchange`) VALUES ('501', 'PASIR RIS MRT STATION', 'PASIRRISDRIVE1,SINGAPORE', '0');
INSERT INTO `metro_train`.`station` (`id`, `name`, `locality`, `is_interchange`) VALUES ('502', 'KEMBANGAN MRT STATION', '55 SIMS AVENUE EAST SINGAPORE 416551', '0');
INSERT INTO `metro_train`.`station` (`id`, `name`, `locality`, `is_interchange`) VALUES ('503', 'KALLANG MRT STATION', '5 SIMS AVENUE SINGAPORE 387405', '0');
INSERT INTO `metro_train`.`station` (`id`, `name`, `locality`, `is_interchange`) VALUES ('504', 'COMMONWEALTH MRT STATION', '375 COMMONWEALTH AVENUE SINGAPORE 149735', '0');
INSERT INTO `metro_train`.`station` (`id`, `name`, `locality`, `is_interchange`) VALUES ('505', 'JOO KOON MRT STATION', '91 JOO KOON CIRCLE,SINGAPORE 629116', '0');
INSERT INTO `metro_train`.`station` (`id`, `name`, `locality`, `is_interchange`) VALUES ('506', 'JURONG EAST MRT STATION', '10 JURONG EAST STREET 12,SINGAPORE 609690', '1');
INSERT INTO `metro_train`.`station` (`id`, `name`, `locality`, `is_interchange`) VALUES ('507', 'WOODLANDS MRT STATION', '30 WOODLANDS AVENUE 2 SINGAPORE 738343', '0');
INSERT INTO `metro_train`.`station` (`id`, `name`, `locality`, `is_interchange`) VALUES ('508', 'YIO CHU KANG MRT STATION', '3000 ANG MO KIO AVENUE 6 SINGAPORE 569813', '0');
INSERT INTO `metro_train`.`station` (`id`, `name`, `locality`, `is_interchange`) VALUES ('509', 'NOVENA MRT STATION', '250 THOMSON ROAD SINGAPORE 307642', '0');
INSERT INTO `metro_train`.`station` (`id`, `name`, `locality`, `is_interchange`) VALUES ('510', 'MARINA BAY MRT STATION', '21 PARK STREET SINGAPORE 018925', '1');
INSERT INTO `metro_train`.`station` (`id`, `name`, `locality`, `is_interchange`) VALUES ('511', 'HARBOURFRONT MRT STATION', '81 TELOK BLANGAH ROAD SINGAPORE 098867', '1');
INSERT INTO `metro_train`.`station` (`id`, `name`, `locality`, `is_interchange`) VALUES ('512', 'CHINATOWN MRT STATION', '151 NEW BRIDGE ROAD SINGAPORE 059443', '1');
INSERT INTO `metro_train`.`station` (`id`, `name`, `locality`, `is_interchange`) VALUES ('513', 'LITTLE INDIA MRT STATION', '60 BUKIT TIMAH ROAD SINGAPORE 229900', '1');
INSERT INTO `metro_train`.`station` (`id`, `name`, `locality`, `is_interchange`) VALUES ('514', 'KOVAN MRT STATION', '900 UPPER SERANGOON ROAD SINGAPORE 534799', '0');
INSERT INTO `metro_train`.`station` (`id`, `name`, `locality`, `is_interchange`) VALUES ('515', 'SENGKANG MRT STATION', '5 SENGKANG SQUARE SINGAPORE 545062', '0');
INSERT INTO `metro_train`.`station` (`id`, `name`, `locality`, `is_interchange`) VALUES ('516', 'PROMENADE MRT STATION', '2 TEMASEK AVENUE SINGAPORE 039193', '1');
INSERT INTO `metro_train`.`station` (`id`, `name`, `locality`, `is_interchange`) VALUES ('517', 'DAKOTA MRT STATION', '201 OLD AIRPORT ROAD SINGAPORE 397973', '0');
INSERT INTO `metro_train`.`station` (`id`, `name`, `locality`, `is_interchange`) VALUES ('518', 'BISHAN MRT STATION', '17 BISHAN PLACE SINGAPORE 579842', '1');
INSERT INTO `metro_train`.`station` (`id`, `name`, `locality`, `is_interchange`) VALUES ('519', 'LABRADOR PARK MRT STATION', '701 TELOK BLANGAH ROAD SINGAPORE 109029', '0');
INSERT INTO `metro_train`.`station` (`id`, `name`, `locality`, `is_interchange`) VALUES ('520', 'BUONA VISTA MRT STATION', '150 NORTH BUONA VISTA ROAD SINGAPORE 139350', '1');
INSERT INTO `metro_train`.`station` (`id`, `name`, `locality`, `is_interchange`) VALUES ('521', 'HILLVIEW MRT STATION', '510 UPPER BUKIT TIMAH ROAD SINGAPORE 678211', '0');
INSERT INTO `metro_train`.`station` (`id`, `name`, `locality`, `is_interchange`) VALUES ('522', 'FORT CANNING MRT STATION', '170 RIVER VALLEY ROAD SINGAPORE 1790', '0');
INSERT INTO `metro_train`.`station` (`id`, `name`, `locality`, `is_interchange`) VALUES ('523', 'GEYLANG BAHRU MRT STATION', '541 KALLANG BAHRU SINGAPORE 339355', '0');
INSERT INTO `metro_train`.`station` (`id`, `name`, `locality`, `is_interchange`) VALUES ('524', 'UBI MRT STATION', '51 UBI AVENUE 2 SINGAPORE 408899', '0');
INSERT INTO `metro_train`.`station` (`id`, `name`, `locality`, `is_interchange`) VALUES ('525', 'EXPO MRT STATION', '2 EXPO DRIVE SINGAPORE 485985', '1');




INSERT INTO `metro_train`.`station_route` (`id`, `station_id`, `route_id`, `position`) VALUES ('101', '501', '1', '1');
INSERT INTO `metro_train`.`station_route` (`id`, `station_id`, `route_id`, `position`) VALUES ('102', '502', '1', '2');
INSERT INTO `metro_train`.`station_route` (`id`, `station_id`, `route_id`, `position`) VALUES ('103', '503', '1', '3');
INSERT INTO `metro_train`.`station_route` (`id`, `station_id`, `route_id`, `position`) VALUES ('104', '504', '1', '4');
INSERT INTO `metro_train`.`station_route` (`id`, `station_id`, `route_id`, `position`) VALUES ('105', '505', '1', '5');
INSERT INTO `metro_train`.`station_route` (`id`, `station_id`, `route_id`, `position`) VALUES ('106', '506', '2', '1');
INSERT INTO `metro_train`.`station_route` (`id`, `station_id`, `route_id`, `position`) VALUES ('107', '507', '2', '2');
INSERT INTO `metro_train`.`station_route` (`id`, `station_id`, `route_id`, `position`) VALUES ('108', '508', '2', '3');
INSERT INTO `metro_train`.`station_route` (`id`, `station_id`, `route_id`, `position`) VALUES ('109', '509', '2', '4');
INSERT INTO `metro_train`.`station_route` (`id`, `station_id`, `route_id`, `position`) VALUES ('110', '510', '2', '5');
INSERT INTO `metro_train`.`station_route` (`id`, `station_id`, `route_id`, `position`) VALUES ('111', '511', '3', '1');
INSERT INTO `metro_train`.`station_route` (`id`, `station_id`, `route_id`, `position`) VALUES ('112', '512', '3', '2');
INSERT INTO `metro_train`.`station_route` (`id`, `station_id`, `route_id`, `position`) VALUES ('113', '513', '3', '3');
INSERT INTO `metro_train`.`station_route` (`id`, `station_id`, `route_id`, `position`) VALUES ('114', '514', '3', '4');
INSERT INTO `metro_train`.`station_route` (`id`, `station_id`, `route_id`, `position`) VALUES ('115', '515', '3', '5');
INSERT INTO `metro_train`.`station_route` (`id`, `station_id`, `route_id`, `position`) VALUES ('116', '516', '4', '1');
INSERT INTO `metro_train`.`station_route` (`id`, `station_id`, `route_id`, `position`) VALUES ('117', '517', '4', '2');
INSERT INTO `metro_train`.`station_route` (`id`, `station_id`, `route_id`, `position`) VALUES ('118', '518', '4', '3');
INSERT INTO `metro_train`.`station_route` (`id`, `station_id`, `route_id`, `position`) VALUES ('119', '519', '4', '4');
INSERT INTO `metro_train`.`station_route` (`id`, `station_id`, `route_id`, `position`) VALUES ('120', '520', '4', '5');
INSERT INTO `metro_train`.`station_route` (`id`, `station_id`, `route_id`, `position`) VALUES ('121', '521', '5', '1');
INSERT INTO `metro_train`.`station_route` (`id`, `station_id`, `route_id`, `position`) VALUES ('122', '522', '5', '2');
INSERT INTO `metro_train`.`station_route` (`id`, `station_id`, `route_id`, `position`) VALUES ('123', '523', '5', '3');
INSERT INTO `metro_train`.`station_route` (`id`, `station_id`, `route_id`, `position`) VALUES ('124', '524', '5', '4');
INSERT INTO `metro_train`.`station_route` (`id`, `station_id`, `route_id`, `position`) VALUES ('125', '525', '5', '5');



INSERT INTO `metro_train`.`train_schedule` (`id`, `metro_train_id`, `station_id`, `schedule_time`) VALUES ('1', '1001', '505', '2017-12-21 09:40:20.0');
INSERT INTO `metro_train`.`train_schedule` (`id`, `metro_train_id`, `station_id`, `schedule_time`) VALUES ('2', '1002', '506', '2017-12-22 16:20:15.0');
INSERT INTO `metro_train`.`train_schedule` (`id`, `metro_train_id`, `station_id`, `schedule_time`) VALUES ('3', '1003', '511', '2017-12-21 10:15:15.0');
INSERT INTO `metro_train`.`train_schedule` (`id`, `metro_train_id`, `station_id`, `schedule_time`) VALUES ('4', '1004', '520', '2017-12-21 10:15:15.0');
INSERT INTO `metro_train`.`train_schedule` (`id`, `metro_train_id`, `station_id`, `schedule_time`) VALUES ('5', '1005', '521', '2017-12-23 11:45:25.0');
INSERT INTO `metro_train`.`train_schedule` (`id`, `metro_train_id`, `station_id`, `schedule_time`) VALUES ('6', '1006', '525', '2017-12-23 22:45:15.0');
INSERT INTO `metro_train`.`train_schedule` (`id`, `metro_train_id`, `station_id`, `schedule_time`) VALUES ('7', '1007', '510', '2017-12-22 11:05:15.0');
INSERT INTO `metro_train`.`train_schedule` (`id`, `metro_train_id`, `station_id`, `schedule_time`) VALUES ('8', '1008', '515', '2017-12-21 12:05:15.0');
INSERT INTO `metro_train`.`train_schedule` (`id`, `metro_train_id`, `station_id`, `schedule_time`) VALUES ('9', '1009', '516', '2017-12-21 10:20:15.0');
INSERT INTO `metro_train`.`train_schedule` (`id`, `metro_train_id`, `station_id`, `schedule_time`) VALUES ('10', '1010', '521', '2017-12-23 23:20:15.0');




insert into `metro_train`.`train_arrival_time`
values(1,1001,503,1,'2017-12-21 09:10:20.0',0),
	  (2,1002,507,2,'2017-12-22 15:43:15.0',3),
      (3,1003,512,3,'2017-12-21 09:52:15.0',2),
      (4,1004,519,4,'2017-12-21 10:25:15.0',5),
      (5,1005,524,5,'2017-12-23 10:40:25.0',0),
      (6,1006,504,6,'2017-12-23 22:31:15.0',11),
      (7,1007,507,7,'2017-12-22 09:21:15.0',1),
      (8,1008,514,8,'2017-12-21 11:36:15.0',6),
      (9,1009,518,9,'2017-12-21 09:40:15.0',0),
      (10,1010,523,10,'2017-12-23 22:27:15.0',7),
      (11,1002,508,2,'2017-12-22 15:23:15.0',8),
      (12,1006,502,6,'2017-12-23 21:35:15.0',0),
      (13,1004,520,4,'2017-12-21 10:44:15.0',14),
      (14,1010,522,10,'2017-12-23 23:02:15.0',2),
      (15,1001,505,1,'2017-12-21 09:44:20.0',4);



INSERT INTO `metro_train`.`travel_card` (`id`, `person_name`, `contact_number`, `balance`) VALUES ('651', 'S DHANABALAN', '+65 81237452', '25.25');
INSERT INTO `metro_train`.`travel_card` (`id`, `person_name`, `contact_number`, `balance`) VALUES ('652', 'GERARD EE', '+65 87892541', '20');
INSERT INTO `metro_train`.`travel_card` (`id`, `person_name`, `contact_number`, `balance`) VALUES ('653', 'ALEX', '+65 95227525', '35.21');
INSERT INTO `metro_train`.`travel_card` (`id`, `person_name`, `contact_number`, `balance`) VALUES ('654', 'KENNY', '+65 85227415', '43.25');
INSERT INTO `metro_train`.`travel_card` (`id`, `person_name`, `contact_number`, `balance`) VALUES ('655', 'HAN SAI POR', '+65 95245255', '45.75');
INSERT INTO `metro_train`.`travel_card` (`id`, `person_name`, `contact_number`, `balance`) VALUES ('656', 'MICHAEL', '+65 62582155', '52.29');
INSERT INTO `metro_train`.`travel_card` (`id`, `person_name`, `contact_number`, `balance`) VALUES ('657', 'KAM NING', '+65 78245225', '49.25');
INSERT INTO `metro_train`.`travel_card` (`id`, `person_name`, `contact_number`, `balance`) VALUES ('658', 'BAEY YAM KENG', '+65 85255255', '46.75');
INSERT INTO `metro_train`.`travel_card` (`id`, `person_name`, `contact_number`, `balance`) VALUES ('659', 'ALICIA', '+65 92525552', '29.25');
INSERT INTO `metro_train`.`travel_card` (`id`, `person_name`, `contact_number`, `balance`) VALUES ('660', 'AARON LEE', '+65 92588226', '43.25');
INSERT INTO `metro_train`.`travel_card` (`id`, `person_name`, `contact_number`, `balance`) VALUES ('661', 'LAWRENCE WONG', '+65 82528552', '32.35');
INSERT INTO `metro_train`.`travel_card` (`id`, `person_name`, `contact_number`, `balance`) VALUES ('662', 'RISSA', '+65 25252552', '29.27');
INSERT INTO `metro_train`.`travel_card` (`id`, `person_name`, `contact_number`, `balance`) VALUES ('663', 'JASIM', '+65 86352555', '42.5');
INSERT INTO `metro_train`.`travel_card` (`id`, `person_name`, `contact_number`, `balance`) VALUES ('664', 'VIVIAN BALAKRISHNAN', '+65 25825662', '47.55');
INSERT INTO `metro_train`.`travel_card` (`id`, `person_name`, `contact_number`, `balance`) VALUES ('665', 'JJ LIN', '+65 25245652', '48.35');



INSERT INTO `metro_train`.`travel_payment` (`id`, `travel_card_id`, `entry_station_id`, `entry_time`, `exit_station_id`, `exit_time`, `amount`) VALUES ('1', '656', '503', '2017-12-21 09:15:15.0', '505', '2017-12-21 09:45:15.0', '40.25');
INSERT INTO `metro_train`.`travel_payment` (`id`, `travel_card_id`, `entry_station_id`, `entry_time`, `exit_station_id`, `exit_time`, `amount`) VALUES ('2', '653', '503', '2017-12-22 11:20:15.0', '504', '2017-12-22 11:45:15.0', '29.75');
INSERT INTO `metro_train`.`travel_payment` (`id`, `travel_card_id`, `entry_station_id`, `entry_time`, `exit_station_id`, `exit_time`, `amount`) VALUES ('3', '654', '501', '2017-12-23 21:15:15.0', '504', '2017-12-23 21:50:15.0', '37.25');
INSERT INTO `metro_train`.`travel_payment` (`id`, `travel_card_id`, `entry_station_id`, `entry_time`, `exit_station_id`, `exit_time`, `amount`) VALUES ('4', '656', '515', '2017-12-22 12:30:15.0', '511', '2017-12-22 12:55:15.0', '36.75');
INSERT INTO `metro_train`.`travel_payment` (`id`, `travel_card_id`, `entry_station_id`, `entry_time`, `exit_station_id`, `exit_time`, `amount`) VALUES ('5', '659', '516', '2017-12-21 10:15:15.0', '518', '2017-12-21 11:15:15.0', '22.25');
INSERT INTO `metro_train`.`travel_payment` (`id`, `travel_card_id`, `entry_station_id`, `entry_time`, `exit_station_id`, `exit_time`, `amount`) VALUES ('6', '657', '520', '2017-12-21 09:30:15.0', '516', '2017-12-21 09:43:15.0', '45.5');
INSERT INTO `metro_train`.`travel_payment` (`id`, `travel_card_id`, `entry_station_id`, `entry_time`, `exit_station_id`, `exit_time`, `amount`) VALUES ('7', '660', '521', '2017-12-23 11:15:25.0', '525', '2017-12-23 11:57:25.0', '37.45');
INSERT INTO `metro_train`.`travel_payment` (`id`, `travel_card_id`, `entry_station_id`, `entry_time`, `exit_station_id`, `exit_time`, `amount`) VALUES ('8', '663', '522', '2017-12-21 09:15:15.0', '524', '2017-12-21 09:30:15.0', '39.35');
INSERT INTO `metro_train`.`travel_payment` (`id`, `travel_card_id`, `entry_station_id`, `entry_time`, `exit_station_id`, `exit_time`, `amount`) VALUES ('9', '660', '506', '2017-12-22 14:30:15.0', '510', '2017-12-22 15:05:15.0', '30');
INSERT INTO `metro_train`.`travel_payment` (`id`, `travel_card_id`, `entry_station_id`, `entry_time`, `exit_station_id`, `exit_time`, `amount`) VALUES ('10', '653', '512', '2017-12-21 09:15:15.0', '514', '2017-12-21 09:40:15.0', '25.75');
INSERT INTO `metro_train`.`travel_payment` (`id`, `travel_card_id`, `entry_station_id`, `entry_time`, `exit_station_id`, `exit_time`, `amount`) VALUES ('11', '654', '513', '2017-12-21 10:15:20.0', '511', '2017-12-21 10:40:20.0', '32.65');
INSERT INTO `metro_train`.`travel_payment` (`id`, `travel_card_id`, `entry_station_id`, `entry_time`, `exit_station_id`, `exit_time`, `amount`) VALUES ('12', '655', '507', '2017-12-22 09:15:15.0', '510', '2017-12-22 09:50:15.0', '38.25');
INSERT INTO `metro_train`.`travel_payment` (`id`, `travel_card_id`, `entry_station_id`, `entry_time`, `exit_station_id`, `exit_time`, `amount`) VALUES ('13', '651', '517', '2017-12-23 11:15:15.0', '519', '2017-12-23 11:40:15.0', '19.5');
INSERT INTO `metro_train`.`travel_payment` (`id`, `travel_card_id`, `entry_station_id`, `entry_time`, `exit_station_id`, `exit_time`, `amount`) VALUES ('14', '658', '525', '2017-12-23 12:45:15.0', '523', '2017-12-23 13:15:20.0', '41.25');
INSERT INTO `metro_train`.`travel_payment` (`id`, `travel_card_id`, `entry_station_id`, `entry_time`, `exit_station_id`, `exit_time`, `amount`) VALUES ('15', '662', '506', '2017-12-23 15:40:15.0', '509', '2017-12-23 16:00:25.0', '25');


