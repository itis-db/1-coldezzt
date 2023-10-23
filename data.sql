insert into activitytype
select d.* from (values 
	(1,'Программа', 	'program'	),
   	(2,'Подпрограмма',	'subprogram'),
	(3,'Проект',		'project'	),
	(4,'Контракт',		'contract'	),
	(5,'КТ',			'point'		)
) as d(id, name, sysname)
where not exists(
    select 1 from activitytype as t
    where t.id = d.id
);

insert into activity 
values	(1, 1, 'code1', 'name1', 1, null),
		(2, 2, 'code2', 'name2', 1, 1),
		(3, 3, 'code3', 'name3', 1, 2),
		(4, 4, 'code4', 'name4', 1, 3),
		(5, 5, 'code5', 'name5', 1, 4),
		(6, 1, 'code1.1', 'name1.1', 2, 1),
		(7, 2, 'code2.1', 'name2.1', 2, 2),
		(8, 3, 'code3.1', 'name3.1', 2, 3),
		(9, 4, 'code4.1', 'name4.1', 2, 4)
on conflict do nothing;

insert into program 
values 	(1, 123, 2000, 2001),
	   	(2, 234, 2000, 2001)
on conflict (id) do nothing;

insert into subprogram 
values	(1, 1231),
		(2, 1232)
on conflict (id) do nothing;

insert into area 
values	(1, 'First'),
		(2, 'Second')
on conflict (id) do nothing;

insert into project
values 	(1, 'First test project'),
		(2, 'Second test project')
on conflict (id) do nothing;

insert into contract 
values 	(1, 1),
		(2, 2)
on conflict (id) do nothing;

insert into point
values	(1, date '2000-12-11', date '2000-12-21'),
		(2, date '2000-12-12', date '2000-12-22')
on conflict (id) do nothing;