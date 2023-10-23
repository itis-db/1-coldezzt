-- for debug purposes
/*
drop table if exists subprogram;
drop table if exists project;
drop table if exists contract;
drop table if exists area;
drop table if exists program;
drop table if exists point;
drop table if exists activity;
drop table if exists activitytype;
*/

create table activitytype (
    id 		integer primary key,
    "name"	varchar not null,
    sysname varchar not null	
);

create table activity (
	id				integer primary key,
	activitytype_id	integer not null references activitytype (id),
	code 			varchar not null,
	"name"			varchar not null,
	activity_id		integer not null,
	parent_id 		integer references activity (id)
);

create table program (
	id			integer primary key references activity (id),
	indexnum	integer,
	yearstart	integer,
	yearfinish	integer
);


create table subprogram (
	id			integer primary key references activity (id),
	indexnum 	integer
);

create table area (
	id		integer primary key,
	"name"	varchar not null default 'Unknown'
);

create table project (
	id			integer primary key references activity (id),
	targetdescr	varchar
);

create table contract (
	id		integer primary key references activity (id),
	area_id integer references area (id)
);

create table point (
	id			integer primary key references activity (id),
	plandate	date not null,
	factdate	date
);








