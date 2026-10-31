-- Clara personal finance data model for Supabase.
-- Apply this in the Supabase SQL Editor after creating a project.

create table if not exists public.finance_movements (
  id text primary key,
  user_id uuid not null references auth.users (id) on delete cascade,
  description text not null check (char_length(description) between 1 and 50),
  category text not null,
  date date not null,
  type text not null check (type in ('gasto', 'ingreso')),
  amount numeric(14, 2) not null check (amount > 0),
  created_at timestamptz not null default now()
);

create table if not exists public.finance_plans (
  id text primary key,
  user_id uuid not null references auth.users (id) on delete cascade,
  description text not null check (char_length(description) between 1 and 50),
  category text not null,
  date date not null,
  amount numeric(14, 2) not null check (amount > 0),
  included boolean not null default true,
  created_at timestamptz not null default now()
);

create table if not exists public.finance_preferences (
  user_id uuid primary key references auth.users (id) on delete cascade,
  available_today numeric(14, 2) not null default 0 check (available_today >= 0),
  updated_at timestamptz not null default now()
);

alter table public.finance_movements enable row level security;
alter table public.finance_plans enable row level security;
alter table public.finance_preferences enable row level security;
alter table public.finance_movements force row level security;
alter table public.finance_plans force row level security;
alter table public.finance_preferences force row level security;

revoke all on public.finance_movements from public, anon, authenticated;
revoke all on public.finance_plans from public, anon, authenticated;
revoke all on public.finance_preferences from public, anon, authenticated;

grant usage on schema public to authenticated;
grant select, insert, update, delete on public.finance_movements to authenticated;
grant select, insert, update, delete on public.finance_plans to authenticated;
grant select, insert, update, delete on public.finance_preferences to authenticated;

drop policy if exists "Users manage their own movements" on public.finance_movements;
create policy "Users manage their own movements"
  on public.finance_movements
  for all to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

drop policy if exists "Users manage their own plans" on public.finance_plans;
create policy "Users manage their own plans"
  on public.finance_plans
  for all to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

drop policy if exists "Users manage their own preferences" on public.finance_preferences;
create policy "Users manage their own preferences"
  on public.finance_preferences
  for all to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);
