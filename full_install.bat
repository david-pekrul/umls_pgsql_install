SET PGPASSWORD=umls2020ab
SET DB_HOST=localhost
SET USERNAME=umls2020ab
SET SCHEMA=umls2020ab

psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -f "%cd%\drop_tables.sql"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -f "%cd%\create_tables.sql"


psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY MRCOLS FROM '%cd%\META\MRCOLS.RRF' WITH DELIMITER AS '|' NULL AS '';"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY MRCONSO FROM '%cd%\META\MRCONSO.RRF' WITH DELIMITER AS '|' NULL AS '';"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY MRCUI FROM '%cd%\META\MRCUI.RRF' WITH DELIMITER AS '|' NULL AS '';"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY MRDEF FROM '%cd%\META\MRDEF.RRF' WITH DELIMITER AS '|' NULL AS '';"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY MRDOC FROM '%cd%\META\MRDOC.RRF' WITH DELIMITER AS '|' NULL AS '';"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY MRFILES FROM '%cd%\META\MRFILES.RRF' WITH DELIMITER AS '|' NULL AS '';"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY MRHIER FROM PROGRAM 'cmd /c ""type ""%cd%\META\MRHIER.RRF""""' WITH DELIMITER AS '|' NULL AS '';"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY MRHIST FROM '%cd%\META\MRHIST.RRF' WITH DELIMITER AS '|' NULL AS '';"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY MRMAP FROM '%cd%\META\MRMAP.RRF' WITH DELIMITER AS '|' NULL AS '';"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY MRRANK FROM '%cd%\META\MRRANK.RRF' WITH DELIMITER AS '|' NULL AS '';"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY MRREL FROM PROGRAM 'cmd /c ""type ""%cd%\META\MRREL.RRF""""' WITH DELIMITER AS '|' NULL AS '';"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY MRSAB FROM '%cd%\META\MRSAB.RRF' WITH DELIMITER AS '|' NULL AS '';"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY MRSAT FROM PROGRAM 'cmd /c ""type ""%cd%\META\MRSAT.RRF""""' WITH DELIMITER AS '|' NULL AS '';"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY MRSMAP FROM '%cd%\META\MRSMAP.RRF' WITH DELIMITER AS '|' NULL AS '';"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY MRSTY FROM '%cd%\META\MRSTY.RRF' WITH DELIMITER AS '|' NULL AS '';"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY MRXNS_ENG FROM '%cd%\META\MRXNS_ENG.RRF' WITH DELIMITER AS '|' NULL AS '';"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY MRXNW_ENG FROM '%cd%\META\MRXNW_ENG.RRF' WITH DELIMITER AS '|' NULL AS '';"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY MRXW_ENG FROM '%cd%\META\MRXW_ENG.RRF' WITH DELIMITER AS '|' NULL AS '';"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY MRAUI FROM '%cd%\META\MRAUI.RRF' WITH DELIMITER AS '|' NULL AS '';"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY AMBIGSUI FROM '%cd%\META\AMBIGSUI.RRF' WITH DELIMITER AS '|' NULL AS '';"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY AMBIGLUI FROM '%cd%\META\AMBIGLUI.RRF' WITH DELIMITER AS '|' NULL AS '';"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY DELETEDCUI FROM '%cd%\META\CHANGE/DELETEDCUI.RRF' WITH DELIMITER AS '|' NULL AS '';"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY DELETEDLUI FROM '%cd%\META\CHANGE/DELETEDLUI.RRF' WITH DELIMITER AS '|' NULL AS '';"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY DELETEDSUI FROM '%cd%\META\CHANGE/DELETEDSUI.RRF' WITH DELIMITER AS '|' NULL AS '';"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY MERGEDCUI FROM '%cd%\META\CHANGE/MERGEDCUI.RRF' WITH DELIMITER AS '|' NULL AS '';"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -c "\COPY MERGEDLUI FROM '%cd%\META\CHANGE/MERGEDLUI.RRF' WITH DELIMITER AS '|' NULL AS '';"


psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -f "%cd%\alter_tables_drop_dummy.sql"
psql -h %DB_HOST% -p 5432 -U %USERNAME% -d %SCHEMA% -f "%cd%\pgsql_index.sql"