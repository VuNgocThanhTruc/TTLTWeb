-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th12 05, 2022 lúc 01:37 PM
-- Phiên bản máy phục vụ: 5.7.36
-- Phiên bản PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `phone_care`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog`
--

DROP TABLE IF EXISTS `blog`;
CREATE TABLE IF NOT EXISTS `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tieu_de_tin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nd_tom_tat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1:Đăng,\r\n0: Không đăng',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_type_blog` int(11) NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL,
  `id_user_create` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_type_blog` (`id_type_blog`,`id_user_create`),
  KEY `FK_id_user_create_users` (`id_user_create`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_booking` datetime NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_payment` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_customer` (`id_customer`,`id_payment`),
  KEY `FK_id_payment` (`id_payment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brand`
--

DROP TABLE IF EXISTS `brand`;
CREATE TABLE IF NOT EXISTS `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brand`
--

INSERT INTO `brand` (`id`, `name`) VALUES
(1, 'Samsung'),
(2, 'Iphone'),
(3, 'Xiaomi'),
(4, 'Vsmart'),
(5, 'Oppo'),
(6, 'Realme'),
(7, 'Nokia');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `checkout`
--

DROP TABLE IF EXISTS `checkout`;
CREATE TABLE IF NOT EXISTS `checkout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_account` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_payment` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_id_payment_checkout` (`id_payment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detail_bookings`
--

DROP TABLE IF EXISTS `detail_bookings`;
CREATE TABLE IF NOT EXISTS `detail_bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_booking` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_id_booking_detail_bookings` (`id_booking`),
  KEY `Fk_id_payment_detail_bookings` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `library_images`
--

DROP TABLE IF EXISTS `library_images`;
CREATE TABLE IF NOT EXISTS `library_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_product` int(11) NOT NULL,
  `skug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_id_product_library_images` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `list_product_in_stores`
--

DROP TABLE IF EXISTS `list_product_in_stores`;
CREATE TABLE IF NOT EXISTS `list_product_in_stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `id_stores` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`,`id_stores`),
  KEY `FK_id_stores_list_product_in_stores` (`id_stores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `location`
--

DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `location`
--

INSERT INTO `location` (`id`, `province`, `city`, `district`) VALUES
(1, 'TP. Hồ Chí Minh', 'quận 1', 'Nguyễn Thị Minh Khai'),
(2, 'TP. Hồ Chí Minh', 'TP. Thủ Đức', 'Linh Trung');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_type_product` int(11) NOT NULL,
  `id_status_device` int(11) NOT NULL,
  `id_brand` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `sum_quantity` int(11) NOT NULL,
  `describe` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_store` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_type_product` (`id_type_product`,`id_status_device`,`id_brand`,`id_store`),
  KEY `FK_id_brand_brand` (`id_brand`),
  KEY `FK_id_status_device_products` (`id_status_device`),
  KEY `FK_id_store_products` (`id_store`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `avatar`, `id_type_product`, `id_status_device`, `id_brand`, `price`, `sum_quantity`, `describe`, `id_store`) VALUES
(1, 'Thay dây nút nguồn Xiaomi Redmi Note 11 Pro\r\n', 'thay-day-nut-nguon-xiaomi-redmi-note-11-pro_1667623363.png\r\n', 5, 1, 3, 300000, 50, '', 1),
(2, 'Thay cụm đuôi sạc Samsung Galaxy A02 A022F\r\n', 'thay-cum-duoi-sac-samsung-galaxy-a02-a022f_1667623123.png\r\n', 6, 1, 1, 300000, 50, '', 1),
(3, 'Độ vỏ iPhone 12 Pro\r\n', 'do-vo-iphone-12-pro_1667622426.png\r\n', 3, 1, 2, 2700000, 50, '', 1),
(4, 'Độ vỏ iPhone 13 Pro\r\n', 'do-vo-iphone-13-pro_1667622253.png\r\n', 2, 1, 2, 3100000, 50, '', 1),
(5, 'Độ vỏ iPhone 13 Pro Max\r\n', 'do-vo-iphone-13-pro-max_1667622099.png\r\n', 2, 1, 2, 3800000, 50, '', 2),
(6, 'Thay loa iPhone XR\r\n', 'thay-loa-iphone-xr_1667543636.png\r\n', 7, 1, 2, 300000, 12, '', 2),
(7, 'Thay pin Asus Zenfone Max Plus (M1) ZB570TL\r\n', 'thay-pin-asus-zenfone-max-plus-m1-zb570tl_1667468565.png\r\n', 1, 1, 5, 300000, 34, '', 2),
(8, 'Thay cảm ứng Asus Zenfone Max Plus (M1) ZB570TL\r\n', 'thay-cam-ung-asus-zenfone-max-plus-m1-zb570tl_1667468452.png\r\n', 3, 1, 5, 350000, 44, '', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `status_device`
--

DROP TABLE IF EXISTS `status_device`;
CREATE TABLE IF NOT EXISTS `status_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `status_device`
--

INSERT INTO `status_device` (`id`, `status`) VALUES
(1, 'New'),
(2, 'Old 99%'),
(3, 'Zin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `stores`
--

DROP TABLE IF EXISTS `stores`;
CREATE TABLE IF NOT EXISTS `stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_store` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_location` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_location` (`id_location`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `stores`
--

INSERT INTO `stores` (`id`, `name_store`, `id_location`) VALUES
(1, 'Phone Care 1', 1),
(2, 'Phone Care 2', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tyle_payments`
--

DROP TABLE IF EXISTS `tyle_payments`;
CREATE TABLE IF NOT EXISTS `tyle_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_blog`
--

DROP TABLE IF EXISTS `type_blog`;
CREATE TABLE IF NOT EXISTS `type_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_type_blog` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_products`
--

DROP TABLE IF EXISTS `type_products`;
CREATE TABLE IF NOT EXISTS `type_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_type_product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type_products`
--

INSERT INTO `type_products` (`id`, `name_type_product`) VALUES
(1, 'Thay pin'),
(2, 'Thay vỏ'),
(3, 'Thay mặt kính '),
(4, 'Thay dây sạc'),
(5, 'Thay nguồn'),
(6, 'Thay đuôi sạc'),
(7, 'Thay chuông'),
(8, 'Thay rung');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_user`
--

DROP TABLE IF EXISTS `type_user`;
CREATE TABLE IF NOT EXISTS `type_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten_loai_user` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type_user`
--

INSERT INTO `type_user` (`id`, `ten_loai_user`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'no-avatar.jpg',
  `tel` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_type_user` int(11) NOT NULL DEFAULT '1',
  `dob` date NOT NULL,
  `sex` int(11) NOT NULL COMMENT '0:male,\r\n1:female,\r\n-1:different',
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_type_user` (`id_type_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `avatar`, `tel`, `id_type_user`, `dob`, `sex`, `address`) VALUES
(1, 'user', 'vutruc0702@gmail.com', '123456', NULL, '0000000000', 1, '2002-11-22', 1, '');

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `FK_id_type_blog_type_blog` FOREIGN KEY (`id_type_blog`) REFERENCES `type_blog` (`id`),
  ADD CONSTRAINT `FK_id_user_create_users` FOREIGN KEY (`id_user_create`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `FK_id_customer_booking` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `FK_id_payment` FOREIGN KEY (`id_payment`) REFERENCES `tyle_payments` (`id`);

--
-- Các ràng buộc cho bảng `checkout`
--
ALTER TABLE `checkout`
  ADD CONSTRAINT `FK_id_payment_checkout` FOREIGN KEY (`id_payment`) REFERENCES `tyle_payments` (`id`);

--
-- Các ràng buộc cho bảng `detail_bookings`
--
ALTER TABLE `detail_bookings`
  ADD CONSTRAINT `Fk_id_booking_detail_bookings` FOREIGN KEY (`id_booking`) REFERENCES `booking` (`id`),
  ADD CONSTRAINT `Fk_id_payment_detail_bookings` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `library_images`
--
ALTER TABLE `library_images`
  ADD CONSTRAINT `FK_id_product_library_images` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `list_product_in_stores`
--
ALTER TABLE `list_product_in_stores`
  ADD CONSTRAINT `FK_id_product_list_product_in_stores` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK_id_stores_list_product_in_stores` FOREIGN KEY (`id_stores`) REFERENCES `stores` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_id_brand_brand` FOREIGN KEY (`id_brand`) REFERENCES `brand` (`id`),
  ADD CONSTRAINT `FK_id_status_device_products` FOREIGN KEY (`id_status_device`) REFERENCES `status_device` (`id`),
  ADD CONSTRAINT `FK_id_store_products` FOREIGN KEY (`id_store`) REFERENCES `stores` (`id`),
  ADD CONSTRAINT `FK_id_type_product_products` FOREIGN KEY (`id_type_product`) REFERENCES `type_products` (`id`);

--
-- Các ràng buộc cho bảng `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `Fk_id_location_stores` FOREIGN KEY (`id_location`) REFERENCES `location` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_id_type_user_user_type_user` FOREIGN KEY (`id_type_user`) REFERENCES `type_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
