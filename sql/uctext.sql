create extension uctext;

select null::uctext;
select ''::uctext;
select 'abc123'::uctext;
select 'ABC123'::uctext;

select 'moo'::uctext = 'moo'::text, 'moo'::text = 'moo'::uctext;
select 'moo'::uctext = 'MOO'::text, 'MOO'::text = 'moo'::uctext;

create table log (
	call uctext,
	loc uctext
);

copy log from stdin;
oz1dae	jo65ag
EA4AOC	IN80DD
UW8SM	KN28IV
M0HMO	IO82QN
IK6BAK	JN63KR
EW6DM	KO35UU
9A1FL	JN74OC
IK2YCW	JN55KE
dl3rar	jn68iv
UY5QQ	KN77MO
S57SWR	JN76AA
PE1FTV	JO21QI
ON6AT	JO10UW
OH3FM	KP21GM
MM9I	IO75
DL4RCE	JN68ax
DJ5AN	JO32MH
S53EOP	JN76OH
OH2KW	KP20IJ
IV3HAX	JN66OB
I4JED	JN54
UX7QV	kn87dl
RG9A	MO04EW
SV2BFN	KN10LN
DL6UAA	JO62td
dl6rdm	jn68hv
oe2e	jn67ls
YU5R	KN04PF
DL8NFA	JN59MP
YL3CU	KO06MM
DL8MKG	JO52NU
IV3DMJ	JN66GB
F6AGM	JN13AT
EA4BAS	IN80HL
SO0A	KO00
UY5VA	KN87
OK1KSL	JO70BF
9A5X	JN86EH
DA0KOL	JO43WH
YO4NF	KN44HD
CX7SS	GF25LQ
YO4FPF	KN44HE
UY5VA	kn87
SV3DCX	KM08VF
DJ4MH	JO42BB
pe1ftv	jo21qi
CT1BXT	IM59PF
DF4XX	JO53CN
UT8IM	KN87SC
PY7XC	HI21ES
DK5KK	JO31LL
CX2AQ	GF25MQ
DL4NWM	JN59SM
DQ9Y	JO31CO
DF4XG	JO43WI
aa3b	fn20re
kb8o	en81wj
w3ll	fm19rl
n2bj	en61am
n4qs	em56px
k2zw	fn65
va3df	en92vv
s51i	jn76xl
\.

select * from log where call = 'pe1ftv';
select * from log where call = 'PE1FTV';
select * from log where call between 'dl0a' and 'dl9zzz';
explain select * from log where call between 'dl0a' and 'dl9zzz';

create index on log (call);
analyze log;
set enable_seqscan = off;

select * from log where call = 'pe1ftv';
select * from log where call = 'PE1FTV';
explain select * from log where call = 'pe1ftv';

select * from log where call between 'dl0a' and 'dl9zzz';
explain select * from log where call between 'dl0a' and 'dl9zzz';
