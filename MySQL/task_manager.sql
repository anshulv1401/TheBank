CREATE DATABASE task_manager;
 
USE task_manager;
 
CREATE TABLE IF NOT EXISTS `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(250) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` text NOT NULL,
  `api_key` varchar(32) NOT NULL,
  `isactive` int(1) NOT NULL DEFAULT '1',
  `createdBy` int(11) NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` int(11) NULL,
  `modifiedDate` timestamp NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email` (`email`)
);
 
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);
 
CREATE TABLE IF NOT EXISTS `user_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `task_id` (`task_id`)
);
 
ALTER TABLE  `user_tasks` ADD FOREIGN KEY (  `user_id` ) REFERENCES  `task_manager`.`users` (
`id`
) ON DELETE CASCADE ON UPDATE CASCADE ;
 
ALTER TABLE  `user_tasks` ADD FOREIGN KEY (  `task_id` ) REFERENCES  `task_manager`.`tasks` (
`id`
) ON DELETE CASCADE ON UPDATE CASCADE ;