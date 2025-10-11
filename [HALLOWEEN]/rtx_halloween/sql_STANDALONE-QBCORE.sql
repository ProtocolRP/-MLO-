CREATE TABLE `halloweendecorations` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `coords` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `rotation` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `decorationid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

ALTER TABLE `halloweendecorations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`(191));

ALTER TABLE `halloweendecorations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;	