-- Questão 01. Crie uma relação a partir da união das tabelas student e takes. --

select *
from student
join takes
on student.ID = takes.ID


-- Questão 2. Contar a quantidade de cursos realizados pelos alunos do departamento de Civil Eng. Ordenar de maneira descendente a quantidade de cursos associada aos alunos. --

select
	s.ID,
	s.name,
	count(course_id) as 'Quantidade de cursos'
from student s
join takes t
	on s.ID = t.ID
where
	dept_name = 'Civil Eng.'
group by
	s.ID,
	s.name
order by
	'Quantidade de cursos' desc

-- Questão 3. Criar uma view chamada 'civil_eng_students' a partir da relação construída na Questão 2. --
	
create view civil_eng_students as
	select
		s.ID,
		s.name,
		count(course_id) as 'Quantidade de cursos'
	from student s
	join takes t
		on s.ID = t.ID
	where
		dept_name = 'Civil Eng.'
	group by
		s.ID,
		s.name