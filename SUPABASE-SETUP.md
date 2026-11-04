# Connecter Warhammer Collection à Supabase

La version déployable est `index.html`. La page garde la sauvegarde locale et l'export JSON ; le cloud ajoute une connexion par lien e-mail et une collection isolée par compte.

## 1. Créer la table et ses règles d'accès

Dans Supabase, ouvrez **SQL Editor**, collez le contenu de `supabase.sql`, puis exécutez-le. Les règles RLS limitent chaque compte à ses propres figurines.

Pour installer le catalogue partagé de 30 kits Warhammer 40,000, ouvrez un nouvel onglet dans **SQL Editor**, collez `catalog-warhammer-40k.sql` et exécutez-le après le premier script. Il crée une table séparée, lisible par les comptes connectés et modifiable uniquement depuis le SQL Editor. Les figurines ajoutées depuis le catalogue sont copiées dans la collection privée de l'utilisateur.

Dans **Authentication → Providers**, activez **Email**. Dans **Authentication → URL Configuration**, définissez **Site URL** et ajoutez dans **Redirect URLs** l'adresse exacte `https://baretclement.github.io/warhammer/`.

## 2. Configuration déjà renseignée

Le `Project URL` et la clé publique **Publishable** ont été ajoutés à `index.html`. La clé est destinée au navigateur ; les règles RLS protègent les données. N'ajoutez jamais de clé `service_role` ou `secret` au site.

## 3. Publier et connecter les appareils

Publiez `index.html` à la racine de la branche GitHub Pages, avec `supabase.sql` conservé à part pour référence. Pour la première connexion, saisissez votre e-mail et demandez un lien de connexion. Une fois connecté, définissez un mot de passe dans le formulaire affiché. Les connexions suivantes peuvent se faire directement avec e-mail et mot de passe ; le lien e-mail reste disponible. Utilisez le même compte sur chaque appareil. À la première connexion, les lignes cloud et la sauvegarde locale sont réunies ; les figurines locales absentes du cloud sont envoyées. Une même figurine présente aux deux endroits prend la version cloud.

Avec le fournisseur e-mail intégré de Supabase, l'envoi est limité à 2 e-mails par heure pour tout le projet. Si cette limite ne suffit pas, configurez un serveur SMTP personnalisé dans Supabase. Voir la [documentation SMTP](https://supabase.com/docs/guides/auth/auth-smtp).

L'export JSON reste disponible hors connexion. Les modifications locales restent enregistrées et placées en attente si le réseau échoue ; elles sont renvoyées à la prochaine connexion ou modification. Les changements hors ligne sur une figurine passent avant sa version cloud lors de la reconnexion. Les suppressions restent aussi en attente hors ligne et sont propagées à la reconnexion.

Le fichier `index.html` du dépôt est la version à publier. Le fichier SQL sert à configurer la base une seule fois ; il ne contient aucun secret.

Les prix du catalogue sont des relevés indicatifs chez Philibert au 4 novembre 2026. Ils peuvent évoluer ; le lien de chaque fiche permet de consulter le prix en vigueur. Les visuels s'affichent lorsque leur adresse d'image est disponible ; sinon une vignette de remplacement apparaît.
