-- phpMyAdmin SQL Dump
-- version 3.5.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 22, 2014 at 09:56 AM
-- Server version: 5.5.33-31.1
-- PHP Version: 5.3.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mclamp_spring2014`
--

-- --------------------------------------------------------

--
-- Table structure for table `Availability`
--

CREATE TABLE IF NOT EXISTS `Availability` (
  `LastName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FirstName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Monday10am` int(11) NOT NULL,
  `Monday11am` int(11) NOT NULL,
  `Monday12pm` int(11) NOT NULL,
  `Monday2pm` int(11) NOT NULL,
  `Monday3pm` int(11) NOT NULL,
  `Monday4pm` int(11) NOT NULL,
  `Tuesday10am` int(11) NOT NULL,
  `Tuesday11am` int(11) NOT NULL,
  `Tuesday12pm` int(11) NOT NULL,
  `Tuesday2pm` int(11) NOT NULL,
  `Tuesday3pm` int(11) NOT NULL,
  `Tuesday4pm` int(11) NOT NULL,
  `Wednesday10am` int(11) NOT NULL,
  `Wednesday11am` int(11) NOT NULL,
  `Wednesday12pm` int(11) NOT NULL,
  `Wednesday2pm` int(11) NOT NULL,
  `Wednesday3pm` int(11) NOT NULL,
  `Wednesday4pm` int(11) NOT NULL,
  `Thursday10am` int(11) NOT NULL,
  `Thursday11am` int(11) NOT NULL,
  `Thursday12pm` int(11) NOT NULL,
  `Thursday2pm` int(11) NOT NULL,
  `Thursday3pm` int(11) NOT NULL,
  `Thursday4pm` int(11) NOT NULL,
  `Friday10am` int(11) NOT NULL,
  `Friday11am` int(11) NOT NULL,
  `Friday12pm` int(11) NOT NULL,
  `Friday2pm` int(11) NOT NULL,
  `Friday3pm` int(11) NOT NULL,
  `Friday4pm` int(11) NOT NULL,
  `Saturday10am` int(11) NOT NULL,
  `Saturday11am` int(11) NOT NULL,
  `Saturday12pm` int(11) NOT NULL,
  `Saturday2pm` int(11) NOT NULL,
  `Saturday3pm` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Availability`
--

INSERT INTO `Availability` (`LastName`, `FirstName`, `Email`, `Monday10am`, `Monday11am`, `Monday12pm`, `Monday2pm`, `Monday3pm`, `Monday4pm`, `Tuesday10am`, `Tuesday11am`, `Tuesday12pm`, `Tuesday2pm`, `Tuesday3pm`, `Tuesday4pm`, `Wednesday10am`, `Wednesday11am`, `Wednesday12pm`, `Wednesday2pm`, `Wednesday3pm`, `Wednesday4pm`, `Thursday10am`, `Thursday11am`, `Thursday12pm`, `Thursday2pm`, `Thursday3pm`, `Thursday4pm`, `Friday10am`, `Friday11am`, `Friday12pm`, `Friday2pm`, `Friday3pm`, `Friday4pm`, `Saturday10am`, `Saturday11am`, `Saturday12pm`, `Saturday2pm`, `Saturday3pm`) VALUES
('Aboulafia', 'Stephanie', 'aboulafia.s@husky.neu.edu', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Akers', 'Tricia', 'akers.t@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
('Ali', 'Mujtaba', 'ali.mo@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Anang', 'Michaela', 'anang.m@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Arenson', 'Melanie', 'arenson.m@husky.neu.edu', 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Aronoff', 'Emily', 'aronoff.e@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Aspray', 'Megan', 'maspray49@gmail.com', 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Austin', 'Marlie', 'austin.m@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Ayres', 'Rachel', 'ayres.r@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Beam', 'Matthew', 'beam.m@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Beaver', 'Megan', 'beaver.m@husky.neu.edu', 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Becker', 'Hannah', 'becker.h@husky.neu.edu', 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0),
('Beluk', 'Christine', 'beluk.c@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Berger', 'Terese', 'berger.t@husky.neu.edu', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Berliner', 'Tessa', 'berliner.t@husky.neu.edu', 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0),
('Bertolini', 'Elaine', 'bertolini.e@husky.neu.edu', 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0),
('Bielecki', 'Julia', 'bielecki.j@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Blackwell', 'Jesse', 'blackwell.j@husky.neu.edu', 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Bohlen', 'Mollie', 'bohlen.m@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Bolotsky', 'Cory', 'bolotsky.c@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0),
('Brown', 'Courtney', 'brown.cou@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Cameron', 'Andrew', 'cameron.an@husky.neu.edu', 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
('Carbonar', 'Andrew', 'carbonar.a@husky.neu.edu', 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Carkin', 'Sam', 'carkinsc@gmail.com', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Cella', 'Erika', 'cella.e@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Clamp', 'Matthew', 'clamp.m@husky.neu.edu', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1),
('Claxton', 'Caroline', 'claxton.c@husky.neu.edu', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0),
('Convertino', 'Alexandra', 'converti0.a@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0),
('Cooray', 'Amila', 'amilais@yahoo.com', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Cordero', 'Jennifer', 'cordero.j@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Coyne', 'Laura', 'coyne.l@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Darrow', 'Sarah', 'sarah.darrow92@gmail.com', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
('Davis', 'Michael', 'davis.m@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0),
('Deahl', 'Jennifer', 'deahl.j@husky.neu.edu', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('DeCarlo', 'Marissa', 'decarlo.m@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0),
('degroot.s@husky.neu.edu', 'Sophie', 'degroot.s@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Dello Russo', 'Catherine', 'dellorusso.c@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0),
('DeMaio', 'Rose', 'demaio.r@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Dodge deBruyn', 'Callan', 'dodgedebruyn.c@husky.neu.edu', 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Duran', 'Jocelyn', 'jocelynduran10@yahoo.com', 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Efrosman', 'Stephanie', 'efrosman.s@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Elkhill', 'Con0r', 'elkhill.c@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0),
('Erdelyi', 'Catherine', 'erdelyi.c@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Fallon', 'Ryan', 'rtfalcon@comcast.net', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Feldman', 'Katharine', 'feldman.k@husky.neu.edu', 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Feliciano', 'Angel', 'feliciano.m@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Finnell', 'Drew', 'finnell.a@husky.neu.edu', 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0),
('Fiorello', 'Marissa', 'marissafiorello@me.com', 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Flannery', 'Daniel', 'flannery.d@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0),
('Flynn', 'Briana', 'flynn.b@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
('Folan', 'Elizabeth', 'folan.e@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0),
('Frizzell', 'Ashley', 'frizzell.a@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Gabso', 'Hilary', 'gabso.h@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0),
('Gaines', 'Shalayah', 'gaines.sh@husky.neu.edu', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Gordon', 'Basia', 'gordon.ba@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Goto', 'NewStratford', 'goto.s@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0),
('Gottlieb', 'Alex', 'gottlieb.a@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Graff', 'Jackie', 'graff.j@husky.neu.edu', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Hanover', 'Jordyn', 'hanover.j@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Hanrahan', 'Madalyn', 'hanrahan.m@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0),
('Havasy', 'Andrew', 'havasy.a@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0),
('Hersch', 'Kimberly', 'hersch.k@husky.neu.edu', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Hoang', 'Minh', 'hoang.m@husky.neu.edu', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0),
('Hudson', 'Katherine', 'hudson.k@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0),
('Humphrey', 'Dan', 'humphrey.d@husky.neu.edu', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0),
('Hwang', 'Sora', 'hwang.sor@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0),
('Jin', 'Wanyi', 'jin.wa@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0),
('Johansen', 'Ally', 'johansen.a@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Katon', 'Jesse', 'jkaton129@gmail.com', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Kim', 'Emily', 'kim.em@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Krupnick', 'Abby', 'krupnick.a@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('LaBove', 'Daniel', 'labove.d@husky.neu.edu', 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Lamazerolles Low', 'Elie', 'lamazerolles.e@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Lawler', 'Kate', 'lawler.ka@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0),
('Le', 'Peter', 'le.p@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Leo', 'John', 'leo.jo@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Lin', 'Sonia', 'lin.son@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Liston', 'Casey', 'liston.c@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Lonergan', 'Nicole', 'nicoleklonergan@gmail.com', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Loomer', 'Lacey', 'loomer.l@husky.neu.edu', 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0),
('Lopez', 'Kristina', 'lopez.k@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Lopez Lalinde', 'Lina', 'lopezlalinde.l@husky.neu.edu', 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0),
('Malatesta', 'Madison', 'malatesta.m@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Manos', 'Madison', 'manos.m@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('McClearn', 'Alison', 'mcclearn.a@husky.neu.edu', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('McGuire', 'Maggie', 'mcguire.mar@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('McKenna', 'Madeline', 'mckenna.ma@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Mertens', 'Jessica', 'mertens.j@husky.neu.edu', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0),
('Metivier', 'Ian', 'ianmetivier@yahoo.com', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0),
('Miller', 'Xander', 'xander.neu115@gmail.com', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Moburg', 'Rachel', 'moburg.r@husky.neu.edu', 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0),
('Moffa', 'Anthony', 'moffa.a@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Moran', 'Daniel', 'moran.dan@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Morgan', 'Annika', 'morgan.an@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0),
('Morris', 'Jessica', 'morris.j@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0),
('Moss', 'Carly', 'moss.ca@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Murdza', 'Allison', 'murdza.a@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Murray', 'Alex', 'murray.al@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Nadeau', 'Elizabeth', 'nadeau.e@husky.neu.edu', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Nault', 'Melanie', 'nault.m@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Nelson', 'Anastasia', 'anastasia.nelson@hotmail.com', 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0),
('Ngan', 'Allison', 'ngan.a@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Nissen', 'Jordan', 'nissen.j@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Okscin', 'Matthew', 'okscin.m@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0),
('Olsen', 'Madeline', 'madeline.belle91@yahoo.com', 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Ostwald', 'Hannah', 'ostwald.h@husky.neu.edu', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Padmanabhan', 'Sarayu', 'padmanabhan.s@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0),
('Palad', 'Carl', 'palad.c@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0),
('Parmalee', 'Meredith', 'parmalee.m@husky.neu.edu', 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Pellegrino', 'Kate', 'pellegrino.k@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Pennoyer', 'Shannon', 'pennoyer.s@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Philpot', 'Rosalie', 'philpot.r@husky.neu.edu', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Polanchik', 'Nick', 'polanchik.n@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Posner', 'Alyssa', 'posner.a@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Pratt', 'Alyssa', 'pratt.a@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0),
('Ratner', 'Samantha', 'ratner.sa@husky.neu.edu', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Retrum', 'Jessica', 'retrum.j@husky.neu.edu', 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Rocovich', 'Allie', 'rocovich.a@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Roman', 'Jose', 'roman.jo@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Roselle', 'James', 'roselle.j@husky.neu.edu', 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0),
('Rosenstein', 'Tedi', 'rosenstein.t@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Rubin', 'Jaclyn', 'rubin.jac@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0),
('Rustum', 'Megan', 'rustum.m@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Rutzick', 'Sam', 'rutzick.s@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0),
('Setton', 'Laura', 'setton.l@husky.neu.edu', 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Shaffer', 'Joel', 'shaffer.j@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Shapiro', 'Rachel', 'shapiro.r@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Shaw', 'Zachery', 'shaw.z@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Shekarkhand', 'Sadaf', 'shekarkhand.s@husky.neu.edu', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Silva', 'Alison', 'silva.a@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0),
('Silverman', 'Eric', 'silverman.er@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Soto', 'Maggie', 'soto.mar@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Sousa', 'Elizabeth', 'sousa.e@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Stefanik', 'Courtney', 'stefanik.c@husky.neu.edu', 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
('Steinberger', 'Justine', 'steinberger.j@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Templeton', 'Melissa', 'templeton.m@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Tierney', 'Daniel', 'tierney.d@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Trayer', 'Paige', 'trayer.p@husky.neu.edu', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Trigger', 'Laura', 'trigger.l@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Tyler', 'Eric', 'tyler.er@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Vallillo', 'Angela', 'vallillo.a@husky.neu.edu', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Van Zee', 'Audrey', 'awesomeaud@gmail.com', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Volgraf', 'Joseph', 'volgraf.j@husky.neu.edu', 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Wade', 'Maura', 'wade.ma@husky.neu.edu', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Wall', 'Shanna', 'wall.s@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Wang', 'Sarah', 'wang.sar@husky.neu.edu', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
('Weiss', 'Rachel', 'weiss.ra@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
('Wieland', 'Christopher', 'cwielandr@gmail.com', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Wong', 'Katie', 'katiewong10@gmail.com', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Yagoda', 'Aaron', 'yagoda.a@husky.neu.edu', 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Yang', 'Kevin', 'kyang1993@yahoo.com', 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Yates', 'Rachel', 'yates.ra@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0),
('Young', 'Ashley', 'young.a@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Youssef', 'Nyera', 'youssef.n@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
('Yu', 'Luomeng', 'yu.luo@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Zielinski', 'Kelsey', 'zielinski.k@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Trigger', 'Matthew', 'trigger.m@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Roberts', 'Stephanie', 'roberts.s@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Goddard', 'Connor', 'goddard.c@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Wasiuk', 'Stephanie', 'wasiuk.s@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Solomon', 'Mary', 'solomon.m@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Rand-Lewis', 'Alexander', 'rand-lewis.a@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Paranello', 'Nicholas', 'panarello.n@husky.neu.ed', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Lilly', 'Stairs', 'stairs.l@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Bernier', 'Libby', 'bernier.l@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Kulik', 'Amelia', 'akulik17@gmail.com', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Stent', 'Michael', 'stent.m@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Vilches', 'Victoria', 'vilches.v@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Pulido', 'Anthony', 'pulido.a@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Rudman', 'Zoe', 'rudman.z@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Fung', 'Derrick', 'fung.d.t@gmail.com', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Fung', 'Derrick', 'fung.d.t@gmail.com', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Lynch', 'Kelli Ann', 'lynch.k@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Jelly', 'Christopher', 'jelly.chris@gmail.com', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Van Zee', 'Audrey', 'vanzee.a@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Anderson', 'Stacey', 'anderson.sta@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0),
('Au', 'Katie', 'au.k@husky.neu.edu', 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Bara0wski', 'Lauren', 'bara0wski.l@husky.neu.edu', 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0),
('Bzdel', 'Matt', 'bzdel.m@husky.neu.edu', 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0),
('Civgin', 'Catherine', 'catherinecivgin@yahoo.com', 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0),
('Conlin', 'Megan', 'conlin.me@husky.neu.edu', 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0),
('Corry', 'Jack', 'corry.jo@husky.neu.edu', 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0),
('Crescitelli', 'Elyse', 'crescitelli.e@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Dammeier', 'Maxwell', 'dammeier.m@husky.neu.edu', 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0),
('Driscoll', 'Tim', 'driscoll.ti@husky.neu.edu', 0, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0),
('Ewall-Wice', 'Leah', 'ewall-wice.l@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0),
('Furtado', 'Sherri', 'furtado.sh@husky.neu.edu', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Graham', 'Kelly', 'graham.kel@husky.neu.edu', 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0),
('Gruber', 'Mitchell', 'gruber.m@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Imburgia', 'Taylor', 'imburgia.t@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Jakobsze', 'Aleksandra', 'jakobsze.a@husky.neu.edu', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0),
('Kalenjian', 'David', 'kalenjian.d@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Lucarello', 'Michael', 'lucarello.m@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0),
('Mahoney', 'Daniel', 'mahoney.dan@husky.neu.edu', 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0),
('Mansfield', 'Caleb', 'mansfield.ca@husky.neu.edu', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Neumann', 'Franziska', 'neumann.f@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0),
('Noyes', 'Evan', 'eva01@gmail.com', 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0),
('Pizzo', 'Edward', 'pizzo.e@husky.neu.edu', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Powell', 'Karlayne', 'powell.kar@husky.neu.edu', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Preputnik', 'Sarah', 'preputnik.s@husky.neu.edu', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Printy', 'Sarah', 'printy.a@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0),
('Rego', 'Nilay', 'rego.ni@husky.neu.edu', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Sousa', 'Alexander', 'sousa.a@husky.neu.edu', 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Taneja', 'Shilpa', 'taneja.s@husky.neu.edu', 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0),
('Vildzius', 'Jennie', 'vildzius.j@husky.neu.edu', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0),
('Zhukovsky', 'Sarah', 'zhukovsky.s@husky.neu.edu', 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0),
('Stairs', 'Lilly', 'stairs.l@husky.neu.edu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

CREATE TABLE IF NOT EXISTS `Category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Category` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Chair` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Budget` decimal(10,2) DEFAULT NULL,
  `Actual` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=37 ;

--
-- Dumping data for table `Category`
--

INSERT INTO `Category` (`id`, `Category`, `Chair`, `Description`, `Budget`, `Actual`) VALUES
(1, 'Retreat', 'Chair', 'SLC Fall Retreat/Programming Leaders/SLC Spring Retreat', 3000.00, 1108.18),
(2, 'SLC Bonding', 'Chair', 'SIAF Dinner/Fall EOS/Spring EOS/General Bonding', 1326.00, 204.31),
(3, 'Conference', 'Chair', 'SIAF/Boston Student Summit', 550.00, 361.53),
(4, 'General HA', 'Chair', 'Welcome Week Event/T-Shirts', 2624.00, 3434.39),
(5, 'Minglers', 'Chair', 'General Bonding', 150.00, 0.00),
(6, 'Total', 'Chair', NULL, 7650.00, 5108.41),
(7, 'Marketing', 'RRA', 'Postcards, Chalk', 110.00, 0.00),
(8, 'Food', 'RRA', 'Chips, soda, candy', 75.00, 0.00),
(9, 'Materials', 'RRA', 'Gift certificate and crafts', 200.00, 0.00),
(10, 'Apparel', 'RRA', 'Jackets/Nametags', 5890.00, 0.00),
(11, 'Gifts', 'RRA', 'TBD', 150.00, 150.00),
(12, 'Alumni', 'RRA', 'TBD', 700.00, 0.00),
(13, 'Spring Marketing', 'RRA', 'Postcards, Chalk, Table', 250.00, 0.00),
(14, 'Spring Food', 'RRA', 'Kettle Corn, Butter Popcorn, Carmel Corn, Soda', 75.00, 0.00),
(15, 'Spring Materials', 'RRA', 'Big Prize, Triboard, Crafts', 100.00, 0.00),
(16, 'Spring Apparel', 'RRA', 'Nametags', 1400.00, 0.00),
(17, 'Spring Gifts', 'RRA', 'Give-a-Ways', 150.00, 0.00),
(18, 'Total', 'RRA', NULL, 9100.00, 150.00),
(19, 'Small Social Programs', 'PR', 'Familiy Bonding/Hockey Game/Homecoming/Finals Breakfast/Spring - TBD', 400.00, 0.00),
(20, 'Large Social Programs', 'PR', 'NU Service Day/Connor''s Farm/Spring-TBD', 2250.00, 0.00),
(21, 'Fall 2013 EOS', 'PR', 'Holiday Party', 250.00, 0.00),
(22, 'Spring 2014 EOS', 'PR', 'Gala', 6000.00, 0.00),
(23, 'Total', 'PR', NULL, 8900.00, 0.00),
(24, 'Slush Fund', 'COM', 'Slush Fund', 100.00, 0.00),
(25, 'Total', 'COM', NULL, 100.00, 0.00),
(26, 'Slush Fund', 'OP', 'Slush Fund', 0.00, 0.00),
(27, 'Total', 'OP', NULL, 0.00, 0.00),
(28, 'Training', 'TD', 'Fall 13/Spring14/Summer14', 4600.00, 0.00),
(29, 'Makeup Training', 'TD', 'Fall 13/Spring 14', 400.00, 0.00),
(30, 'Repographics', 'TD', NULL, 1000.00, 0.00),
(31, 'HDC', 'TD', NULL, 800.00, 0.00),
(32, 'Reserves', 'TD', NULL, 350.00, 0.00),
(33, 'Total', 'TD', NULL, 7150.00, 0.00),
(34, 'Slush Fund', 'SF', NULL, 1000.00, 0.00),
(35, 'Total', 'SF', NULL, 1000.00, 0.00),
(36, '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Coverages`
--

CREATE TABLE IF NOT EXISTS `Coverages` (
  `CID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Day` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Time` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `TourType` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Date` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Covered` int(11) NOT NULL,
  `Coverer` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CID`),
  UNIQUE KEY `CID` (`CID`),
  KEY `CID_2` (`CID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=69 ;

--
-- Dumping data for table `Coverages`
--

INSERT INTO `Coverages` (`CID`, `Name`, `Day`, `Time`, `TourType`, `Date`, `Covered`, `Coverer`) VALUES
(33, 'Katherine Au', 'Monday', '11am', 'Reg', '2014-02-17', 1, 'Not Covered'),
(32, 'Aaron Yagoda', 'Monday', '11am', 'Reg', '2014-02-17', 2, 'Matthew Clamp'),
(31, 'Matthew Trigger', 'Friday', '4pm', 'Reg', '2014-02-14', 1, 'Not Covered'),
(30, 'Lilly Stairs', 'Thursday', '12pm', 'Reg', '2014-02-20', 1, 'Not Covered'),
(29, 'Alyssa Pratt', 'Saturday', '12pm', 'Reg', '2014-02-15', 1, 'Shanna Wall'),
(28, 'Briana Flynn', 'Saturday', '11am', 'Reg', '2014-02-15', 1, 'Not Covered'),
(26, 'Alexandra Convertino', 'Saturday', '12pm', 'Reg', '2014-02-15', 1, 'Jessica Morris'),
(21, 'Marissa DeCarlo', 'Saturday', '11am', 'Reg', '2014-02-08', 1, ''),
(53, 'Elyse Crescitelli', 'Tuesday', '3pm', '', '2014-02-25', 1, 'Elyse Crescitelli'),
(20, 'Jessica Morris', 'Saturday', '11am', 'IV', '2014-02-08', 1, 'Alexandra Convertino'),
(54, 'Elyse Crescitelli', 'Tuesday', '3pm', 'Reg', '2014-02-25', 1, 'Daniel Mahoney'),
(35, 'Stacey Anderson', 'Saturday', '12pm', '', '2014-02-15', 1, 'Not Covered'),
(36, 'Tessa Berliner', 'Saturday', '10am', 'Reg', '2014-01-15', 0, ''),
(37, 'Tessa Berliner', 'Saturday', '10am', 'Reg', '2014-02-15', 1, 'Not Covered'),
(38, 'Daniel Mahoney', 'Friday', '12pm', 'Reg', '2014-02-14', 1, 'Not Covered'),
(39, 'Anthony Moffa', 'Monday', '4pm', 'Reg', '2014-02-17', 2, 'Alex Gottlieb'),
(40, 'Stephanie Aboulafia', 'Thursday', '3pm', 'Ath', '2014-02-12', 1, 'Not Covered'),
(42, 'Jackie Graff', 'Monday', '2pm', 'Reg', '2014-02-07', 1, ''),
(43, 'Christopher Jelly', 'Monday', '12pm', 'Reg', '2014-02-17', 2, 'Maura Wade'),
(44, 'Kelli Ann Lynch', 'Saturday', '10am', 'Reg', '2014-02-15', 1, 'Not Covered'),
(51, 'Alexandra Convertino', 'Saturday', '12pm', 'Reg', '3/1/14', 0, ''),
(45, 'Matthew Trigger', 'Friday', '4pm', 'Reg', '2014-02-14', 2, 'Catherine Dello Russo'),
(46, 'Matt Bzdel', 'Monday', '2pm', 'Reg', '2014-02-17', 1, 'Not Covered'),
(47, 'Rebecca Sirull', 'Saturday', '11am', 'Reg', '2014-02-07', 0, ''),
(48, 'Sarah Printy', 'Saturday', '11am', 'Reg', '2014-03-08', 0, ''),
(49, 'Emily Aronoff', 'Thursday', '3pm', 'Reg', '2014-02-20', 1, 'Not Covered'),
(50, 'Matthew Okscin', 'Friday', '2pm', 'Reg', '2014-02-21', 1, 'Not Covered'),
(52, 'Jordan Nissen', 'Wednesday', '11am', 'Reg', '2001-02-19', 0, ''),
(55, 'Catherine Civgin', 'Friday', '2pm', 'Reg', '02/28/2014', 0, ''),
(56, 'Sadaf Sekarkhand', 'Wednesday', '10am', 'Reg', '2014-02-26', 0, ''),
(57, 'Nicholas Viviano', 'Saturday', '11am', 'Reg', '2011-02-22', 0, ''),
(58, 'Katherine Hudson', 'Saturday', '11am', 'Reg', '2014-03-01', 0, ''),
(59, 'Daniel Mahoney', 'Friday', '12pm', 'Reg', 'Friday February 28, 2014', 0, ''),
(60, 'Angela Vallillo', 'Friday', '10am', 'Reg', '2/21/14', 0, ''),
(61, 'Stephanie Roberts', 'Tuesday', '2pm', 'Reg', '2014-03-11', 0, ''),
(62, 'Stephanie Roberts', 'Tuesday', '2pm', 'Reg', '2014-03-11', 0, ''),
(63, 'Ariel McDonnell (M)', 'Friday', '10am', '', '2014-02-28', 0, ''),
(64, 'Ariel McDonnell (M)', 'Friday', '10am', '', '2014-03-07', 0, ''),
(65, 'Matthew Okscin', 'Friday', '2pm', 'Reg', '2014-02-21', 1, 'Not Covered'),
(66, 'Leah Ewall-Wice', 'Saturday', '10am', 'Reg', '0014-03-15', 0, ''),
(67, 'Jessica Morris', 'Saturday', '11am', 'IV', '2014-03-08', 0, ''),
(68, 'Alexandra Convertino', 'Saturday', '12pm', 'Reg', '3/8/14', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `Evaluations`
--

CREATE TABLE IF NOT EXISTS `Evaluations` (
  `SLCColor` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Not Assigned',
  `Date` datetime NOT NULL,
  `UID` int(11) NOT NULL,
  `Year` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `TourSize` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `PromptArrival` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `ProperIntroduction` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `SafetyInCrosswalk` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `WalkBackwards` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `AccurateFacts` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `SevenColleges` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `TourLength` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `Circumstances` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `GeneralFeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `Stories` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `StoriesComments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `Academics` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `AcademicsComments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `Research` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ResearchComments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ServiceLearning` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ServiceLearningComments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `StudyAbroad` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `StudyAbroadComments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `Coop` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CoopComments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `StudentLife` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `StudentLifeComments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `Presentation` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `PresentationComments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `Questions` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `QuestionsComments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `PresentationBlurb` longtext COLLATE utf8_unicode_ci NOT NULL,
  `TourStrengths` longtext COLLATE utf8_unicode_ci NOT NULL,
  `Improving` longtext COLLATE utf8_unicode_ci NOT NULL,
  `Color` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `FlaggedHuh` longtext COLLATE utf8_unicode_ci NOT NULL,
  `AdditionalComments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `BringUp` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Evaluations`
--

INSERT INTO `Evaluations` (`SLCColor`, `Date`, `UID`, `Year`, `TourSize`, `PromptArrival`, `ProperIntroduction`, `SafetyInCrosswalk`, `WalkBackwards`, `AccurateFacts`, `SevenColleges`, `TourLength`, `Circumstances`, `GeneralFeedback`, `Stories`, `StoriesComments`, `Academics`, `AcademicsComments`, `Research`, `ResearchComments`, `ServiceLearning`, `ServiceLearningComments`, `StudyAbroad`, `StudyAbroadComments`, `Coop`, `CoopComments`, `StudentLife`, `StudentLifeComments`, `Presentation`, `PresentationComments`, `Questions`, `QuestionsComments`, `PresentationBlurb`, `TourStrengths`, `Improving`, `Color`, `FlaggedHuh`, `AdditionalComments`, `BringUp`) VALUES
('Red', '2014-01-27 22:37:43', 1, 'Third Year', '5', 'Yes', 'No', 'Yes', 'No', 'Yes', 'Yes', '60', 'ijoi', 'joijioj', 'Strongly Agree', 'iojiojio', 'Strongly Agree', 'iojiojioj', 'Strongly Agree', 'opjopjopjop', 'Strongly Agree', 'ojopjopj', 'Strongly Disagree', 'opjopjopjopj', 'Agree', 'pojopjopj', 'Strongly Disagree', 'pojopjopjopj', 'Disagree', 'opjpojopj', 'Strongly Agree', 'ojkopjpojop', 'ojopjopj', 'opjopjopjopj', 'opjopjopjop', 'Yellow', 'pojopjopj', 'opjopjopj', 'opjopjopj');

-- --------------------------------------------------------

--
-- Table structure for table `Friday2PM`
--

CREATE TABLE IF NOT EXISTS `Friday2PM` (
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Jan10` int(11) NOT NULL,
  `Jan17` int(11) NOT NULL,
  `Jan24` int(11) NOT NULL,
  `Jan31` int(11) NOT NULL,
  `Feb07` int(11) NOT NULL,
  `Feb14` int(11) NOT NULL,
  `Feb21` int(11) NOT NULL,
  `Feb28` int(11) NOT NULL,
  `Mar07` int(11) NOT NULL,
  `Mar14` int(11) NOT NULL,
  `Mar21` int(11) NOT NULL,
  `Mar28` int(11) NOT NULL,
  `Apr04` int(11) NOT NULL,
  `Apr11` int(11) NOT NULL,
  `Apr18` int(11) NOT NULL,
  `Apr25` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Friday2PM`
--

INSERT INTO `Friday2PM` (`Name`, `Jan10`, `Jan17`, `Jan24`, `Jan31`, `Feb07`, `Feb14`, `Feb21`, `Feb28`, `Mar07`, `Mar14`, `Mar21`, `Mar28`, `Apr04`, `Apr11`, `Apr18`, `Apr25`) VALUES
('Matthew Okscin', 1, 1, 1, 1, 1, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Kelly Graham', 0, 0, 0, 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Kaitlin Beegle (M)', 2, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Jessica Trager (M)', 1, 3, 1, 1, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Connor Goddard', 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Katherine Gilmore (M)', 3, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Pedro Henrique Ribeiro Morais Silva (M)', 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Jack Corry', 0, 0, 0, 0, 4, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Catherine Civgin', 0, 0, 0, 0, 4, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Tullia Lieb (M)', 0, 0, 0, 0, 4, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Kassidy MacPhail (M)', 0, 0, 0, 0, 4, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Franziska Neumann', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Friday3PM`
--

CREATE TABLE IF NOT EXISTS `Friday3PM` (
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Jan10` int(11) NOT NULL,
  `Jan17` int(11) NOT NULL,
  `Jan24` int(11) NOT NULL,
  `Jan31` int(11) NOT NULL,
  `Feb07` int(11) NOT NULL,
  `Feb14` int(11) NOT NULL,
  `Feb21` int(11) NOT NULL,
  `Feb28` int(11) NOT NULL,
  `Mar07` int(11) NOT NULL,
  `Mar14` int(11) NOT NULL,
  `Mar21` int(11) NOT NULL,
  `Mar28` int(11) NOT NULL,
  `Apr04` int(11) NOT NULL,
  `Apr11` int(11) NOT NULL,
  `Apr18` int(11) NOT NULL,
  `Apr25` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Friday3PM`
--

INSERT INTO `Friday3PM` (`Name`, `Jan10`, `Jan17`, `Jan24`, `Jan31`, `Feb07`, `Feb14`, `Feb21`, `Feb28`, `Mar07`, `Mar14`, `Mar21`, `Mar28`, `Apr04`, `Apr11`, `Apr18`, `Apr25`) VALUES
('James Roselle', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Shilpa Taneja', 0, 0, 0, 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Catherine Dello Russ', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Samantha Bell (M)', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Anthony Pulido', 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Lauren Baranowski', 0, 0, 0, 0, 4, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Nicholas Haberli (M)', 0, 0, 0, 0, 4, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Ashley Abaunza (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Friday4PM`
--

CREATE TABLE IF NOT EXISTS `Friday4PM` (
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Jan10` int(11) NOT NULL,
  `Jan17` int(11) NOT NULL,
  `Jan24` int(11) NOT NULL,
  `Jan31` int(11) NOT NULL,
  `Feb07` int(11) NOT NULL,
  `Feb14` int(11) NOT NULL,
  `Feb21` int(11) NOT NULL,
  `Feb28` int(11) NOT NULL,
  `Mar07` int(11) NOT NULL,
  `Mar14` int(11) NOT NULL,
  `Mar21` int(11) NOT NULL,
  `Mar28` int(11) NOT NULL,
  `Apr04` int(11) NOT NULL,
  `Apr11` int(11) NOT NULL,
  `Apr18` int(11) NOT NULL,
  `Apr25` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Friday4PM`
--

INSERT INTO `Friday4PM` (`Name`, `Jan10`, `Jan17`, `Jan24`, `Jan31`, `Feb07`, `Feb14`, `Feb21`, `Feb28`, `Mar07`, `Mar14`, `Mar21`, `Mar28`, `Apr04`, `Apr11`, `Apr18`, `Apr25`) VALUES
('Elaine Bertolini', 1, 2, 1, 1, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Matthew Trigger', 1, 1, 3, 2, 1, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Matt Bzdel', 0, 0, 0, 4, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Megan Conlin', 0, 0, 0, 4, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Franziska Neumann', 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Friday10AM`
--

CREATE TABLE IF NOT EXISTS `Friday10AM` (
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Jan10` int(11) NOT NULL,
  `Jan17` int(11) NOT NULL,
  `Jan24` int(11) NOT NULL,
  `Jan31` int(11) NOT NULL,
  `Feb07` int(11) NOT NULL,
  `Feb14` int(11) NOT NULL,
  `Feb21` int(11) NOT NULL,
  `Feb28` int(11) NOT NULL,
  `Mar07` int(11) NOT NULL,
  `Mar14` int(11) NOT NULL,
  `Mar21` int(11) NOT NULL,
  `Mar28` int(11) NOT NULL,
  `Apr04` int(11) NOT NULL,
  `Apr11` int(11) NOT NULL,
  `Apr18` int(11) NOT NULL,
  `Apr25` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Friday10AM`
--

INSERT INTO `Friday10AM` (`Name`, `Jan10`, `Jan17`, `Jan24`, `Jan31`, `Feb07`, `Feb14`, `Feb21`, `Feb28`, `Mar07`, `Mar14`, `Mar21`, `Mar28`, `Apr04`, `Apr11`, `Apr18`, `Apr25`) VALUES
('Caroline Claxton', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Angela Vallillo', 2, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Matthew Clamp', 1, 1, 1, 1, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Anna Jeong (M)', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Sarah Nodine (M)', 1, 2, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Ariel McDonnell (M)', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Sarah Zhukovsky', 0, 0, 0, 0, 4, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Tim Driscoll', 0, 0, 0, 0, 4, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Evan Noyes', 0, 0, 0, 0, 4, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Elliott Mueller (M)', 0, 0, 0, 0, 4, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Jessica Lewis (M)', 0, 0, 0, 0, 4, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Eryn Nakashima (M)', 0, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Ashley Abaunza (M)', 0, 0, 0, 0, 0, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Friday11AM`
--

CREATE TABLE IF NOT EXISTS `Friday11AM` (
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Jan10` int(11) NOT NULL,
  `Jan17` int(11) NOT NULL,
  `Jan24` int(11) NOT NULL,
  `Jan31` int(11) NOT NULL,
  `Feb07` int(11) NOT NULL,
  `Feb14` int(11) NOT NULL,
  `Feb21` int(11) NOT NULL,
  `Feb28` int(11) NOT NULL,
  `Mar07` int(11) NOT NULL,
  `Mar14` int(11) NOT NULL,
  `Mar21` int(11) NOT NULL,
  `Mar28` int(11) NOT NULL,
  `Apr04` int(11) NOT NULL,
  `Apr11` int(11) NOT NULL,
  `Apr18` int(11) NOT NULL,
  `Apr25` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Friday11AM`
--

INSERT INTO `Friday11AM` (`Name`, `Jan10`, `Jan17`, `Jan24`, `Jan31`, `Feb07`, `Feb14`, `Feb21`, `Feb28`, `Mar07`, `Mar14`, `Mar21`, `Mar28`, `Apr04`, `Apr11`, `Apr18`, `Apr25`) VALUES
('Kimberly Hersch', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Anastasia Nelson', 1, 1, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Sam Rutzick', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Molly Kennelly (M)', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Andrea Zatorski (M)', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Kelly Graham', 0, 0, 0, 0, 4, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Maxwell Dammeier', 0, 0, 0, 0, 4, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Taylor Aguilar (M)', 0, 0, 0, 0, 4, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Friday12PM`
--

CREATE TABLE IF NOT EXISTS `Friday12PM` (
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Jan10` int(11) NOT NULL,
  `Jan17` int(11) NOT NULL,
  `Jan24` int(11) NOT NULL,
  `Jan31` int(11) NOT NULL,
  `Feb07` int(11) NOT NULL,
  `Feb14` int(11) NOT NULL,
  `Feb21` int(11) NOT NULL,
  `Feb28` int(11) NOT NULL,
  `Mar07` int(11) NOT NULL,
  `Mar14` int(11) NOT NULL,
  `Mar21` int(11) NOT NULL,
  `Mar28` int(11) NOT NULL,
  `Apr04` int(11) NOT NULL,
  `Apr11` int(11) NOT NULL,
  `Apr18` int(11) NOT NULL,
  `Apr25` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Friday12PM`
--

INSERT INTO `Friday12PM` (`Name`, `Jan10`, `Jan17`, `Jan24`, `Jan31`, `Feb07`, `Feb14`, `Feb21`, `Feb28`, `Mar07`, `Mar14`, `Mar21`, `Mar28`, `Apr04`, `Apr11`, `Apr18`, `Apr25`) VALUES
('Daniel LaBove', 1, 1, 3, 1, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Tessa Berliner', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Stephanie Efrosman', 1, 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Hannah Becker', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Sarah Wang', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Dan Humphrey', 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Daniel Mahoney', 0, 0, 0, 0, 4, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `GuideList`
--

CREATE TABLE IF NOT EXISTS `GuideList` (
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `completed` int(11) NOT NULL,
  `missed` int(11) NOT NULL,
  `EmailLevel` int(11) NOT NULL,
  `Shadowed` int(11) NOT NULL,
  `WelcomeDay` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `TrainingAttendance` int(11) NOT NULL,
  `WelcomeDayAttendance` int(11) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `GuideList`
--

INSERT INTO `GuideList` (`Name`, `completed`, `missed`, `EmailLevel`, `Shadowed`, `WelcomeDay`, `TrainingAttendance`, `WelcomeDayAttendance`) VALUES
('Megan Aspray', 7, 0, 0, 0, 'February 8', 1, 1),
('Nicholas Viviano', 2, 1, 1, 0, 'February 9', 1, 1),
('Andrew Cameron', 7, 0, 0, 0, 'February 8', 1, 0),
('Cameret Bannister', 7, 0, 0, 0, 'February 9', 1, 1),
('Dan Humphrey', 10, 0, 0, 0, 'February 8', 1, 0),
('Laura Setton', 6, 0, 0, 0, 'February 9', 1, 1),
('Tricia Akers', 6, 0, 0, 0, '', 1, 0),
('Stephanie Aboulafia', 4, 0, 0, 0, 'February 9', 1, 1),
('Michaela Anang', 7, 0, 0, 0, '', 1, 0),
('Melanie Arenson', 6, 0, 0, 0, 'April 5', 1, 0),
('Emily Aronoff', 7, 0, 0, 0, 'February 8', 1, 1),
('Rachel Ayres', 6, 0, 0, 0, 'April 6', 1, 0),
('Megan Beaver', 21, 1, 1, 0, 'April 6', 1, 0),
('Hannah Becker', 10, 0, 0, 0, 'February 8', 1, 0),
('Terese Berger', 6, 1, 1, 0, '', 1, 0),
('Tessa Berliner', 14, 0, 0, 0, 'February 9', 1, 1),
('Elaine Bertolini', 4, 1, 1, 0, 'April 5', 1, 0),
('Julia Bielecki', 7, 0, 0, 0, 'February 8', 1, 1),
('Jesse Blackwell', 8, 0, 0, 0, 'April 5', 1, 0),
('Cory Bolotsky', 6, 0, 0, 0, 'February 8', 1, 1),
('Andrew Carbonar', 6, 1, 1, 0, 'April 6', 1, 0),
('Sam Carkin', 7, 0, 0, 0, 'April 6', 1, 0),
('Caroline Claxton', 7, 0, 0, 0, 'April 5', 1, 0),
('Alexandra Convertino', 4, 0, 0, 0, 'February 9', 1, 1),
('Jennifer Cordero', 6, 1, 1, 0, 'February 8', 1, 1),
('Sarah Darrow', 7, 0, 0, 0, 'April 6', 1, 0),
('Michael Davis', 5, 1, 1, 0, 'April 5', 1, 0),
('Jennifer Deahl', 8, 0, 0, 0, 'February 9', 1, 1),
('Marissa DeCarlo', 4, 2, 2, 0, '', 1, 0),
('Catherine Dello Russo', 6, 0, 0, 0, 'April 6', 1, 0),
('Rose DeMaio', 7, 0, 0, 0, 'April 6', 1, 0),
('Callan Dodge deBruyn', 11, 0, 0, 0, 'April 5', 1, 0),
('Jocelyn Duran', 6, 1, 1, 0, 'April 6', 1, 0),
('Stephanie Efrosman', 6, 0, 0, 0, '', 1, 0),
('Connor Elkhill', 7, 0, 0, 0, '', 1, 0),
('Drew Finnell', 16, 0, 0, 0, '', 1, 0),
('Marissa Fiorello', 6, 1, 1, 0, 'April 6', 1, 0),
('Daniel Flannery', 8, 0, 0, 0, 'February 9', 1, 1),
('Briana Flynn', 5, 0, 0, 0, 'April 6', 1, 0),
('Elizabeth Folan', 9, 1, 1, 0, '', 1, 1),
('Hilary Gabso', 7, 0, 0, 0, '', 1, 0),
('Shalayah Gaines', 6, 1, 1, 0, 'February 8', 1, 1),
('Basia Gordon', 6, 0, 0, 0, '', 1, 0),
('Stratford Goto', 7, 0, 0, 0, 'February 8', 1, 1),
('Alex Gottlieb', 10, 0, 0, 0, '', 1, 0),
('Jackie Graff', 5, 0, 0, 0, 'February 9', 1, 1),
('Jordyn Hanover', 6, 0, 0, 0, 'February 8', 1, 1),
('Andrew Havasy', 0, 2, 2, 0, '', 0, 0),
('Kimberly Hersch', 8, 0, 0, 0, 'February 9', 1, 1),
('Minh Hoang', 6, 0, 0, 0, 'April 5', 1, 0),
('Katherine Hudson', 7, 0, 0, 0, 'April 5', 1, 0),
('Dan Humphrey', 10, 0, 0, 0, 'February 8', 1, 0),
('Sora Hwang', 7, 0, 0, 0, 'April 5', 1, 0),
('Wanyi Jin', 2, 2, 2, 0, 'February 9', 1, 1),
('Ally Johansen', 5, 0, 0, 0, 'April 6', 1, 0),
('Daniel LaBove', 5, 2, 2, 0, 'April 6', 1, 0),
('Elie Low', 5, 0, 0, 0, 'February 9', 1, 1),
('Kate Lawler', 9, 0, 0, 0, 'February 8', 1, 0),
('John Leo', 5, 1, 1, 0, 'February 9', 1, 1),
('Sonia Lin', 5, 0, 0, 0, 'April 6', 1, 0),
('Lacey Loomer', 8, 0, 0, 0, 'February 8', 1, 0),
('Lina Lopez Lalinde', 8, 0, 0, 0, '', 1, 0),
('Madison Malatesta', 6, 0, 0, 0, 'February 8', 1, 1),
('Alison McClearn', 7, 0, 0, 0, 'February 8', 1, 1),
('Maggie McGuire', 13, 0, 0, 1, 'April 5', 1, 0),
('Madeline McKenna', 6, 0, 0, 0, 'February 9', 1, 0),
('Jessica Mertens', 8, 0, 0, 0, 'April 6', 1, 0),
('Ian Metivier', 6, 0, 0, 0, 'February 8', 1, 1),
('Xander Miller', 9, 0, 0, 0, 'February 9', 1, 1),
('Rachel Moburg', 6, 0, 0, 0, 'April 5', 0, 0),
('Anthony Moffa', 3, 0, 0, 0, '', 1, 0),
('Annika Morgan', 3, 0, 0, 0, 'February 9', 1, 1),
('Jessica Morris', 6, 1, 1, 0, 'April 5', 1, 0),
('Trevor Zwick', 5, 1, 1, 0, '', 0, 0),
('Elizabeth Nadeau', 10, 4, 4, 0, '', 1, 0),
('Anastasia Nelson', 6, 1, 1, 0, '', 1, 0),
('Allison Ngan', 8, 0, 0, 0, 'April 5', 1, 0),
('Jordan Nissen', 6, 0, 0, 0, 'February 8', 1, 1),
('Matthew Okscin', 4, 1, 1, 0, 'April 5', 1, 0),
('Madeline Olsen', 7, 0, 0, 0, 'February 9', 1, 0),
('Hannah Ostwald', 6, 0, 0, 0, 'February 8', 1, 1),
('Sarayu Padmanabhan', 0, 0, 0, 0, '', 0, 0),
('Carl Palad', 6, 0, 0, 0, 'February 8', 1, 1),
('Meredith Parmalee', 6, 0, 0, 0, 'April 6', 1, 0),
('Rosalie Philpot', 0, 4, 4, 0, '', 0, 0),
('Alyssa Pratt', 3, 0, 0, 0, 'February 9', 1, 1),
('Samantha Ratner', 5, 1, 1, 0, 'April 5', 1, 0),
('Jose Roman', 7, 0, 0, 0, '', 1, 0),
('James Roselle', 6, 0, 0, 0, 'February 8', 1, 1),
('Jaclyn Rubin', 7, 1, 1, 0, 'April 5', 1, 0),
('Sam Rutzick', 16, 0, 0, 0, '', 1, 0),
('Rachel Shapiro', 7, 0, 0, 0, 'April 6', 1, 0),
('Sadaf Sekarkhand', 10, 2, 2, 0, 'April 5', 1, 0),
('Maggie Soto', 7, 0, 0, 0, 'April 6', 1, 0),
('Elizabeth Sousa', 5, 1, 1, 0, '', 1, 0),
('Courtney Stefanik', 7, 0, 0, 0, 'February 8', 1, 0),
('Justine Steinberger', 6, 0, 0, 0, 'February 9', 1, 1),
('Melissa Templeton', 8, 0, 0, 0, 'February 8', 1, 0),
('Paige Trayer', 5, 0, 0, 0, '', 1, 0),
('Angela Vallillo', 7, 0, 0, 0, 'April 5', 1, 0),
('Joseph Volgraf', 7, 0, 0, 0, 'April 6', 0, 0),
('Maura Wade', 10, 0, 0, 0, 'April 6', 1, 0),
('Shanna Wall', 7, 2, 2, 0, 'February 8', 1, 1),
('Sarah Wang', 7, 0, 0, 0, 'February 8', 1, 1),
('Rachel Weiss', 5, 1, 1, 0, '', 1, 0),
('Katie Wong', 5, 1, 1, 0, 'April 5', 0, 0),
('Aaron Yagoda', 7, 0, 0, 1, '', 1, 0),
('Kevin Yang', 0, 2, 2, 0, '', 0, 0),
('Rachel Yates', 5, 0, 0, 0, 'April 6', 1, 0),
('Ashley Young', 7, 0, 0, 0, 'February 9', 1, 1),
('Nyera Youssef', 8, 0, 0, 0, '', 1, 0),
('Kelsey Zielinski', 9, 0, 0, 0, 'February 9', 1, 0),
('Matthew Clamp', 9, 0, 0, 1, 'April 5', 1, 0),
('Kaitlin Beegle (M)', 8, 1, 1, 2, 'February 8', 1, 0),
('Samantha Bell (M)', 8, 0, 0, 2, 'April 6', 1, 0),
('Benjamin Brady (M)', 13, 0, 0, 3, 'February 8', 1, 0),
('Lindsey Bressler (M)', 15, 0, 0, 2, 'February 9', 1, 0),
('Tyler Cole (M)', 10, 1, 1, 1, 'February 8', 1, 0),
('Jonathan Corriveau (M)', 7, 0, 0, 1, 'February 8', 1, 0),
('Julianna Covino (M)', 10, 1, 1, 0, 'April 6', 1, 0),
('Emily Feltault (M)', 8, 0, 0, 2, 'February 9', 1, 0),
('Lee Haggerty (M)', 8, 0, 0, 2, 'April 6', 1, 0),
('Morgan Helfman (M)', 8, 0, 0, 2, 'February 9', 1, 0),
('Pedro Henrique Ribeiro Morais Silva (M) ', 9, 0, 0, 1, 'February 8', 1, 0),
('Anna Jeong (M)', 13, 1, 1, 1, 'February 9', 1, 0),
('Molly Kennelly (M)', 7, 0, 0, 2, 'April 5', 1, 0),
('Asama Lekbua (M)', 9, 1, 1, 2, 'April 5', 1, 0),
('Katherine Masterson (M) ', 7, 0, 0, 2, 'April 5', 1, 0),
('Thomas Mattera (M)', 13, 0, 0, 2, 'April 5', 1, 0),
('Ariel McDonnell (M)', 7, 0, 0, 1, 'February 8', 1, 0),
('Serena Mozafari (M)', 3, 2, 2, 1, 'February 9', 1, 0),
('Sarah Nodine (M)', 12, 0, 0, 2, 'February 8', 1, 0),
('Michelle Reichman (M)', 5, 1, 1, 0, 'February 9', 1, 0),
('Jessica Trager (M)', 5, 1, 1, 2, 'February 9', 1, 1),
('Bryce Turner (M)', 16, 0, 0, 3, 'April 5', 1, 0),
('Claudia Vilcu (M)', 6, 0, 0, 2, 'April 6', 1, 0),
('Logan Wells (M)', 7, 0, 0, 2, 'February 8', 1, 0),
('Bryce Wynn (M)', 10, 1, 1, 1, '', 1, 0),
('Andrea Zatorski (M)', 14, 0, 0, 2, 'February 9', 1, 0),
('Matthew Trigger', 3, 1, 1, 0, 'April 5', 1, 0),
('Stephanie Roberts', 6, 0, 0, 0, 'February 8', 1, 1),
('Connor Goddard', 6, 0, 0, 0, '', 1, 0),
('Stephanie Wasiuk (M)', 7, 0, 0, 1, 'April 6', 1, 0),
('Mary Solomon', 4, 0, 0, 0, '', 1, 0),
('Alexander Rand-Lewis', 4, 2, 2, 0, '', 1, 0),
('Katherine Gilmore (M)', 4, 0, 0, 1, 'February 8', 1, 0),
('Nicholas Paranello', 3, 3, 3, 0, 'April 6', 0, 0),
('Lilly Stairs', 5, 0, 0, 0, 'February 9', 1, 1),
('Libby Bernier', 5, 0, 0, 0, 'April 5', 1, 0),
('Amelia Kulik', 5, 0, 0, 0, '', 1, 0),
('Michael Stent', 5, 0, 0, 0, 'February 9', 1, 1),
('Victoria Vilches', 5, 2, 2, 0, 'February 9', 1, 1),
('Joshua Belinsky (M)', 3, 1, 1, 0, 'April 6', 1, 0),
('Maria Van Thienen (M)', 5, 1, 1, 1, 'April 6', 1, 0),
('Jake McKnight (M)', 11, 1, 1, 3, 'February 8', 1, 0),
('Alicia Guyton (M)', 3, 2, 2, 0, 'February 8', 1, 0),
('Anthony Pulido', 5, 0, 0, 0, 'April 5', 1, 0),
('Zoe Rudman', 4, 1, 1, 0, 'April 5', 1, 0),
('Derrick Fung', 6, 0, 0, 0, 'April 6', 1, 0),
('Kelli Ann Lynch', 4, 1, 1, 0, 'February 9', 1, 1),
('Christopher Jelly', 5, 0, 0, 0, 'April 5', 1, 0),
('Audrey Van Zee', 0, 0, 0, 0, '', 0, 0),
('Katherine Chrunyk', 3, 0, 0, 0, 'February 9', 1, 1),
('Tim Driscoll', 2, 2, 2, 0, 'February 9', 1, 0),
('Shilpa Taneja', 2, 0, 0, 0, 'April 5', 1, 0),
('Elyse Crescitelli', 0, 2, 2, 0, '', 1, 0),
('Evan Noyes', 5, 0, 0, 1, 'April 5', 1, 0),
('Megan Conlin', 2, 0, 0, 0, 'April 6', 1, 0),
('Katherine Au', 0, 0, 0, 0, 'February 9', 1, 0),
('Rebecca Sirull', 0, 1, 1, 1, 'April 5', 1, 0),
('Lauren Baranowski', 4, 1, 1, 0, 'April 5', 1, 0),
('Jack Corry', 3, 1, 1, 1, '', 1, 0),
('Catherine Civgin', 2, 0, 0, 1, '', 1, 0),
('Sarah Printy', 2, 0, 0, 0, 'February 8', 1, 0),
('Kelly Graham', 4, 0, 0, 1, 'April 5', 1, 0),
('Franziska Neumann', 3, 0, 0, 1, 'April 5', 1, 0),
('Michael Lucarello', 1, 0, 0, 1, 'April 5', 1, 0),
('Matt Bzdel', 3, 1, 1, 0, 'February 8', 1, 0),
('Mitchell Gruber', 2, 0, 0, 1, '', 1, 0),
('Edward Pizzo', 2, 0, 0, 0, 'April 6', 1, 0),
('Crystal Oseagulu', 0, 0, 0, 0, '', 1, 0),
('Leah Ewall-Wice', 1, 1, 1, 1, 'April 6', 1, 0),
('Maxwell Dammeier', 4, 2, 2, 0, '', 1, 0),
('Karlayne Powell', 1, 1, 1, 1, '', 1, 0),
('Sarah Preputnik', 3, 0, 0, 0, 'February 9', 1, 0),
('Jennifer Vildzius', 0, 0, 0, 1, 'April 6', 1, 0),
('Aleksandra Jakobsze', 2, 0, 0, 0, '', 1, 0),
('Daniel Mahoney', 3, 1, 1, 1, 'April 6', 1, 0),
('Mackenzie Heiser', 0, 0, 0, 0, 'April 5', 1, 0),
('Stacey Anderson', 1, 0, 0, 1, 'April 5', 1, 0),
('Nilay Rego', 3, 1, 1, 0, '', 1, 0),
('Sarah Zhukovsky', 3, 0, 0, 1, '', 1, 0),
('Sherri Furtado', 3, 1, 1, 1, '', 1, 0),
('David Kalenjian', 1, 1, 1, 2, 'April 5', 1, 0),
('Alexander Sousa', 2, 0, 0, 1, 'April 6', 1, 0),
('Michael Deitz (M)', 4, 0, 0, 0, '', 1, 0),
('Tullia Lieb (M)', 2, 2, 2, 0, 'February 8', 1, 0),
('Matthew Dunn (M)', 4, 0, 0, 0, 'February 9', 1, 0),
('Justin Hewitt (M)', 8, 0, 0, 0, 'April 6', 1, 0),
('Taylor Imburgia (M)', 4, 0, 0, 0, 'February 8', 1, 0),
('Kassidy MacPhail (M)', 4, 0, 0, 0, 'February 9', 1, 0),
('Stacey Rosenfeld (M)', 3, 0, 0, 0, 'February 8', 1, 0),
('Howard Cheung (M)', 4, 0, 0, 0, 'February 9', 1, 0),
('Kathleen Mullany (M)', 0, 0, 0, 0, 'April 5', 1, 0),
('Matthew Robbertz (M)', 3, 1, 1, 0, 'February 9', 1, 0),
('Jessica Darfoor (M)', 3, 0, 0, 0, 'February 9', 1, 0),
('Sarah Zaatar (M)', 2, 1, 1, 0, 'April 5', 1, 0),
('Tavia Allen (M)', 3, 0, 0, 0, 'February 9', 1, 0),
('Emma Parrish (M)', 4, 0, 0, 0, '', 1, 0),
('Anastasia Scourtes (M)', 4, 0, 0, 0, 'April 6', 1, 0),
('Taylor Aguilar (M)', 6, 0, 0, 0, 'February 8', 1, 0),
('Elliot Mueller (M)', 0, 0, 0, 0, 'April 5', 1, 0),
('Eryn Nakashima (M)', 3, 1, 1, 0, '', 1, 0),
('Carl Uchytil (M)', 4, 0, 0, 0, 'April 5', 1, 0),
('Christopher Demirdogen (M)', 4, 0, 0, 0, 'April 6', 1, 0),
('Patricia Rudy (M)', 3, 1, 1, 0, '', 1, 0),
('Jessica Lewis (M)', 4, 1, 1, 0, 'February 9', 1, 0),
('Ashley Abaunza (M)', 2, 2, 2, 0, 'April 5', 1, 0),
('Anjali Mehta (M)', 3, 0, 0, 0, 'February 9', 1, 0),
('Mary Eckert (M)', 4, 0, 0, 0, '', 1, 0),
('Oliver Fishstein', 0, 0, 0, 0, 'February 9', 1, 0),
('Nicholas Haberli', 0, 0, 0, 0, '', 1, 0),
('Priya Prabakaran (M)', 2, 0, 0, 0, 'February 8', 1, 0),
('Caleb Mansfield', 3, 1, 1, 0, 'February 8', 1, 1),
('Michael Lucarello', 0, 0, 0, 0, '', 0, 0),
('Tricia Hunter', 1, 0, 0, 0, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `intersession2014`
--

CREATE TABLE IF NOT EXISTS `intersession2014` (
  `uid` int(11) NOT NULL,
  `daytime_id` int(11) NOT NULL,
  `tour_type` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MasterRoster2014`
--

CREATE TABLE IF NOT EXISTS `MasterRoster2014` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `LastName` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `FirstName` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `FullName` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `Hometown` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `State` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Country` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `Gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `HighSchool` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `Major` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `College` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `GraduationYear` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PhoneNumber` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SemesterStarted` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Ethnicity` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `TrainedOnIV` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `TrainedOnAthletics` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `HereInFall` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=238 ;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(65) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(65) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `username`, `password`, `role`) VALUES
(2, 'slc', 'dd402be8d85dbc2442d7591a6f46978b', 'SLC'),
(3, 'parttimer', 'd32d8727197a38bf51d0aaea1ac4cb6a', 'parttimer'),
(4, 'ha', '3093b7b0bde0a9e5d620430a2acf944c', 'member'),
(5, 'leadership', '8e918f1a74928a1c58d47dd5031099f0', 'leadership');

-- --------------------------------------------------------

--
-- Table structure for table `Minglers`
--

CREATE TABLE IF NOT EXISTS `Minglers` (
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `TourSupport` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Minglers`
--

INSERT INTO `Minglers` (`Name`, `TourSupport`) VALUES
('Kaitlin Beegle', 0),
('Joshua Belinsky', 0),
('Samantha Bell', 0),
('Benjamin Brady', 0),
('Lindsey Bressler', 1),
('Tyler Cole', 2),
('Jonathan Corriveau', 0),
('Julianna Covino', 0),
('Emily Feltault', 0),
('Katherine Gilmore', 0),
('Alicia Guyton', 0),
('Lee Haggerty', 1),
('Morgan Helfman', 1),
('Pedro Henrique Ribeiro Morais Silva', 2),
('Anna Jeong', 1),
('Molly Kennelly', 1),
('Asama Lekbua', 2),
('Katherine Masterson', 2),
('Thomas Mattera', 2),
('Ariel McDonnell', 2),
('Jake McKnight', 2),
('Serena Mozafari', 0),
('Sarah Nodine', 1),
('Priya Prabakaran', 0),
('Michelle Reichman', 0),
('Jessica Trager', 0),
('Bryce Turner', 0),
('Maria Van Thienen', 0),
('Claudia Vilcu', 0),
('Stephanie Wasiuk', 1),
('Logan Wells', 0),
('Bryce Wynn', 0),
('Andrea Zatorski', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Monday2PM`
--

CREATE TABLE IF NOT EXISTS `Monday2PM` (
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Jan06` int(11) NOT NULL,
  `Jan13` int(11) NOT NULL,
  `Jan20` int(11) NOT NULL,
  `Jan27` int(11) NOT NULL,
  `Feb03` int(11) NOT NULL,
  `Feb10` int(11) NOT NULL,
  `Feb17` int(11) NOT NULL,
  `Feb24` int(11) NOT NULL,
  `Mar03` int(11) NOT NULL,
  `Mar10` int(11) NOT NULL,
  `Mar17` int(11) NOT NULL,
  `Mar24` int(11) NOT NULL,
  `Mar31` int(11) NOT NULL,
  `Apr07` int(11) NOT NULL,
  `Apr14` int(11) NOT NULL,
  `Apr21` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Monday2PM`
--

INSERT INTO `Monday2PM` (`Name`, `Jan06`, `Jan13`, `Jan20`, `Jan27`, `Feb03`, `Feb10`, `Feb17`, `Feb24`, `Mar03`, `Mar10`, `Mar17`, `Mar24`, `Mar31`, `Apr07`, `Apr14`, `Apr21`) VALUES
('Jesse Blackwell', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Alison McClearn', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Jackie Graff', 3, 1, 1, 1, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Katherine Masterson (M) ', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Thomas Mattera (M)', 3, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Maria Van Thienen (M)', 0, 1, 1, 1, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Matt Bzdel', 0, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Caleb Mansfield', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Taylor Aguilar (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Christopher Demirdogen (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Jessica Lewis (M)', 0, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Matthew Robbertz (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Tullia Lieb (M)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Monday3PM`
--

CREATE TABLE IF NOT EXISTS `Monday3PM` (
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Jan06` int(11) NOT NULL,
  `Jan13` int(11) NOT NULL,
  `Jan20` int(11) NOT NULL,
  `Jan27` int(11) NOT NULL,
  `Feb03` int(11) NOT NULL,
  `Feb10` int(11) NOT NULL,
  `Feb17` int(11) NOT NULL,
  `Feb24` int(11) NOT NULL,
  `Mar03` int(11) NOT NULL,
  `Mar10` int(11) NOT NULL,
  `Mar17` int(11) NOT NULL,
  `Mar24` int(11) NOT NULL,
  `Mar31` int(11) NOT NULL,
  `Apr07` int(11) NOT NULL,
  `Apr14` int(11) NOT NULL,
  `Apr21` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Monday3PM`
--

INSERT INTO `Monday3PM` (`Name`, `Jan06`, `Jan13`, `Jan20`, `Jan27`, `Feb03`, `Feb10`, `Feb17`, `Feb24`, `Mar03`, `Mar10`, `Mar17`, `Mar24`, `Mar31`, `Apr07`, `Apr14`, `Apr21`) VALUES
('Callan Dodge deBruyn', 1, 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Meredith Parmalee', 1, 1, 2, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Elizabeth Nadeau', 3, 1, 3, 1, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Morgan Helfman (M)', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Victoria Vilches', 0, 1, 3, 1, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Tim Driscoll', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Maxwell Dammeier', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Howard Cheung (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Monday4PM`
--

CREATE TABLE IF NOT EXISTS `Monday4PM` (
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Jan06` int(11) NOT NULL,
  `Jan13` int(11) NOT NULL,
  `Jan20` int(11) NOT NULL,
  `Jan27` int(11) NOT NULL,
  `Feb03` int(11) NOT NULL,
  `Feb10` int(11) NOT NULL,
  `Feb17` int(11) NOT NULL,
  `Feb24` int(11) NOT NULL,
  `Mar03` int(11) NOT NULL,
  `Mar10` int(11) NOT NULL,
  `Mar17` int(11) NOT NULL,
  `Mar24` int(11) NOT NULL,
  `Mar31` int(11) NOT NULL,
  `Apr07` int(11) NOT NULL,
  `Apr14` int(11) NOT NULL,
  `Apr21` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Monday4PM`
--

INSERT INTO `Monday4PM` (`Name`, `Jan06`, `Jan13`, `Jan20`, `Jan27`, `Feb03`, `Feb10`, `Feb17`, `Feb24`, `Mar03`, `Mar10`, `Mar17`, `Mar24`, `Mar31`, `Apr07`, `Apr14`, `Apr21`) VALUES
('Jessica Mertens', 3, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Anthony Moffa', 0, 1, 2, 1, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Callan Dodge deBruyn', 0, 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Aleksandra Jakobsze', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Monday10AM`
--

CREATE TABLE IF NOT EXISTS `Monday10AM` (
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Jan06` int(11) NOT NULL,
  `Jan13` int(11) NOT NULL,
  `Jan20` int(11) NOT NULL,
  `Jan27` int(11) NOT NULL,
  `Feb03` int(11) NOT NULL,
  `Feb10` int(11) NOT NULL,
  `Feb17` int(11) NOT NULL,
  `Feb24` int(11) NOT NULL,
  `Mar03` int(11) NOT NULL,
  `Mar10` int(11) NOT NULL,
  `Mar17` int(11) NOT NULL,
  `Mar24` int(11) NOT NULL,
  `Mar31` int(11) NOT NULL,
  `Apr07` int(11) NOT NULL,
  `Apr14` int(11) NOT NULL,
  `Apr21` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Monday10AM`
--

INSERT INTO `Monday10AM` (`Name`, `Jan06`, `Jan13`, `Jan20`, `Jan27`, `Feb03`, `Feb10`, `Feb17`, `Feb24`, `Mar03`, `Mar10`, `Mar17`, `Mar24`, `Mar31`, `Apr07`, `Apr14`, `Apr21`) VALUES
('Megan Aspray', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Xander Miller', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Lindsey Bressler (M)', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Jonathan Corriveau (M)', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Cameret Bannister', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Elliott Mueller (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Nilay Rego', 0, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Tavia Allen (M)', 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Anastasia Scourtes (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Jake McKnight (M)', 0, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Monday11AM`
--

CREATE TABLE IF NOT EXISTS `Monday11AM` (
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Jan06` int(11) NOT NULL,
  `Jan13` int(11) NOT NULL,
  `Jan20` int(11) NOT NULL,
  `Jan27` int(11) NOT NULL,
  `Feb03` int(11) NOT NULL,
  `Feb10` int(11) NOT NULL,
  `Feb17` int(11) NOT NULL,
  `Feb24` int(11) NOT NULL,
  `Mar03` int(11) NOT NULL,
  `Mar10` int(11) NOT NULL,
  `Mar17` int(11) NOT NULL,
  `Mar24` int(11) NOT NULL,
  `Mar31` int(11) NOT NULL,
  `Apr07` int(11) NOT NULL,
  `Apr14` int(11) NOT NULL,
  `Apr21` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Monday11AM`
--

INSERT INTO `Monday11AM` (`Name`, `Jan06`, `Jan13`, `Jan20`, `Jan27`, `Feb03`, `Feb10`, `Feb17`, `Feb24`, `Mar03`, `Mar10`, `Mar17`, `Mar24`, `Mar31`, `Apr07`, `Apr14`, `Apr21`) VALUES
('Andrew Cameron', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Aaron Yagoda', 1, 1, 1, 1, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Bryce Turner (M)', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Alexander Rand-Lewis', 0, 1, 3, 1, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Wanyi Jin', 0, 0, 0, 0, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Katie Au', 0, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Jessica Darfoor (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Monday12PM`
--

CREATE TABLE IF NOT EXISTS `Monday12PM` (
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Jan06` int(11) NOT NULL,
  `Jan13` int(11) NOT NULL,
  `Jan20` int(11) NOT NULL,
  `Jan27` int(11) NOT NULL,
  `Feb03` int(11) NOT NULL,
  `Feb10` int(11) NOT NULL,
  `Feb17` int(11) NOT NULL,
  `Feb24` int(11) NOT NULL,
  `Mar03` int(11) NOT NULL,
  `Mar10` int(11) NOT NULL,
  `Mar17` int(11) NOT NULL,
  `Mar24` int(11) NOT NULL,
  `Mar31` int(11) NOT NULL,
  `Apr07` int(11) NOT NULL,
  `Apr14` int(11) NOT NULL,
  `Apr21` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Monday12PM`
--

INSERT INTO `Monday12PM` (`Name`, `Jan06`, `Jan13`, `Jan20`, `Jan27`, `Feb03`, `Feb10`, `Feb17`, `Feb24`, `Mar03`, `Mar10`, `Mar17`, `Mar24`, `Mar31`, `Apr07`, `Apr14`, `Apr21`) VALUES
('Shalayah Gaines', 1, 1, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Drew Finnell', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Megan Beaver', 1, 1, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Trevor Zwick', 0, 1, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Christopher Jelly', 0, 0, 1, 2, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Sarah Preputnik', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Sherri Furtado', 0, 0, 0, 0, 0, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Saturday3PM`
--

CREATE TABLE IF NOT EXISTS `Saturday3PM` (
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `01/25` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Saturday3PM`
--

INSERT INTO `Saturday3PM` (`Name`, `01/25`) VALUES
('Matthew Clamp', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Saturday10AM`
--

CREATE TABLE IF NOT EXISTS `Saturday10AM` (
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Jan11` int(11) NOT NULL,
  `Jan18` int(11) NOT NULL,
  `Jan25` int(11) NOT NULL,
  `Feb01` int(11) NOT NULL,
  `Feb08` int(11) NOT NULL,
  `Feb15` int(11) NOT NULL,
  `Feb22` int(11) NOT NULL,
  `Feb29` int(11) NOT NULL,
  `Mar08` int(11) NOT NULL,
  `Mar15` int(11) NOT NULL,
  `Mar22` int(11) NOT NULL,
  `Mar29` int(11) NOT NULL,
  `Apr05` int(11) NOT NULL,
  `Apr12` int(11) NOT NULL,
  `Apr19` int(11) NOT NULL,
  `Apr26` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Saturday10AM`
--

INSERT INTO `Saturday10AM` (`Name`, `Jan11`, `Jan18`, `Jan25`, `Feb01`, `Feb08`, `Feb15`, `Feb22`, `Feb29`, `Mar08`, `Mar15`, `Mar22`, `Mar29`, `Apr05`, `Apr12`, `Apr19`, `Apr26`) VALUES
('Cory Bolotsky', 3, 2, 1, 1, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Tessa Berliner', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Ian Metivier', 1, 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Drew Finnell', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Stratford Goto', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Anna Jeong (M)', 1, 1, 1, 0, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Kaitlin Beegle (M)', 2, 2, 1, 1, 3, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Asama Lekbua (M)', 1, 2, 1, 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Kelli Ann Lynch', 0, 1, 1, 2, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Leah Ewall-Wice', 0, 0, 0, 0, 4, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Kassidy MacPhail (M)', 0, 0, 0, 0, 4, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Anjali Mehta (M)', 0, 0, 0, 0, 4, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Emma Parrish (M)', 0, 0, 0, 0, 4, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Stacey Rosenfeld (M)', 0, 0, 0, 0, 4, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Eryn Nakashima (M)', 0, 0, 0, 0, 4, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Saturday11AM`
--

CREATE TABLE IF NOT EXISTS `Saturday11AM` (
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Jan11` int(11) NOT NULL,
  `Jan18` int(11) NOT NULL,
  `Jan25` int(11) NOT NULL,
  `Feb01` int(11) NOT NULL,
  `Feb08` int(11) NOT NULL,
  `Feb15` int(11) NOT NULL,
  `Feb22` int(11) NOT NULL,
  `Feb29` int(11) NOT NULL,
  `Mar08` int(11) NOT NULL,
  `Mar15` int(11) NOT NULL,
  `Mar22` int(11) NOT NULL,
  `Mar29` int(11) NOT NULL,
  `Apr05` int(11) NOT NULL,
  `Apr12` int(11) NOT NULL,
  `Apr19` int(11) NOT NULL,
  `Apr26` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Saturday11AM`
--

INSERT INTO `Saturday11AM` (`Name`, `Jan11`, `Jan18`, `Jan25`, `Feb01`, `Feb08`, `Feb15`, `Feb22`, `Feb29`, `Mar08`, `Mar15`, `Mar22`, `Mar29`, `Apr05`, `Apr12`, `Apr19`, `Apr26`) VALUES
('Marissa DeCarlo', 1, 1, 3, 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Briana Flynn', 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Sarah Printy', 0, 0, 0, 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Allison Ngan', 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Jessica Morris', 3, 1, 1, 1, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Katherine Hudson', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Asama Lekbua (M)', 1, 2, 1, 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Pedro Henrique Ribeiro Morais Silva (M)', 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Nicholas Viviano', 2, 3, 1, 0, 3, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Nicholas Haberli (M)', 0, 0, 0, 0, 4, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Patricia Rudy (M)', 0, 0, 0, 0, 4, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Rebecca Sirull', 0, 0, 0, 0, 3, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Michael Lucarello', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Saturday12PM`
--

CREATE TABLE IF NOT EXISTS `Saturday12PM` (
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Jan11` int(11) NOT NULL,
  `Jan18` int(11) NOT NULL,
  `Jan25` int(11) NOT NULL,
  `Feb01` int(11) NOT NULL,
  `Feb08` int(11) NOT NULL,
  `Feb15` int(11) NOT NULL,
  `Feb22` int(11) NOT NULL,
  `Feb29` int(11) NOT NULL,
  `Mar08` int(11) NOT NULL,
  `Mar15` int(11) NOT NULL,
  `Mar22` int(11) NOT NULL,
  `Mar29` int(11) NOT NULL,
  `Apr05` int(11) NOT NULL,
  `Apr12` int(11) NOT NULL,
  `Apr19` int(11) NOT NULL,
  `Apr26` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Saturday12PM`
--

INSERT INTO `Saturday12PM` (`Name`, `Jan11`, `Jan18`, `Jan25`, `Feb01`, `Feb08`, `Feb15`, `Feb22`, `Feb29`, `Mar08`, `Mar15`, `Mar22`, `Mar29`, `Apr05`, `Apr12`, `Apr19`, `Apr26`) VALUES
('Alexandra Convertino', 3, 2, 1, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Daniel Flannery', 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Dan Humphrey', 3, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Annika Morgan', 3, 1, 1, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Carl Palad', 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Jaclyn Rubin', 1, 1, 1, 0, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Alyssa Pratt', 0, 3, 1, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Stacey Anderson', 0, 0, 0, 0, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Sunday2PM`
--

CREATE TABLE IF NOT EXISTS `Sunday2PM` (
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Sunday2PM`
--

INSERT INTO `Sunday2PM` (`Name`) VALUES
('Testing');

-- --------------------------------------------------------

--
-- Table structure for table `Thursday2PM`
--

CREATE TABLE IF NOT EXISTS `Thursday2PM` (
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Jan09` int(11) NOT NULL,
  `Jan16` int(11) NOT NULL,
  `Jan23` int(11) NOT NULL,
  `Jan30` int(11) NOT NULL,
  `Feb06` int(11) NOT NULL,
  `Feb13` int(11) NOT NULL,
  `Feb20` int(11) NOT NULL,
  `Feb27` int(11) NOT NULL,
  `Mar06` int(11) NOT NULL,
  `Mar13` int(11) NOT NULL,
  `Mar20` int(11) NOT NULL,
  `Mar27` int(11) NOT NULL,
  `Apr03` int(11) NOT NULL,
  `Apr10` int(11) NOT NULL,
  `Apr17` int(11) NOT NULL,
  `Apr24` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Thursday2PM`
--

INSERT INTO `Thursday2PM` (`Name`, `Jan09`, `Jan16`, `Jan23`, `Jan30`, `Feb06`, `Feb13`, `Feb20`, `Feb27`, `Mar06`, `Mar13`, `Mar20`, `Mar27`, `Apr03`, `Apr10`, `Apr17`, `Apr24`) VALUES
('Rachel Moburg', 3, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Madeline Olsen', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Bryce Wynn (M)', 1, 1, 1, 1, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Jack Corry', 0, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Katherine Chrunyk', 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Benjamin Brady (M)', 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Michael Deitz (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Taylor Imburgia (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Justin Hewitt (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Thursday3PM`
--

CREATE TABLE IF NOT EXISTS `Thursday3PM` (
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Jan09` int(11) NOT NULL,
  `Jan16` int(11) NOT NULL,
  `Jan23` int(11) NOT NULL,
  `Jan30` int(11) NOT NULL,
  `Feb06` int(11) NOT NULL,
  `Feb13` int(11) NOT NULL,
  `Feb20` int(11) NOT NULL,
  `Feb27` int(11) NOT NULL,
  `Mar06` int(11) NOT NULL,
  `Mar13` int(11) NOT NULL,
  `Mar20` int(11) NOT NULL,
  `Mar27` int(11) NOT NULL,
  `Apr03` int(11) NOT NULL,
  `Apr10` int(11) NOT NULL,
  `Apr17` int(11) NOT NULL,
  `Apr24` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Thursday3PM`
--

INSERT INTO `Thursday3PM` (`Name`, `Jan09`, `Jan16`, `Jan23`, `Jan30`, `Feb06`, `Feb13`, `Feb20`, `Feb27`, `Mar06`, `Mar13`, `Mar20`, `Mar27`, `Apr03`, `Apr10`, `Apr17`, `Apr24`) VALUES
('Emily Aronoff', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Alex Gottlieb', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Terese Berger', 1, 1, 1, 1, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Stephanie Wasiuk (M)', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Logan Wells (M)', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Nicholas Paranello', 3, 1, 1, 1, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Libby Bernier', 3, 1, 1, 1, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('David Kalenjian', 0, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Matthew Robbertz (M)', 0, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Thursday4PM`
--

CREATE TABLE IF NOT EXISTS `Thursday4PM` (
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Jan09` int(11) NOT NULL,
  `Jan16` int(11) NOT NULL,
  `Jan23` int(11) NOT NULL,
  `Jan30` int(11) NOT NULL,
  `Feb06` int(11) NOT NULL,
  `Feb13` int(11) NOT NULL,
  `Feb20` int(11) NOT NULL,
  `Feb27` int(11) NOT NULL,
  `Mar06` int(11) NOT NULL,
  `Mar13` int(11) NOT NULL,
  `Mar20` int(11) NOT NULL,
  `Mar27` int(11) NOT NULL,
  `Apr03` int(11) NOT NULL,
  `Apr10` int(11) NOT NULL,
  `Apr17` int(11) NOT NULL,
  `Apr24` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Thursday4PM`
--

INSERT INTO `Thursday4PM` (`Name`, `Jan09`, `Jan16`, `Jan23`, `Jan30`, `Feb06`, `Feb13`, `Feb20`, `Feb27`, `Mar06`, `Mar13`, `Mar20`, `Mar27`, `Apr03`, `Apr10`, `Apr17`, `Apr24`) VALUES
('Lina Lopez Lalinde', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Kate Lawler', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Sarah Darrow', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Minh Hoang', 0, 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Thursday10AM`
--

CREATE TABLE IF NOT EXISTS `Thursday10AM` (
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Jan09` int(11) NOT NULL,
  `Jan16` int(11) NOT NULL,
  `Jan23` int(11) NOT NULL,
  `Jan30` int(11) NOT NULL,
  `Feb06` int(11) NOT NULL,
  `Feb13` int(11) NOT NULL,
  `Feb20` int(11) NOT NULL,
  `Feb27` int(11) NOT NULL,
  `Mar06` int(11) NOT NULL,
  `Mar13` int(11) NOT NULL,
  `Mar20` int(11) NOT NULL,
  `Mar27` int(11) NOT NULL,
  `Apr03` int(11) NOT NULL,
  `Apr10` int(11) NOT NULL,
  `Apr17` int(11) NOT NULL,
  `Apr24` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Thursday10AM`
--

INSERT INTO `Thursday10AM` (`Name`, `Jan09`, `Jan16`, `Jan23`, `Jan30`, `Feb06`, `Feb13`, `Feb20`, `Feb27`, `Mar06`, `Mar13`, `Mar20`, `Mar27`, `Apr03`, `Apr10`, `Apr17`, `Apr24`) VALUES
('Melanie Arenson', 2, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Hannah Ostwald', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Ally Johansen', 1, 3, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Lee Haggerty (M)', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Lindsey Bressler (M)', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Oliver Fishstein (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Tavia Allen (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Kathleen Mullaney (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Alexander Sousa', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Thursday11AM`
--

CREATE TABLE IF NOT EXISTS `Thursday11AM` (
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Jan09` int(11) NOT NULL,
  `Jan16` int(11) NOT NULL,
  `Jan23` int(11) NOT NULL,
  `Jan30` int(11) NOT NULL,
  `Feb06` int(11) NOT NULL,
  `Feb13` int(11) NOT NULL,
  `Feb20` int(11) NOT NULL,
  `Feb27` int(11) NOT NULL,
  `Mar06` int(11) NOT NULL,
  `Mar13` int(11) NOT NULL,
  `Mar20` int(11) NOT NULL,
  `Mar27` int(11) NOT NULL,
  `Apr03` int(11) NOT NULL,
  `Apr10` int(11) NOT NULL,
  `Apr17` int(11) NOT NULL,
  `Apr24` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Thursday11AM`
--

INSERT INTO `Thursday11AM` (`Name`, `Jan09`, `Jan16`, `Jan23`, `Jan30`, `Feb06`, `Feb13`, `Feb20`, `Feb27`, `Mar06`, `Mar13`, `Mar20`, `Mar27`, `Apr03`, `Apr10`, `Apr17`, `Apr24`) VALUES
('Sam Carkin', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Jose Roman', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Madison Malatesta', 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Bryce Turner (M)', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Mary Solomon', 3, 3, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Jake McKnight (M)', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Katie Au', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Patricia Rudy (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Thursday12PM`
--

CREATE TABLE IF NOT EXISTS `Thursday12PM` (
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Jan09` int(11) NOT NULL,
  `Jan16` int(11) NOT NULL,
  `Jan23` int(11) NOT NULL,
  `Jan30` int(11) NOT NULL,
  `Feb06` int(11) NOT NULL,
  `Feb13` int(11) NOT NULL,
  `Feb20` int(11) NOT NULL,
  `Feb27` int(11) NOT NULL,
  `Mar06` int(11) NOT NULL,
  `Mar13` int(11) NOT NULL,
  `Mar20` int(11) NOT NULL,
  `Mar27` int(11) NOT NULL,
  `Apr03` int(11) NOT NULL,
  `Apr10` int(11) NOT NULL,
  `Apr17` int(11) NOT NULL,
  `Apr24` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Thursday12PM`
--

INSERT INTO `Thursday12PM` (`Name`, `Jan09`, `Jan16`, `Jan23`, `Jan30`, `Feb06`, `Feb13`, `Feb20`, `Feb27`, `Mar06`, `Mar13`, `Mar20`, `Mar27`, `Apr03`, `Apr10`, `Apr17`, `Apr24`) VALUES
('Rose DeMaio', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Courtney Stefanik', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('John Leo', 1, 1, 1, 0, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Megan Beaver', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Michaela Anang', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Lilly Stairs', 3, 1, 1, 2, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Transactions`
--

CREATE TABLE IF NOT EXISTS `Transactions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Chair` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Date` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Category` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Amount` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Dumping data for table `Transactions`
--

INSERT INTO `Transactions` (`id`, `Chair`, `Date`, `Category`, `Description`, `Amount`) VALUES
(11, 'Chair', '11/1/13', 'SLC Bonding', 'Coffee Chats', 48.12),
(10, 'Chair', '9/29/13', 'Conference', 'SIAF', 350.00),
(9, 'Chair', '9/29/13', 'SLC Bonding', 'SIAF Dinner', 110.00),
(12, 'Chair', '10/30/13', 'SLC Bonding', 'SLC Recognition', 46.19),
(13, 'Chair', '11/4/13', 'Retreat', 'PC Retreat Drink', 13.18),
(14, 'Chair', '10/30/13', 'Conference', 'Transport to Admissions Conference', 11.53),
(15, 'Chair', '12/27/13', 'General HA', 'T-Shirts', 1968.44),
(16, 'Chair', '10/26/13', 'General HA', 'Open House Food', 875.00),
(17, 'Chair', '10/10/13', 'Retreat', 'Outward Bound', 1095.00),
(18, 'Chair', '11/11/13', 'General HA', 'Welcome Day', 489.48),
(19, 'Chair', '11/5/13', 'General HA', 'PC Leadership Day NYP', 101.47),
(20, 'RRA', 'February 2, 2014', 'Gifts', 'Refer A Friend gift card', 150.00);

-- --------------------------------------------------------

--
-- Table structure for table `Tuesday2PM`
--

CREATE TABLE IF NOT EXISTS `Tuesday2PM` (
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Jan07` int(11) NOT NULL,
  `Jan14` int(11) NOT NULL,
  `Jan21` int(11) NOT NULL,
  `Jan28` int(11) NOT NULL,
  `Feb04` int(11) NOT NULL,
  `Feb11` int(11) NOT NULL,
  `Feb18` int(11) NOT NULL,
  `Feb25` int(11) NOT NULL,
  `Mar04` int(11) NOT NULL,
  `Mar11` int(11) NOT NULL,
  `Mar18` int(11) NOT NULL,
  `Mar25` int(11) NOT NULL,
  `Apr01` int(11) NOT NULL,
  `Apr08` int(11) NOT NULL,
  `Apr15` int(11) NOT NULL,
  `Apr22` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Tuesday2PM`
--

INSERT INTO `Tuesday2PM` (`Name`, `Jan07`, `Jan14`, `Jan21`, `Jan28`, `Feb04`, `Feb11`, `Feb18`, `Feb25`, `Mar04`, `Mar11`, `Mar18`, `Mar25`, `Apr01`, `Apr08`, `Apr15`, `Apr22`) VALUES
('Connor Elkhill', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Rachel Shapiro', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Melissa Templeton', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Serena Mozafari (M)', 1, 1, 3, 0, 1, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Tyler Cole (M)', 1, 1, 3, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Stephanie Roberts', 4, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Joshua Belinsky (M)', 0, 1, 3, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Howard Cheung (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Mary Eckert (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Stacey Rosenfeld (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Carl Uchytil (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Tuesday3PM`
--

CREATE TABLE IF NOT EXISTS `Tuesday3PM` (
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Jan07` int(11) NOT NULL,
  `Jan14` int(11) NOT NULL,
  `Jan21` int(11) NOT NULL,
  `Jan28` int(11) NOT NULL,
  `Feb04` int(11) NOT NULL,
  `Feb11` int(11) NOT NULL,
  `Feb18` int(11) NOT NULL,
  `Feb25` int(11) NOT NULL,
  `Mar04` int(11) NOT NULL,
  `Mar11` int(11) NOT NULL,
  `Mar18` int(11) NOT NULL,
  `Mar25` int(11) NOT NULL,
  `Apr01` int(11) NOT NULL,
  `Apr08` int(11) NOT NULL,
  `Apr15` int(11) NOT NULL,
  `Apr22` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Tuesday3PM`
--

INSERT INTO `Tuesday3PM` (`Name`, `Jan07`, `Jan14`, `Jan21`, `Jan28`, `Feb04`, `Feb11`, `Feb18`, `Feb25`, `Mar04`, `Mar11`, `Mar18`, `Mar25`, `Apr01`, `Apr08`, `Apr15`, `Apr22`) VALUES
('Michael Davis', 1, 1, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Sam Rutzick', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Maggie Soto', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Elizabeth Folan', 1, 1, 1, 1, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Lacey Loomer', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Michelle Reichman (M)', 1, 1, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Elyse Crescitelli', 0, 0, 0, 0, 0, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Matthew Dunn (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Tuesday4PM`
--

CREATE TABLE IF NOT EXISTS `Tuesday4PM` (
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Jan07` int(11) NOT NULL,
  `Jan14` int(11) NOT NULL,
  `Jan21` int(11) NOT NULL,
  `Jan28` int(11) NOT NULL,
  `Feb04` int(11) NOT NULL,
  `Feb11` int(11) NOT NULL,
  `Feb18` int(11) NOT NULL,
  `Feb25` int(11) NOT NULL,
  `Mar04` int(11) NOT NULL,
  `Mar11` int(11) NOT NULL,
  `Mar18` int(11) NOT NULL,
  `Mar25` int(11) NOT NULL,
  `Apr01` int(11) NOT NULL,
  `Apr08` int(11) NOT NULL,
  `Apr15` int(11) NOT NULL,
  `Apr22` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Tuesday4PM`
--

INSERT INTO `Tuesday4PM` (`Name`, `Jan07`, `Jan14`, `Jan21`, `Jan28`, `Feb04`, `Feb11`, `Feb18`, `Feb25`, `Mar04`, `Mar11`, `Mar18`, `Mar25`, `Apr01`, `Apr08`, `Apr15`, `Apr22`) VALUES
('Sora Hwang', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Megan Beaver', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Kelsey Zielinski', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Derrick Fung', 0, 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Tuesday10AM`
--

CREATE TABLE IF NOT EXISTS `Tuesday10AM` (
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Jan07` int(11) NOT NULL,
  `Jan14` int(11) NOT NULL,
  `Jan21` int(11) NOT NULL,
  `Jan28` int(11) NOT NULL,
  `Feb04` int(11) NOT NULL,
  `Feb11` int(11) NOT NULL,
  `Feb18` int(11) NOT NULL,
  `Feb25` int(11) NOT NULL,
  `Mar04` int(11) NOT NULL,
  `Mar11` int(11) NOT NULL,
  `Mar18` int(11) NOT NULL,
  `Mar25` int(11) NOT NULL,
  `Apr01` int(11) NOT NULL,
  `Apr08` int(11) NOT NULL,
  `Apr15` int(11) NOT NULL,
  `Apr22` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Tuesday10AM`
--

INSERT INTO `Tuesday10AM` (`Name`, `Jan07`, `Jan14`, `Jan21`, `Jan28`, `Feb04`, `Feb11`, `Feb18`, `Feb25`, `Mar04`, `Mar11`, `Mar18`, `Mar25`, `Apr01`, `Apr08`, `Apr15`, `Apr22`) VALUES
('Andrew Carbonar', 3, 1, 1, 1, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Rosalie Philpot', 3, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Sadaf Sekarkhand', 1, 1, 1, 1, 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Paige Trayer', 3, 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Jennifer Deahl', 1, 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Sarah Nodine (M)', 3, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Thomas Mattera (M)', 3, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Andrea Zatorski (M)', 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Matthew Dunn (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Taylor Imburgia (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Kathleen Mullaney (M)', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Tuesday11AM`
--

CREATE TABLE IF NOT EXISTS `Tuesday11AM` (
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Jan07` int(11) NOT NULL,
  `Jan14` int(11) NOT NULL,
  `Jan21` int(11) NOT NULL,
  `Jan28` int(11) NOT NULL,
  `Feb04` int(11) NOT NULL,
  `Feb11` int(11) NOT NULL,
  `Feb18` int(11) NOT NULL,
  `Feb25` int(11) NOT NULL,
  `Mar04` int(11) NOT NULL,
  `Mar11` int(11) NOT NULL,
  `Mar18` int(11) NOT NULL,
  `Mar25` int(11) NOT NULL,
  `Apr01` int(11) NOT NULL,
  `Apr08` int(11) NOT NULL,
  `Apr15` int(11) NOT NULL,
  `Apr22` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Tuesday11AM`
--

INSERT INTO `Tuesday11AM` (`Name`, `Jan07`, `Jan14`, `Jan21`, `Jan28`, `Feb04`, `Feb11`, `Feb18`, `Feb25`, `Mar04`, `Mar11`, `Mar18`, `Mar25`, `Apr01`, `Apr08`, `Apr15`, `Apr22`) VALUES
('Jennifer Cordero', 1, 1, 1, 1, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Joseph Volgraf', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Jocelyn Duran', 3, 1, 1, 1, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Julianna Covino (M)', 1, 1, 2, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Maxwell Dammeier', 0, 0, 0, 0, 0, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Daniel Mahoney', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Justin Hewitt (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Sarah Zaatar (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Tuesday12PM`
--

CREATE TABLE IF NOT EXISTS `Tuesday12PM` (
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Jan07` int(11) NOT NULL,
  `Jan14` int(11) NOT NULL,
  `Jan21` int(11) NOT NULL,
  `Jan28` int(11) NOT NULL,
  `Feb04` int(11) NOT NULL,
  `Feb11` int(11) NOT NULL,
  `Feb18` int(11) NOT NULL,
  `Feb25` int(11) NOT NULL,
  `Mar04` int(11) NOT NULL,
  `Mar11` int(11) NOT NULL,
  `Mar18` int(11) NOT NULL,
  `Mar25` int(11) NOT NULL,
  `Apr01` int(11) NOT NULL,
  `Apr08` int(11) NOT NULL,
  `Apr15` int(11) NOT NULL,
  `Apr22` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Tuesday12PM`
--

INSERT INTO `Tuesday12PM` (`Name`, `Jan07`, `Jan14`, `Jan21`, `Jan28`, `Feb04`, `Feb11`, `Feb18`, `Feb25`, `Mar04`, `Mar11`, `Mar18`, `Mar25`, `Apr01`, `Apr08`, `Apr15`, `Apr22`) VALUES
('Nyera Youssef', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Julia Bielecki', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Shanna Wall', 1, 1, 1, 1, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Maggie McGuire', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Marissa Fiorello', 3, 1, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Hilary Gabso', 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Wednesday2PM`
--

CREATE TABLE IF NOT EXISTS `Wednesday2PM` (
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Jan08` int(11) NOT NULL,
  `Jan15` int(11) NOT NULL,
  `Jan22` int(11) NOT NULL,
  `Jan29` int(11) NOT NULL,
  `Feb05` int(11) NOT NULL,
  `Feb12` int(11) NOT NULL,
  `Feb19` int(11) NOT NULL,
  `Feb26` int(11) NOT NULL,
  `Mar05` int(11) NOT NULL,
  `Mar12` int(11) NOT NULL,
  `Mar19` int(11) NOT NULL,
  `Mar26` int(11) NOT NULL,
  `Apr02` int(11) NOT NULL,
  `Apr09` int(11) NOT NULL,
  `Apr16` int(11) NOT NULL,
  `Apr23` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Wednesday2PM`
--

INSERT INTO `Wednesday2PM` (`Name`, `Jan08`, `Jan15`, `Jan22`, `Jan29`, `Feb05`, `Feb12`, `Feb19`, `Feb26`, `Mar05`, `Mar12`, `Mar19`, `Mar26`, `Apr02`, `Apr09`, `Apr16`, `Apr23`) VALUES
('Elizabeth Sousa', 1, 1, 3, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Ashley Young', 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Emily Feltault (M)', 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Alicia Guyton (M)', 0, 3, 3, 1, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Benjamin Brady (M)', 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Zoe Rudman', 0, 1, 3, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Priya Prabakaran (M)', 0, 0, 0, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Caleb Mansfield', 0, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Jennie Vildzius', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Mary Eckert (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Anjali Mehta (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Anastasia Scourtes (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Carl Uchytil (M)', 0, 0, 0, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Wednesday3PM`
--

CREATE TABLE IF NOT EXISTS `Wednesday3PM` (
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Jan08` int(11) NOT NULL,
  `Jan15` int(11) NOT NULL,
  `Jan22` int(11) NOT NULL,
  `Jan29` int(11) NOT NULL,
  `Feb05` int(11) NOT NULL,
  `Feb12` int(11) NOT NULL,
  `Feb19` int(11) NOT NULL,
  `Feb26` int(11) NOT NULL,
  `Mar05` int(11) NOT NULL,
  `Mar12` int(11) NOT NULL,
  `Mar19` int(11) NOT NULL,
  `Mar26` int(11) NOT NULL,
  `Apr02` int(11) NOT NULL,
  `Apr09` int(11) NOT NULL,
  `Apr16` int(11) NOT NULL,
  `Apr23` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Wednesday3PM`
--

INSERT INTO `Wednesday3PM` (`Name`, `Jan08`, `Jan15`, `Jan22`, `Jan29`, `Feb05`, `Feb12`, `Feb19`, `Feb26`, `Mar05`, `Mar12`, `Mar19`, `Mar26`, `Apr02`, `Apr09`, `Apr16`, `Apr23`) VALUES
('Basia Gordon', 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Maura Wade', 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Stephanie Aboulafia', 1, 2, 1, 1, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Samantha Ratner', 1, 1, 1, 1, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Tyler Cole (M)', 3, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Rachel Weiss', 1, 1, 1, 1, 0, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Michael Deitz (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Edward Pizzo', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Wednesday4PM`
--

CREATE TABLE IF NOT EXISTS `Wednesday4PM` (
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Jan08` int(11) NOT NULL,
  `Jan15` int(11) NOT NULL,
  `Jan22` int(11) NOT NULL,
  `Jan29` int(11) NOT NULL,
  `Feb05` int(11) NOT NULL,
  `Feb12` int(11) NOT NULL,
  `Feb19` int(11) NOT NULL,
  `Feb26` int(11) NOT NULL,
  `Mar05` int(11) NOT NULL,
  `Mar12` int(11) NOT NULL,
  `Mar19` int(11) NOT NULL,
  `Mar26` int(11) NOT NULL,
  `Apr02` int(11) NOT NULL,
  `Apr09` int(11) NOT NULL,
  `Apr16` int(11) NOT NULL,
  `Apr23` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Wednesday4PM`
--

INSERT INTO `Wednesday4PM` (`Name`, `Jan08`, `Jan15`, `Jan22`, `Jan29`, `Feb05`, `Feb12`, `Feb19`, `Feb26`, `Mar05`, `Mar12`, `Mar19`, `Mar26`, `Apr02`, `Apr09`, `Apr16`, `Apr23`) VALUES
('Michael Stent', 3, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Rachel Yates', 3, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Amelia Kulik', 3, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Wednesday10AM`
--

CREATE TABLE IF NOT EXISTS `Wednesday10AM` (
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Jan08` int(11) NOT NULL,
  `Jan15` int(11) NOT NULL,
  `Jan22` int(11) NOT NULL,
  `Jan29` int(11) NOT NULL,
  `Feb05` int(11) NOT NULL,
  `Feb12` int(11) NOT NULL,
  `Feb19` int(11) NOT NULL,
  `Feb26` int(11) NOT NULL,
  `Mar05` int(11) NOT NULL,
  `Mar12` int(11) NOT NULL,
  `Mar19` int(11) NOT NULL,
  `Mar26` int(11) NOT NULL,
  `Apr02` int(11) NOT NULL,
  `Apr09` int(11) NOT NULL,
  `Apr16` int(11) NOT NULL,
  `Apr23` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Wednesday10AM`
--

INSERT INTO `Wednesday10AM` (`Name`, `Jan08`, `Jan15`, `Jan22`, `Jan29`, `Feb05`, `Feb12`, `Feb19`, `Feb26`, `Mar05`, `Mar12`, `Mar19`, `Mar26`, `Apr02`, `Apr09`, `Apr16`, `Apr23`) VALUES
('Sonia Lin', 1, 1, 4, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Sadaf Sekarkhand', 1, 1, 4, 3, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Laura Setton', 1, 1, 4, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Claudia Vilcu', 1, 1, 4, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Evan Noyes', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Nilay Rego', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Oliver Fishstein (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Jessica Darfoor (M)', 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Emma Parrish (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Sarah Zataar (M)', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Wednesday11AM`
--

CREATE TABLE IF NOT EXISTS `Wednesday11AM` (
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Jan08` int(11) NOT NULL,
  `Jan15` int(11) NOT NULL,
  `Jan22` int(11) NOT NULL,
  `Jan29` int(11) NOT NULL,
  `Feb05` int(11) NOT NULL,
  `Feb12` int(11) NOT NULL,
  `Feb19` int(11) NOT NULL,
  `Feb26` int(11) NOT NULL,
  `Mar05` int(11) NOT NULL,
  `Mar12` int(11) NOT NULL,
  `Mar19` int(11) NOT NULL,
  `Mar26` int(11) NOT NULL,
  `Apr02` int(11) NOT NULL,
  `Apr09` int(11) NOT NULL,
  `Apr16` int(11) NOT NULL,
  `Apr23` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Wednesday11AM`
--

INSERT INTO `Wednesday11AM` (`Name`, `Jan08`, `Jan15`, `Jan22`, `Jan29`, `Feb05`, `Feb12`, `Feb19`, `Feb26`, `Mar05`, `Mar12`, `Mar19`, `Mar26`, `Apr02`, `Apr09`, `Apr16`, `Apr23`) VALUES
('Rachel Ayres', 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Justine Steinberger', 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Jordan Nissen', 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Julianna Covino (M)', 0, 0, 3, 1, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Lauren Baranowski', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Mitchell Gruber', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Christopher Demirdogen (M)', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Wednesday12PM`
--

CREATE TABLE IF NOT EXISTS `Wednesday12PM` (
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Jan08` int(11) NOT NULL,
  `Jan15` int(11) NOT NULL,
  `Jan22` int(11) NOT NULL,
  `Jan29` int(11) NOT NULL,
  `Feb05` int(11) NOT NULL,
  `Feb12` int(11) NOT NULL,
  `Feb19` int(11) NOT NULL,
  `Feb26` int(11) NOT NULL,
  `Mar05` int(11) NOT NULL,
  `Mar12` int(11) NOT NULL,
  `Mar19` int(11) NOT NULL,
  `Mar26` int(11) NOT NULL,
  `Apr02` int(11) NOT NULL,
  `Apr09` int(11) NOT NULL,
  `Apr16` int(11) NOT NULL,
  `Apr23` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Wednesday12PM`
--

INSERT INTO `Wednesday12PM` (`Name`, `Jan08`, `Jan15`, `Jan22`, `Jan29`, `Feb05`, `Feb12`, `Feb19`, `Feb26`, `Mar05`, `Mar12`, `Mar19`, `Mar26`, `Apr02`, `Apr09`, `Apr16`, `Apr23`) VALUES
('Tricia Akers', 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Elie Low', 1, 3, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Katie Wong', 1, 1, 1, 1, 0, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Jordyn Hanover', 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Maggie McGuire', 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Madeline McKenna', 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Adam Fishman', 3, 1, 1, 1, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Sherri Furtado', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('Karlayne Powell', 0, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
