# Connecter Warhammer Collection à Supabase

La version déployable est `index.html`. La page garde la sauvegarde locale et l'export JSON ; le cloud ajoute une connexion par lien e-mail et une collection isolée par compte.

## 1. Créer la table et ses règles d'accès

Dans Supabase, ouvrez **SQL Editor**, collez le contenu de `supabase.sql`, puis exécutez-le. Les règles RLS limitent chaque compte à ses propres figurines.

Dans **Authentication → Providers**, activez **Email**. Les liens doivent renvoyer vers l'adresse GitHub Pages du site. Ajoutez cette adresse dans **Authentication → URL Configuration → Redirect URLs**, par exemple `https://baretclement.github.io/warhammer/`.

## 2. Configuration déjà renseignée

Le `Project URL` et la clé publique **Publishable** ont été ajoutés à `index.html`. La clé est destinée au navigateur ; les règles RLS protègent les données. N'ajoutez jamais de clé `service_role` ou `secret` au site.

## 3. Publier et connecter les appareils

Publiez `index.html` à la racine de la branche GitHub Pages, avec `supabase.sql` conservé à part pour référence. Sur le site, saisissez votre e-mail et ouvrez le lien de connexion reçu. Connectez-vous avec le même compte sur chaque appareil. À la première connexion, les lignes cloud et la sauvegarde locale sont réunies ; les figurines locales absentes du cloud sont envoyées. Une même figurine présente aux deux endroits prend la version cloud.

L'export JSON reste disponible hors connexion. Les modifications locales restent enregistrées et placées en attente si le réseau échoue ; elles sont renvoyées à la prochaine connexion ou modification. Les changements hors ligne sur une figurine passent avant sa version cloud lors de la reconnexion. Les suppressions restent aussi en attente hors ligne et sont propagées à la reconnexion.

Le fichier `index.html` du dépôt est la version à publier. Le fichier SQL sert à configurer la base une seule fois ; il ne contient aucun secret.
