-- TP3 : Exercices pratiques
-- Base de données : bibliotheque

USE bibliotheque;

-- Exercice 1 : ouvrages récents
 SELECT * FROM ouvrage
 -> ORDER BY id DESC
 -> LIMIT 3;

-- Exercice 2 : Auteurs à nom long
SELECT * FROM auteur
-> WHERE CHAR_LENGTH(nom) >= 5;

-- Exercice 3 : Abonnés hors domaine
 SELECT nom, email FROM abonne
 -> WHERE email NOT LIKE '%@example.com'
 -> AND email NOT LIKE '%@test.org';

-- Exercice 4: Emprunts en retard
--Requête non exécutée : les colonnes date_fin_prevue et date_retour_effective n'existent pas 
-- SELECT * FROM emprunt
-> WHERE date_fin_prevue < CURDATE()
-- AND date_retour_effective IS NULL;

-- Exercice 5: statistiques par auteur 
SELECT
-> a.id,
-> a.nom,
-> COUNT(o.id) AS total_ouvrages,
-> SUM(CASE WHEN o.disponible = TRUE THEN 1 ELSE 0 END) AS disponibles
-> FROM auteur a
-> JOIN ouvrage o ON a.id = o.auteur_id
-> GROUP BY a.id, a.nom;