default_version = '1'
comment = 'UPPER CASE text'
relocatable = true
ifelse(eval(VERSION_NUM >= 130000), 1, trusted = true)
