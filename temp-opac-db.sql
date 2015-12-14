-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2015 at 08:45 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `temp-opac-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE IF NOT EXISTS `books` (
  `accNum` bigint(255) NOT NULL,
  `class` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `bookTitle` varchar(100) NOT NULL,
  `edition` varchar(100) NOT NULL,
  `volume` int(15) NOT NULL,
  `pages` bigint(255) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `year` bigint(15) NOT NULL,
  `availability` tinyint(1) NOT NULL,
  `isActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`accNum`, `class`, `author`, `bookTitle`, `edition`, `volume`, `pages`, `publisher`, `year`, `availability`, `isActive`) VALUES
(123, '123', '123', '123', '123', 123, 123, '123', 123, 1, 0),
(567, '567', '567', '567', '567', 567, 567, '567', 567, 0, 0),
(777, '1234', '1234', '22', '1234', 1234, 1234, '1234', 1234, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE IF NOT EXISTS `feedbacks` (
  `feedbackId` int(11) NOT NULL AUTO_INCREMENT,
  `idNumber` varchar(50) NOT NULL,
  `feedbackMessages` varchar(535) NOT NULL,
  `feedbackDate` date NOT NULL,
  PRIMARY KEY (`feedbackId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `feedbacks`
--

INSERT INTO `feedbacks` (`feedbackId`, `idNumber`, `feedbackMessages`, `feedbackDate`) VALUES
(3, '2012-00011', 'Wendy Found', '2015-11-02'),
(4, '2012-00011', 'Wendy is reading', '2015-11-02'),
(6, '2012-00011', 'hello', '2015-11-04'),
(7, '2012-00011', 'Wendylicious', '2015-11-09');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE IF NOT EXISTS `genre` (
  `genreId` int(11) NOT NULL AUTO_INCREMENT,
  `genreName` varchar(255) NOT NULL,
  PRIMARY KEY (`genreId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genreId`, `genreName`) VALUES
(1, 'Arts and Animation'),
(2, 'Business and Marketing'),
(3, 'Science and Technology'),
(4, 'Hobbies and Recreation');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `newsId` int(1) NOT NULL AUTO_INCREMENT,
  `newsTitle` varchar(255) NOT NULL,
  `newsMessage` varchar(535) NOT NULL,
  `newsDate` date NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`newsId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`newsId`, `newsTitle`, `newsMessage`, `newsDate`, `isActive`) VALUES
(5, 'Update', 'Working or not working?\r\n', '2015-11-04', 0),
(6, '', 'Book missing', '2015-11-02', 1),
(8, 'Library', 'Gone', '2015-11-04', 1),
(9, 'Library', 'GONE', '2015-11-04', 1),
(10, 'Missing Person Found', 'Wendylicious is now captured. Thank you students for helping us capture this person. ', '2015-11-04', 0),
(11, '12341', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaa vbbbbbxcv', '2015-11-04', 1),
(12, 'qwqeq', '12131', '2015-11-04', 1),
(13, 'wendy', 'hello', '2015-11-09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `opacusers`
--

CREATE TABLE IF NOT EXISTS `opacusers` (
  `idNumber` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `isAdmin` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `opacusers`
--

INSERT INTO `opacusers` (`idNumber`, `password`, `firstName`, `lastName`, `isAdmin`) VALUES
('2013-01251', 'gabriel', 'Gabriel', 'Gonzales', 1),
('2012-00011', 'qwerty', 'wendell', 'Rodriguez', 0);

-- --------------------------------------------------------

--
-- Table structure for table `relation`
--

CREATE TABLE IF NOT EXISTS `relation` (
  `accNum` int(11) NOT NULL,
  `genreId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `relation`
--

INSERT INTO `relation` (`accNum`, `genreId`) VALUES
(123, 2),
(777, 3);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
