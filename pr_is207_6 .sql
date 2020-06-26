-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июн 26 2020 г., 19:33
-- Версия сервера: 5.7.27-log
-- Версия PHP: 7.4.0RC3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `pr_is207_6`
--

-- --------------------------------------------------------

--
-- Структура таблицы `managers_coef`
--

CREATE TABLE `managers_coef` (
  `Manager_id` int(10) UNSIGNED NOT NULL,
  `junior` double UNSIGNED NOT NULL,
  `middle` double UNSIGNED NOT NULL,
  `senior` double UNSIGNED NOT NULL,
  `analysis` double UNSIGNED NOT NULL,
  `installation` double UNSIGNED NOT NULL,
  `support` double UNSIGNED NOT NULL,
  `time_coef` double UNSIGNED NOT NULL,
  `diff_coef` double UNSIGNED NOT NULL,
  `cash_coef` double UNSIGNED NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `managers_coef`
--

INSERT INTO `managers_coef` (`Manager_id`, `junior`, `middle`, `senior`, `analysis`, `installation`, `support`, `time_coef`, `diff_coef`, `cash_coef`, `deleted`) VALUES
(1, 10000, 20000, 30000, 0.9, 0.7, 0.4, 1.9, 2.5, 200, 0),
(2, 12001.2, 24000, 36000, 0.8, 0.5, 1.9, 1.5, 2, 19, 0),
(3, 5000, 15000, 30000, 1, 1, 0.2, 3.4, 2.9, 250, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `performer`
--

CREATE TABLE `performer` (
  `Performer_id` int(10) UNSIGNED NOT NULL,
  `Grade` enum('junior','middle','senior','') COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `performer`
--

INSERT INTO `performer` (`Performer_id`, `Grade`, `deleted`) VALUES
(4, 'junior', 0),
(5, 'middle', 0),
(6, 'senior', 0),
(7, 'junior', 0),
(8, 'middle', 0),
(9, 'junior', 0),
(10, 'junior', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `subgroups`
--

CREATE TABLE `subgroups` (
  `id` int(10) NOT NULL,
  `Manager_id` int(10) UNSIGNED NOT NULL,
  `Performer_id` int(10) UNSIGNED NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `subgroups`
--

INSERT INTO `subgroups` (`id`, `Manager_id`, `Performer_id`, `deleted`) VALUES
(1, 1, 4, 0),
(2, 1, 5, 0),
(3, 2, 6, 0),
(4, 2, 7, 0),
(5, 2, 8, 0),
(6, 3, 9, 0),
(7, 3, 10, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `task`
--

CREATE TABLE `task` (
  `id` int(10) UNSIGNED NOT NULL,
  `Performer_id` int(10) UNSIGNED NOT NULL,
  `Name` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `Definition` text COLLATE utf8_unicode_ci NOT NULL,
  `Complexity` tinyint(2) UNSIGNED NOT NULL,
  `Status` enum('Запланирована','Выполняется','Завершена','Отменена') COLLATE utf8_unicode_ci NOT NULL,
  `LeadTime` int(11) NOT NULL,
  `DateCompletion` datetime DEFAULT NULL,
  `PerformanceDate` datetime NOT NULL,
  `DateCreate` datetime NOT NULL,
  `TypeWork` enum('Анализ и проектирование','Установка оборудования','Техническое обслуживание и сопровождение') COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `task`
--

INSERT INTO `task` (`id`, `Performer_id`, `Name`, `Definition`, `Complexity`, `Status`, `LeadTime`, `DateCompletion`, `PerformanceDate`, `DateCreate`, `TypeWork`, `deleted`) VALUES
(1, 4, 'Проектирование системы для \"\"ООО Автопром-сервис\"\"', 'Запроектировать так, чтобы мать родная не узнала', 20, 'Запланирована', 0, NULL, '2020-06-16 00:00:00', '2020-06-16 00:00:00', 'Анализ и проектирование', 0),
(2, 4, 'Установка оборудования для \"\"ООО Автопром-сервис\"\"', '', 25, 'Запланирована', 0, NULL, '2020-06-16 00:00:00', '2020-06-16 00:00:00', 'Анализ и проектирование', 0),
(3, 5, 'Анализ поломки оборудования у \"\"Пятерочка\"\"', '', 12, 'Запланирована', 0, NULL, '2020-06-16 00:00:00', '2020-06-16 00:00:00', 'Анализ и проектирование', 0),
(4, 6, 'Подготовить коммерческое предложение для \"\"Евросеть\"\"', '', 45, 'Завершена', 183, '2020-06-25 00:00:00', '2020-06-16 00:00:00', '2020-06-16 00:00:00', 'Анализ и проектирование', 0),
(5, 7, 'Подготовить коммерческое предложение для \"\"Дикси\"\"', '', 35, 'Завершена', 0, '2020-06-25 00:00:00', '2020-06-16 00:00:00', '2020-06-16 00:00:00', 'Анализ и проектирование', 0),
(6, 8, 'Установка оборудования для \"\"ООО Магнит\"\"', 'cbcvcbvvcbbcvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv', 32, 'Запланирована', 0, NULL, '2020-06-16 00:00:00', '2020-06-16 00:00:00', 'Анализ и проектирование', 0),
(7, 9, 'Установка оборудования для \"\"Бристоль\"\"', '', 24, 'Запланирована', 0, NULL, '2020-06-16 00:00:00', '2020-06-16 00:00:00', 'Анализ и проектирование', 0),
(8, 9, 'Отправить пригласительные письма потенциальным клиентам', '', 15, 'Запланирована', 0, NULL, '2020-06-16 00:00:00', '2020-06-16 00:00:00', 'Анализ и проектирование', 0),
(9, 10, 'Отработать возражения от \"\"Пчелки\"\"', '', 34, 'Запланирована', 0, NULL, '2020-06-16 00:00:00', '2020-06-16 00:00:00', 'Анализ и проектирование', 0),
(20, 6, 'Дешевка', 'ывева', 35, 'Завершена', 345, '2020-06-17 00:00:00', '2020-06-04 00:00:00', '2020-06-23 00:00:00', 'Техническое обслуживание и сопровождение', 1),
(21, 5, 'фаыу', 'ыва', 34, 'Выполняется', 35, '2020-06-26 00:00:00', '2020-06-04 00:00:00', '2020-06-23 00:00:00', 'Техническое обслуживание и сопровождение', 0),
(22, 4, 'вы', 'вы', 2, 'Завершена', 2, '2020-06-25 00:00:00', '2020-06-17 00:00:00', '2020-06-24 00:00:00', 'Анализ и проектирование', 0),
(23, 5, 'd', 'd', 2, 'Выполняется', 2, '2020-06-09 00:00:00', '2020-06-17 00:00:00', '2020-06-24 00:00:00', 'Установка оборудования', 0),
(24, 5, 'Мистер Бэбэй', 'f', 2, 'Выполняется', 2, NULL, '2020-06-25 00:00:00', '2020-06-24 00:00:00', 'Установка оборудования', 0),
(25, 6, 'Не Мистре Бубэй', '', 50, 'Запланирована', 20, NULL, '2020-06-03 00:00:00', '2020-06-24 00:00:00', 'Установка оборудования', 1),
(26, 6, 'test', 'test', 24, 'Отменена', 45, NULL, '2020-06-05 00:00:00', '2020-06-24 00:00:00', 'Анализ и проектирование', 1),
(27, 6, 'па', 'ап', 2, 'Завершена', 2, '2020-06-25 00:00:00', '2020-06-17 00:00:00', '2020-06-25 00:00:00', 'Анализ и проектирование', 1),
(28, 7, '\'`\"', '`sd ``\"&#39;&#39;&#39;&#39;&#39;', 2, 'Завершена', 2, '2020-06-25 00:00:00', '2020-06-11 00:00:00', '2020-06-25 00:00:00', 'Анализ и проектирование', 1),
(29, 7, '2', '', 1, 'Выполняется', 2, NULL, '2020-05-28 00:00:00', '2020-06-25 00:00:00', 'Анализ и проектирование', 1),
(30, 7, 'какакакак', 'какакака', 3, 'Запланирована', 12, '2020-06-28 00:00:00', '2020-06-28 00:00:00', '2020-06-26 00:00:00', 'Техническое обслуживание и сопровождение', 1),
(31, 6, 'Сыграть в бубень для заказчика', '', 50, 'Завершена', 210, '2020-06-26 00:00:00', '2020-06-25 00:00:00', '2020-06-26 00:00:00', 'Установка оборудования', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `Login` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FullName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TypeUser` enum('Исполнитель','Менеджер') COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `Login`, `Password`, `FullName`, `TypeUser`, `deleted`) VALUES
(1, 'kukleva', 'kuklevapassword', 'Куклева Дарья Владимировна', 'Менеджер', 0),
(2, 'kremlev', '1', 'Кремлев Владислав Юрьевич', 'Менеджер', 0),
(3, 'lavrinov', 'lavrinovpassword', 'Лавринов Андрей Борисович', 'Менеджер', 0),
(4, 'galiulina', '1', 'Галиуллина Альбина Нафисовна', 'Исполнитель', 0),
(5, 'kudryashov', 'kudryashovpassword', 'Кудряшов Александр Витальевич', 'Исполнитель', 0),
(6, 'velizhanina', '1', 'Велижанина Светлана Николаевна', 'Исполнитель', 0),
(7, 'plotnikova', 'plotnikovapassword', 'Плотникова Алевтина Валентиновна', 'Исполнитель', 0),
(8, 'malcev', 'malcevpassword', 'Мальцев Александр Сергеевич', 'Исполнитель', 0),
(9, 'morozova', 'morozovapassword', 'Морозова Екатерина  Владимировна', 'Исполнитель', 0),
(10, 'pyankova', 'pyankovapassword', 'Пьянкова Анастасия Борисовна', 'Исполнитель', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `managers_coef`
--
ALTER TABLE `managers_coef`
  ADD UNIQUE KEY `Manager_id` (`Manager_id`);

--
-- Индексы таблицы `performer`
--
ALTER TABLE `performer`
  ADD PRIMARY KEY (`Performer_id`),
  ADD UNIQUE KEY `Executor_id` (`Performer_id`);

--
-- Индексы таблицы `subgroups`
--
ALTER TABLE `subgroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Manager_id` (`Manager_id`,`Performer_id`),
  ADD KEY `Executor_id` (`Performer_id`);

--
-- Индексы таблицы `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `Executor_id` (`Performer_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Username` (`Login`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `subgroups`
--
ALTER TABLE `subgroups`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `task`
--
ALTER TABLE `task`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `managers_coef`
--
ALTER TABLE `managers_coef`
  ADD CONSTRAINT `managers_coef_ibfk_1` FOREIGN KEY (`Manager_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `performer`
--
ALTER TABLE `performer`
  ADD CONSTRAINT `performer_ibfk_1` FOREIGN KEY (`Performer_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `subgroups`
--
ALTER TABLE `subgroups`
  ADD CONSTRAINT `subgroups_ibfk_1` FOREIGN KEY (`Performer_id`) REFERENCES `performer` (`Performer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subgroups_ibfk_2` FOREIGN KEY (`Manager_id`) REFERENCES `managers_coef` (`Manager_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_ibfk_1` FOREIGN KEY (`Performer_id`) REFERENCES `performer` (`Performer_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
