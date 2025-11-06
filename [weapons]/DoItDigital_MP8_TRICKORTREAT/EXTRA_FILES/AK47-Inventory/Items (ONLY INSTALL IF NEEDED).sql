-- Auto-generated weapon SQL entries

-- Mp8 Trickortreat
DELETE FROM items WHERE name = 'WEAPON_MP8_TRICKORTREAT';
INSERT INTO items (name, label, weight, rare, can_remove)
SELECT 'WEAPON_MP8_TRICKORTREAT', 'Mp8 Trickortreat', 1, 0, 1
WHERE NOT EXISTS (SELECT 1 FROM items WHERE name = 'WEAPON_MP8_TRICKORTREAT');
