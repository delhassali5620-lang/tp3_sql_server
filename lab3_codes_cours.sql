mysql> notee;
mysql> USE bibliotheque;
Database changed
mysql> SELECT * FROM auteur;
+----+--------+--------+----------------+
| id | nom    | prenom | date_naissance |
+----+--------+--------+----------------+
|  1 | Dupont | Marie  | 1975-04-12     |
+----+--------+--------+----------------+
1 row in set (0.01 sec)

mysql> SELECT COUNT (*) FROM auteur;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '*) FROM auteur' at line 1
mysql> SELECT COUNT(*) FROM auteur;
+----------+
| COUNT(*) |
+----------+
|        1 |
+----------+
1 row in set (0.01 sec)

mysql> SELECT nom, email FROM abonne;
+--------+------------------------+
| nom    | email                  |
+--------+------------------------+
| Martin | luc.martin@example.com |
+--------+------------------------+
1 row in set (0.00 sec)

mysql> SELECT nom AS NomAbonne, email AS courriel FROM abonne;
+-----------+------------------------+
| NomAbonne | courriel               |
+-----------+------------------------+
| Martin    | luc.martin@example.com |
+-----------+------------------------+
1 row in set (0.00 sec)

mysql> SELECT titre, disponible 
    -> FROM ouvrage
    -> WHERE disponible = TRUE;
+----------------+------------+
| titre          | disponible |
+----------------+------------+
| Les Mis‚rables |          1 |
+----------------+------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM emprunt WHERE date_debut > '2025-06-01';
+------------+-----------+------------+----------+
| ouvrage_id | abonne_id | date_debut | date_fin |
+------------+-----------+------------+----------+
|          1 |         1 | 2026-11-19 | NULL     |
+------------+-----------+------------+----------+
1 row in set (0.00 sec)

mysql> SELECT titre FROM ouvrage WHERE disponible = TRUE ORDER BY titre ASC;
+----------------+
| titre          |
+----------------+
| Les Mis‚rables |
+----------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM emprunt 
    -> WHERE date_fin IS NOT NULL AND date_fin < '2025-12-31';
Empty set (0.00 sec)

mysql> SELECT titre FROM ouvrage
    -> WHERE disponible = FALSE AND auteur_id = 3;
Empty set (0.00 sec)

mysql> SELECT nom FROM abonne
    -> WHERE email LIKE '%@gmail.com' OR email LIKE '%@yahoo.fr';
Empty set (0.00 sec)

mysql> SELECT nom FROM auteur
    -> WHERE NOT (nom LIKE 'A%');
+--------+
| nom    |
+--------+
| Dupont |
+--------+
1 row in set (0.00 sec)

mysql> SELECT nom FROM auteur WHERE nom LIKE 'M%';
Empty set (0.00 sec)

mysql> SELECT email FROM abonne WHERE email LIKE '%@example.com';
+------------------------+
| email                  |
+------------------------+
| luc.martin@example.com |
+------------------------+
1 row in set (0.00 sec)

mysql> SELECT titre FROM ouvrage WHERE titre LIKE '%Science%';
Empty set (0.00 sec)

mysql> SELECT nom FROM auteur WHERE BINARY nom LIKE 'Dup%';
+--------+
| nom    |
+--------+
| Dupont |
+--------+
1 row in set, 1 warning (0.00 sec)

mysql> SELECT nom FROM abonne WHERE id IN (1,3,5,7);
+--------+
| nom    |
+--------+
| Martin |
+--------+
1 row in set (0.00 sec)

mysql> SELECT nom FROM abonne WHERE id NOT IN (2,4,6);
+--------+
| nom    |
+--------+
| Martin |
+--------+
1 row in set (0.00 sec)

mysql> WHERE date_debut BETWEEN '2025-05-01' AND '2025-05-31';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'WHERE date_debut BETWEEN '2025-05-01' AND '2025-05-31'' at line 1
mysql> SELECT * FROM emprunt 
    -> WHERE date_debut BETWEEN '2025-05-01' AND '2025-05-31';
Empty set (0.00 sec)

mysql> SELECT * FROM emprunt 
    -> WHERE date_debut NOT BETWEEN '2025-05-01' AND '2025-05-31';
+------------+-----------+------------+----------+
| ouvrage_id | abonne_id | date_debut | date_fin |
+------------+-----------+------------+----------+
|          1 |         1 | 2026-11-19 | NULL     |
+------------+-----------+------------+----------+
1 row in set (0.00 sec)

mysql> SELECT * FROM emprunt WHERE date_fin IS NULL;
+------------+-----------+------------+----------+
| ouvrage_id | abonne_id | date_debut | date_fin |
+------------+-----------+------------+----------+
|          1 |         1 | 2026-11-19 | NULL     |
+------------+-----------+------------+----------+
1 row in set (0.00 sec)

mysql> SELECT * FROM emprunt WHERE date_fin IS NOT NULL;
Empty set (0.00 sec)

mysql> SELECT nom, prenom
    -> FROM auteur
    -> ORDER BY nom ASC, prenom ASC;
+--------+--------+
| nom    | prenom |
+--------+--------+
| Dupont | Marie  |
+--------+--------+
1 row in set (0.00 sec)

mysql> SELECT * FROM abonne 
    -> ORDER BY id ASC LIMIT 10 OFFSET 20;
Empty set (0.00 sec)

mysql> SELECT COUNT(*) AS nb_disponibles
    -> FROM ouvrage
    -> WHERE disponible = TRUE;
+----------------+
| nb_disponibles |
+----------------+
|              1 |
+----------------+
1 row in set (0.00 sec)

mysql> SELECT auteur_id, COUNT(*) AS nb_ouvrages
    -> FROM ouvrage
    -> GROUP BY auteur_id
    -> HAVING nb_ouvrages > 5;
Empty set (0.00 sec)

mysql> notee;
