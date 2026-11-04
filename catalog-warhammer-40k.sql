-- Catalogue partagé Warhammer 40,000 (prix indicatifs Philibert, relevés le 2026-11-04).
-- Les images sont null lorsqu'une URL de visuel stable n'a pas pu être confirmée.
create table if not exists public.catalog_items (
  id text primary key,
  universe text not null default 'Warhammer 40,000',
  faction text not null,
  name text not null,
  description text not null,
  price_eur numeric(8,2) not null check (price_eur >= 0),
  image_url text,
  product_url text not null,
  price_source text not null default 'Philibert',
  price_checked_at date not null default date '2026-11-04'
);

alter table public.catalog_items enable row level security;
drop policy if exists "Signed-in users read catalog" on public.catalog_items;
drop policy if exists "Anyone reads public catalog" on public.catalog_items;
create policy "Anyone reads public catalog" on public.catalog_items
  for select to anon, authenticated using (true);
revoke all on public.catalog_items from public, anon, authenticated;
grant select on public.catalog_items to anon, authenticated;

insert into public.catalog_items
(id,universe,faction,name,description,price_eur,image_url,product_url,price_source,price_checked_at)
values
('40k-sm-intercessors','Warhammer 40,000','Space Marines','Escouade Intercessor','Unité polyvalente de dix Space Marines pour tenir les objectifs et soutenir la ligne de bataille.',47.95,null,'https://www.philibertnet.com/fr/space-marines/182645-w40k-space-marines-escouade-intercessor-5011921267538.html','Philibert','2026-11-04'),
('40k-sm-jump-intercessors','Warhammer 40,000','Space Marines','Intercessors avec Réacteurs Dorsaux','Escouade d’assaut mobile équipée de réacteurs dorsaux.',45.95,null,'https://www.philibertnet.com/fr/space-marines/129098-w40k-adeptus-astartes-intercessors-avec-reacteurs-dorsaux-5011921200498.html','Philibert','2026-11-04'),
('40k-sm-eradicators','Warhammer 40,000','Space Marines','Eradicators','Équipe d’infanterie lourde spécialisée dans la destruction des blindés.',45.95,null,'https://www.philibertnet.com/fr/10078-space-marines','Philibert','2026-11-04'),
('40k-tyr-termagants','Warhammer 40,000','Tyranides','Termagants','Dix créatures d’infanterie équipées d’armes vivantes, accompagnées d’une nuée de Voraces.',33.50,'https://cdn1.philibertnet.com/588839-small_default/w40k-tyranids-termagants-5011921200313.jpg','https://www.philibertnet.com/fr/tyranids/128005-w40k-tyranids-termagants-5011921200313.html','Philibert','2026-11-04'),
('40k-tyr-hormagaunts','Warhammer 40,000','Tyranides','Hormagaunts','Dix assaillants bondissants armés de griffes, accompagnés d’une nuée de Voraces.',37.95,null,'https://www.philibertnet.com/fr/9932-tyranids','Philibert','2026-11-04'),
('40k-tyr-genestealers','Warhammer 40,000','Tyranides','Genestealers','Unité de prédateurs rapides conçue pour frapper au corps à corps.',40.50,null,'https://www.philibertnet.com/fr/9932-tyranids','Philibert','2026-11-04'),
('40k-orks-boyz','Warhammer 40,000','Orks','Boyz','Infanterie ork nombreuse avec options d’armes et de personnalisation.',46.95,null,'https://www.philibertnet.com/fr/orks/181268-w40k-orks-boyz-5011921267064.html','Philibert','2026-11-04'),
('40k-orks-beast-snagga','Warhammer 40,000','Orks','Beast Snagga Boyz','Dix combattants orks voués à la chasse et aux assauts brutaux.',45.95,null,'https://www.philibertnet.com/fr/orks/101219-w40k-orks-beast-snagga-boyz-5011921128310.html','Philibert','2026-11-04'),
('40k-orks-squighog','Warhammer 40,000','Orks','Squighog Boyz','Cavalerie agressive montée sur squigs, menée par un Nob.',50.95,null,'https://www.philibertnet.com/fr/orks/101233-w40k-orks-squighog-boyz-5011921128341.html','Philibert','2026-11-04'),
('40k-nec-warriors','Warhammer 40,000','Nécrons','Guerriers Nécrons','Infanterie mécanique immortelle accompagnée de scarabées Canoptek.',38.95,null,'https://www.philibertnet.com/fr/9931-necrons','Philibert','2026-11-04'),
('40k-nec-doomstalker','Warhammer 40,000','Nécrons','Canoptek Doomstalker','Plateforme de tir autonome soutenant les phalanges nécrons.',38.95,null,'https://www.philibertnet.com/fr/9931-necrons','Philibert','2026-11-04'),
('40k-nec-skorpekh','Warhammer 40,000','Nécrons','Destroyers Skorpekh','Unité d’élite de combat rapproché pour le Culte Destroyer.',46.50,null,'https://www.philibertnet.com/fr/9931-necrons','Philibert','2026-11-04'),
('40k-ael-guardians','Warhammer 40,000','Aeldari','Gardiens Aeldari','Dix Gardiens et une plateforme d’arme antigrav pour défendre leur monde-vaisseau.',45.95,null,'https://www.philibertnet.com/fr/9928-aeldari','Philibert','2026-11-04'),
('40k-ael-dire-avengers','Warhammer 40,000','Aeldari','Dire Avengers','Guerriers aspects équipés pour délivrer des salves de tirs disciplinées.',33.50,null,'https://www.philibertnet.com/fr/9928-aeldari','Philibert','2026-11-04'),
('40k-ael-avatar','Warhammer 40,000','Aeldari','Avatar de Khaine','Grande figurine centrale représentant le dieu de la guerre aeldari.',81.00,null,'https://www.philibertnet.com/fr/9928-aeldari','Philibert','2026-11-04'),
('40k-csm-possessed','Warhammer 40,000','Space Marines du Chaos','Possédés','Guerriers du Chaos transformés par les démons et spécialisés dans l’assaut.',47.95,null,'https://www.philibertnet.com/fr/9933-space-marines-du-chaos','Philibert','2026-11-04'),
('40k-csm-accursed','Warhammer 40,000','Space Marines du Chaos','Cultistes Maudits','Huit cultistes mutés, répartis entre mutants et tourmentés.',42.95,null,'https://www.philibertnet.com/fr/9933-space-marines-du-chaos','Philibert','2026-11-04'),
('40k-csm-lord','Warhammer 40,000','Space Marines du Chaos','Seigneur du Chaos','Commandant hérétique personnalisable avec plusieurs options d’armes.',32.50,null,'https://www.philibertnet.com/fr/space-marines-du-chaos/145858-w40k-space-marines-du-chaos-seigneur-du-chaos-5011921225101.html','Philibert','2026-11-04'),
('40k-guard-artillery','Warhammer 40,000','Astra Militarum','Équipe d’Artillerie','Équipe de servants et pièce d’artillerie pour soutenir les forces impériales.',47.95,null,'https://www.philibertnet.com/fr/9907-astra-militarum','Philibert','2026-11-04'),
('40k-guard-krieg','Warhammer 40,000','Astra Militarum','Death Korps de Krieg','Infanterie disciplinée de Krieg, équipée pour combattre dans des conditions extrêmes.',38.95,null,'https://www.philibertnet.com/fr/9907-astra-militarum','Philibert','2026-11-04'),
('40k-guard-cavalry','Warhammer 40,000','Astra Militarum','Cavaliers de Krieg','Cavalerie de choc de Krieg pour mener des charges rapides.',47.95,null,'https://www.philibertnet.com/fr/9907-astra-militarum','Philibert','2026-11-04'),
('40k-tau-kroot','Warhammer 40,000','Empire T’au','Carnivores Kroot','Unité d’infanterie éclaireuse alliée à l’Empire T’au.',42.95,null,'https://www.philibertnet.com/fr/9912-tau','Philibert','2026-11-04'),
('40k-tau-crisis','Warhammer 40,000','Empire T’au','Exo-armures Crisis XV8','Exo-armures polyvalentes équipées d’armes et systèmes interchangeables.',66.95,null,'https://www.philibertnet.com/fr/9912-tau','Philibert','2026-11-04'),
('40k-tau-firewarriors','Warhammer 40,000','Empire T’au','Équipe de Guerriers de Feu','Unité de ligne de l’Empire T’au dotée d’armes à impulsion.',45.95,null,'https://www.philibertnet.com/fr/9912-tau','Philibert','2026-11-04'),
('40k-adm-hastarii','Warhammer 40,000','Adeptus Mechanicus','Hastarii','Cinq spécialistes d’appui feu, assemblables en Exterminateurs ou Fusiliers.',45.00,null,'https://www.philibertnet.com/fr/9916-adeptus-mechanicus','Philibert','2026-11-04'),
('40k-adm-dominus','Warhammer 40,000','Adeptus Mechanicus','Tech-Priest Dominus','Prêtre de la Machine et commandant pour le Cult Mechanicus.',32.50,null,'https://www.philibertnet.com/fr/9916-adeptus-mechanicus','Philibert','2026-11-04'),
('40k-adm-electropriests','Warhammer 40,000','Adeptus Mechanicus','Electro-Priests','Cinq prêtres pouvant être assemblés en Corpuscarii ou Fulgurites.',40.50,null,'https://www.philibertnet.com/fr/9916-adeptus-mechanicus','Philibert','2026-11-04'),
('40k-sor-battle-sisters','Warhammer 40,000','Adepta Sororitas','Escouade de Sœurs de Bataille','Infanterie polyvalente de l’Adepta Sororitas avec options d’armes.',47.95,null,'https://www.philibertnet.com/fr/9908-soeurs-de-bataille','Philibert','2026-11-04'),
('40k-sor-retributors','Warhammer 40,000','Adepta Sororitas','Retributors','Équipe d’appui lourd des Sœurs de Bataille.',47.95,null,'https://www.philibertnet.com/fr/9908-soeurs-de-bataille','Philibert','2026-11-04'),
('40k-sor-canoness','Warhammer 40,000','Adepta Sororitas','Chanoinesse','Commandante de l’Adepta Sororitas pour mener les sœurs au combat.',32.50,null,'https://www.philibertnet.com/fr/9908-soeurs-de-bataille','Philibert','2026-11-04')
on conflict (id) do update set
  faction=excluded.faction, name=excluded.name, description=excluded.description,
  price_eur=excluded.price_eur, image_url=excluded.image_url,
  product_url=excluded.product_url, price_source=excluded.price_source,
  price_checked_at=excluded.price_checked_at;
