-- MySQL dump 10.13  Distrib 5.7.42, for Linux (x86_64)
--
-- Host: localhost    Database: ready_writers_db
-- ------------------------------------------------------
-- Server version	5.7.42-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ready_writers_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ready_writers_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ready_writers_db`;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `author_id` int(11) NOT NULL AUTO_INCREMENT,
  `author_lastname` varchar(255) DEFAULT NULL,
  `author_firstname` varchar(255) DEFAULT NULL,
  `author_email` varchar(255) DEFAULT NULL,
  `author_password` varchar(255) NOT NULL,
  `author_field` varchar(30) DEFAULT NULL,
  `author_bio` text,
  `author_image` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Ogbu','Joy O.','obyjoy@yahoo.com','',NULL,'Joy Ogbu is a very dedicated and enthusiastic student of Software Engineering at Alx Africa. She specializes in content creation, software and web development','joy_ogbu.jpeg',NULL,'2023-09-18 08:47:51'),(2,'Akam','Johnjoe O.','jjjekyll2020@yahoo.com','',NULL,'I am a freelance software developer and a graphics designer','avatar_001.jpeg','2023-09-14 10:45:53','2023-09-18 13:17:54'),(3,'Ogbu','Daniel','danielogbu@gmail.com','','Lifestyle','Counselor, Teacher of the gospel, follower of Christ',NULL,'2023-09-21 03:38:27','2023-09-21 03:38:27'),(4,'Adams','Andrew','adams@gmail.com','undefined','Tech','Tech guru',NULL,'2023-09-21 09:01:16','2023-09-21 09:01:16'),(5,'Jame','Priscilia','prisi@gmail.com','prisigirl','Lifestyle','Content writer and developer',NULL,'2023-09-21 09:23:20','2023-09-21 09:23:20'),(6,'Emeka','Collins','collins@gmail.com','collinze','lifestyle','Am a relationship expert and a life coach','images (44).jpeg','2023-10-05 13:42:47','2023-10-05 13:42:47'),(7,'Ola','Yinka','ola@gmail.com','olaboy','tech','I am a tech savvy software engineering student','images (44).jpeg','2023-10-07 02:53:55','2023-10-07 02:53:55'),(8,'emmanuel','john','john@gmail.com','john1','tech','i am an alx student','img3.jpg','2023-10-09 00:05:54','2023-10-09 00:05:54');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_post_id` int(11) DEFAULT NULL,
  `comment_reply_id` int(11) DEFAULT '0',
  `comment_name` varchar(255) DEFAULT NULL,
  `comment_email` varchar(255) DEFAULT NULL,
  `comment_body` text,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  KEY `comment_post_id` (`comment_post_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`comment_post_id`) REFERENCES `posts` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,2,0,'Joy Ogbu','Obyjoy@yahoo.com','Wonderful post','2023-09-18 20:50:13','2023-09-18 20:50:13'),(2,2,0,'Mercy Eze','ezemercy@gmail.com','I love this','2023-09-19 02:23:07','2023-09-19 02:23:07'),(3,1,0,'Joy Ogbu','Obyjoy@yahoo.com','First comment','2023-09-19 10:23:53','2023-09-19 10:23:53'),(4,2,0,'andrew','ezemercy@gmail.com','Another comment','2023-09-19 10:25:17','2023-09-19 10:25:17'),(5,2,0,'shawn peters','Ujjkk','This post is good','2023-09-19 10:29:29','2023-09-19 10:29:29'),(6,1,0,'Hjj','Hjk','','2023-09-19 11:42:25','2023-09-19 11:42:25'),(7,1,0,'Hjj','Hjk','','2023-09-19 11:42:27','2023-09-19 11:42:27'),(8,1,0,'Hjj','Hjk','','2023-09-19 11:42:39','2023-09-19 11:42:39'),(9,1,0,'Jllk','Hjkk','Ghkl','2023-09-19 11:43:36','2023-09-19 11:43:36'),(10,1,0,'Jllk','Hjkk','Ghkl','2023-09-19 11:43:50','2023-09-19 11:43:50'),(11,1,0,'Abraham Ogar','ezemercy@gmail.com','This is a lovely write up','2023-09-19 11:51:26','2023-09-19 11:51:26'),(12,1,0,'Theo Linx','Nxmx,x.','Good job','2023-09-19 11:54:46','2023-09-19 11:54:46'),(13,1,0,'Oro','Dod','Dx','2023-09-19 11:56:51','2023-09-19 11:56:51'),(14,2,0,'Ggh','Nnn','Nnm','2023-09-19 12:04:23','2023-09-19 12:04:23'),(15,2,0,'Emmanuel Okoro','emma@gmail.com','I love this post. Is really wonderful','2023-09-19 20:28:28','2023-09-19 20:28:28');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) DEFAULT NULL,
  `post_title` varchar(255) DEFAULT NULL,
  `post_category` varchar(50) DEFAULT NULL,
  `post_image` varchar(255) DEFAULT NULL,
  `post_text` text,
  `date_created` datetime DEFAULT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `post_intro` text,
  `published` int(11) DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,'What happens when you type www.google.com and press enter',NULL,'internet.jpeg','Whether we are technically inclined or not, a lot of things happen under the hood. Many processes are initiated but they all happen in fractions of seconds that we are hardly aware of them…',NULL,'2023-10-01 14:47:01','Whether we are technically inclined or not, a lot of things happen under the hood',1),(2,1,'10 Python Projects You Can Start Today and Monetize Tomorrow',NULL,'python.jpeg','Hi, I know many of you strive to make a relatively passive income from programming that’s why I wrote this article. I hope it will be to your liking',NULL,'2023-10-01 14:47:13','Hi, I know many of you strive to make a relatively passive income from programming that’s why I wrote this article. I hope it will be to your liking.',1),(3,2,'How to Build a Sellable Side-Project in 5 Months: From Idea to Acquisition',NULL,'image_001.jpg','In just five short months, my idea went from concept to acquisition. This is my second acquisition this year, and I’ll share how I did it in this post.<p>1. Launch fast</p><p>2. Build something cool</p><p> 3. Share it everywhere</p><p>4. Focus on SEO</p><p>Selling on Acquire.com</p><p><b>Important notes</b></p><p>If you’re a new indie hacker or developer, keep in mind that I have years of experience. I often reuse code, manage a component library, and have built many projects (even some Chrome extensions). Additionally, the hype surrounding AI certainly contributed to gaining early exposure. Newsletters and AI directories began to mention it, which resulted in some early sales.</p>',NULL,'2023-10-01 14:47:17','In just five short months, my idea went from concept to acquisition. This is my second acquisition this year, and I’ll share how I did it in this post.',1),(4,5,'How to upload and save image into your database using express','Tech','images (46).jpeg','undefined',NULL,'2023-10-01 14:47:21','This tutorial help to upload an image into a folder and store the image path into a MySQL table using express-fileupload nodejs module. ',1),(5,1,'How to Make the Right Choice in Marriage','Relationship','images (47).jpeg','Making the right choice of a marriage partner has become a herculean task for so many. This post will help provide a guide when choosing a marriage partner',NULL,'2023-10-06 11:36:12','Making the right choice in marriage has over the years being a herculean tasks for many ',1),(6,6,'5 Strong Reasons Why You Need a Website for your business','Business','images (49).jpeg','<p>Website is your second store front. Just as you have a physical business location, it is your address on the internet.</p>',NULL,'2023-10-05 13:59:06','Website is your second store front. It is your address on the internet',0),(7,6,'Submit a Form Without Page Refresh Using jQuery','Tech','images (50).jpeg','<p>A great way to improve the user experience of your website is to validate and submit forms without a page refresh.</p><p>In this tutorial, I\'ll show you how easy it is to do just that—validate and submit a contact form without page refresh using jQuery! Let\'s get started.</p>',NULL,'2023-10-05 23:59:03','<p>A great way to improve the user experience of your website is to validate and submit forms without a page refresh',1),(8,8,'my journey into alx','Tech','6ddb5840-275f-11eb-9cdf-30ba9a77e022.jpg','<p>i love alx, i love software engineering</p>',NULL,'2023-10-09 00:10:01','<p>i love alx, i love software engineering</p>',1),(9,8,'How to create a blog','Tech','images (2).jpeg','<p>this post will teach you how to create a blog</p>',NULL,'2023-10-09 01:04:48','<p>this post will teach you how to create a blog</p>',1);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-13 15:41:25
