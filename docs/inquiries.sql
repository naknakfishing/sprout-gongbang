-- Supabase SQL Editor에 붙여 넣고 Run
create table if not exists public.inquiries (
  id bigint generated always as identity primary key,
  created_at timestamptz not null default now(),
  name text not null,
  contact text not null,
  message text,
  consent boolean not null default false,
  status text not null default '새 문의' check (status in ('새 문의', '연락함', '완료')),
  updated_at timestamptz
);
alter table public.inquiries enable row level security;
-- 정책은 만들지 않는다: 브라우저(공개 키)로는 접근 불가, 서버(/api)만 접근
