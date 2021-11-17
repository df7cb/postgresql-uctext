create extension uctext;

select null::uctext;
select ''::uctext;
select 'abc123'::uctext;
select 'ABC123'::uctext;

create table uc (
	u uctext,
	t text
);

select 'moo'::uctext = 'moo'::text, 'moo'::text = 'moo'::uctext;
select 'moo'::uctext = 'MOO'::text, 'MOO'::text = 'moo'::uctext;

insert into uc values ('df7cb', 'df7cb');
insert into uc values ('DF7CB', 'df7cb');

select u, t, u = t, t = u from uc;
select * from uc where u = 'df7cb';

insert into uc select 'abC'||i::text from generate_series(1, 10000) g(i);

create index on uc (u);
analyze uc;

select * from uc where u = 'abc123';
explain select * from uc where u = 'abc123';

select * from uc where u between 'abc123' and 'abc124';
