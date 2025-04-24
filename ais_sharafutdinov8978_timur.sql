-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Апр 24 2025 г., 12:57
-- Версия сервера: 8.0.29
-- Версия PHP: 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ais_sharafutdinov8978_timur`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Билет`
--

CREATE TABLE `Билет` (
  `ID` int NOT NULL COMMENT 'ID билета',
  `id сеанса` int NOT NULL COMMENT 'ID сеанса',
  `id места` int NOT NULL COMMENT 'ID места',
  `Посетитель` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ФИО '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Билет`
--

INSERT INTO `Билет` (`ID`, `id сеанса`, `id места`, `Посетитель`) VALUES
(1, 1, 1, 'Иванов Иван '),
(2, 2, 4, 'Петров Петр'),
(3, 3, 7, 'Максимов Максим'),
(4, 4, 2, 'Алексеев Алексей'),
(5, 5, 5, 'Константинов Константин'),
(6, 6, 8, 'Тимуров Тимур'),
(7, 7, 3, 'Артуров Артур'),
(8, 8, 6, 'Егоров Егор'),
(9, 9, 9, 'Михаилов Михаил');

-- --------------------------------------------------------

--
-- Структура таблицы `Зал`
--

CREATE TABLE `Зал` (
  `ID` int NOT NULL COMMENT 'ID зала',
  `Зал` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Наименование зала'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Зал`
--

INSERT INTO `Зал` (`ID`, `Зал`) VALUES
(1, 'Moon'),
(2, 'Star'),
(3, 'Sun');

-- --------------------------------------------------------

--
-- Структура таблицы `Место`
--

CREATE TABLE `Место` (
  `ID` int NOT NULL COMMENT 'ID места',
  `Ряд` int NOT NULL COMMENT 'номер ряда',
  `Номер` int NOT NULL COMMENT 'номер места',
  `Ценовая категория` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Категория цены',
  `ID зала` int NOT NULL COMMENT 'ID зала'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Место`
--

INSERT INTO `Место` (`ID`, `Ряд`, `Номер`, `Ценовая категория`, `ID зала`) VALUES
(1, 1, 1, 'low', 1),
(2, 1, 2, 'low', 1),
(3, 1, 3, 'low', 1),
(4, 1, 1, 'medium', 2),
(5, 1, 2, 'medium', 2),
(6, 1, 3, 'medium', 2),
(7, 1, 1, 'high', 3),
(8, 1, 2, 'high', 3),
(9, 1, 3, 'high', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `Сеанс`
--

CREATE TABLE `Сеанс` (
  `ID` int NOT NULL COMMENT 'ID сеанса',
  `id зала` int NOT NULL COMMENT 'ID зала',
  `id фильма` int DEFAULT NULL COMMENT 'ID фильма',
  `время начала` varchar(255) NOT NULL COMMENT 'время начала сеанса'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Сеанс`
--

INSERT INTO `Сеанс` (`ID`, `id зала`, `id фильма`, `время начала`) VALUES
(1, 1, 1, '11:00'),
(2, 2, 2, '12:00'),
(3, 3, 3, '13:00'),
(4, 1, 4, '14:00'),
(5, 2, 1, '15:00'),
(6, 3, 2, '16:00'),
(7, 1, 3, '17:00'),
(8, 2, 4, '18:00'),
(9, 3, 1, '19:00');

-- --------------------------------------------------------

--
-- Структура таблицы `Фильм`
--

CREATE TABLE `Фильм` (
  `ID` int NOT NULL COMMENT 'ID фильма',
  `фильм` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_cs_0900_ai_ci NOT NULL COMMENT 'Название фильма',
  `продолжительность` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Продолжительность сеанса'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Фильм`
--

INSERT INTO `Фильм` (`ID`, `фильм`, `продолжительность`) VALUES
(1, 'Spider-Man', '2часа'),
(2, 'Titanik', '3часа'),
(3, '8-mile', '1час'),
(4, '1+1', '3часа');

-- --------------------------------------------------------

--
-- Структура таблицы `Цена`
--

CREATE TABLE `Цена` (
  `ID` int NOT NULL COMMENT 'ID стоимости',
  `id сеанса` int NOT NULL COMMENT 'ID сеанса',
  `Ценовая категория` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Ценовая категория билета',
  `Цена` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Стоимость билета'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Цена`
--

INSERT INTO `Цена` (`ID`, `id сеанса`, `Ценовая категория`, `Цена`) VALUES
(1, 1, 'low', '100'),
(2, 2, 'medium', '200'),
(3, 3, 'high', '300'),
(4, 4, 'low', '100'),
(5, 5, 'medium', '200'),
(6, 6, 'high', '300'),
(7, 7, 'low', '100'),
(8, 8, 'medium', '200'),
(9, 9, 'high', '300');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Билет`
--
ALTER TABLE `Билет`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `id сеанса` (`id сеанса`),
  ADD KEY `id места` (`id места`);

--
-- Индексы таблицы `Зал`
--
ALTER TABLE `Зал`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `Место`
--
ALTER TABLE `Место`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID зала` (`ID зала`);

--
-- Индексы таблицы `Сеанс`
--
ALTER TABLE `Сеанс`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `id зала` (`id зала`),
  ADD KEY `id фильма` (`id фильма`);

--
-- Индексы таблицы `Фильм`
--
ALTER TABLE `Фильм`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `Цена`
--
ALTER TABLE `Цена`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `id сеанса` (`id сеанса`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Билет`
--
ALTER TABLE `Билет`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID билета', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `Зал`
--
ALTER TABLE `Зал`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID зала', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `Место`
--
ALTER TABLE `Место`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID места', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `Сеанс`
--
ALTER TABLE `Сеанс`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID сеанса', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `Фильм`
--
ALTER TABLE `Фильм`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID фильма', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `Цена`
--
ALTER TABLE `Цена`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT COMMENT 'ID стоимости', AUTO_INCREMENT=10;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Билет`
--
ALTER TABLE `Билет`
  ADD CONSTRAINT `Билет_ibfk_1` FOREIGN KEY (`id сеанса`) REFERENCES `Сеанс` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Билет_ibfk_2` FOREIGN KEY (`id места`) REFERENCES `Место` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Место`
--
ALTER TABLE `Место`
  ADD CONSTRAINT `Место_ibfk_1` FOREIGN KEY (`ID зала`) REFERENCES `Зал` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Сеанс`
--
ALTER TABLE `Сеанс`
  ADD CONSTRAINT `Сеанс_ibfk_1` FOREIGN KEY (`id зала`) REFERENCES `Зал` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Сеанс_ibfk_2` FOREIGN KEY (`id фильма`) REFERENCES `Фильм` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Цена`
--
ALTER TABLE `Цена`
  ADD CONSTRAINT `Цена_ibfk_1` FOREIGN KEY (`id сеанса`) REFERENCES `Сеанс` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
