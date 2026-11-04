-- Warhammer Collection: une ligne par figurine et par compte Supabase.
create table if not exists public.collection_items (
  user_id uuid not null references auth.users(id) on delete cascade,
  id uuid not null,
  item jsonb check (item is null or jsonb_typeof(item) = 'object'),
  deleted boolean not null default false,
  updated_at timestamptz not null default now(),
  primary key (user_id, id),
  check (deleted or item is not null)
);

alter table public.collection_items enable row level security;

-- Chaque compte ne peut lire et modifier que ses propres lignes.
create policy "Users read their own collection"
  on public.collection_items for select to authenticated
  using ((select auth.uid()) = user_id);

create policy "Users add to their own collection"
  on public.collection_items for insert to authenticated
  with check ((select auth.uid()) = user_id);

create policy "Users update their own collection"
  on public.collection_items for update to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

create policy "Users delete from their own collection"
  on public.collection_items for delete to authenticated
  using ((select auth.uid()) = user_id);

grant select, insert, update, delete on public.collection_items to authenticated;
revoke all on public.collection_items from anon;
