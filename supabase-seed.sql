-- Run in Supabase SQL Editor → New Query

create table if not exists courses (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  progress integer not null default 0 check (progress >= 0 and progress <= 100),
  icon_name text not null default 'BookOpen',
  created_at timestamptz not null default now()
);

insert into courses (title, progress, icon_name) values
  ('Advanced React Patterns', 75, 'Code2'),
  ('TypeScript Deep Dive',    42, 'FileCode'),
  ('Next.js App Router',      88, 'Layers'),
  ('Framer Motion Mastery',   20, 'PlayCircle');

alter table courses enable row level security;
create policy "public read" on courses for select using (true);
