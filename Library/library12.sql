/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 5.7.22-log : Database - library12
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`library12` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `library12`;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `bookName` varchar(25) DEFAULT NULL,
  `publisher` varchar(25) DEFAULT NULL,
  `author` varchar(25) DEFAULT NULL,
  `year` varchar(25) DEFAULT NULL,
  `number` varchar(25) DEFAULT NULL,
  `user` varchar(25) DEFAULT NULL,
  `info` varchar(25) DEFAULT NULL,
  `borrowedAt` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `book` */

insert  into `book`(`bookName`,`publisher`,`author`,`year`,`number`,`user`,`info`,`borrowedAt`) values 
('이것이 자바다','한빛미디어','신용권','2015-01-05','001','user1','o','2018-06-03 17:46:02'),
('JSP SERVLET','대청','안승규','2002-08-15','002','admin','o','2018-06-03 19:01:07'),
('파피용','열린책들','베르베르','2013-05-30','003',' ','x',' '),
('고양이1','열린책들','베르베르','2018-06-12','004','admin','o','2018-06-03 18:59:54'),
('고양이2','열린책들','베르베르','2018-06-13','005',' ','x',' '),
('연어','문학동네','안도현','1996-03-02','006',' ','x',' '),
('삼국지','민음사','이문열','2002-03-05','007',' ','x',' '),
('삼대','문학과지성','염상섭','2004-12-03','009',' ','x',' '),
('무진기행','문학동네','김승옥','2004-10-15','008',' ','x',' '),
('C언어본색','프리렉','박정민','2011-01-05','009',' ','x',' ');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` varchar(25) NOT NULL,
  `passwd` varchar(25) DEFAULT NULL,
  `name` varchar(25) DEFAULT NULL,
  `mail` varchar(25) DEFAULT NULL,
  `book1` varchar(25) DEFAULT NULL,
  `book2` varchar(25) DEFAULT NULL,
  `book3` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `member` */

insert  into `member`(`id`,`passwd`,`name`,`mail`,`book1`,`book2`,`book3`) values 
('admin','1234','운영자','admin@gmail.com','고양이1','JSP SERVLET',' '),
('user','1234','user','user@gmail.com',' ',' ',' '),
('user1','1234','user1','user1@naver.com','이것이 자바다',' ',' '),
('user2','1234','user2','user2@naver.com',' ',' ',' ');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
