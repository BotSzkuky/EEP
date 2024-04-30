-- phpMyAdmin SQL Dump
-- version 5.2.1deb1
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2024. Ápr 30. 10:26
-- Kiszolgáló verziója: 10.11.6-MariaDB-0+deb12u1
-- PHP verzió: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `eep`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

--
-- A tábla adatainak kiíratása `munka`
--

INSERT INTO `munka` (`UserId`, `MunkaId`, `Szakma`, `Leiras`, `Lakhely`, `Telefonszam`, `Feladat`) VALUES
(1, 49, 4, 'Lakásomba szeretnék új villanyvezetékeket kiépíteni. Keresek egy megbízható és tapasztalt szakembert. Fontos számomra a biztonság, a minőségi munkavégzés és a szakértői tanácsadás az egész folyamat során.', 'Miskolc', '0670111111', 'Vezeték'),
(1, 50, 4, 'Lakásomban tervezek új villanykapcsolókat kiépíteni és néhány meglévőt cserélni. Keresek egy megbízható és tapasztalt villanyszerelőt.', 'Salgótarján', '0670111111', 'Villanykapcsoló'),
(1, 51, 4, 'Házamba szeretnék új lámpát bekötni. Keresek egy megbízható és tapasztalt villanyszerelőt a munka elvégzéséhez.', 'Szolnok', '0670111111', 'Lámpa bekötés'),
(1, 52, 4, 'Otthonom biztonságáért keresek tapasztalt szakembereket biztosíték doboz beépítésére.', 'Eger', '0670111111', 'Biztosíték doboz'),
(1, 53, 3, 'Lakásomba szeretnék gázvezetéket kiépíteni a konyhában és a fűtési rendszerhez. Fontos számomra a biztonság, a minőségi munkavégzés és a szakértői tanácsadás az egész folyamat során.', 'Esztergom', '0670111111', 'Gázvezeték kiépítés'),
(1, 54, 1, 'Keresek valakit, aki ki tudna festeni egy szobát nekem. Szükség van a festésre, mert a falak már régiek, és frissítést igényelnek. A szoba mérete körülbelül 20 négyzetméter.', 'Budapest XVIII.', '0670111111', 'Szobafestés'),
(1, 55, 1, 'Keresek valakit, aki ki tudná festeni házam külső falait. Szükség van a festésre, mert az időjárás kicsit megviselte a falakat. A ház körülbelül 100 négyzetméter alapterületű.', 'Kecskemét', '0670111111', 'Külső festés'),
(1, 56, 2, 'Keresek megbízható és tapasztalt szakembert a csővezetékeim karbantartásához. A hétköznapi lakásban található mosdó, konyha és fürdőszoba csövek tisztítását, ellenőrzését és szükség esetén javítását szeretném kérni.', 'Debrecen', '0670111111', 'Csővezeték karbantartás'),
(1, 57, 2, 'Lakásomba szeretnék egy új kazánt kiépíteni, és keresek egy megbízható, tapasztalt szakembert, aki segíthet ebben a projektben. Az új kazán az otthon fűtését és meleg víz ellátását fogja biztosítani.', 'Budapest II.', '0670111111', 'Kazán kiépítés'),
(1, 58, 2, 'Házamban szeretnék néhány új csaptelepet kiépíteni a konyhában és a fürdőszobában. Keresek egy megbízható és tapasztalt szakembert, aki segíthet ebben a projekten. Az új csaptelepek a mindennapi használat során kényelmes és hosszú élettartamúak legyenek.', 'Siófok', '0670111111', 'Csaptelep kiépítés');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

--
-- A tábla adatainak kiíratása `munkaltato`
--

INSERT INTO `munkaltato` (`Id`, `UserId`, `MunkaltatoId`, `Lakhely`, `Telefonszam`) VALUES
(5, 2, 0, 'Budapest', '+36123456789');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `naptar`
--

CREATE TABLE `naptar` (
  `Id` int(11) NOT NULL,
  `MunkaId` int(11) NOT NULL,
  `DatumKezd` varchar(255) NOT NULL,
  `DatumVeg` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szakma`
--

CREATE TABLE `szakma` (
  `Id` int(11) NOT NULL,
  `Szakma` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

--
-- A tábla adatainak kiíratása `user`
--

INSERT INTO `user` (`Id`, `Nev`, `Email`, `Jelszo`, `Admin`) VALUES
(1, 'Admin', 'admin@admin.hu', '$2y$10$0fox8Glusr.eA6396LrAMOePJ/nznw29Xgy1t/c3QwVPHnTFNAgOu', 1),
(2, 'Mark', 'mark@gmail.com', '$2y$10$LDy9UkSQyFjLF.ynRkMTbeU7P0AgOAEfxTM5CECDtb1de75iUQuSi', 0),
(3, 'Benedek', 'benedek@gmail.com', '$2y$10$UsYbszWos9cGHxoQ1GdsBOIb6l0DuwUpyAUumHNyiCprmRJWLFYiG', 0),
(4, 'DCsilla', 'dobrocsi.csilla@hengersor.hu', '$2y$10$EoO8UkJBh2l.CTr6Z85Hu.2ib7txF6a2l0GYLp8zlhvVT0FEECohy', 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

--
-- A tábla adatainak kiíratása `vallalkozo`
--

INSERT INTO `vallalkozo` (`Id`, `UserId`, `VallalkozoId`, `SzulIdo`, `Szakma`, `Vegzetseg`, `Lakhely`, `Telefonszam`, `Tapasztalat`, `Letszam`, `Megjegyzes`) VALUES
(1, 3, 1, '1994-10-03', 1, 'Szakmunkás', 'Budapest', '06201234567', '3 év', 1, 'Vállalkozó vagyok');

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
  MODIFY `MunkaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
