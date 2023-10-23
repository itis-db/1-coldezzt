/*
 * for debug purposes
drop table if exists activity;
drop table if exists activitytype;
drop table if exists point_parent;
drop table if exists point;
drop table if exists contract;
drop table if exists project;
drop table if exists area;
drop table if exists subprogram;
drop table if exists program;
*/

create table activitytype (
    id 		integer primary key,
    "name"	varchar not null,
    sysname varchar not null	
);

create table activity (
	id				integer primary key,
	parent_id 		integer references activity (id),
	activitytype_id	integer not null references activitytype (id),
	activity_id		integer not null
);

create table program (
	id		integer primary key,
	"name"	varchar not null default 'Unknown',
	"desc"	varchar not null default 'Unspecified'
);


create table subprogram (
	id		integer primary key,
	"name"	varchar not null default 'Unknown',
	"desc"	varchar not null default 'Unspecified'
);

create table area (
	id		integer primary key,
	"name"	varchar not null default 'Unknown'
);

create table project (
	id		integer primary key,
	area_id	integer not null references area (id),
	"name"	varchar not null default 'Unknown',
	"desc"	varchar not null default 'Unspecified'
);

create table contract (
	id		integer primary key,
	"name"	varchar not null default 'Unknown',
	"desc"	varchar not null default 'Unspecified'
);

create table point (
	id			integer primary key,
	"name"		varchar not null default 'Unknown',
	"desc"		varchar not null default 'Unspecified'
);

-- для реализации связки кт -> (контракт ИЛИ проект)
--
-- при чём кт может быть связана с контрактом И проектом
-- одновременно, потому что логично, что прохождение кт, 
-- в некоторых случаях, может зависеть от нескольких факторов
create table point_parent (
	id			integer references point (id),
	contract_id integer,
	project_id	integer,
	check (contract_id is not null or project_id is not null)
);








