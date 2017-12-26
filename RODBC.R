library(RODBC)

dbhandle <- odbcDriverConnect('driver={SQL Server};
                              server=mysqlhost;
                              database=mydbname;
                              trusted_connection=true')
res <- sqlQuery(dbhandle, 'select * from information_schema.tables')