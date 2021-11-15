MODULE_big = uctext
OBJS = uctext.o
EXTENSION = uctext
DATA = uctext--1.sql
REGRESS = uctext

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
