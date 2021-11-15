/*
Copyright (C) 2021 Christoph Berg

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
*/

#include <postgres.h>
#include <fmgr.h>
#include <utils/builtins.h>
#include <utils/formatting.h>

/* module initialization */

PG_MODULE_MAGIC;

/* functions */

PG_FUNCTION_INFO_V1 (uctext_in);

Datum
uctext_in (PG_FUNCTION_ARGS)
{
	char		*str = PG_GETARG_CSTRING(0);
	int			len = strlen(str);
	char		*out_string;
	text		*result;
	Oid         collid = PG_GET_COLLATION();

	out_string = str_toupper(str, len, collid);
	result = cstring_to_text(out_string);
	pfree(out_string);

	PG_RETURN_TEXT_P(result);
}

PG_FUNCTION_INFO_V1(uctext_out);

Datum
uctext_out(PG_FUNCTION_ARGS)
{
	Datum       txt = PG_GETARG_DATUM(0);

	PG_RETURN_CSTRING(TextDatumGetCString(txt));
}
