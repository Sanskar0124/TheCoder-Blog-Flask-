-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2021 at 01:33 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thecoder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(50) NOT NULL,
  `name` text NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone_num`, `msg`, `date`, `email`) VALUES
(1, 'First Post', '773870689', 'FIRST POST', '2021-04-26 10:51:49', 'firstpost@gmail.com'),
(2, 'Sanskar Sakhareliya', '07738707689', 'This is test message', NULL, 'Sansakhraliya@gmail.com'),
(3, 'Sanskar Sakhareliya', '07738707689', 'This is test message', '0000-00-00 00:00:00', 'Sansakhraliya@gmail.com'),
(4, 'Sanskar Sakhareliya', '07738707689', 'This is test message', '2021-04-26 11:51:43', 'Sansakhraliya@gmail.com'),
(5, 'Sanskar Sakhareliya', '07738707689', 'This is test message', '2021-04-26 12:20:26', 'Sansakhraliya@gmail.com'),
(6, 'Sanskar Sakhareliya', '07738707689', 'This is test message', '2021-04-26 12:27:29', 'Sansakhraliya@gmail.com'),
(7, 'Sanskar Sakhareliya', '07738707689', 'test ndg', '2021-04-26 19:26:09', 'Sansakhraliya@gmail.com'),
(8, 'Sanskar Sakhareliya', '07738707689', 'test ndg', '2021-04-26 19:28:58', 'Sansakhraliya@gmail.com'),
(9, 'Sanskar Sakhareliya', '07738707689', 'test message 2', '2021-04-26 19:29:09', 'Sansakhraliya@gmail.com'),
(10, 'Sanskar Sakhareliya', '07738707689', 'test message\r\n', '2021-04-26 19:30:18', 'Sansakhraliya@gmail.com'),
(11, 'Sanskar Sakhareliya', '07738707689', 'test message\r\n', '2021-04-26 19:30:39', 'Sansakhraliya@gmail.com'),
(12, 'Sanskar Sakhareliya', '07738707689', 'test message', '2021-04-26 19:32:20', 'Sansakhraliya@gmail.com'),
(13, 'Sanskar Sakhareliya', '07738707689', 'test message', '2021-04-26 19:35:37', 'Sansakhraliya@gmail.com'),
(14, 'Sanskar Sakhareliya', '07738707689', 'test message', '2021-04-26 19:41:02', 'Sansakhraliya@gmail.com'),
(15, 'Sanskar Sakhareliya', '07738707689', 'test message', '2021-04-26 19:43:37', 'Sansakhraliya@gmail.com'),
(16, 'Sanskar Sakhareliya', '07738707689', 'r34tr34rt43', '2021-04-26 19:43:53', 'Sansakhraliya@gmail.com'),
(17, 'Sanskar Sakhareliya', '07738707689', 'r34tr34rt43', '2021-04-26 19:44:46', 'Sansakhraliya@gmail.com'),
(18, 'Sanskar Sakhareliya', '07738707689', 'dasfda', '2021-04-26 19:44:54', 'Sansakhraliya@gmail.com'),
(19, 'Sanskar Sakhareliya', '07738707689', 'dasfda', '2021-04-26 19:48:30', 'Sansakhraliya@gmail.com'),
(20, 'Sanskar Sakhareliya', '07738707689', 'dasfda', '2021-04-26 19:48:38', 'Sansakhraliya@gmail.com'),
(21, 'Sanskar Sakhareliya', '07738707689', 'dasfda', '2021-04-26 19:51:19', 'Sansakhraliya@gmail.com'),
(22, 'Sanskar Sakhareliya', '07738707689', 'dasfda', '2021-04-26 19:52:08', 'Sansakhraliya@gmail.com'),
(23, 'Sanskar Sakhareliya', '07738707689', 'dassfa', '2021-04-26 19:53:04', 'Sansakhraliya@gmail.com'),
(24, 'Sanskar Sakhareliya', '07738707689', 'dassfa', '2021-04-26 19:55:30', 'Sansakhraliya@gmail.com'),
(25, 'Sanskar Sakhareliya', '07738707689', 'dassfa', '2021-04-26 20:18:24', 'Sansakhraliya@gmail.com'),
(26, 'Sanskar Sakhareliya', '07738707689', 'awsdsa', '2021-04-26 20:27:45', 'Sansakhraliya@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(12) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'Thi is my first post title yoooo!', 'This first post', 'first-post', 'This is my blog post and i am very excited....', 'post-bg.jpg', '2021-04-28 19:15:33'),
(2, 'Thi is my secondpost title', 'This is second post', 'second-post', 'hello everyoneliujkhd boyb b67yfd jhbewfd oewbepi;u ;ef 9eu bhguewr he;yhguwef nu[ eprigberg re etrg rtgtrhgtr ', 'home-bg.jpg', '2021-04-26 21:36:23'),
(4, 'Thi is my fourthpost title', 'Fourth Post', 'fourth-post', 'woieufg hpiewuew hbf0pbrf heuwoyrvlrbewjk rpuiewrnljdrbfouwel oy roiewugbojwe oub 0ewdfubwpiedg b 0upifj n0euwifhgpiueb  ovbwpiu hepiuhr wiubher ouygewblr jw pewhrfp;oiwer hpb;irh ehp rp', '', '2021-04-26 21:45:26'),
(5, 'Thi is my fifthpost title', 'Fifth Post', 'fifth-post', '`khvdfb iklu bkf oeuvfbp lofb oerbf ler nl uiobfoil buf ljf b fv bouhf uopierbl bog gp9urhbpi;leh lkfgnpbierghpieurg hptrbigr hpti n trnprti trhnth tprhtniu trgn itr p9rjgort jp[ttro trhjtor hmkt h9;[pthnotr;\'hn;hmn\'; lkmn\';thm tirohj t\'mhtihj oitrpuiogh ruyogroeler gbro gl reiu hbrep rei ubr', '', '2021-04-26 21:46:12'),
(8, 'Sixth Post', 'this is sixth post', 'sixth-post', 'sixth post : 666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666', '', '2021-04-29 18:57:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
