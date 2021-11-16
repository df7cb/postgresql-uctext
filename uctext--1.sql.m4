divert(-1)
changequote(`[', `]')dnl

define([parallel_safe], ifelse(eval(VERSION_NUM >= 130000), 1, [parallel safe], [--parallel safe]))

divert(0)dnl
-- type definition

create type uctext;

create function uctext_in(cstring)
	returns uctext
	AS '$libdir/uctext'
	immutable
	strict
	parallel_safe
	language C;

create function uctext_out(uctext)
	returns cstring
	AS '$libdir/uctext'
	immutable
	strict
	parallel_safe
	language C;

create type uctext (
	input = uctext_in,
	output = uctext_out,
	--receive = uctext_recv,
	--send = uctext_send,
	category = 'S',
	internallength = variable,
	alignment = int4,
	collatable = true
);

create cast (uctext as text)
	without function
	as implicit;

dnl $1=text name, $2=operator
define([opr],
[-- operator $2 ($1)

create function uctext_$1_uctext(a uctext, b uctext)
	returns boolean
	immutable
	strict
	parallel_safe
	language sql
	as $$select a::text $2 b::text$$;

create operator $2 (
	leftarg = uctext,
	rightarg = uctext,
	function = uctext_$1_uctext
);

create function uctext_$1_text(a uctext, b text)
	returns boolean
	immutable
	strict
	parallel_safe
	language sql
	as $$select a::text $2 upper(b)$$;

create operator $2 (
	leftarg = uctext,
	rightarg = text,
	function = uctext_$1_text
);

create function text_$1_uctext(a text, b uctext)
	returns boolean
	immutable
	strict
	parallel_safe
	language sql
	as $$select upper(a) $2 b::text$$;

create operator $2 (
	leftarg = text,
	rightarg = uctext,
	function = text_$1_uctext
);
])

opr([lt], [<])
opr([le], [<=])
opr([eq], [=])
opr([ne], [<>])
opr([ge], [>=])
opr([gt], [>])
