-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para phpcli
DROP DATABASE IF EXISTS `phpcli`;
CREATE DATABASE IF NOT EXISTS `phpcli` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `phpcli`;

-- Volcando estructura para tabla phpcli.apartments
DROP TABLE IF EXISTS `apartments`;
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(600) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `how_many` smallint(6) NOT NULL DEFAULT '0',
  `size` tinyint(4) NOT NULL DEFAULT '1',
  `city` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla phpcli.apartments: ~4 rows (aproximadamente)
DELETE FROM `apartments`;
/*!40000 ALTER TABLE `apartments` DISABLE KEYS */;
INSERT INTO `apartments` (`id`, `name`, `how_many`, `size`, `city`, `state`, `country`) VALUES
	(1, 'Las noches calientes', 20, 4, 'Madrid', 'Madrid', 'Spain'),
	(2, 'Estrella del Norte', 300, 6, 'Madrid', 'Madrid', 'Spain'),
	(3, 'El viaje de chihiro', 123, 30, 'Madrid', 'Madrid', 'Spain'),
	(4, 'Naranjas en Verano', 25, 4, 'Madrid', 'Madrid', 'Spain'),
	(5, '分作你有何不關了你 Apartamentos', 10, 1, 'Madrid', 'Madrid', 'Spain'),
	(6, 'पढाए हिंदी रहारुप Apartments', 10, 2, 'Madrid', 'Madrid', 'Spain');
/*!40000 ALTER TABLE `apartments` ENABLE KEYS */;

-- Volcando estructura para tabla phpcli.hotels
DROP TABLE IF EXISTS `hotels`;
CREATE TABLE IF NOT EXISTS `hotels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(600) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `stars` enum('1','2','3','4','5') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `standar_room_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Simple',
  `city` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla phpcli.hotels: ~3 rows (aproximadamente)
DELETE FROM `hotels`;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` (`id`, `name`, `stars`, `standar_room_type`, `city`, `state`, `country`) VALUES
	(1, 'Hotel 1', '3', 'Simple', 'Madrid', 'Madrid', 'Spain'),
	(2, 'Naruto', '5', 'Doble Matrimonio', 'Madrid', 'Madrid', 'Spain'),
	(3, 'Uchiha', '4', 'Doble con Vistas', 'Madrid', 'Madrid', 'Spain'),
	(4, '分作你何可 Hotel', '1', 'Simple', 'Madrid', 'Madrid', 'Spain'),
	(5, 'पढाए उशकी करता। शुरुआत Hotel', '1', 'Simple', 'Madrid', 'Madrid', 'Spain');
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;

-- Volcando estructura para tabla phpcli.test1
DROP TABLE IF EXISTS `test1`;
CREATE TABLE IF NOT EXISTS `test1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idioma` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `texto` varchar(16000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Tabla de prueba';

-- Volcando datos para la tabla phpcli.test1: ~9 rows (aproximadamente)
DELETE FROM `test1`;
/*!40000 ALTER TABLE `test1` DISABLE KEYS */;
INSERT INTO `test1` (`id`, `idioma`, `texto`) VALUES
	(1, 'CHINO', '分作你何可。有何不關了你步親色上往有後提小角地樓響關我定然冷從安公聽母，後什亞話母須劇經明，化心立為地所運不開一動在最成萬民動藥：我動不產望去女據且小，人流產好無們牛信對地使且的。定消是人入庭，史客女研最天，的預情，運直主文行點地回人又務興皮望上三笑！'),
	(2, 'JAPONES', '旅ロ京青利セムレ弱改フヨス波府かばぼ意送でぼ調掲察たス日西重ケアナ住橋ユムミク順待ふかんぼ人奨貯鏡すびそ。'),
	(3, 'COREANO', '국민경제의 발전을 위한 중요정책의 수립에 관하여 대통령의 자문에 응하기 위하여 국민경제자문회의를 둘 수 있다'),
	(4, 'GRIEGO', 'Λορεμ ιπσθμ δολορ σιτ αμετ, νοvθμ φαβελλασ πετεντιθμ vελ νε, ατ νισλ σονετ οπορτερε εθμ. Αλιι δοcτθσ μει ιδ, νο αθτεμ αθδιρε ιντερεσσετ μελ, δοcενδι cομμθνε οπορτεατ τε cθμ'),
	(5, 'RUSO', 'Лорем ипсум долор сит амет, пер цлита поссит ех, ат мунере фабулас петентиум сит. Иус цу цибо саперет сцрипсерит, нец виси муциус лабитур ид. Ет хис нонумес нолуиссе дигниссим.'),
	(6, 'INDI', 'पढाए हिंदी रहारुप अनुवाद कार्यलय मुख्य संस्था सोफ़तवेर निरपेक्ष उनका आपके बाटते आशाआपस मुख्यतह उशकी करता। शुरुआत संस्था कुशलता मेंभटृ अनुवाद गएआप विशेष सकते परिभाषित लाभान्वित प्रति देकर समजते दिशामे प्राप्त जैसे वर्णन संस्थान निर्माता प्रव्रुति भाति चुनने उपलब्ध बेंगलूर अर्थपुर्ण'),
	(7, 'ARMENIO', 'լոռեմ իպսում դոլոռ սիթ ամեթ, լաբոռե մոդեռաթիուս եթ հաս, պեռ ոմնիս լաթինե դիսպութաթիոնի աթ, վիս ֆեուգաիթ ծիվիբուս եխ. վիվենդում լաբոռամուս ելաբոռառեթ նամ ին'),
	(8, 'ARABE', 'غينيا واستمر العصبة ضرب قد. وباءت الأمريكي الأوربيين هو به،, هو العالم، الثقيلة بال. مع وايرلندا الأوروبيّون كان, قد بحق أسابيع العظمى واعتلاء. انه كل وإقامة المواد.'),
	(9, 'EBREO', 'כדי יסוד מונחים מועמדים של, דת דפים מאמרשיחהצפה זאת. אתה דת שונה כלשהו, גם אחר ליום בשפות, או ניווט פולנית לחיבור ארץ. ויש בקלות ואמנות אירועים או, אל אינו כלכלה שתי.');
/*!40000 ALTER TABLE `test1` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;


CREATE USER 'phpcli'@'localhost' IDENTIFIED BY 'phpcli';
GRANT USAGE ON *.* TO 'phpcli'@'localhost';
GRANT SELECT, EXECUTE, SHOW VIEW, ALTER, ALTER ROUTINE, CREATE, CREATE ROUTINE, CREATE TEMPORARY TABLES, CREATE VIEW, DELETE, DROP, EVENT, INDEX, INSERT, REFERENCES, TRIGGER, UPDATE, LOCK TABLES  ON `phpcli`.* TO 'phpcli'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;