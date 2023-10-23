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

insert into program 
values 	(1, 'First', 'First test program (continue)'),
	   	(2, 'Second', 'Second test program (end)')
on conflict (id) do nothing;

insert into subprogram 
values	(1, 'First', 'First test subprogram'),
		(2, 'Second', 'Second test subprogram')
on conflict (id) do nothing;

insert into area 
values	(1, 'First'),
		(2, 'Second')
on conflict (id) do nothing;

insert into project
values 	(1, 1, 'First', 'First test project in First area'),
		(2, 2, 'Second', 'Second test project in Second area')
on conflict (id) do nothing;

insert into contract 
values 	(1, 'First', 'First test contract'),
		(2, 'Second', 'Second test contract')
on conflict (id) do nothing;

insert into point
values	(1, 'First', 'First test checkpoint'),
		(2, 'Second', 'Second test checkpoint')
on conflict (id) do nothing;

insert into point_parent 
values 	(1, null, 1),
		(2, 2, null)
on conflict do nothing;

insert into activity 
values	(1, null, 1, 1),
		(2, 1, 2, 1),
		(3, 2, 3, 1),
		(4, 3, 4, 1),
		(5, 4, 5, 1),
		(6, 1, 2, 2),
		(7, 2, 3, 2),
		(8, 3, 4, 2),
		(9, 4, 5, 2)
on conflict do nothing;