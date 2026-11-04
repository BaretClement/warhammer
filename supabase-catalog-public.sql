-- Permet la lecture publique du catalogue de produits (sans exposer les collections personnelles).
alter table public.catalog_items enable row level security;
drop policy if exists "Signed-in users read catalog" on public.catalog_items;
drop policy if exists "Anyone reads public catalog" on public.catalog_items;
create policy "Anyone reads public catalog" on public.catalog_items
  for select to anon, authenticated using (true);
revoke all on public.catalog_items from public, anon, authenticated;
grant select on public.catalog_items to anon, authenticated;
