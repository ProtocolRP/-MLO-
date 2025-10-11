INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('pumpkin', 'Pumpkin', 1, 0, 1),
	('bat_b', 'Bat B (Decoration)', 1, 0, 1),
	('bat_g', 'Bat G (Decoration)', 1, 0, 1),
	('bat_w', 'Bat W (Decoration)', 1, 0, 1),
	('bucket_1', 'Bucket (Decoration)', 1, 0, 1),
	('bucket_2', 'Bucket (Decoration)', 1, 0, 1),
	('bucket_3', 'Bucket (Decoration)', 1, 0, 1),
	('trickortreatsbucket', 'Bucket (Trick or Treats)', 1, 0, 1),
	('cat_b', 'Cat B (Decoration)', 1, 0, 1),
	('cat_g', 'Cat G (Decoration)', 1, 0, 1),
	('cat_w', 'Cat W (Decoration)', 1, 0, 1),
	('coffin', 'Coffin (Decoration)', 1, 0, 1),
	('coffin_door', 'Coffin Door (Decoration)', 1, 0, 1),
	('crown_b', 'Crown B (Decoration)', 1, 0, 1),
	('crown_g', 'Crown G (Decoration)', 1, 0, 1),
	('crown_w', 'Crown W (Decoration)', 1, 0, 1),	
	('cyrny', 'Cyrny (Candy)', 1, 0, 1),	
	('flet', 'Flet (Candy)', 1, 0, 1),	
	('ghost_b', 'Ghost B (Decoration)', 1, 0, 1),
	('ghost_g', 'Ghost G (Decoration)', 1, 0, 1),
	('ghost_w', 'Ghost W (Decoration)', 1, 0, 1),	
	('grave', 'Grave (Decoration)', 1, 0, 1),	
	('krucifix_b', 'Krucifix B (Decoration)', 1, 0, 1),
	('krucifix_g', 'Krucifix G (Decoration)', 1, 0, 1),
	('krucifix_w', 'Ghost W (Decoration)', 1, 0, 1),		
	('lars', 'Lars (Candy)', 1, 0, 1),
	('mumie', 'Mumie (Decoration)', 1, 0, 1),	
	('papi', 'Papi (Candy)', 1, 0, 1),
	('picolo', 'Picolo (Candy)', 1, 0, 1),
	('pot_handler', 'Pot Handler (Decoration)', 1, 0, 1),
	('pumpkin_1', 'Pumpkin 1 (Decoration)', 1, 0, 1),
	('pumpkin_2', 'Pumpkin 2 (Decoration)', 1, 0, 1),
	('pumpkin_3', 'Pumpkin 3 (Decoration)', 1, 0, 1),
	('skeleton_grave', 'Skeleton Grave (Decoration)', 1, 0, 1),
	('skiiles', 'Skiiles (Candy)', 1, 0, 1),
	('skull_1', 'Skull 1 (Decoration)', 1, 0, 1),
	('skull_2', 'Skull 2 (Decoration)', 1, 0, 1),
	('sneck', 'Sneck (Candy)', 1, 0, 1),
	('spider_b', 'Spider B (Decoration)', 1, 0, 1),
	('spider_g', 'Spider G (Decoration)', 1, 0, 1),
	('spider_w', 'Spider W (Decoration)', 1, 0, 1),	
	('witch_b', 'Witch B (Decoration)', 1, 0, 1),
	('witch_g', 'Witch G (Decoration)', 1, 0, 1),
	('witch_w', 'Witch W (Decoration)', 1, 0, 1);
	
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