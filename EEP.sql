-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Ápr 18. 13:25
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `eliteep`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `munka`
--

CREATE TABLE `munka` (
  `UserId` int(11) NOT NULL,
  `MunkaId` int(11) NOT NULL,
  `Szakma` int(11) NOT NULL,
  `Leiras` varchar(255) NOT NULL,
  `Lakhely` varchar(255) NOT NULL,
  `Telefonszam` varchar(255) NOT NULL,
  `Feladat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `munka`
--

INSERT INTO `munka` (`UserId`, `MunkaId`, `Szakma`, `Leiras`, `Lakhely`, `Telefonszam`, `Feladat`) VALUES
(1, 1, 1, 'Festőt keresek', 'Pécs', '+3650748245', 'Szoba felújítás'),
(13, 15, 4, 'Villany bekötése a házba', 'Eger', '+3620742945', 'Villany bekötése'),
(13, 16, 3, 'Gáz sütő megnézése', 'Budapest XVI.', '+3610866738', 'Nem működő gázsütő'),
(13, 18, 2, 'Kerti csap csere', 'Balatonfüred', '+3687361348', 'Kerti csap hiba'),
(13, 21, 1, 'Egy nagyobb terem festése', 'Sopron', '+363076357', 'Terem festés');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `munkaltato`
--

CREATE TABLE `munkaltato` (
  `Id` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `MunkaltatoId` tinyint(1) NOT NULL COMMENT 'ha munkáltató akkor 0,ha vállalkozó akkor 1',
  `Lakhely` varchar(255) NOT NULL,
  `Telefonszam` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `munkaltato`
--

INSERT INTO `munkaltato` (`Id`, `UserId`, `MunkaltatoId`, `Lakhely`, `Telefonszam`) VALUES
(1, 1, 1, 'Budapest', '06301234567'),
(5, 13, 0, 'Budapest', '+36123456789');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `naptar`
--

CREATE TABLE `naptar` (
  `Id` int(11) NOT NULL,
  `MunkaId` int(11) NOT NULL,
  `DatumKezd` varchar(255) NOT NULL,
  `DatumVeg` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `naptar`
--

INSERT INTO `naptar` (`Id`, `MunkaId`, `DatumKezd`, `DatumVeg`) VALUES
(1, 1, '2024.03.28', '2024.04.5');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szakma`
--

CREATE TABLE `szakma` (
  `Id` int(11) NOT NULL,
  `Szakma` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `szakma`
--

INSERT INTO `szakma` (`Id`, `Szakma`) VALUES
(1, 'Festés'),
(2, 'Vízszerelés'),
(3, 'Gázszerelő'),
(4, 'Villanyszerelés');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user`
--

CREATE TABLE `user` (
  `Id` int(11) NOT NULL,
  `Nev` varchar(255) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Jelszo` varchar(255) NOT NULL,
  `Admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `user`
--

INSERT INTO `user` (`Id`, `Nev`, `Email`, `Jelszo`, `Admin`) VALUES
(1, 'Kiss Béla', 'kissbela@gmail.com', 'kissbela123', 0),
(2, 'Kiss Ferenc', 'kissferenc@gmail.com', 'kissferenc123', 0),
(13, 'Benedek', 'benedek@gmail.com', '$2y$10$UsYbszWos9cGHxoQ1GdsBOIb6l0DuwUpyAUumHNyiCprmRJWLFYiG', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vallalkozo`
--

CREATE TABLE `vallalkozo` (
  `Id` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `VallalkozoId` tinyint(1) NOT NULL COMMENT 'ha munkáltató akkor 0,ha vállalkozó akkor 1',
  `SzulIdo` date NOT NULL,
  `Szakma` int(11) NOT NULL,
  `Vegzetseg` varchar(255) NOT NULL,
  `Lakhely` varchar(255) NOT NULL,
  `Telefonszam` varchar(255) NOT NULL,
  `Tapasztalat` varchar(255) NOT NULL,
  `Letszam` int(11) NOT NULL,
  `Megjegyzes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `vallalkozo`
--

INSERT INTO `vallalkozo` (`Id`, `UserId`, `VallalkozoId`, `SzulIdo`, `Szakma`, `Vegzetseg`, `Lakhely`, `Telefonszam`, `Tapasztalat`, `Letszam`, `Megjegyzes`) VALUES
(1, 2, 1, '1994-10-03', 1, 'Szakmunkás', 'Budapest', '06201234567', '3 év', 1, 'Vállalkozó vagyok');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `munka`
--
ALTER TABLE `munka`
  ADD PRIMARY KEY (`MunkaId`),
  ADD KEY `szakma_index` (`Szakma`) USING BTREE,
  ADD KEY `user_index` (`UserId`) USING BTREE;

--
-- A tábla indexei `munkaltato`
--
ALTER TABLE `munkaltato`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `MunkaltatoUserId_index` (`UserId`) USING BTREE;

--
-- A tábla indexei `naptar`
--
ALTER TABLE `naptar`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `MunkaId_index` (`MunkaId`) USING BTREE;

--
-- A tábla indexei `szakma`
--
ALTER TABLE `szakma`
  ADD PRIMARY KEY (`Id`);

--
-- A tábla indexei `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `email_egyedi` (`Email`);

--
-- A tábla indexei `vallalkozo`
--
ALTER TABLE `vallalkozo`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `VallalkozoUserId_index` (`UserId`) USING BTREE,
  ADD KEY `szakma_index` (`Szakma`) USING BTREE;

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `munka`
--
ALTER TABLE `munka`
  MODIFY `MunkaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT a táblához `munkaltato`
--
ALTER TABLE `munkaltato`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT a táblához `naptar`
--
ALTER TABLE `naptar`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `szakma`
--
ALTER TABLE `szakma`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT a táblához `vallalkozo`
--
ALTER TABLE `vallalkozo`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `munka`
--
ALTER TABLE `munka`
  ADD CONSTRAINT `munka_ibfk_1` FOREIGN KEY (`Szakma`) REFERENCES `szakma` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `munka_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `munkaltato`
--
ALTER TABLE `munkaltato`
  ADD CONSTRAINT `munkaltato_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `naptar`
--
ALTER TABLE `naptar`
  ADD CONSTRAINT `naptar_ibfk_1` FOREIGN KEY (`MunkaId`) REFERENCES `munka` (`MunkaId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `vallalkozo`
--
ALTER TABLE `vallalkozo`
  ADD CONSTRAINT `vallalkozo_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`),
  ADD CONSTRAINT `vallalkozo_ibfk_2` FOREIGN KEY (`Szakma`) REFERENCES `szakma` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
