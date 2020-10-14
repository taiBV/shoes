-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 27, 2020 lúc 04:38 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_shop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account_comment`
--

CREATE TABLE `account_comment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `account_comment`
--

INSERT INTO `account_comment` (`id`, `product_id`, `name`, `email`, `body`, `created_at`, `updated_at`) VALUES
(50, 8, 'sd', 'sd', 'xc', '2020-04-05 01:53:11', '2020-04-05 01:53:11'),
(51, 8, 'sds', 'sdssdsd', 'c', '2020-04-05 01:53:26', '2020-04-05 01:53:26'),
(53, 19, 'fhghg', 'hgg', 'gh', '2020-04-05 07:00:37', '2020-04-05 07:00:37'),
(55, 19, 'sd', 'sd', 'sd', '2020-04-05 14:22:47', '2020-04-05 07:22:47'),
(56, 8, 'sdsd', 'sds', 'sds', '2020-04-05 15:47:41', '2020-04-05 15:47:41'),
(57, 1, 'admin', 'admin@gmail.com', 'Êm chân', '2020-04-11 14:30:00', '2020-04-11 14:30:00'),
(58, 1, 'giày', 'giay@gmail.com', 'Đẹp', '2020-04-11 14:30:19', '2020-04-11 14:30:19'),
(59, 1, 'admin', 'admin@gmail.com', 'đẹp', '2020-04-11 14:40:03', '2020-04-11 14:40:03'),
(60, 2, 'tai', 'sds@gmail.com', 'đẹp', '2020-04-11 15:02:58', '2020-04-11 15:02:58'),
(61, 2, 'admin', 'admin@gmail.com', 'êm chân', '2020-04-11 15:07:10', '2020-04-11 15:07:10'),
(62, 2, 'bui tai', 'chutai3212@gmail.com', 'Giày đẹp', '2020-05-05 23:24:35', '2020-05-05 23:24:35');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(11) NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_price` double(20,2) NOT NULL,
  `shipment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`id`, `sku`, `customer_id`, `data`, `total_price`, `shipment`, `payment`, `date_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'KA0902981', 1, '{\"1\":{\"id\":\"1\",\"name\":\"Giày Thể Thao Siêu Nhẹ Cho Nam 202\",\"price\":431000,\"quantity\":\"1\",\"attributes\":{\"size\":\"42\",\"color\":\"Xanh\"},\"conditions\":[]},\"3\":{\"id\":\"3\",\"name\":\"Giày NIKE AIR FORCE 1\",\"price\":210000,\"quantity\":7,\"attributes\":{\"size\":\"40\",\"color\":\"Vàng\"},\"conditions\":[]}}', 1901000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-03-06', '2', '2020-03-06 10:37:50', '2020-03-31 06:08:26'),
(2, 'KA0902982', 2, '{\"18\":{\"id\":\"18\",\"name\":\"Giày Nam Da Cao Cấp P016\",\"price\":520000,\"quantity\":\"1\",\"attributes\":{\"size\":\"42\",\"color\":\"Trắng\"},\"conditions\":[]},\"14\":{\"id\":\"14\",\"name\":\"Giày nam cao cổ thời trang PETTINO - KS02\",\"price\":199000,\"quantity\":\"5\",\"attributes\":{\"size\":\"42\",\"color\":\"Lam\"},\"conditions\":[]}}', 1515000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-03-14', '2', '2020-03-14 09:33:06', '2020-04-03 23:18:45'),
(3, 'KA0902983', 3, '{\"1\":{\"id\":\"1\",\"name\":\"Giày Thể Thao Siêu Nhẹ Cho Nam 202\",\"price\":431000,\"quantity\":5,\"attributes\":{\"size\":\"40\",\"color\":\"Xanh\"},\"conditions\":[]},\"3\":{\"id\":\"3\",\"name\":\"Giày NIKE AIR FORCE 1\",\"price\":210000,\"quantity\":\"1\",\"attributes\":{\"size\":\"39\",\"color\":\"Vàng\"},\"conditions\":[]}}', 2365000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-03-23', '2', '2020-03-23 08:20:48', '2020-03-31 06:32:31'),
(4, 'KA0902984', 4, '{\"1\":{\"id\":\"1\",\"name\":\"Giày Thể Thao Siêu Nhẹ Cho Nam 202\",\"price\":431000,\"quantity\":\"1\",\"attributes\":{\"size\":\"40\",\"color\":\"Trắng\"},\"conditions\":[]}}', 431000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-03-23', '2', '2020-03-23 08:31:32', '2020-03-31 06:32:36'),
(5, 'KA0902985', 5, '{\"1\":{\"id\":\"1\",\"name\":\"Giày Thể Thao Siêu Nhẹ Cho Nam 202\",\"price\":431000,\"quantity\":3,\"attributes\":{\"size\":\"40\",\"color\":\"Xanh\"},\"conditions\":[]}}', 1293000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-03-23', '2', '2020-03-23 08:37:00', '2020-03-29 08:10:11'),
(6, 'KA0902986', 6, '{\"1\":{\"id\":\"1\",\"name\":\"Giày Thể Thao Siêu Nhẹ Cho Nam 202\",\"price\":431000,\"quantity\":5,\"attributes\":{\"size\":\"42\",\"color\":\"Trắng\"},\"conditions\":[]}}', 2155000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-03-23', '2', '2020-03-23 09:25:12', '2020-03-29 08:10:10'),
(7, 'KA0902987', 7, '{\"4\":{\"id\":\"4\",\"name\":\"NIKE AIR MAX 270 REACT GHOST AQUA PHANTOM\",\"price\":190000,\"quantity\":\"6\",\"attributes\":{\"size\":\"43\",\"color\":\"Trắng\",\"img\":\"9.png\"},\"conditions\":[]},\"8\":{\"id\":\"8\",\"name\":\"VANS FEAR OF GOD NAM\",\"price\":890000,\"quantity\":4,\"attributes\":{\"size\":\"39\",\"color\":\"Trắng\",\"img\":\"40.jpg\"},\"conditions\":[]}}', 4700000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-03-26', '2', '2020-03-25 10:26:58', '2020-03-29 08:10:12'),
(8, 'KA0902988', 8, '{\"1\":{\"id\":\"1\",\"name\":\"Giày Thể Thao Siêu Nhẹ Cho Nam 202\",\"price\":1000000,\"quantity\":3,\"attributes\":{\"size\":\"38\",\"color\":\"Xanh\",\"img\":\"nike-203.jpg\"},\"conditions\":[]}}', 3000000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-03-26', '2', '2020-03-25 18:35:25', '2020-03-31 06:32:38'),
(9, 'KA0902989', 9, '{\"1\":{\"id\":\"1\",\"name\":\"Giày Thể Thao Siêu Nhẹ Cho Nam 202\",\"price\":1000000,\"quantity\":2,\"attributes\":{\"size\":\"41\",\"color\":\"Xanh\",\"img\":\"nike-203.jpg\"},\"conditions\":[]}}', 2000000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-03-29', '2', '2020-03-29 09:18:59', '2020-03-31 06:32:40'),
(10, 'KA09029810', 10, '{\"2\":{\"id\":\"2\",\"name\":\"Giày Nike Zoom Winflo 6 Nam - Trắng\",\"price\":230000,\"quantity\":\"1\",\"attributes\":{\"size\":\"42\",\"color\":\"Trăng\",\"img\":\"30.png\"},\"conditions\":[]}}', 230000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-03-29', '2', '2020-03-29 09:23:14', '2020-03-31 06:32:49'),
(11, 'KA09029811', 11, '{\"2\":{\"id\":\"2\",\"name\":\"Giày Nike Zoom Winflo 6 Nam - Trắng\",\"price\":230000,\"quantity\":\"1\",\"attributes\":{\"size\":\"42\",\"color\":\"Trăng\",\"img\":\"30.png\"},\"conditions\":[]}}', 230000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-03-29', '2', '2020-03-29 09:25:45', '2020-03-31 06:33:15'),
(12, 'KA09029812', 12, '{\"2\":{\"id\":\"2\",\"name\":\"Giày Nike Zoom Winflo 6 Nam - Trắng\",\"price\":230000,\"quantity\":\"1\",\"attributes\":{\"size\":\"42\",\"color\":\"Trăng\",\"img\":\"30.png\"},\"conditions\":[]}}', 230000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-03-29', '2', '2020-03-29 09:28:43', '2020-03-31 06:32:53'),
(13, 'KA09029813', 13, '{\"2\":{\"id\":\"2\",\"name\":\"Giày Nike Zoom Winflo 6 Nam - Trắng\",\"price\":230000,\"quantity\":\"1\",\"attributes\":{\"size\":\"42\",\"color\":\"Trăng\",\"img\":\"30.png\"},\"conditions\":[]}}', 230000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-03-29', '2', '2020-03-29 09:40:42', '2020-03-31 06:33:00'),
(14, 'KA09029814', 14, '{\"2\":{\"id\":\"2\",\"name\":\"Giày Nike Zoom Winflo 6 Nam - Trắng\",\"price\":230000,\"quantity\":\"1\",\"attributes\":{\"size\":\"42\",\"color\":\"Trăng\",\"img\":\"30.png\"},\"conditions\":[]}}', 230000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-03-29', '2', '2020-03-29 09:41:02', '2020-03-31 06:33:15'),
(15, 'KA09029815', 15, '{\"2\":{\"id\":\"2\",\"name\":\"Giày Nike Zoom Winflo 6 Nam - Trắng\",\"price\":230000,\"quantity\":\"1\",\"attributes\":{\"size\":\"42\",\"color\":\"Trăng\",\"img\":\"30.png\"},\"conditions\":[]}}', 230000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-03-29', '2', '2020-03-29 09:41:41', '2020-03-31 06:33:15'),
(16, 'KA09029816', 16, '{\"2\":{\"id\":\"2\",\"name\":\"Giày Nike Zoom Winflo 6 Nam - Trắng\",\"price\":230000,\"quantity\":\"1\",\"attributes\":{\"size\":\"42\",\"color\":\"Trăng\",\"img\":\"30.png\"},\"conditions\":[]}}', 230000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-03-29', '2', '2020-03-29 09:42:05', '2020-03-31 06:33:14'),
(17, 'KA09029817', 17, '{\"2\":{\"id\":\"2\",\"name\":\"Giày Nike Zoom Winflo 6 Nam - Trắng\",\"price\":230000,\"quantity\":\"1\",\"attributes\":{\"size\":\"42\",\"color\":\"Trăng\",\"img\":\"30.png\"},\"conditions\":[]}}', 230000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-03-29', '2', '2020-03-29 09:43:09', '2020-03-31 06:33:13'),
(18, 'KA09029818', 18, '{\"2\":{\"id\":\"2\",\"name\":\"Giày Nike Zoom Winflo 6 Nam - Trắng\",\"price\":230000,\"quantity\":\"1\",\"attributes\":{\"size\":\"42\",\"color\":\"Trăng\",\"img\":\"30.png\"},\"conditions\":[]}}', 230000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-03-29', '2', '2020-03-29 09:44:09', '2020-04-05 16:23:07'),
(19, 'KA09029819', 19, '{\"1\":{\"id\":\"1\",\"name\":\"Giày Thể Thao Siêu Nhẹ Cho Nam 202\",\"price\":1000000,\"quantity\":\"1\",\"attributes\":{\"size\":\"40\",\"color\":\"Trắng\",\"img\":\"nike-203.jpg\"},\"conditions\":[]}}', 1000000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-03-29', '2', '2020-03-29 09:46:20', '2020-03-31 06:33:12'),
(20, 'KA09029820', 20, '{\"1\":{\"id\":\"1\",\"name\":\"Giày Thể Thao Siêu Nhẹ Cho Nam 202\",\"price\":1000000,\"quantity\":\"1\",\"attributes\":{\"size\":\"40\",\"color\":\"Trắng\",\"img\":\"nike-203.jpg\"},\"conditions\":[]}}', 1000000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-03-30', '2', '2020-03-29 10:02:11', '2020-03-31 06:33:10'),
(21, 'KA09029821', 21, '{\"8\":{\"id\":\"8\",\"name\":\"VANS FEAR OF GOD NAM\",\"price\":890000,\"quantity\":\"3\",\"attributes\":{\"size\":\"39\",\"color\":\"Trắng\",\"img\":\"40.jpg\"},\"conditions\":[]},\"1\":{\"id\":\"1\",\"name\":\"Giày Thể Thao Siêu Nhẹ Cho Nam 202\",\"price\":1000000,\"quantity\":3,\"attributes\":{\"size\":\"40\",\"color\":\"Trắng\",\"img\":\"nike-203.jpg\"},\"conditions\":[]}}', 5670000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-03-30', '2', '2020-03-29 10:04:36', '2020-04-09 06:56:18'),
(22, 'KA09029822', 22, '{\"2\":{\"id\":\"2\",\"name\":\"Giày Nike Zoom Winflo 6 Nam - Trắng\",\"price\":199000,\"quantity\":\"3\",\"attributes\":{\"size\":\"42\",\"color\":\"Xanh\",\"img\":\"30.png\",\"sale\":\"\"},\"conditions\":[]},\"3\":{\"id\":\"3\",\"name\":\"Giày NIKE AIR FORCE 1\",\"price\":210000,\"quantity\":\"3\",\"attributes\":{\"size\":\"39\",\"color\":\"Vàng\",\"img\":\"18.png\",\"sale\":\"\"},\"conditions\":[]}}', 1227000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-03-31', '2', '2020-03-31 06:03:56', '2020-04-09 06:56:17'),
(23, 'KA09029823', 23, '{\"19\":{\"id\":\"19\",\"name\":\"Giày Tây Nam Da Bò Mã BH-2\",\"price\":400000,\"quantity\":5,\"attributes\":{\"size\":\"41\",\"color\":\"Đen\",\"img\":\"51.jpg\",\"sale\":\"\"},\"conditions\":[]}}', 2000000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-04-04', '2', '2020-04-03 23:15:48', '2020-04-07 04:09:48'),
(24, 'KA09029824', 24, '{\"1\":{\"id\":\"1\",\"name\":\"Giày Thể Thao Siêu Nhẹ Cho Nam 202\",\"price\":980000,\"quantity\":3,\"attributes\":{\"size\":\"41\",\"color\":\"Xanh\",\"img\":\"nike-203.jpg\",\"sale\":\"\"},\"conditions\":[]}}', 2940000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-04-09', '0', '2020-04-09 09:31:10', '2020-04-09 09:31:10'),
(25, 'KA09029825', 25, '{\"1\":{\"id\":\"1\",\"name\":\"Giày Thể Thao Siêu Nhẹ Cho Nam 202\",\"price\":980000,\"quantity\":3,\"attributes\":{\"size\":\"41\",\"color\":\"Xanh\",\"img\":\"nike-203.jpg\",\"sale\":\"\"},\"conditions\":[]}}', 2940000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-04-09', '0', '2020-04-09 09:31:33', '2020-04-09 09:31:33'),
(26, 'KA09029826', 26, '{\"1\":{\"id\":\"1\",\"name\":\"Giày Thể Thao Siêu Nhẹ Cho Nam 202\",\"price\":980000,\"quantity\":2,\"attributes\":{\"size\":\"41\",\"color\":\"Trắng\",\"img\":\"nike-203.jpg\",\"sale\":\"\"},\"conditions\":[]}}', 1960000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-04-09', '0', '2020-04-09 09:47:31', '2020-04-09 09:47:31'),
(27, 'KA09029827', 27, '{\"2\":{\"id\":\"2\",\"name\":\"Giày Nike Zoom Winflo 6 Nam - Trắng\",\"price\":199000,\"quantity\":\"1\",\"attributes\":{\"size\":\"38\",\"color\":\"Xanh\",\"img\":\"1586338923.png\",\"sale\":\"\"},\"conditions\":[]}}', 199000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-04-09', '0', '2020-04-09 09:48:08', '2020-04-09 09:48:08'),
(28, 'KA09029828', 28, '{\"1\":{\"id\":\"1\",\"name\":\"Giày Thể Thao Siêu Nhẹ Cho Nam 202\",\"price\":980000,\"quantity\":\"1\",\"attributes\":{\"size\":\"41\",\"color\":\"Trắng\",\"img\":\"nike-203.jpg\",\"sale\":\"\"},\"conditions\":[]}}', 980000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-04-09', '0', '2020-04-09 09:56:23', '2020-04-09 09:56:23'),
(29, 'KA09029829', 29, '{\"1\":{\"id\":\"1\",\"name\":\"Giày Thể Thao Siêu Nhẹ Cho Nam 202\",\"price\":980000,\"quantity\":\"1\",\"attributes\":{\"size\":\"40\",\"color\":\"Trắng\",\"img\":\"nike-203.jpg\",\"sale\":\"\"},\"conditions\":[]}}', 980000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-04-09', '1', '2020-04-09 10:01:57', '2020-04-11 15:10:07'),
(30, 'KA09029830', 30, '{\"2\":{\"id\":\"2\",\"name\":\"Giày Nike Zoom Winflo 6 Nam - Trắng\",\"price\":199000,\"quantity\":5,\"attributes\":{\"size\":\"40\",\"color\":\"Trăng\",\"img\":\"1586338923.png\",\"sale\":\"\"},\"conditions\":[]}}', 995000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-04-11', '2', '2020-04-11 14:41:49', '2020-04-11 14:43:04'),
(31, 'KA09029831', 31, '{\"16\":{\"id\":\"16\",\"name\":\"Giày tây da nam khóa kéo mẫu mới 2019 TRT-GTN-07\",\"price\":290000,\"quantity\":2,\"attributes\":{\"size\":\"38\",\"color\":\"Đen\",\"img\":\"49.jpg\",\"sale\":\"\"},\"conditions\":[]}}', 580000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-04-11', '2', '2020-04-11 15:08:47', '2020-04-11 15:10:13'),
(32, 'KA09029832', 32, '{\"2\":{\"id\":\"2\",\"name\":\"Giày Nike Zoom Winflo 6 Nam - Trắng\",\"price\":199000,\"quantity\":10,\"attributes\":{\"size\":\"41\",\"color\":\"Trăng\",\"img\":\"1586338923.png\",\"sale\":\"\"},\"conditions\":[]}}', 1990000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-05-06', '0', '2020-05-06 01:19:34', '2020-05-06 01:19:34'),
(33, 'KA09029833', 33, '{\"1\":{\"id\":\"1\",\"name\":\"Giày Thể Thao Siêu Nhẹ Cho Nam 202\",\"price\":980000,\"quantity\":\"1\",\"attributes\":{\"size\":\"40\",\"color\":\"Trắng\",\"img\":\"nike-203.jpg\",\"sale\":\"\"},\"conditions\":[]}}', 980000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-05-06', '0', '2020-05-06 01:39:24', '2020-05-06 01:39:24'),
(34, 'KA09029834', 34, '{\"1\":{\"id\":\"1\",\"name\":\"Giày Thể Thao Siêu Nhẹ Cho Nam 202\",\"price\":980000,\"quantity\":\"1\",\"attributes\":{\"size\":\"40\",\"color\":\"Trắng\",\"img\":\"nike-203.jpg\",\"sale\":\"\"},\"conditions\":[]}}', 980000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-05-06', '0', '2020-05-06 01:45:43', '2020-05-06 01:45:43'),
(35, 'KA09029835', 35, '{\"1\":{\"id\":\"1\",\"name\":\"Giày Thể Thao Siêu Nhẹ Cho Nam 202\",\"price\":980000,\"quantity\":\"1\",\"attributes\":{\"size\":\"40\",\"color\":\"Trắng\",\"img\":\"nike-203.jpg\",\"sale\":\"\"},\"conditions\":[]},\"2\":{\"id\":\"2\",\"name\":\"Giày Nike Zoom Winflo 6 Nam - Trắng\",\"price\":199000,\"quantity\":\"1\",\"attributes\":{\"size\":\"42\",\"color\":\"Trăng\",\"img\":\"1586338923.png\",\"sale\":\"\"},\"conditions\":[]}}', 1179000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-05-06', '0', '2020-05-06 01:47:03', '2020-05-06 01:47:03'),
(36, 'KA09029836', 36, '{\"3\":{\"id\":\"3\",\"name\":\"Giày NIKE AIR FORCE 1\",\"price\":210000,\"quantity\":\"5\",\"attributes\":{\"size\":\"39\",\"color\":\"Trắng\",\"img\":\"18.png\",\"sale\":\"\"},\"conditions\":[]}}', 1050000.00, 'Giao hàng tại nhà', 'Thanh toán sau khi nhận hàng', '2020-05-06', '2', '2020-05-06 01:48:19', '2020-05-06 01:49:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint(20) NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`id`, `name`, `phone`, `email`, `address`, `note`, `created_at`, `updated_at`) VALUES
(1, 'Đông trùn', 383059048, 'taibv@watermelon.vn', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-03-06 10:37:50', '2020-03-06 10:37:50'),
(2, 'Nguyễn Kim Ánh', 326913212, 'kimanh41276@gmail.com', '64 đường Phú diễn - phường minh khai - Bắc từ liêm', 'Giao hàng buổi sáng', '2020-03-14 09:33:05', '2020-03-14 09:33:05'),
(3, 'Đông trùng tươi sấy', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', 'Giao hàng buổi sáng', '2020-03-23 08:20:48', '2020-03-23 08:20:48'),
(4, 'Đông trùng tươi sấy', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', 'Giao hàng buổi sáng', '2020-03-23 08:31:32', '2020-03-23 08:31:32'),
(5, 'Đông trùng tươi 250 gram', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', 'Giao hàng buổi sáng', '2020-03-23 08:37:00', '2020-03-23 08:37:00'),
(6, 'Đông trùng tươi sấy', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-03-23 09:25:12', '2020-03-23 09:25:12'),
(7, 'Bui Van Tai', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', 'Giao hàng buổi sáng', '2020-03-25 10:26:58', '2020-03-25 10:26:58'),
(8, 'WM Bui Van Tai', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', 'Giao hàng buổi sáng', '2020-03-25 18:35:25', '2020-03-25 18:35:25'),
(9, 'Đông trùng tươi sấy', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', 'Giao hàng buổi sáng', '2020-03-29 09:18:59', '2020-03-29 09:18:59'),
(10, 'Đông trùng tươi sấy', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', 'Giao hàng buổi sáng', '2020-03-29 09:23:14', '2020-03-29 09:23:14'),
(11, 'Đông trùng tươi sấy', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', 'Giao hàng buổi sáng', '2020-03-29 09:25:44', '2020-03-29 09:25:44'),
(12, 'Đông trùng tươi sấy', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-03-29 09:28:42', '2020-03-29 09:28:42'),
(13, 'WM Bui Van Tai', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-03-29 09:40:42', '2020-03-29 09:40:42'),
(14, 'WM Bui Van Tai', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-03-29 09:41:02', '2020-03-29 09:41:02'),
(15, 'WM Bui Van Tai', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-03-29 09:41:40', '2020-03-29 09:41:40'),
(16, 'Đông trùng tươi sấy', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-03-29 09:42:05', '2020-03-29 09:42:05'),
(17, 'Đông trùng tươi sấy', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-03-29 09:43:09', '2020-03-29 09:43:09'),
(18, 'Đông trùng tươi sấy', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-03-29 09:44:09', '2020-03-29 09:44:09'),
(19, 'WM Bui Van Tai', 383059048, 'kimanh41276@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-03-29 09:46:20', '2020-03-29 09:46:20'),
(20, 'Kim Ánh', 383059048, 'kimanh41276@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-03-29 10:02:11', '2020-03-29 10:02:11'),
(21, 'WM Bui Van Tai', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-03-29 10:04:36', '2020-03-29 10:04:36'),
(22, 'WM Bui Van Tai', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-03-31 06:03:56', '2020-03-31 06:03:56'),
(23, 'WM Bui Van Tai', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', 'Giao hàng buổi sáng', '2020-04-03 23:15:48', '2020-04-03 23:15:48'),
(24, 'Đông trùng tươi sấy', 383059048, 't', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-04-09 09:31:10', '2020-04-09 09:31:10'),
(25, 'Đông trùng tươi sấy', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-04-09 09:31:32', '2020-04-09 09:31:32'),
(26, 'Đông trùng tươi sấy', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-04-09 09:47:31', '2020-04-09 09:47:31'),
(27, 'Đông trùng tươi sấy', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-04-09 09:48:08', '2020-04-09 09:48:08'),
(28, 'WM Bui Van Tai', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-04-09 09:56:23', '2020-04-09 09:56:23'),
(29, 'Đông trùng tươi sấy', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-04-09 10:01:57', '2020-04-09 10:01:57'),
(30, 'Tai', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-04-11 14:41:49', '2020-04-11 14:41:49'),
(31, 'Đông trùng tươi sấy', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-04-11 15:08:47', '2020-04-11 15:08:47'),
(32, 'Tai', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-05-06 01:19:34', '2020-05-06 01:19:34'),
(33, 'WM Bui Van Tai', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-05-06 01:39:24', '2020-05-06 01:39:24'),
(34, 'WM Bui Van Tai', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-05-06 01:45:42', '2020-05-06 01:45:42'),
(35, 'WM Bui Van Tai', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-05-06 01:47:03', '2020-05-06 01:47:03'),
(36, 'Taibv123', 383059048, 'chutai3212@gmail.com', 'số nhà 9 nghách 136/64 đường cầu diễn - phường minh khai - Bắc từ liêm', NULL, '2020-05-06 01:48:19', '2020-05-06 01:48:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_20_142544_create_product_categories_table', 1),
(5, '2019_12_20_142617_create_product_types_table', 1),
(6, '2019_12_20_152322_create_products_colors_table', 1),
(7, '2019_12_20_152444_create_products_size_table', 1),
(8, '2019_12_20_152658_create_products_imagestable', 1),
(9, '2019_12_21_153907_create_companies_table', 1),
(10, '2019_12_25_115249_create_products_table', 1),
(11, '2019_12_29_101606_create_customers_table', 1),
(12, '2019_12_29_101654_create_billss_table', 1),
(13, '2020_03_23_165257_update_products_table', 2),
(14, '2020_03_29_024306_update_bills_table', 3),
(15, '2020_03_29_024753_update2_bills_table', 4),
(16, '2020_03_30_013421_update2_products_table', 5),
(17, '2020_03_30_013842_update3_products_table', 6),
(18, '2020_03_30_013947_update4_products_table', 7),
(19, '2020_03_30_014346_update5_products_table', 8),
(20, '2020_03_30_014649_update6_products_table', 9),
(21, '2020_03_30_034017_create_sale_codes_table', 10),
(22, '2020_04_04_152140_create_account_comment_table', 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_type_id` bigint(20) DEFAULT NULL,
  `product_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `price_sale` decimal(10,2) DEFAULT NULL,
  `excerpt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `product_type_id`, `product_image`, `sku`, `name`, `price`, `price_sale`, `excerpt`, `description`, `body`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'nike-203.jpg', '2323232323', 'Giày Thể Thao Siêu Nhẹ Cho Nam 202\r\n', '1000000.00', '980000.00', 'Chức năng: chống trơn trượt, chống mài mòn, thoáng khí, cân bằng Đóng cửa nhẹ: ren Cỡ giày: 36 37 38 39 40 41 42 43 44', 'Các yếu tố phổ biến: khâu xe \r\nPhân loại màu: đen trắng, toàn màu đen Công nghệ giày thể thao: chân trần, công nghệ thoáng khí Thích hợp cho vỉa hè: đường mòn đường bộ giải trí đi bộ Giới tính: Nam giới Dòng thể thao: Dòng đời thể thao\r\n', NULL, NULL, 1, NULL, NULL),
(2, 1, '1586338923.png', 'TJ20200408154920', 'Giày Nike Zoom Winflo 6 Nam - Trắng', '230000.00', '199000.00', 'Sử dụng chất liệu vải lưới mesh cùng các dây Flywire trên upper, đôi giày có trọng lượng nhẹ, thoáng khí và vừa vặn với bàn chân. Gót giày có đơn vị Air Zoom mang lại một bộ đệm tuyệt vời.', 'Đế giày mềm và linh hoạt với đế ngoài cao su Waffle bền bỉ, các rãnh và vân đế ngoài có ma sát cao giúp phái Nam vững vàng với mọi cú tiếp đất. Kiểu dáng thời trang, màu sắc trang nhã, Nam tính, giày Nike Zoom Winflo 6 chắc chắn là một sự lựa chọn tuyệt vời.', NULL, NULL, 1, NULL, '2020-04-08 09:42:03'),
(3, 1, '18.png', 'GIÀ-15784038', 'Giày NIKE AIR FORCE 1', '210000.00', NULL, 'Size 36-43\nHàng đang hot nhất hiện nay', NULL, NULL, NULL, 1, '2020-03-06 10:33:06', '2020-03-06 10:33:06'),
(4, 1, '9.png', 'NIK-78246979', 'NIKE AIR MAX 270 REACT GHOST AQUA PHANTOM', '190000.00', NULL, NULL, NULL, NULL, NULL, 1, '2020-03-06 10:40:22', '2020-03-06 10:40:22'),
(5, 2, '25.png', 'ADI-51034876', 'ADIDAS YEEZY 350 V2 CLOUD WHITE NAM', '290000.00', NULL, NULL, NULL, NULL, NULL, 1, '2020-03-06 10:42:23', '2020-03-06 10:42:23'),
(6, 2, '20.png', 'ADI-32783856', 'ADIDAS ULTRA BOOST 4.0 GAME OF THRONES', '870000.00', NULL, NULL, NULL, NULL, NULL, 1, '2020-03-06 10:44:10', '2020-03-06 10:44:10'),
(7, 2, '19.png', 'ADI-58951763', 'ADIDAS ALPHABOUNCE INSTINCT M TURQUOISE 1:1', '780000.00', NULL, NULL, NULL, NULL, NULL, 1, '2020-03-06 10:45:56', '2020-03-06 10:45:56'),
(8, 4, '40.jpg', 'VAN-35129957', 'VANS FEAR OF GOD NAM', '890000.00', NULL, NULL, NULL, NULL, NULL, 1, '2020-03-06 10:47:03', '2020-03-06 10:47:03'),
(9, 4, '41.jpg', 'VAN-37980861', 'VANS SLIP ON SPONGEBOD BỌT BIỂN', '540000.00', NULL, NULL, NULL, NULL, NULL, 1, '2020-03-06 10:48:06', '2020-03-06 10:48:06'),
(10, 6, '42.jpg', 'GIÀ-83280161', 'Giày Sandal Nam Quai Ngang Vento NV4905', '260000.00', NULL, NULL, NULL, NULL, NULL, 1, '2020-03-06 10:49:53', '2020-03-06 10:49:53'),
(11, 6, '43.jpg', 'GIÀ-38260547', 'Giày Sandal Nam  VENTO Hàng Xuất Khẩu  NV8302B', '2390000.00', NULL, NULL, NULL, NULL, NULL, 1, '2020-03-06 10:51:06', '2020-03-06 10:51:06'),
(12, 7, '44.jpg', 'SAN-14090315', 'Sandal Nam Biti\'s SXB018200XNH', '185000.00', NULL, NULL, NULL, NULL, NULL, 1, '2020-03-06 10:52:27', '2020-03-06 10:52:27'),
(13, 10, '48.jpg', 'GIÀ-00387589', 'Giày Nam Chelsea Boot Cao Cổ Cao Câp UDANY', '599000.00', NULL, NULL, NULL, NULL, NULL, 1, '2020-03-06 10:54:17', '2020-03-06 10:54:17'),
(14, 10, '44.jpg', 'GIÀ-23894478', 'Giày nam cao cổ thời trang PETTINO - KS02', '199000.00', NULL, NULL, 'Thiết kế trẻ trung, năng động\n\nMàu sắc cá tính riêng biệt\n\nXu hướng thời trang Hàn Quốc\n\nThoải mái và êm ái khi di chuyển\n\nChất liệu cao cấp bền đẹp\n\nMũi giày tròn, ôm chân gọn gàng\n\nĐế bằng cao su tổng hợp; có độ ma sát cao\n\nDễ dàng phối trang phục', NULL, NULL, 1, '2020-03-06 10:55:25', '2020-03-06 10:55:25'),
(15, 15, '', 'GIÀ-92714537', 'Giày Boot Nam Cổ Ngắn Haley - Đen', '245000.00', NULL, NULL, 'Kiểu dáng: Giày boots trẻ trung\n\nChất liệu: Da PU, siêu bền đẹp\n\nĐế: Cao su, có rãnh chống trơn trượt\n\nThương hiệu:\n\nThích hợp: 4 mùa\n\nMục đích sử dụng: Công sở, du lịch, thể thao đi bộ, dã ngoại', NULL, NULL, 1, '2020-03-06 10:57:18', '2020-04-09 06:59:12'),
(16, 13, '49.jpg', 'GIÀ-17243280', 'Giày tây da nam khóa kéo mẫu mới 2019 TRT-GTN-07', '290000.00', NULL, NULL, 'Chất liệu cao cấp\n\nHợp thời trang\n\nSang trọng; lịch lãm\n\nKiểu dáng trẻ trung\n\nTính năng: Tăng chiều cao\n\nMàu sắc: Đen\n\nĐế: Cao su\n\nSize: Đủ size', NULL, NULL, 1, '2020-03-06 10:59:21', '2020-03-06 10:59:21'),
(17, 13, '50.jpg', 'GIÀ-69231146', 'Giày tây nam Oxford Tomoyo đen bóng TMN92101', '890000.00', NULL, NULL, 'hất liệu da bò cao cấp nhập khẩu\n\nLót và talon bên trong bằng chất liêu da thật 100% đến tận mũi giày, cực kỳ êm chân\n\nForm giày ôm bảo vệ chân tốt\n\nViền chỉ cùng màu tạo điểm nhấn\n\nĐế giày: đế Pháp, cực kỳ sang trọng\n\nSản phẩm được may đế, đảm bảo vô cùng chắc chắn\n\nĐường may sắc sảo, công nghệ hoàn thiện thủ công hơn 50% bởi những người thợ lành nghề\n\nGiảm hôi chân 1 cách hiệu quả nhất, luôn tạo cảm giác thoải mái cho người mang', NULL, NULL, 1, '2020-03-06 11:00:29', '2020-03-06 11:00:29'),
(18, 13, '52.jpg', 'GIÀ-41980738', 'Giày Nam Da Cao Cấp P016', '520000.00', NULL, NULL, NULL, NULL, NULL, 1, '2020-03-06 11:01:14', '2020-03-06 11:01:14'),
(53, 1, '1588729853.jpeg', 'TJ20200506085053', 'giay dep 2020', '500000.00', NULL, NULL, NULL, NULL, 'giay - dep - 2020', 1, '2020-05-06 01:50:53', '2020-05-06 01:50:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products_colors`
--

CREATE TABLE `products_colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products_colors`
--

INSERT INTO `products_colors` (`id`, `product_id`, `color`, `created_at`, `updated_at`) VALUES
(1, 1, 'Trắng', NULL, NULL),
(2, 1, 'Xanh', NULL, NULL),
(5, 3, 'Trắng', NULL, NULL),
(6, 3, 'Vàng', NULL, NULL),
(7, 4, 'Trắng', NULL, NULL),
(8, 4, 'Lục', NULL, NULL),
(9, 5, 'Trắng', NULL, NULL),
(10, 6, 'Đen', NULL, NULL),
(11, 7, 'Lam', NULL, NULL),
(12, 7, 'Trắng', NULL, NULL),
(13, 7, 'Đen', NULL, NULL),
(14, 8, 'Đen', NULL, NULL),
(15, 8, 'Trắng', NULL, NULL),
(16, 9, 'Vàng', NULL, NULL),
(17, 9, 'Đen', NULL, NULL),
(18, 10, 'Đen', NULL, NULL),
(19, 11, 'Đen', NULL, NULL),
(20, 11, 'Trắng', NULL, NULL),
(21, 12, 'Đen', NULL, NULL),
(22, 12, 'Lam', NULL, NULL),
(23, 13, 'Đen', NULL, NULL),
(24, 14, 'Lam', NULL, NULL),
(28, 16, 'Đen', NULL, NULL),
(29, 17, 'Đen', NULL, NULL),
(30, 18, 'Trắng', NULL, NULL),
(32, 20, 'Đen', NULL, NULL),
(33, 20, 'Trắng', NULL, NULL),
(34, 21, 'Đen', NULL, NULL),
(35, 21, 'Trắng', NULL, NULL),
(36, 22, 'Đen', NULL, NULL),
(37, 22, 'Trắng', NULL, NULL),
(38, 23, 'Đen', NULL, NULL),
(39, 23, 'Đỏ', NULL, NULL),
(40, 23, 'Lam', NULL, NULL),
(41, 23, 'Trắng', NULL, NULL),
(42, 24, 'Đen', NULL, NULL),
(43, 24, 'Lục', NULL, NULL),
(45, 25, 'Trắng', NULL, NULL),
(46, 25, 'Lam', NULL, NULL),
(47, 25, 'Đỏ', NULL, NULL),
(48, 25, 'Vàng', NULL, NULL),
(49, 29, 'Đen', NULL, NULL),
(50, 29, 'Trắng', NULL, NULL),
(51, 31, 'Đen', NULL, NULL),
(52, 32, 'Đen', NULL, NULL),
(53, 32, 'Trắng', NULL, NULL),
(54, 32, 'Lam', NULL, NULL),
(55, 32, 'Đỏ', NULL, NULL),
(56, 32, 'Vàng', NULL, NULL),
(57, 32, 'Hồng', NULL, NULL),
(58, 32, 'Lục', NULL, NULL),
(59, 33, 'Đen', NULL, NULL),
(60, 33, 'Trắng', NULL, NULL),
(61, 33, 'Đỏ', NULL, NULL),
(62, 34, 'Đỏ', NULL, NULL),
(63, 34, 'Vàng', NULL, NULL),
(64, 35, 'Đỏ', NULL, NULL),
(65, 35, 'Vàng', NULL, NULL),
(66, 36, 'Trắng', NULL, NULL),
(67, 37, 'Trắng', NULL, NULL),
(68, 38, 'Trắng', NULL, NULL),
(69, 39, 'Trắng', NULL, NULL),
(70, 40, 'Trắng', NULL, NULL),
(71, 41, 'Đen', NULL, NULL),
(72, 42, 'Đen', NULL, NULL),
(73, 43, 'Hồng', NULL, NULL),
(74, 44, 'Đen', NULL, NULL),
(75, 44, 'Trắng', NULL, NULL),
(76, 45, 'Đỏ', NULL, NULL),
(77, 46, 'Đỏ', NULL, NULL),
(78, 46, 'Đen', NULL, NULL),
(79, 47, 'Đen', NULL, NULL),
(80, 47, 'Trắng', NULL, NULL),
(81, 48, 'Đen', NULL, NULL),
(82, 48, 'Trắng', NULL, NULL),
(169, 19, 'Trắng', NULL, NULL),
(170, 19, 'Đen', NULL, NULL),
(171, 19, 'Lam', NULL, NULL),
(172, 19, 'Đỏ', NULL, NULL),
(173, 19, 'Vàng', NULL, NULL),
(174, 49, 'Đen', NULL, NULL),
(175, 49, 'Trắng', NULL, NULL),
(178, 2, 'Xanh', NULL, NULL),
(179, 2, 'Trăng', NULL, NULL),
(180, 2, 'Đen', NULL, NULL),
(181, 2, 'Lam', NULL, NULL),
(182, 2, 'Hồng', NULL, NULL),
(183, 15, 'Đen', NULL, NULL),
(184, 15, 'Lam', NULL, NULL),
(185, 15, 'Vàng', NULL, NULL),
(187, 50, 'Đen', NULL, NULL),
(191, 51, 'Đen', NULL, NULL),
(192, 51, 'Trắng', NULL, NULL),
(193, 51, 'Lam', NULL, NULL),
(194, 51, 'Đỏ', NULL, NULL),
(195, 51, 'Vàng', NULL, NULL),
(198, 52, 'Đen', NULL, NULL),
(199, 52, 'Trắng', NULL, NULL),
(200, 52, 'Lam', NULL, NULL),
(201, 52, 'Đỏ', NULL, NULL),
(202, 52, 'Vàng', NULL, NULL),
(203, 52, 'Hồng', NULL, NULL),
(204, 53, 'Đen', NULL, NULL),
(205, 53, 'Trắng', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products_images`
--

CREATE TABLE `products_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `images` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products_images`
--

INSERT INTO `products_images` (`id`, `product_id`, `images`, `created_at`, `updated_at`) VALUES
(1, 1, 'https://shopgiaythethaogiare.com/wp-content/uploads/2019/09/Giay-Nike-Air-Force-1-low-jelly-swoosh.jpg', NULL, NULL),
(2, 2, 'https://pegiay.vn/wp-content/uploads/2019/11/76684063_2493916537598717_8252857088934412288_n.jpg', NULL, NULL),
(3, 3, '1583461987.jpeg', '2020-03-06 10:33:07', '2020-03-06 10:33:07'),
(4, 5, '1583462544.jpeg', '2020-03-06 10:42:24', '2020-03-06 10:42:24'),
(5, 6, '1583462650.jpeg', '2020-03-06 10:44:10', '2020-03-06 10:44:10'),
(6, 7, '1583462756.jpeg', '2020-03-06 10:45:56', '2020-03-06 10:45:56'),
(7, 8, '1583462824.jpeg', '2020-03-06 10:47:04', '2020-03-06 10:47:04'),
(8, 9, '1583462887.jpeg', '2020-03-06 10:48:07', '2020-03-06 10:48:07'),
(9, 10, '1583462993.jpeg', '2020-03-06 10:49:53', '2020-03-06 10:49:53'),
(10, 11, '1583463066.jpeg', '2020-03-06 10:51:06', '2020-03-06 10:51:06'),
(11, 12, '1583463147.jpeg', '2020-03-06 10:52:27', '2020-03-06 10:52:27'),
(12, 13, '1583463257.jpeg', '2020-03-06 10:54:18', '2020-03-06 10:54:18'),
(13, 14, '1583463326.jpeg', '2020-03-06 10:55:26', '2020-03-06 10:55:26'),
(14, 15, '1583463438.jpeg', '2020-03-06 10:57:18', '2020-03-06 10:57:18'),
(15, 16, '1583463561.jpeg', '2020-03-06 10:59:22', '2020-03-06 10:59:22'),
(16, 17, '1583463629.jpeg', '2020-03-06 11:00:29', '2020-03-06 11:00:29'),
(17, 18, '1583463674.jpeg', '2020-03-06 11:01:14', '2020-03-06 11:01:14'),
(18, 19, '1583464006.jpeg', '2020-03-06 11:06:46', '2020-03-06 11:06:46'),
(19, 21, '1584981651.jpeg', '2020-03-23 09:40:51', '2020-03-23 09:40:51'),
(20, 22, '1584982976.jpeg', '2020-03-23 10:02:56', '2020-03-23 10:02:56'),
(21, 23, '1585153765.png', '2020-03-25 09:29:25', '2020-03-25 09:29:25'),
(22, 24, '1585157432.png', '2020-03-25 10:30:33', '2020-03-25 10:30:33'),
(23, 25, '1585186732.png', '2020-03-25 18:38:52', '2020-03-25 18:38:52'),
(24, 29, '1585532945.jpeg', '2020-03-29 18:49:05', '2020-03-29 18:49:05'),
(25, 30, '1585533478.jpeg', '2020-03-29 18:57:58', '2020-03-29 18:57:58'),
(26, 31, '1585533520.jpeg', '2020-03-29 18:58:40', '2020-03-29 18:58:40'),
(27, 32, '1585660513.jpeg', '2020-03-31 06:15:13', '2020-03-31 06:15:13'),
(28, 33, '1585981203.jpeg', '2020-04-03 23:20:03', '2020-04-03 23:20:03'),
(29, 34, '1586154837.jpeg', '2020-04-06 06:33:58', '2020-04-06 06:33:58'),
(30, 35, '1586154961.jpeg', '2020-04-06 06:36:01', '2020-04-06 06:36:01'),
(31, 36, '1586155053.jpeg', '2020-04-06 06:37:33', '2020-04-06 06:37:33'),
(32, 37, '1586155176.jpeg', '2020-04-06 06:39:36', '2020-04-06 06:39:36'),
(33, 38, '1586155189.jpeg', '2020-04-06 06:39:49', '2020-04-06 06:39:49'),
(34, 39, '1586155202.jpeg', '2020-04-06 06:40:03', '2020-04-06 06:40:03'),
(35, 40, '1586155287.jpeg', '2020-04-06 06:41:27', '2020-04-06 06:41:27'),
(36, 41, '1586155420.jpeg', '2020-04-06 06:43:41', '2020-04-06 06:43:41'),
(37, 42, '1586155531.jpeg', '2020-04-06 06:45:31', '2020-04-06 06:45:31'),
(38, 43, '1586155619.jpeg', '2020-04-06 06:46:59', '2020-04-06 06:46:59'),
(39, 44, '1586156224.jpeg', '2020-04-06 06:57:04', '2020-04-06 06:57:04'),
(40, 45, '1586156344.jpeg', '2020-04-06 06:59:04', '2020-04-06 06:59:04'),
(41, 46, '1586157520.jpeg', '2020-04-06 07:18:40', '2020-04-06 07:18:40'),
(42, 47, '1586158681.jpeg', '2020-04-06 07:38:01', '2020-04-06 07:38:01'),
(43, 48, '1586158760.jpeg', '2020-04-06 07:39:20', '2020-04-06 07:39:20'),
(44, 49, '1586311598.jpeg', '2020-04-08 02:06:38', '2020-04-08 02:06:38'),
(45, 50, '1586531729.jpeg', '2020-04-10 15:15:29', '2020-04-10 15:15:29'),
(46, 51, '1586616260.jpeg', '2020-04-11 14:44:20', '2020-04-11 14:44:20'),
(47, 52, '1586617876.jpeg', '2020-04-11 15:11:16', '2020-04-11 15:11:16'),
(48, 53, '1588729854.jpeg', '2020-05-06 01:50:54', '2020-05-06 01:50:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products_sizes`
--

CREATE TABLE `products_sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products_sizes`
--

INSERT INTO `products_sizes` (`id`, `product_id`, `size`, `created_at`, `updated_at`) VALUES
(1, 1, '40', NULL, NULL),
(2, 1, '41', NULL, NULL),
(3, 1, '42', NULL, NULL),
(4, 1, '38', NULL, NULL),
(5, 1, '39', NULL, NULL),
(10, 3, '38', NULL, NULL),
(11, 3, '39', NULL, NULL),
(12, 3, '40', NULL, NULL),
(13, 3, '41', NULL, NULL),
(14, 3, '42', NULL, NULL),
(15, 3, '43', NULL, NULL),
(16, 4, '38', NULL, NULL),
(17, 4, '41', NULL, NULL),
(18, 4, '42', NULL, NULL),
(19, 4, '43', NULL, NULL),
(20, 5, '43', NULL, NULL),
(21, 5, '42', NULL, NULL),
(22, 5, '41', NULL, NULL),
(23, 5, '40', NULL, NULL),
(24, 5, '38', NULL, NULL),
(25, 5, '39', NULL, NULL),
(26, 6, '38', NULL, NULL),
(27, 6, '40', NULL, NULL),
(28, 6, '39', NULL, NULL),
(29, 6, '43', NULL, NULL),
(30, 6, '42', NULL, NULL),
(31, 6, '41', NULL, NULL),
(32, 7, '43', NULL, NULL),
(33, 7, '40', NULL, NULL),
(34, 7, '39', NULL, NULL),
(35, 7, '38', NULL, NULL),
(36, 7, '41', NULL, NULL),
(37, 8, '38', NULL, NULL),
(38, 8, '39', NULL, NULL),
(39, 8, '40', NULL, NULL),
(40, 8, '41', NULL, NULL),
(41, 8, '42', NULL, NULL),
(42, 8, '43', NULL, NULL),
(43, 9, '38', NULL, NULL),
(44, 9, '39', NULL, NULL),
(45, 9, '41', NULL, NULL),
(46, 9, '40', NULL, NULL),
(47, 10, '38', NULL, NULL),
(48, 10, '39', NULL, NULL),
(49, 10, '40', NULL, NULL),
(50, 10, '41', NULL, NULL),
(51, 10, '42', NULL, NULL),
(52, 10, '43', NULL, NULL),
(53, 12, '40', NULL, NULL),
(54, 12, '38', NULL, NULL),
(55, 12, '39', NULL, NULL),
(56, 12, '41', NULL, NULL),
(57, 12, '42', NULL, NULL),
(58, 12, '43', NULL, NULL),
(59, 13, '40', NULL, NULL),
(60, 13, '42', NULL, NULL),
(61, 13, '41', NULL, NULL),
(62, 13, '43', NULL, NULL),
(63, 14, '38', NULL, NULL),
(64, 14, '39', NULL, NULL),
(65, 14, '41', NULL, NULL),
(66, 14, '40', NULL, NULL),
(67, 14, '42', NULL, NULL),
(68, 18, '43', NULL, NULL),
(69, 18, '42', NULL, NULL),
(70, 18, '41', NULL, NULL),
(71, 18, '39', NULL, NULL),
(72, 18, '40', NULL, NULL),
(73, 16, '43', NULL, NULL),
(74, 16, '38', NULL, NULL),
(75, 16, '40', NULL, NULL),
(76, 16, '39', NULL, NULL),
(83, 11, '38', NULL, NULL),
(84, 11, '39', NULL, NULL),
(85, 20, '38', NULL, NULL),
(86, 20, '40', NULL, NULL),
(87, 21, '38', NULL, NULL),
(88, 21, '39', NULL, NULL),
(89, 22, '38', NULL, NULL),
(90, 22, '39', NULL, NULL),
(91, 23, '38', NULL, NULL),
(92, 23, '40', NULL, NULL),
(93, 23, '43', NULL, NULL),
(94, 24, '38', NULL, NULL),
(95, 24, '39', NULL, NULL),
(96, 24, '40', NULL, NULL),
(97, 24, '41', NULL, NULL),
(98, 24, '42', NULL, NULL),
(99, 24, '43', NULL, NULL),
(100, 25, '39', NULL, NULL),
(101, 25, '38', NULL, NULL),
(102, 25, '40', NULL, NULL),
(103, 25, '41', NULL, NULL),
(104, 29, '39', NULL, NULL),
(105, 29, '38', NULL, NULL),
(106, 31, '38', NULL, NULL),
(107, 33, '40', NULL, NULL),
(108, 33, '39', NULL, NULL),
(109, 33, '38', NULL, NULL),
(110, 33, '41', NULL, NULL),
(111, 33, '42', NULL, NULL),
(112, 34, '43', NULL, NULL),
(113, 34, '42', NULL, NULL),
(114, 35, '43', NULL, NULL),
(115, 35, '42', NULL, NULL),
(116, 36, '38', NULL, NULL),
(117, 37, '38', NULL, NULL),
(118, 38, '38', NULL, NULL),
(119, 39, '38', NULL, NULL),
(120, 40, '38', NULL, NULL),
(121, 41, '38', NULL, NULL),
(122, 42, '39', NULL, NULL),
(123, 42, '41', NULL, NULL),
(124, 43, '43', NULL, NULL),
(125, 43, '42', NULL, NULL),
(126, 44, '43', NULL, NULL),
(127, 45, '43', NULL, NULL),
(128, 47, '38', NULL, NULL),
(129, 47, '39', NULL, NULL),
(130, 47, '40', NULL, NULL),
(131, 48, '38', NULL, NULL),
(132, 48, '39', NULL, NULL),
(230, 19, '42', NULL, NULL),
(231, 19, '41', NULL, NULL),
(232, 19, '40', NULL, NULL),
(233, 19, '38', NULL, NULL),
(234, 19, '43', NULL, NULL),
(235, 49, '38', NULL, NULL),
(240, 2, '38', NULL, NULL),
(241, 2, '42', NULL, NULL),
(242, 2, '40', NULL, NULL),
(243, 2, '41', NULL, NULL),
(244, 15, '38', NULL, NULL),
(245, 15, '39', NULL, NULL),
(246, 15, '41', NULL, NULL),
(248, 50, '38', NULL, NULL),
(252, 51, '38', NULL, NULL),
(253, 51, '39', NULL, NULL),
(254, 51, '40', NULL, NULL),
(257, 52, '38', NULL, NULL),
(258, 52, '40', NULL, NULL),
(259, 52, '39', NULL, NULL),
(260, 52, '41', NULL, NULL),
(261, 52, '42', NULL, NULL),
(262, 53, '38', NULL, NULL),
(263, 53, '39', NULL, NULL),
(264, 53, '41', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Giày thể thao', NULL, '2020-04-11 14:59:34'),
(2, 'Giày Sandal', NULL, NULL),
(3, 'Boot', NULL, NULL),
(4, 'Giày da', NULL, NULL),
(16, 'Giày đẹp 2019', '2020-04-11 15:12:35', '2020-04-11 15:12:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_types`
--

CREATE TABLE `product_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_category_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_types`
--

INSERT INTO `product_types` (`id`, `name`, `product_category_id`, `created_at`, `updated_at`) VALUES
(1, 'Giày Nike', 1, NULL, '2020-04-11 15:00:00'),
(3, 'Giày Puma', 1, NULL, NULL),
(4, 'Giày Vans', 1, NULL, NULL),
(5, 'Gucci', 1, NULL, NULL),
(6, 'Sandal Vento', 2, NULL, NULL),
(7, 'Sandal Bitis', 2, NULL, NULL),
(8, ' Sandal Fila', 2, NULL, NULL),
(9, 'Sandal Nike', 2, NULL, NULL),
(10, 'Red Wing', 3, NULL, NULL),
(11, 'Giày Sorel', 3, NULL, NULL),
(12, 'Grenson', 3, NULL, NULL),
(13, 'Salvatore', 4, NULL, NULL),
(14, 'Giày Gucci', 4, NULL, NULL),
(15, 'Givenchy.\r\n', 4, NULL, NULL),
(16, 'Giorgio Armani', 4, NULL, NULL),
(17, 'Minichino', 4, NULL, NULL),
(18, 'Balenciaga', 1, '2020-03-21 09:28:05', '2020-03-21 09:28:05'),
(19, 'Prada', 1, '2020-03-21 09:28:27', '2020-03-21 09:28:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sale_codes`
--

CREATE TABLE `sale_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` bigint(20) NOT NULL,
  `excerpt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sale_codes`
--

INSERT INTO `sale_codes` (`id`, `code`, `value`, `excerpt`, `created_at`, `updated_at`) VALUES
(1, 'KH2323', 5, NULL, NULL, NULL),
(2, 'TJ2323222', 10, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Tai ghgh', 'chutai3212@gmail.com', NULL, '123', NULL, '2020-03-06 12:39:52', '2020-05-06 06:58:45'),
(3, 'anh tai 98', 'tai123@gmail.com', NULL, '123', NULL, NULL, '2020-04-09 06:45:41'),
(7, 'admin2', 'admin@gmail.com', NULL, '123', NULL, '2020-04-11 15:13:08', '2020-04-11 15:13:15');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account_comment`
--
ALTER TABLE `account_comment`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `products_colors`
--
ALTER TABLE `products_colors`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products_images`
--
ALTER TABLE `products_images`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products_sizes`
--
ALTER TABLE `products_sizes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_types`
--
ALTER TABLE `product_types`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sale_codes`
--
ALTER TABLE `sale_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sale_codes_code_unique` (`code`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account_comment`
--
ALTER TABLE `account_comment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT cho bảng `products_colors`
--
ALTER TABLE `products_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT cho bảng `products_images`
--
ALTER TABLE `products_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `products_sizes`
--
ALTER TABLE `products_sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=265;

--
-- AUTO_INCREMENT cho bảng `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `product_types`
--
ALTER TABLE `product_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `sale_codes`
--
ALTER TABLE `sale_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
