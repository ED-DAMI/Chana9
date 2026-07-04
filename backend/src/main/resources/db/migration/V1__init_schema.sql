create table users (
    id uuid primary key,
    phone varchar(32) not null unique,
    full_name varchar(255) not null,
    role varchar(32) not null,
    kyc_verified boolean not null default false,
    created_at timestamp not null default now()
);

create table annonces (
    id uuid primary key,
    title varchar(255) not null,
    description text,
    race varchar(255),
    poids double precision,
    prix numeric(19, 2),
    region varchar(255),
    statut varchar(32) not null,
    eleveur_id uuid not null references users(id),
    created_at timestamp not null default now()
);

create table annonce_photos (
    id bigserial primary key,
    annonce_id uuid not null references annonces(id) on delete cascade,
    photo_url text not null
);

create table sequestres (
    id uuid primary key,
    annonce_id uuid not null references annonces(id),
    acheteur_id uuid not null references users(id),
    montant numeric(19, 2) not null,
    statut varchar(32) not null,
    created_at timestamp not null default now()
);

create table messages (
    id uuid primary key,
    sender_id uuid not null references users(id),
    receiver_id uuid not null references users(id),
    content text not null,
    annonce_id uuid,
    sent_at timestamp not null default now()
);
