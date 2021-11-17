UPPER CASE Text Extension For PostgreSQL
========================================

The `uctext` extension for PostgreSQL implements a text-like datatype that
accepts input in either case, but stores everything in UPPER CASE. It is meant
to be used for things like hamradio callsigns that are customarily spelled in
upper case, while being forgiving on input and searches.

```
# create extension uctext;
CREATE EXTENSION

# create table my_logbook (time timestamptz, call uctext, freq numeric, locator uctext);
CREATE TABLE

# insert into my_logbook values (now(), 'df7cb', 1.840, 'jo31hi');
INSERT 0 1

# select * from my_logbook where call = 'df7cb';
             time              │ call  │ freq  │ locator
───────────────────────────────┼───────┼───────┼─────────
 2021-11-17 23:19:10.933677+01 │ DF7CB │ 1.840 │ JO31HI
```

`uctext` behaves like the normal `text` datatype in most contexts since there
is an implicit cast from uctext to text. The only special handling is in
comparison operators (`= <> < <= => >`) which act case-insensitive.

Also included is a `=||` operator that does case-insensitive prefix matches:

```
# select locator from my_logbook where locator =|| 'jo';
 locator
─────────
 JO31HI
```

# Copyright and License

Copyright (C) 2021 Christoph Berg <myon@debian.org>

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
