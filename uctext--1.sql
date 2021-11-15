create type uctext;

create function uctext_in(cstring)
	returns uctext
	AS '$libdir/uctext'
	immutable
	strict
	parallel safe
	language C;

create function uctext_out(uctext)
	returns cstring
	AS '$libdir/uctext'
	immutable
	strict
	parallel safe
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

create function uctext_eq_text(a uctext, b text)
	returns boolean
	immutable
	strict
	parallel safe
	language sql
	as $$select a::text = upper(b)$$;

create function text_eq_uctext(a text, b uctext)
	returns boolean
	immutable
	strict
	parallel safe
	language sql
	as $$select upper(a) = b::text$$;

create operator = (
	leftarg = uctext,
	rightarg = text,
	function = uctext_eq_text
);

create operator = (
	leftarg = text,
	rightarg = uctext,
	function = text_eq_uctext
);
