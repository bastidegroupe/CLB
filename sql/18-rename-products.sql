ALTER TABLE produit_had ADD COLUMN otherLabel VARCHAR(80);
UPDATE produit_had SET otherLabel = 'Location matelas à air classe 4 (curatif)' where lb_produit like '%COMPRESSEUR POUR AXTRAIR 4 AUTOMORPHO%';
UPDATE produit_had SET otherLabel = 'Location matelas à air classe 3 (préventif)' where lb_produit like '%MATELAS AXTAIR ONE%';
UPDATE produit_had SET otherLabel = 'Achat matelas mémoire de forme classe 3' where lb_produit like '%MATELAS AIRSOFT DUO 110K 200X87X17 CL3+H%';
UPDATE produit_had SET otherLabel = 'Achat matelas mémoire de forme classe 2' where lb_produit like '%MATELAS ECOFORM II CONFORTMED+HOUS%';
UPDATE produit_had SET otherLabel = 'FAUTEUIL COQUILLE ELECTRIQUE' where lb_produit like '%FAUTEUIL COQUILLE%';
UPDATE produit_had SET otherLabel = 'FAUTEUIL DE CONFORT MANUEL' where lb_produit like '%FAUTEUIL ROULANT de type REA CLEMATIS%';
UPDATE produit_had SET otherLabel = 'OXYGENE CONCENTRATEUR avec déambulation' where lb_produit like '%Forfait O2 LG TERME DEAMBUL HOMEFILL%';
UPDATE produit_had SET otherLabel = 'OXYGENE CONCENTRATEUR sans déambulation' where lb_produit like '%Forfait OLT 1.00%';
UPDATE produit_had SET otherLabel = 'OXYGENE LIQUIDE avec déambulation (> 6l/mn ou déambulation > 4h/j)' where lb_produit like '%Forfait OLT 2.00%';
UPDATE produit_had SET isDeleted = 1 where lb_produit like '%FAUTEUIL DE REPOS SANS ROULETTES%';