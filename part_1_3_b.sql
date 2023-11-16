-- Ajout de la colonne connected_at_month à la table session_table
ALTER TABLE session_table
ADD COLUMN connected_at_month INTEGER;

-- Mise à jour de la colonne connected_at_month avec le mois de la colonne connected_at
UPDATE session_table
SET connected_at_month = EXTRACT(MONTH FROM connected_at)::INTEGER;