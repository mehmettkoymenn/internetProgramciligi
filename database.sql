-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 14 Mar 2024, 10:46:54
-- Sunucu sürümü: 8.2.0
-- PHP Sürümü: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `backend_project`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img_url` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `rank` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Tetikleyiciler `brands`
--
DROP TRIGGER IF EXISTS `brands_delete`;
DELIMITER $$
CREATE TRIGGER `brands_delete` BEFORE DELETE ON `brands` FOR EACH ROW INSERT INTO brands_log (item_id, img_url, title, `rank`, is_active, updated_at)
VALUES (OLD.id, OLD.img_url, OLD.title, OLD.rank, OLD.is_active, NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `brands_update`;
DELIMITER $$
CREATE TRIGGER `brands_update` BEFORE UPDATE ON `brands` FOR EACH ROW INSERT INTO brands_log (item_id, img_url, title, `rank`, is_active, updated_at)
VALUES (OLD.id, OLD.img_url, OLD.title, OLD.rank, OLD.is_active, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `brands_log`
--

DROP TABLE IF EXISTS `brands_log`;
CREATE TABLE IF NOT EXISTS `brands_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `id` int NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `rank` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img_url` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `rank` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at,` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Tetikleyiciler `products`
--
DROP TRIGGER IF EXISTS `products_delete`;
DELIMITER $$
CREATE TRIGGER `products_delete` BEFORE DELETE ON `products` FOR EACH ROW INSERT INTO products_log (product_id, img_url, title, description, `rank`, is_active, updated_at)
    VALUES (OLD.id, OLD.img_url, OLD.title, OLD.description, OLD.rank, OLD.is_active, NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `products_update`;
DELIMITER $$
CREATE TRIGGER `products_update` BEFORE UPDATE ON `products` FOR EACH ROW INSERT INTO products_log (product_id, img_url, title, description, `rank`, is_active, updated_at)
    VALUES (OLD.id, OLD.img_url, OLD.title, OLD.description, OLD.rank, OLD.is_active, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products_log`
--

DROP TABLE IF EXISTS `products_log`;
CREATE TABLE IF NOT EXISTS `products_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `id` int NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `rank` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_images`
--

DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `rank` int NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `is_cover` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Tetikleyiciler `product_images`
--
DROP TRIGGER IF EXISTS `product_images_delete`;
DELIMITER $$
CREATE TRIGGER `product_images_delete` BEFORE DELETE ON `product_images` FOR EACH ROW INSERT INTO product_images_log (product_image_id, product_id, `rank`, img_url, is_cover, is_active, updated_at)
    VALUES (OLD.id, OLD.product_id, OLD.`rank`, OLD.img_url, OLD.is_cover, OLD.is_active, NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `product_images_update`;
DELIMITER $$
CREATE TRIGGER `product_images_update` BEFORE UPDATE ON `product_images` FOR EACH ROW INSERT INTO product_images_log (product_image_id, product_id, `rank`, img_url, is_cover, is_active, updated_at)
    VALUES (OLD.id, OLD.product_id, OLD.`rank`, OLD.img_url, OLD.is_cover, OLD.is_active, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_images_log`
--

DROP TABLE IF EXISTS `product_images_log`;
CREATE TABLE IF NOT EXISTS `product_images_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `rank` int NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `is_cover` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `references`
--

DROP TABLE IF EXISTS `references`;
CREATE TABLE IF NOT EXISTS `references` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img_url` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `rank` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Tetikleyiciler `references`
--
DROP TRIGGER IF EXISTS `references_delete`;
DELIMITER $$
CREATE TRIGGER `references_delete` BEFORE DELETE ON `references` FOR EACH ROW INSERT INTO references_log (content_id, img_url, title, description, `rank`, is_active, updated_at)
    VALUES (OLD.id, OLD.img_url, OLD.title, OLD.description, OLD.rank, OLD.is_active, NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `references_update`;
DELIMITER $$
CREATE TRIGGER `references_update` BEFORE UPDATE ON `references` FOR EACH ROW INSERT INTO references_log (content_id, img_url, title, description, `rank`, is_active, updated_at)
    VALUES (OLD.id, OLD.img_url, OLD.title, OLD.description, OLD.rank, OLD.is_active, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `references_log`
--

DROP TABLE IF EXISTS `references_log`;
CREATE TABLE IF NOT EXISTS `references_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `id` int NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `rank` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img_url` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `rank` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Tetikleyiciler `services`
--
DROP TRIGGER IF EXISTS `services_delete`;
DELIMITER $$
CREATE TRIGGER `services_delete` BEFORE DELETE ON `services` FOR EACH ROW INSERT INTO services_log (id, img_url, title, url, description, `rank`, is_active, updated_at) 
    VALUES (OLD.id, OLD.img_url, OLD.title, OLD.url, OLD.description, OLD.`rank`, OLD.is_active, NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `services_update`;
DELIMITER $$
CREATE TRIGGER `services_update` BEFORE UPDATE ON `services` FOR EACH ROW INSERT INTO services_log (id, img_url, title, url, description, `rank`, is_active, updated_at) 
    VALUES (OLD.id, OLD.img_url, OLD.title, OLD.url, OLD.description, OLD.`rank`, OLD.is_active, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `services_log`
--

DROP TABLE IF EXISTS `services_log`;
CREATE TABLE IF NOT EXISTS `services_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `id` int NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `rank` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `about_us` text NOT NULL,
  `slogan` varchar(100) NOT NULL,
  `mission` text NOT NULL,
  `vision` text NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `mobile_img_url` varchar(50) NOT NULL,
  `favicon` varchar(50) NOT NULL,
  `phone_one` varchar(50) NOT NULL,
  `phone_two` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `facebook` varchar(50) NOT NULL,
  `twitter` varchar(50) NOT NULL,
  `instagram` varchar(50) NOT NULL,
  `linkedin` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `gsm_one` varchar(50) NOT NULL,
  `gsm_two` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Tetikleyiciler `settings`
--
DROP TRIGGER IF EXISTS `settings_delete`;
DELIMITER $$
CREATE TRIGGER `settings_delete` BEFORE DELETE ON `settings` FOR EACH ROW INSERT INTO companies_log (
        company_id, company_name, address, about_us, slogan, mission, vision, img_url,
        mobile_img_url, favicon, phone_one, phone_two, email, facebook, twitter,
        instagram, linkedin, is_active, gsm_one, gsm_two, updated_at
    ) VALUES (
        OLD.id, OLD.company_name, OLD.address, OLD.about_us, OLD.slogan, OLD.mission, OLD.vision, OLD.img_url,
        OLD.mobile_img_url, OLD.favicon, OLD.phone_one, OLD.phone_two, OLD.email, OLD.facebook, OLD.twitter,
        OLD.instagram, OLD.linkedin, OLD.is_active, OLD.gsm_one, OLD.gsm_two, NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `settings_update`;
DELIMITER $$
CREATE TRIGGER `settings_update` BEFORE UPDATE ON `settings` FOR EACH ROW INSERT INTO companies_log (
        company_id, company_name, address, about_us, slogan, mission, vision, img_url,
        mobile_img_url, favicon, phone_one, phone_two, email, facebook, twitter,
        instagram, linkedin, is_active, gsm_one, gsm_two, updated_at
    ) VALUES (
        OLD.id, OLD.company_name, OLD.address, OLD.about_us, OLD.slogan, OLD.mission, OLD.vision, OLD.img_url,
        OLD.mobile_img_url, OLD.favicon, OLD.phone_one, OLD.phone_two, OLD.email, OLD.facebook, OLD.twitter,
        OLD.instagram, OLD.linkedin, OLD.is_active, OLD.gsm_one, OLD.gsm_two, NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `settings_log`
--

DROP TABLE IF EXISTS `settings_log`;
CREATE TABLE IF NOT EXISTS `settings_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `id` int NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `about_us` text NOT NULL,
  `slogan` varchar(100) NOT NULL,
  `mission` text NOT NULL,
  `vision` text NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `mobile_img_url` varchar(50) NOT NULL,
  `favicon` varchar(50) NOT NULL,
  `phone_one` varchar(50) NOT NULL,
  `phone_two` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `facebook` varchar(50) NOT NULL,
  `twitter` varchar(50) NOT NULL,
  `instagram` varchar(50) NOT NULL,
  `linkedin` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `gsm_one` varchar(50) NOT NULL,
  `gsm_two` varchar(50) NOT NULL,
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `testimanials`
--

DROP TABLE IF EXISTS `testimanials`;
CREATE TABLE IF NOT EXISTS `testimanials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `company` varchar(100) NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `rank` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Tetikleyiciler `testimanials`
--
DROP TRIGGER IF EXISTS `testimanials_delete`;
DELIMITER $$
CREATE TRIGGER `testimanials_delete` BEFORE DELETE ON `testimanials` FOR EACH ROW INSERT INTO testimanials_log (user_id, title, description, full_name, company, img_url, `rank`, is_active)
    VALUES (OLD.id, OLD.title, OLD.description, OLD.full_name, OLD.company, OLD.img_url, OLD.`rank`, OLD.is_active)
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `testimanials_update`;
DELIMITER $$
CREATE TRIGGER `testimanials_update` BEFORE UPDATE ON `testimanials` FOR EACH ROW INSERT INTO testimanials_log (user_id, title, description, full_name, company, img_url, `rank`, is_active)
    VALUES (OLD.id, OLD.title, OLD.description, OLD.full_name, OLD.company, OLD.img_url, OLD.`rank`, OLD.is_active)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `testimanials_log`
--

DROP TABLE IF EXISTS `testimanials_log`;
CREATE TABLE IF NOT EXISTS `testimanials_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `id` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `company` varchar(100) NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `rank` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img_url` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `img_url`, `email`, `name`, `surname`, `password`, `is_active`, `created_at`) VALUES
(1, 'DENEME.jpg', 'kjfjk@gmms.com', 'gssjjf', 'kdfhkerşlgkrlk', '131323423', 1, '2024-03-10 18:35:08');

--
-- Tetikleyiciler `users`
--
DROP TRIGGER IF EXISTS `users_delete`;
DELIMITER $$
CREATE TRIGGER `users_delete` BEFORE DELETE ON `users` FOR EACH ROW INSERT INTO users_log (id, img_url, email, name, surname, password, is_active)
	VALUES (OLD.id, OLD.img_url, OLD.email, OLD.name, OLD.surname, OLD.password, OLD.is_active)
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `users_update`;
DELIMITER $$
CREATE TRIGGER `users_update` BEFORE UPDATE ON `users` FOR EACH ROW INSERT INTO users_log (id, img_url, email, name, surname, password, is_active)
	VALUES (OLD.id, OLD.img_url, OLD.email, OLD.name, OLD.surname, OLD.password, OLD.is_active)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users_log`
--

DROP TABLE IF EXISTS `users_log`;
CREATE TABLE IF NOT EXISTS `users_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `id` int NOT NULL,
  `img_url` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Tablo döküm verisi `users_log`
--

INSERT INTO `users_log` (`log_id`, `id`, `img_url`, `email`, `name`, `surname`, `password`, `is_active`) VALUES
(1, 1, 'DENEME.jpg', 'kjfjk@gmms.com', 'gjjf', 'kdfhkerşlgkrlk', '131323423', 1),
(2, 3, 'DENEME.jpg', 'kjfjkregeg@gmms.com', 'gsssjjf', 'kdfhkerşlgkrlk', '131323423', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
