-- /*

-- #Script adapted to work with PostgreSQL 9.2.5 and UMLS2018AA by Juan M. Banda (juan@jmbanda.com)
-- PostgreSQL load script authored and contributed by Steve Bedrick (bedricks@ohsu.edu).
-- Please point each 'COPY' statement to your local '/tmp/META' installation directory, or wherever you have stored the .RRF files output by MetamorphoSys. 
-- This script has been tested in PostgreSQL 8.2.3 on Mac OS 10.4.10

-- # The script can also work with PostgreSQL 11.2 and UMLS-2020AB by Zhao Zhengyang (tsingcheng1327@live.cn)
-- Thank you for Mr Banda and Mr Bedrick!
-- This script has been tested in PostgreSQL 11.2 on Linux (Deepin 20.1, Debain 10 cored).

-- The 'dummy' column is to get around each row in the *.RRF file ending in a delimeter |, which psql interprets as there being an extra column between the ending | and $\r\n. 
-- By creating the table with a 'dummy' column, null is inserted into all of them without having to modify every *.RRF file, and then the script can just drop the column.

-- */

-- create schema if not exists _2020ab; /* You can change the schema name as your wish. */
-- set schema '_2020ab';


CREATE TABLE MRCOLS (
	COL	varchar(20),
	DES	varchar(200),
	REF	varchar(20),
	MIN	int,
	AV	numeric(5,2),
	MAX	int,
	FIL	varchar(50),
	DTY	varchar(20),
	dummy char(1)
);

---change the path of RRF file according the practice---

CREATE TABLE  MRCONSO (
	CUI	char(12) NOT NULL,
	LAT	char(3) NOT NULL,
	TS	char(1) NOT NULL,
	LUI	char(12) NOT NULL,
	STT	varchar(3) NOT NULL,
	SUI	char(12) NOT NULL,
	ISPREF	char(1) NOT NULL,
	AUI	varchar(9) NOT NULL,
	SAUI	varchar(50),
	SCUI	varchar(50),
	SDUI	varchar(50),
	SAB	varchar(20) NOT NULL,
	TTY	varchar(20) NOT NULL,
	CODE	varchar(100) NOT NULL,
	STR	text NOT NULL,
	SRL	int NOT NULL,
	SUPPRESS	char(1) NOT NULL,
	CVF	int,
	dummy char(1)
);






CREATE TABLE MRCUI (
	CUI1	char(12) NOT NULL,
	VER	varchar(10) NOT NULL,
	REL	varchar(4) NOT NULL,
	RELA	varchar(100),
	MAPREASON	text,
	CUI2	char(12),
	MAPIN	char(1),
	dummy char(1)
);

CREATE TABLE MRDEF (
	CUI	char(12) NOT NULL,
	AUI	varchar(9) NOT NULL,
	ATUI	varchar(15) NOT NULL,
	SATUI	varchar(50),
	SAB	varchar(20) NOT NULL,
	DEF	text NOT NULL,
	SUPPRESS	char(1) NOT NULL,
	CVF	int,
	dummy char(1)
);

CREATE TABLE MRDOC (
	DOCKEY	varchar(50) NOT NULL,
	VALUE	varchar(200),
	TYPE	varchar(50) NOT NULL,
	EXPL	text,
	dummy char(1)
);

CREATE TABLE MRFILES (
	FIL	varchar(50),
	DES	varchar(200),
	FMT	text,
	CLS	int,
	RWS	int,
	BTS	bigint,
	dummy char(1)
);

CREATE TABLE MRHIER (
	CUI	char(12) NOT NULL,
	AUI	varchar(9) NOT NULL,
	CXN	int NOT NULL,
	PAUI	varchar(9),
	SAB	varchar(20) NOT NULL,
	RELA	varchar(100),
	PTR	text,
	HCD	varchar(70),
	CVF	int,
	dummy char(1)
);

CREATE TABLE MRHIST (
	CUI	char(12) NOT NULL,
	SOURCEUI	varchar(50) NOT NULL,
	SAB	varchar(20) NOT NULL,
	SVER	varchar(20) NOT NULL,
	CHANGETYPE	text NOT NULL,
	CHANGEKEY	text NOT NULL,
	CHANGEVAL	text NOT NULL,
	REASON	text,
	CVF	int,
	dummy char(1)
);

CREATE TABLE MRMAP (
	MAPSETCUI	char(12),
	MAPSETSAB	varchar(20),
	MAPSUBSETID	varchar(10),
	MAPRANK	int,
	MAPID	varchar(50),
	MAPSID	varchar(50),
	FROMID	varchar(50),
	FROMSID	varchar(50),
	FROMEXPR	text,
	FROMTYPE	varchar(50),
	FROMRULE	text,
	FROMRES	text,
	REL	varchar(4),
	RELA	varchar(100),
	TOID	varchar(50),
	TOSID	varchar(50),
	TOEXPR	text,
	TOTYPE	varchar(50),
	TORULE	text,
	TORES	text,
	MAPRULE	text,
	MAPRES	text,
	MAPTYPE	varchar(50),
	MAPATN	varchar(20),
	MAPATV	text,
	CVF	int,
	dummy char(1)
);

CREATE TABLE MRRANK (
	RANK	int NOT NULL,
	SAB	varchar(20) NOT NULL,
	TTY	varchar(20) NOT NULL,
	SUPPRESS	char(1) NOT NULL,
	dummy char(1)
);

CREATE TABLE MRREL (
	CUI1	char(12) NOT NULL,
	AUI1	varchar(9),
	STYPE1	varchar(50) NOT NULL,
	REL	varchar(4) NOT NULL,
	CUI2	char(12) NOT NULL,
	AUI2	varchar(9),
	STYPE2	varchar(50) NOT NULL,
	RELA	varchar(100),
	RUI	varchar(10) NOT NULL,
	SRUI	varchar(50),
	SAB	varchar(20) NOT NULL,
	SL	varchar(20) NOT NULL,
	RG	varchar(10),
	DIR	varchar(1),
	SUPPRESS	char(1) NOT NULL,
	CVF	int,
	dummy char(1)
);

CREATE TABLE MRSAB (
	VCUI	char(12),
	RCUI	char(12),
	VSAB	varchar(50) NOT NULL,
	RSAB	varchar(20) NOT NULL,
	SON	text NOT NULL,
	SF	varchar(20) NOT NULL,
	SVER	varchar(20),
	VSTART	char(10),
	VEND	char(10),
	IMETA	varchar(10) NOT NULL,
	RMETA	varchar(10),
	SLC	text,
	SCC	text,
	SRL	int NOT NULL,
	TFR	int,
	CFR	int,
	CXTY	varchar(50),
	TTYL	varchar(200),
	ATNL	text,
	LAT	char(3),
	CENC	varchar(20) NOT NULL,
	CURVER	char(1) NOT NULL,
	SABIN	char(1) NOT NULL,
	SSN	text NOT NULL,
	SCIT	text NOT NULL,
	dummy char(1)
);

CREATE TABLE MRSAT (
	CUI	char(12) NOT NULL,
	LUI	char(12),
	SUI	char(12),
	METAUI	varchar(50),
	STYPE	varchar(50) NOT NULL,
	CODE	varchar(50),
	ATUI	varchar(15) NOT NULL,
	SATUI	varchar(50),
	ATN	varchar(80) NOT NULL,
	SAB	varchar(20) NOT NULL,
	ATV	text,
	SUPPRESS	char(1) NOT NULL,
	CVF	int,
	dummy char(1)
);

CREATE TABLE MRSMAP (
	MAPSETCUI	char(12),
	MAPSETSAB	varchar(20),
	MAPID	varchar(50),
	MAPSID	varchar(50),
	FROMEXPR	text,
	FROMTYPE	varchar(50),
	REL	varchar(4),
	RELA	varchar(100),
	TOEXPR	text,
	TOTYPE	varchar(50),
	CVF	int,
	dummy char(1)
);

CREATE TABLE MRSTY (
	CUI	char(12) NOT NULL,
	TUI	char(4) NOT NULL,
	STN	varchar(100) NOT NULL,
	STY	varchar(50) NOT NULL,
	ATUI	varchar(15) NOT NULL,
	CVF	int,
	dummy char(1)
);

CREATE TABLE MRXNS_ENG (
	LAT	char(3) NOT NULL,
	NSTR	text NOT NULL,
	CUI	char(12) NOT NULL,
	LUI	char(12) NOT NULL,
	SUI	char(12) NOT NULL,
	dummy char(1)
);

CREATE TABLE MRXNW_ENG (
	LAT	char(3) NOT NULL,
	NWD	varchar(100) NOT NULL,
	CUI	char(12) NOT NULL,
	LUI	char(12) NOT NULL,
	SUI	char(12) NOT NULL,
	dummy char(1)
);

CREATE TABLE MRXW_ENG (
	LAT	char(3) NOT NULL,
	WD	varchar(100) NOT NULL,
	CUI	char(12) NOT NULL,
	LUI	char(12) NOT NULL,
	SUI	char(12) NOT NULL,
	dummy char(1)
);



/*  Because I only use English items, I deleted the load of MRXW_XXX loaders except English one.
	If you want to load another language, you can rewrite the SQL expression as follows:

	DROP TABLE if exists MRXW_LAN; ---'LAN' means the language.---
	CREATE TABLE MRXW_ENG (
		LAT	char(3) NOT NULL,
		WD	varchar(100) NOT NULL,
		CUI	char(12) NOT NULL,
		LUI	char(12) NOT NULL,
		SUI	char(12) NOT NULL,
		dummy char(1)
	);
	COPY MRXW_LAN FROM '/your/path/META/MRXW_ENG.RRF' WITH DELIMITER AS '|' NULL AS '';
	ALTER TABLE MRXW_LAN DROP COLUMN dummy;
 */

CREATE TABLE MRAUI (
	AUI1	varchar(9) NOT NULL,
	CUI1	char(12) NOT NULL,
	VER	varchar(10) NOT NULL,
	REL	varchar(4),
	RELA	varchar(100),
	MAPREASON	text NOT NULL,
	AUI2	varchar(9) NOT NULL,
	CUI2	char(12) NOT NULL,
	MAPIN	char(1) NOT NULL,
	dummy char(1)
);

CREATE TABLE AMBIGSUI (
	SUI	char(12) NOT NULL,
	CUI	char(12) NOT NULL,
	dummy char(1)
);

CREATE TABLE AMBIGLUI (
	LUI	char(12) NOT NULL,
	CUI	char(12) NOT NULL,
	dummy char(1)
);

CREATE TABLE DELETEDCUI (
	PCUI	char(12) NOT NULL,
	PSTR	text NOT NULL,
	dummy char(1)
);

CREATE TABLE DELETEDLUI (
	PLUI	char(12) NOT NULL,
	PSTR	text NOT NULL,
	dummy char(1)
);

CREATE TABLE DELETEDSUI (
	PSUI	char(12) NOT NULL,
	LAT	char(3) NOT NULL,
	PSTR	text NOT NULL,
	dummy char(1)
);

CREATE TABLE MERGEDCUI (
	PCUI	char(12) NOT NULL,
	CUI	char(12) NOT NULL,
	dummy char(1)
);

CREATE TABLE MERGEDLUI (
	PLUI	char(12),
	LUI	char(12),
	dummy char(1)
);