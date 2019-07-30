
library(RODBC)
myServer <- "veedb.database.windows.net"
myUser <- "veerasak"
myPassword <- "#October218"
myDatabase <- "airlines"
myDriver <- "SQL Server" # Must correspond to an entry in the Drivers tab of "ODBC Data Sources"

connectionString <- paste0(
  "Driver=", myDriver,
  ";Server=", myServer,
  ";Database=", myDatabase,
  ";Uid=", myUser,
  ";Pwd=", myPassword)
# This query simulates a table by generating a rowset with one integer column going from 1 to 1000
sqlQuery <- "
SELECT * FROM customer
"
conn <- odbcDriverConnect(connectionString)
df <- sqlQuery(conn, sqlQuery)
close(conn) # don't leak connections !

str(df)


library(RJDBC)
drv <- JDBC(driverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver",
  classPath = "~/dev/SQL/sqljdbc_6.0/enu/jre8/sqljdbc42.jar")
conn <- dbConnect(drv, "jdbc:sqlserver://veedb.database.windows.net", "veerasak", "#October218")
d <- dbReadTable(conn, "Customer")
#dbGetQuery(conn, "SELECT * from SalesLT.Customer")
dbListTables(con)
dbDisconnect(con)


library(odbc)
con <- dbConnect(odbc(),
                 #Driver = "Simba SQL Server ODBC Driver",
                 Driver = "ODBC Driver 17 for SQL Server",
                 Server = "veedb.database.windows.net",
                 Database = "airlines",
                 UID = "veerasak",
                 PWD = rstudioapi::askForPassword("Database password"),
                 Port = 1433)

customer <- dbGetQuery(con, "SELECT * FROM SalesLT.Customer")
str(customer)
head(customer)


dbDisconnect(con)




