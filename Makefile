MODULE_big = uctext
OBJS = uctext.o
EXTENSION = uctext
EXTRA_CLEAN = uctext.control
DATA_built = uctext--1.sql
REGRESS = uctext

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)

%.sql: %.sql.m4
	m4 -DVERSION_NUM=$(VERSION_NUM) $< > $@

%.control: %.control.m4
	m4 -DVERSION_NUM=$(VERSION_NUM) $< > $@
