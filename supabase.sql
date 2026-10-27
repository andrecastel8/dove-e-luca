-- Dov'è Luca? — setup classifica
-- Incolla tutto in Supabase → SQL Editor → Run

create table if not exists public.scores (
  id         bigint generated always as identity primary key,
  name       text        not null check (char_length(trim(name)) between 1 and 16),
  score      integer     not null check (score between 1 and 500000),
  created_at timestamptz not null default now()
);

alter table public.scores enable row level security;

-- Chiunque abbia il link può leggere e aggiungere punteggi.
-- Nessuno può modificarli o cancellarli (nessuna policy update/delete).
create policy "lettura pubblica"   on public.scores for select to anon using (true);
create policy "inserimento pubblico" on public.scores for insert to anon with check (true);

grant select, insert on public.scores to anon;

-- Classifica: miglior punteggio per persona (nomi uguali a meno di maiuscole = stessa persona)
create or replace view public.leaderboard
with (security_invoker = true) as
select
  min(trim(name)) as name,
  max(score)      as best,
  count(*)        as games
from public.scores
group by lower(trim(name));

grant select on public.leaderboard to anon;

-- Per cancellare un punteggio finto (da SQL Editor, come amministratore):
-- delete from public.scores where id = 123;
