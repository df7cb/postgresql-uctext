create extension uctext;

select null::uctext;
select ''::uctext;
select 'abc123'::uctext;
select 'ABC123'::uctext;

create table uc (
	u uctext,
	t text
);

select 'moo'::uctext = 'moo';
select 'moo'::uctext = 'MOO';

insert into uc values ('df7cb', 'df7cb');
insert into uc values ('DF7CB', 'df7cb');

select u, t, u = t, t = u from uc;

create index on uc (u);
