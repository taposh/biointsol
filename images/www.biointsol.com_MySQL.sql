DROP TABLE IF EXISTS columns_priv;
CREATE TABLE columns_priv (
   Host char(60) NOT NULL,
   Db char(64) NOT NULL,
   User char(16) NOT NULL,
   Table_name char(64) NOT NULL,
   Column_name char(64) NOT NULL,
   Timestamp timestamp DEFAULT 'CURRENT_TIMESTAMP',
   Column_priv set('Select','Insert','Update','References') NOT NULL,
   PRIMARY KEY (Host,Db,User,Table_name,Column_name)
);




DROP TABLE IF EXISTS db;
CREATE TABLE db (
   Host char(60) NOT NULL,
   Db char(64) NOT NULL,
   User char(16) NOT NULL,
   Select_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Insert_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Update_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Delete_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Create_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Drop_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Grant_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   References_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Index_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Alter_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Create_tmp_table_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Lock_tables_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   PRIMARY KEY (Host,Db,User),
   KEY User (User)
);

INSERT INTO db VALUES('%', 'joebase', 'joe', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'softdesign', 'rbiehler', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'transmysql', 'BlogUser', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'nulanda', 'admin', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'armatura_full', 'links_root', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'youtube', 'jovita', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'codedone_actual', 'CodeDone_Main', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'codedone_actual', 'rlkf', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'codedone_demo', 'CodeDone_Main', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'mysticallady', 'lacy', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'shibandheidi', 'shibleyb', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'allmysqldb', 'mysqladmin', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'hcffa1', 'HCFFA1', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'softdesign', 'wwwuser', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'jay', 'jay', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'mysticallady', 'mysticallady', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'core', 'philippe', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'core', 'kevin', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'hditmambo', 'hdit', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'temerity', 'stephen', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'apartments', 'nhughes', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'ameraab_phpyellow', 'ameraabd', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'ameraab_phpyellow', 'lenar', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'links', 'links_root', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'deoludb', 'webuser', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'nuke', 'Panchu', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'mysqldb', 'bazerbashi', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'successnow', 'lenhodgeman', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'linkslicensing', 'crusprin', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'biehler', 'rbiehler', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'qw', 'EZLOOKIN', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'lucid_phpbb', 'LDATA', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'oscommerce', 'wabs27', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'dreamsafari', 'jovita', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'phpfox', 'jovita', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'youtube', 'matango', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'dreamsafari', 'matango', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'phpfox', 'matango', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'codedone_actual', 'wordpress', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'codedone_demo', 'wordpress', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'transcend', 'osCom', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');
INSERT INTO db VALUES('%', 'biehler', 'wwwuser', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y');



DROP TABLE IF EXISTS func;
CREATE TABLE func (
   name char(64) NOT NULL,
   ret tinyint(1) NOT NULL,
   dl char(128) NOT NULL,
   type enum('function','aggregate') DEFAULT 'function' NOT NULL,
   PRIMARY KEY (name)
);




DROP TABLE IF EXISTS help_category;
CREATE TABLE help_category (
   help_category_id smallint(5) unsigned NOT NULL,
   name varchar(64) NOT NULL,
   parent_category_id smallint(5) unsigned,
   url varchar(128) NOT NULL,
   PRIMARY KEY (help_category_id),
   KEY name (name)
);

INSERT INTO help_category VALUES('0', 'Polygon properties', '24', ');
INSERT INTO help_category VALUES('1', 'Column Types', '15', ');
INSERT INTO help_category VALUES('2', 'Geometry constructors', '24', ');
INSERT INTO help_category VALUES('3', 'WKT', '24', ');
INSERT INTO help_category VALUES('4', 'Numeric Functions', '22', ');
INSERT INTO help_category VALUES('5', 'GeometryCollection properties', '24', ');
INSERT INTO help_category VALUES('6', 'Data Manipulation', '15', ');
INSERT INTO help_category VALUES('7', 'Administration', '15', ');
INSERT INTO help_category VALUES('8', 'MBR', '24', ');
INSERT INTO help_category VALUES('9', 'Control flow functions', '22', ');
INSERT INTO help_category VALUES('10', 'Transactions', '15', ');
INSERT INTO help_category VALUES('11', 'Geometry relations', '24', ');
INSERT INTO help_category VALUES('12', 'Functions and Modifiers for Use with GROUP BY Clauses', '22', ');
INSERT INTO help_category VALUES('13', 'WKB', '24', ');
INSERT INTO help_category VALUES('14', 'Date and Time Functions', '22', ');
INSERT INTO help_category VALUES('15', 'Contents', '0', ');
INSERT INTO help_category VALUES('16', 'Point properties', '24', ');
INSERT INTO help_category VALUES('17', 'Encryption Functions', '22', ');
INSERT INTO help_category VALUES('18', 'LineString properties', '24', ');
INSERT INTO help_category VALUES('19', 'Geometry properties', '24', ');
INSERT INTO help_category VALUES('20', 'Logical operators', '22', ');
INSERT INTO help_category VALUES('21', 'Miscellaneous Functions', '22', ');
INSERT INTO help_category VALUES('22', 'Functions', '15', ');
INSERT INTO help_category VALUES('23', 'String Functions', '22', ');
INSERT INTO help_category VALUES('24', 'Geographic features', '15', ');
INSERT INTO help_category VALUES('25', 'Information Functions', '22', ');
INSERT INTO help_category VALUES('26', 'Comparison operators', '22', ');
INSERT INTO help_category VALUES('27', 'Bit Functions', '22', ');
INSERT INTO help_category VALUES('28', 'Data Definition', '15', ');



DROP TABLE IF EXISTS help_keyword;
CREATE TABLE help_keyword (
   help_keyword_id int(10) unsigned NOT NULL,
   name varchar(64) NOT NULL,
   PRIMARY KEY (help_keyword_id),
   KEY name (name)
);

INSERT INTO help_keyword VALUES('0', 'MIN');
INSERT INTO help_keyword VALUES('1', 'JOIN');
INSERT INTO help_keyword VALUES('2', 'SERIALIZABLE');
INSERT INTO help_keyword VALUES('3', 'REPLACE');
INSERT INTO help_keyword VALUES('4', 'RETURNS');
INSERT INTO help_keyword VALUES('5', 'MASTER_SSL_CA');
INSERT INTO help_keyword VALUES('6', 'NCHAR');
INSERT INTO help_keyword VALUES('7', 'COLUMNS');
INSERT INTO help_keyword VALUES('8', 'WORK');
INSERT INTO help_keyword VALUES('9', 'DATETIME');
INSERT INTO help_keyword VALUES('10', 'MODE');
INSERT INTO help_keyword VALUES('11', 'OPEN');
INSERT INTO help_keyword VALUES('12', 'INTEGER');
INSERT INTO help_keyword VALUES('13', 'ESCAPE');
INSERT INTO help_keyword VALUES('14', 'VALUE');
INSERT INTO help_keyword VALUES('15', 'GEOMETRYCOLLECTIONFROMWKB');
INSERT INTO help_keyword VALUES('16', 'DROP');
INSERT INTO help_keyword VALUES('17', 'SQL_BIG_RESULT');
INSERT INTO help_keyword VALUES('18', 'EVENTS');
INSERT INTO help_keyword VALUES('19', 'MONTH');
INSERT INTO help_keyword VALUES('20', 'REGEXP');
INSERT INTO help_keyword VALUES('21', 'DUPLICATE');
INSERT INTO help_keyword VALUES('22', 'LINESTRINGFROMTEXT.');
INSERT INTO help_keyword VALUES('23', 'REPLICATION');
INSERT INTO help_keyword VALUES('24', 'UNLOCK');
INSERT INTO help_keyword VALUES('25', 'INNODB');
INSERT INTO help_keyword VALUES('26', 'YEAR_MONTH');
INSERT INTO help_keyword VALUES('27', 'SUBJECT');
INSERT INTO help_keyword VALUES('28', 'LOCK');
INSERT INTO help_keyword VALUES('29', 'NDB');
INSERT INTO help_keyword VALUES('30', 'CHECK');
INSERT INTO help_keyword VALUES('31', 'FULL');
INSERT INTO help_keyword VALUES('32', 'INT4');
INSERT INTO help_keyword VALUES('33', 'BY');
INSERT INTO help_keyword VALUES('34', 'NO');
INSERT INTO help_keyword VALUES('35', 'MINUTE');
INSERT INTO help_keyword VALUES('36', 'DATA');
INSERT INTO help_keyword VALUES('37', 'DAY');
INSERT INTO help_keyword VALUES('38', 'RAID_CHUNKSIZE');
INSERT INTO help_keyword VALUES('39', 'SHARE');
INSERT INTO help_keyword VALUES('40', 'REAL');
INSERT INTO help_keyword VALUES('41', 'SEPARATOR');
INSERT INTO help_keyword VALUES('42', 'DELETE');
INSERT INTO help_keyword VALUES('43', 'ON');
INSERT INTO help_keyword VALUES('44', 'CHANGED');
INSERT INTO help_keyword VALUES('45', 'CLOSE');
INSERT INTO help_keyword VALUES('46', 'X509');
INSERT INTO help_keyword VALUES('47', 'USE');
INSERT INTO help_keyword VALUES('48', 'WHERE');
INSERT INTO help_keyword VALUES('49', 'PRIVILEGES');
INSERT INTO help_keyword VALUES('50', 'SPATIAL');
INSERT INTO help_keyword VALUES('51', 'SUPER');
INSERT INTO help_keyword VALUES('52', 'SQL_BUFFER_RESULT');
INSERT INTO help_keyword VALUES('53', 'IGNORE');
INSERT INTO help_keyword VALUES('54', 'QUICK');
INSERT INTO help_keyword VALUES('55', 'SIGNED');
INSERT INTO help_keyword VALUES('56', 'SECURITY');
INSERT INTO help_keyword VALUES('57', 'FALSE');
INSERT INTO help_keyword VALUES('58', 'POLYGONFROMWKB');
INSERT INTO help_keyword VALUES('59', 'NDBCLUSTER');
INSERT INTO help_keyword VALUES('60', 'LEVEL');
INSERT INTO help_keyword VALUES('61', 'FORCE');
INSERT INTO help_keyword VALUES('62', 'BINARY');
INSERT INTO help_keyword VALUES('63', 'TO');
INSERT INTO help_keyword VALUES('64', 'CHANGE');
INSERT INTO help_keyword VALUES('65', 'HOUR_MINUTE');
INSERT INTO help_keyword VALUES('66', 'UPDATE');
INSERT INTO help_keyword VALUES('67', 'INTO');
INSERT INTO help_keyword VALUES('68', 'FEDERATED');
INSERT INTO help_keyword VALUES('69', 'VARYING');
INSERT INTO help_keyword VALUES('70', 'HOUR_SECOND');
INSERT INTO help_keyword VALUES('71', 'VARIABLE');
INSERT INTO help_keyword VALUES('72', 'ROLLBACK');
INSERT INTO help_keyword VALUES('73', 'MAX');
INSERT INTO help_keyword VALUES('74', 'RTREE');
INSERT INTO help_keyword VALUES('75', 'PROCEDURE');
INSERT INTO help_keyword VALUES('76', 'TIMESTAMP');
INSERT INTO help_keyword VALUES('77', 'IMPORT');
INSERT INTO help_keyword VALUES('78', 'AGAINST');
INSERT INTO help_keyword VALUES('79', 'CHECKSUM');
INSERT INTO help_keyword VALUES('80', 'INSERT');
INSERT INTO help_keyword VALUES('81', 'COUNT');
INSERT INTO help_keyword VALUES('82', 'LONGBINARY');
INSERT INTO help_keyword VALUES('83', 'THEN');
INSERT INTO help_keyword VALUES('84', 'ENGINES');
INSERT INTO help_keyword VALUES('85', 'DAY_SECOND');
INSERT INTO help_keyword VALUES('86', 'EXISTS');
INSERT INTO help_keyword VALUES('87', 'BOOLEAN');
INSERT INTO help_keyword VALUES('88', 'DEFAULT');
INSERT INTO help_keyword VALUES('89', 'MOD');
INSERT INTO help_keyword VALUES('90', 'TYPE');
INSERT INTO help_keyword VALUES('91', 'NO_WRITE_TO_BINLOG');
INSERT INTO help_keyword VALUES('92', 'RESET');
INSERT INTO help_keyword VALUES('93', 'BIGINT');
INSERT INTO help_keyword VALUES('94', 'SET');
INSERT INTO help_keyword VALUES('95', 'ISSUER');
INSERT INTO help_keyword VALUES('96', 'DATE');
INSERT INTO help_keyword VALUES('97', 'STATUS');
INSERT INTO help_keyword VALUES('98', 'FULLTEXT');
INSERT INTO help_keyword VALUES('99', 'COMMENT');
INSERT INTO help_keyword VALUES('100', 'MASTER_CONNECT_RETRY');
INSERT INTO help_keyword VALUES('101', 'INNER');
INSERT INTO help_keyword VALUES('102', 'STOP');
INSERT INTO help_keyword VALUES('103', 'MASTER_LOG_FILE');
INSERT INTO help_keyword VALUES('104', 'MRG_MYISAM');
INSERT INTO help_keyword VALUES('105', 'PRECISION');
INSERT INTO help_keyword VALUES('106', 'REQUIRE');
INSERT INTO help_keyword VALUES('107', 'TRAILING');
INSERT INTO help_keyword VALUES('108', 'LONG');
INSERT INTO help_keyword VALUES('109', 'OPTION');
INSERT INTO help_keyword VALUES('110', 'ELSE');
INSERT INTO help_keyword VALUES('111', 'IO_THREAD');
INSERT INTO help_keyword VALUES('112', 'CIPHER');
INSERT INTO help_keyword VALUES('113', 'FROM');
INSERT INTO help_keyword VALUES('114', 'READ');
INSERT INTO help_keyword VALUES('115', 'LEFT');
INSERT INTO help_keyword VALUES('116', 'MINUTE_SECOND');
INSERT INTO help_keyword VALUES('117', 'COMPACT');
INSERT INTO help_keyword VALUES('118', 'DEC');
INSERT INTO help_keyword VALUES('119', 'FOR');
INSERT INTO help_keyword VALUES('120', 'WARNINGS');
INSERT INTO help_keyword VALUES('121', 'MIN_ROWS');
INSERT INTO help_keyword VALUES('122', 'STRING');
INSERT INTO help_keyword VALUES('123', 'FUNCTION');
INSERT INTO help_keyword VALUES('124', 'ENCLOSED');
INSERT INTO help_keyword VALUES('125', 'AGGREGATE');
INSERT INTO help_keyword VALUES('126', 'FIELDS');
INSERT INTO help_keyword VALUES('127', 'INT3');
INSERT INTO help_keyword VALUES('128', 'ARCHIVE');
INSERT INTO help_keyword VALUES('129', 'AVG_ROW_LENGTH');
INSERT INTO help_keyword VALUES('130', 'ADD');
INSERT INTO help_keyword VALUES('131', 'FLOAT4');
INSERT INTO help_keyword VALUES('132', 'STRIPED');
INSERT INTO help_keyword VALUES('133', 'VIEW');
INSERT INTO help_keyword VALUES('134', 'REPEATABLE');
INSERT INTO help_keyword VALUES('135', 'INFILE');
INSERT INTO help_keyword VALUES('136', 'ORDER');
INSERT INTO help_keyword VALUES('137', 'USING');
INSERT INTO help_keyword VALUES('138', 'MIDDLEINT');
INSERT INTO help_keyword VALUES('139', 'GRANT');
INSERT INTO help_keyword VALUES('140', 'UNSIGNED');
INSERT INTO help_keyword VALUES('141', 'DECIMAL');
INSERT INTO help_keyword VALUES('142', 'GEOMETRYFROMTEXT');
INSERT INTO help_keyword VALUES('143', 'INDEXES');
INSERT INTO help_keyword VALUES('144', 'FOREIGN');
INSERT INTO help_keyword VALUES('145', 'CACHE');
INSERT INTO help_keyword VALUES('146', 'HOSTS');
INSERT INTO help_keyword VALUES('147', 'COMMIT');
INSERT INTO help_keyword VALUES('148', 'SCHEMAS');
INSERT INTO help_keyword VALUES('149', 'LEADING');
INSERT INTO help_keyword VALUES('150', 'LOAD');
INSERT INTO help_keyword VALUES('151', 'SQL_CACHE');
INSERT INTO help_keyword VALUES('152', 'CONVERT');
INSERT INTO help_keyword VALUES('153', 'DYNAMIC');
INSERT INTO help_keyword VALUES('154', 'POLYGONFROMTEXT');
INSERT INTO help_keyword VALUES('155', 'BYTE');
INSERT INTO help_keyword VALUES('156', 'LINESTRINGFROMWKB');
INSERT INTO help_keyword VALUES('157', 'GLOBAL');
INSERT INTO help_keyword VALUES('158', 'BERKELEYDB');
INSERT INTO help_keyword VALUES('159', 'WHEN');
INSERT INTO help_keyword VALUES('160', 'HAVING');
INSERT INTO help_keyword VALUES('161', 'AS');
INSERT INTO help_keyword VALUES('162', 'STARTING');
INSERT INTO help_keyword VALUES('163', 'RELOAD');
INSERT INTO help_keyword VALUES('164', 'AUTOCOMMIT');
INSERT INTO help_keyword VALUES('165', 'REVOKE');
INSERT INTO help_keyword VALUES('166', 'GRANTS');
INSERT INTO help_keyword VALUES('167', 'OUTER');
INSERT INTO help_keyword VALUES('168', 'FLOOR');
INSERT INTO help_keyword VALUES('169', 'WITH');
INSERT INTO help_keyword VALUES('170', 'AFTER');
INSERT INTO help_keyword VALUES('171', 'STD');
INSERT INTO help_keyword VALUES('172', 'DISABLE');
INSERT INTO help_keyword VALUES('173', 'CSV');
INSERT INTO help_keyword VALUES('174', 'OUTFILE');
INSERT INTO help_keyword VALUES('175', 'LOW_PRIORITY');
INSERT INTO help_keyword VALUES('176', 'FILE');
INSERT INTO help_keyword VALUES('177', 'BDB');
INSERT INTO help_keyword VALUES('178', 'SCHEMA');
INSERT INTO help_keyword VALUES('179', 'SONAME');
INSERT INTO help_keyword VALUES('180', 'POW');
INSERT INTO help_keyword VALUES('181', 'MULTIPOINTFROMWKB');
INSERT INTO help_keyword VALUES('182', 'INDEX');
INSERT INTO help_keyword VALUES('183', 'MULTIPOINTFROMTEXT');
INSERT INTO help_keyword VALUES('184', 'BACKUP');
INSERT INTO help_keyword VALUES('185', 'MULTILINESTRINGFROMWKB');
INSERT INTO help_keyword VALUES('186', 'EXTENDED');
INSERT INTO help_keyword VALUES('187', 'CROSS');
INSERT INTO help_keyword VALUES('188', 'NATIONAL');
INSERT INTO help_keyword VALUES('189', 'GROUP');
INSERT INTO help_keyword VALUES('190', 'ZEROFILL');
INSERT INTO help_keyword VALUES('191', 'CLIENT');
INSERT INTO help_keyword VALUES('192', 'MASTER_PASSWORD');
INSERT INTO help_keyword VALUES('193', 'RELAY_LOG_FILE');
INSERT INTO help_keyword VALUES('194', 'TRUE');
INSERT INTO help_keyword VALUES('195', 'CHARACTER');
INSERT INTO help_keyword VALUES('196', 'MASTER_USER');
INSERT INTO help_keyword VALUES('197', 'ENGINE');
INSERT INTO help_keyword VALUES('198', 'TABLE');
INSERT INTO help_keyword VALUES('199', 'INSERT_METHOD');
INSERT INTO help_keyword VALUES('200', 'CASCADE');
INSERT INTO help_keyword VALUES('201', 'RELAY_LOG_POS');
INSERT INTO help_keyword VALUES('202', 'SQL_CALC_FOUND_ROWS');
INSERT INTO help_keyword VALUES('203', 'MYISAM');
INSERT INTO help_keyword VALUES('204', 'MODIFY');
INSERT INTO help_keyword VALUES('205', 'MATCH');
INSERT INTO help_keyword VALUES('206', 'MASTER_LOG_POS');
INSERT INTO help_keyword VALUES('207', 'DESC');
INSERT INTO help_keyword VALUES('208', 'DISTINCTROW');
INSERT INTO help_keyword VALUES('209', 'TIME');
INSERT INTO help_keyword VALUES('210', 'GEOMETRYCOLLECTIONFROMTEXT');
INSERT INTO help_keyword VALUES('211', 'RAID_CHUNKS');
INSERT INTO help_keyword VALUES('212', 'FLUSH');
INSERT INTO help_keyword VALUES('213', 'CREATE');
INSERT INTO help_keyword VALUES('214', 'ISAM');
INSERT INTO help_keyword VALUES('215', 'MAX_UPDATES_PER_HOUR');
INSERT INTO help_keyword VALUES('216', 'INT2');
INSERT INTO help_keyword VALUES('217', 'PROCESSLIST');
INSERT INTO help_keyword VALUES('218', 'LOGS');
INSERT INTO help_keyword VALUES('219', 'HEAP');
INSERT INTO help_keyword VALUES('220', 'SOUNDS');
INSERT INTO help_keyword VALUES('221', 'BETWEEN');
INSERT INTO help_keyword VALUES('222', 'MULTILINESTRINGFROMTEXT');
INSERT INTO help_keyword VALUES('223', 'PACK_KEYS');
INSERT INTO help_keyword VALUES('224', 'FAST');
INSERT INTO help_keyword VALUES('225', 'VALUES');
INSERT INTO help_keyword VALUES('226', 'VARCHARACTER');
INSERT INTO help_keyword VALUES('227', 'SHOW');
INSERT INTO help_keyword VALUES('228', 'ALL');
INSERT INTO help_keyword VALUES('229', 'REDUNDANT');
INSERT INTO help_keyword VALUES('230', 'USER_RESOURCES');
INSERT INTO help_keyword VALUES('231', 'PARTIAL');
INSERT INTO help_keyword VALUES('232', 'BINLOG');
INSERT INTO help_keyword VALUES('233', 'END');
INSERT INTO help_keyword VALUES('234', 'SECOND');
INSERT INTO help_keyword VALUES('235', 'AND');
INSERT INTO help_keyword VALUES('236', 'FLOAT8');
INSERT INTO help_keyword VALUES('237', 'PREV');
INSERT INTO help_keyword VALUES('238', 'HOUR');
INSERT INTO help_keyword VALUES('239', 'SELECT');
INSERT INTO help_keyword VALUES('240', 'DATABASES');
INSERT INTO help_keyword VALUES('241', 'OR');
INSERT INTO help_keyword VALUES('242', 'IDENTIFIED');
INSERT INTO help_keyword VALUES('243', 'MASTER_SSL_CIPHER');
INSERT INTO help_keyword VALUES('244', 'SQL_SLAVE_SKIP_COUNTER');
INSERT INTO help_keyword VALUES('245', 'BOTH');
INSERT INTO help_keyword VALUES('246', 'BOOL');
INSERT INTO help_keyword VALUES('247', 'YEAR');
INSERT INTO help_keyword VALUES('248', 'MASTER_PORT');
INSERT INTO help_keyword VALUES('249', 'CONCURRENT');
INSERT INTO help_keyword VALUES('250', 'UNIQUE');
INSERT INTO help_keyword VALUES('251', 'PROCESS');
INSERT INTO help_keyword VALUES('252', 'MASTER_SSL');
INSERT INTO help_keyword VALUES('253', 'DATE_ADD');
INSERT INTO help_keyword VALUES('254', 'MAX_CONNECTIONS_PER_HOUR');
INSERT INTO help_keyword VALUES('255', 'LIKE');
INSERT INTO help_keyword VALUES('256', 'IN');
INSERT INTO help_keyword VALUES('257', 'COLUMN');
INSERT INTO help_keyword VALUES('258', 'DUMPFILE');
INSERT INTO help_keyword VALUES('259', 'USAGE');
INSERT INTO help_keyword VALUES('260', 'EXECUTE');
INSERT INTO help_keyword VALUES('261', 'MEMORY');
INSERT INTO help_keyword VALUES('262', 'CEIL');
INSERT INTO help_keyword VALUES('263', 'QUERY');
INSERT INTO help_keyword VALUES('264', 'MASTER_HOST');
INSERT INTO help_keyword VALUES('265', 'LINES');
INSERT INTO help_keyword VALUES('266', 'SQL_THREAD');
INSERT INTO help_keyword VALUES('267', 'MAX_QUERIES_PER_HOUR');
INSERT INTO help_keyword VALUES('268', 'MULTIPOLYGONFROMWKB');
INSERT INTO help_keyword VALUES('269', 'MASTER_SSL_CERT');
INSERT INTO help_keyword VALUES('270', 'DAY_MINUTE');
INSERT INTO help_keyword VALUES('271', 'TRANSACTION');
INSERT INTO help_keyword VALUES('272', 'DATE_SUB');
INSERT INTO help_keyword VALUES('273', 'GEOMETRYFROMWKB');
INSERT INTO help_keyword VALUES('274', 'INT1');
INSERT INTO help_keyword VALUES('275', 'RENAME');
INSERT INTO help_keyword VALUES('276', 'RIGHT');
INSERT INTO help_keyword VALUES('277', 'ALTER');
INSERT INTO help_keyword VALUES('278', 'MAX_ROWS');
INSERT INTO help_keyword VALUES('279', 'STRAIGHT_JOIN');
INSERT INTO help_keyword VALUES('280', 'NATURAL');
INSERT INTO help_keyword VALUES('281', 'VARIABLES');
INSERT INTO help_keyword VALUES('282', 'ESCAPED');
INSERT INTO help_keyword VALUES('283', 'SHA1');
INSERT INTO help_keyword VALUES('284', 'PASSWORD');
INSERT INTO help_keyword VALUES('285', 'RAID_TYPE');
INSERT INTO help_keyword VALUES('286', 'CHAR');
INSERT INTO help_keyword VALUES('287', 'OFFSET');
INSERT INTO help_keyword VALUES('288', 'NEXT');
INSERT INTO help_keyword VALUES('289', 'SQL_LOG_BIN');
INSERT INTO help_keyword VALUES('290', 'ERRORS');
INSERT INTO help_keyword VALUES('291', 'TEMPORARY');
INSERT INTO help_keyword VALUES('292', 'SQL_SMALL_RESULT');
INSERT INTO help_keyword VALUES('293', 'COMMITTED');
INSERT INTO help_keyword VALUES('294', 'DELAY_KEY_WRITE');
INSERT INTO help_keyword VALUES('295', 'BEGIN');
INSERT INTO help_keyword VALUES('296', 'MEDIUM');
INSERT INTO help_keyword VALUES('297', 'INTERVAL');
INSERT INTO help_keyword VALUES('298', 'SSL');
INSERT INTO help_keyword VALUES('299', 'DAY_HOUR');
INSERT INTO help_keyword VALUES('300', 'REFERENCES');
INSERT INTO help_keyword VALUES('301', 'AES_ENCRYPT');
INSERT INTO help_keyword VALUES('302', 'ISOLATION');
INSERT INTO help_keyword VALUES('303', 'INT8');
INSERT INTO help_keyword VALUES('304', 'RESTRICT');
INSERT INTO help_keyword VALUES('305', 'IS');
INSERT INTO help_keyword VALUES('306', 'UNCOMMITTED');
INSERT INTO help_keyword VALUES('307', 'NOT');
INSERT INTO help_keyword VALUES('308', 'DES_KEY_FILE');
INSERT INTO help_keyword VALUES('309', 'COMPRESSED');
INSERT INTO help_keyword VALUES('310', 'START');
INSERT INTO help_keyword VALUES('311', 'IF');
INSERT INTO help_keyword VALUES('312', 'SAVEPOINT');
INSERT INTO help_keyword VALUES('313', 'PRIMARY');
INSERT INTO help_keyword VALUES('314', 'LAST');
INSERT INTO help_keyword VALUES('315', 'INNOBASE');
INSERT INTO help_keyword VALUES('316', 'LIMIT');
INSERT INTO help_keyword VALUES('317', 'KEYS');
INSERT INTO help_keyword VALUES('318', 'KEY');
INSERT INTO help_keyword VALUES('319', 'MERGE');
INSERT INTO help_keyword VALUES('320', 'SQL_NO_CACHE');
INSERT INTO help_keyword VALUES('321', 'DELAYED');
INSERT INTO help_keyword VALUES('322', 'CONSTRAINT');
INSERT INTO help_keyword VALUES('323', 'SERIAL');
INSERT INTO help_keyword VALUES('324', 'ACTION');
INSERT INTO help_keyword VALUES('325', 'WRITE');
INSERT INTO help_keyword VALUES('326', 'SESSION');
INSERT INTO help_keyword VALUES('327', 'DATABASE');
INSERT INTO help_keyword VALUES('328', 'NULL');
INSERT INTO help_keyword VALUES('329', 'USE_FRM');
INSERT INTO help_keyword VALUES('330', 'SLAVE');
INSERT INTO help_keyword VALUES('331', 'TERMINATED');
INSERT INTO help_keyword VALUES('332', 'ASC');
INSERT INTO help_keyword VALUES('333', 'OPTIONALLY');
INSERT INTO help_keyword VALUES('334', 'ENABLE');
INSERT INTO help_keyword VALUES('335', 'DIRECTORY');
INSERT INTO help_keyword VALUES('336', 'MAX_USER_CONNECTIONS');
INSERT INTO help_keyword VALUES('337', 'LOCAL');
INSERT INTO help_keyword VALUES('338', 'DISTINCT');
INSERT INTO help_keyword VALUES('339', 'MASTER_SSL_KEY');
INSERT INTO help_keyword VALUES('340', 'NONE');
INSERT INTO help_keyword VALUES('341', 'TABLES');
INSERT INTO help_keyword VALUES('342', '<>');
INSERT INTO help_keyword VALUES('343', 'SHUTDOWN');
INSERT INTO help_keyword VALUES('344', 'HIGH_PRIORITY');
INSERT INTO help_keyword VALUES('345', 'BTREE');
INSERT INTO help_keyword VALUES('346', 'FIRST');
INSERT INTO help_keyword VALUES('347', 'TYPES');
INSERT INTO help_keyword VALUES('348', 'MASTER');
INSERT INTO help_keyword VALUES('349', 'FIXED');
INSERT INTO help_keyword VALUES('350', 'RAID0');
INSERT INTO help_keyword VALUES('351', 'MULTIPOLYGONFROMTEXT');
INSERT INTO help_keyword VALUES('352', 'ROW_FORMAT');



DROP TABLE IF EXISTS help_relation;
CREATE TABLE help_relation (
   help_topic_id int(10) unsigned NOT NULL,
   help_keyword_id int(10) unsigned NOT NULL,
   PRIMARY KEY (help_keyword_id,help_topic_id)
);

INSERT INTO help_relation VALUES('380', '0');
INSERT INTO help_relation VALUES('283', '1');
INSERT INTO help_relation VALUES('352', '2');
INSERT INTO help_relation VALUES('332', '3');
INSERT INTO help_relation VALUES('127', '4');
INSERT INTO help_relation VALUES('148', '5');
INSERT INTO help_relation VALUES('338', '6');
INSERT INTO help_relation VALUES('274', '7');
INSERT INTO help_relation VALUES('109', '8');
INSERT INTO help_relation VALUES('300', '9');
INSERT INTO help_relation VALUES('62', '10');
INSERT INTO help_relation VALUES('283', '10');
INSERT INTO help_relation VALUES('78', '11');
INSERT INTO help_relation VALUES('274', '11');
INSERT INTO help_relation VALUES('127', '12');
INSERT INTO help_relation VALUES('397', '12');
INSERT INTO help_relation VALUES('303', '13');
INSERT INTO help_relation VALUES('190', '14');
INSERT INTO help_relation VALUES('80', '15');
INSERT INTO help_relation VALUES('19', '16');
INSERT INTO help_relation VALUES('61', '16');
INSERT INTO help_relation VALUES('127', '16');
INSERT INTO help_relation VALUES('149', '16');
INSERT INTO help_relation VALUES('220', '16');
INSERT INTO help_relation VALUES('369', '16');
INSERT INTO help_relation VALUES('283', '17');
INSERT INTO help_relation VALUES('186', '18');
INSERT INTO help_relation VALUES('20', '19');
INSERT INTO help_relation VALUES('398', '20');
INSERT INTO help_relation VALUES('117', '21');
INSERT INTO help_relation VALUES('40', '22');
INSERT INTO help_relation VALUES('158', '23');
INSERT INTO help_relation VALUES('23', '24');
INSERT INTO help_relation VALUES('274', '25');
INSERT INTO help_relation VALUES('372', '25');
INSERT INTO help_relation VALUES('20', '26');
INSERT INTO help_relation VALUES('158', '27');
INSERT INTO help_relation VALUES('23', '28');
INSERT INTO help_relation VALUES('283', '28');
INSERT INTO help_relation VALUES('372', '29');
INSERT INTO help_relation VALUES('372', '30');
INSERT INTO help_relation VALUES('274', '31');
INSERT INTO help_relation VALUES('372', '31');
INSERT INTO help_relation VALUES('397', '32');
INSERT INTO help_relation VALUES('34', '33');
INSERT INTO help_relation VALUES('60', '33');
INSERT INTO help_relation VALUES('158', '33');
INSERT INTO help_relation VALUES('283', '33');
INSERT INTO help_relation VALUES('289', '33');
INSERT INTO help_relation VALUES('332', '33');
INSERT INTO help_relation VALUES('369', '33');
INSERT INTO help_relation VALUES('372', '33');
INSERT INTO help_relation VALUES('372', '34');
INSERT INTO help_relation VALUES('376', '34');
INSERT INTO help_relation VALUES('20', '35');
INSERT INTO help_relation VALUES('87', '36');
INSERT INTO help_relation VALUES('332', '36');
INSERT INTO help_relation VALUES('372', '36');
INSERT INTO help_relation VALUES('20', '37');
INSERT INTO help_relation VALUES('372', '38');
INSERT INTO help_relation VALUES('283', '39');
INSERT INTO help_relation VALUES('127', '40');
INSERT INTO help_relation VALUES('248', '40');
INSERT INTO help_relation VALUES('289', '41');
INSERT INTO help_relation VALUES('372', '42');
INSERT INTO help_relation VALUES('376', '42');
INSERT INTO help_relation VALUES('0', '43');
INSERT INTO help_relation VALUES('376', '43');
INSERT INTO help_relation VALUES('24', '44');
INSERT INTO help_relation VALUES('78', '45');
INSERT INTO help_relation VALUES('158', '46');
INSERT INTO help_relation VALUES('0', '47');
INSERT INTO help_relation VALUES('34', '48');
INSERT INTO help_relation VALUES('60', '48');
INSERT INTO help_relation VALUES('78', '48');
INSERT INTO help_relation VALUES('158', '49');
INSERT INTO help_relation VALUES('166', '50');
INSERT INTO help_relation VALUES('369', '50');
INSERT INTO help_relation VALUES('158', '51');
INSERT INTO help_relation VALUES('283', '52');
INSERT INTO help_relation VALUES('0', '53');
INSERT INTO help_relation VALUES('60', '53');
INSERT INTO help_relation VALUES('117', '53');
INSERT INTO help_relation VALUES('283', '53');
INSERT INTO help_relation VALUES('332', '53');
INSERT INTO help_relation VALUES('369', '53');
INSERT INTO help_relation VALUES('24', '54');
INSERT INTO help_relation VALUES('34', '54');
INSERT INTO help_relation VALUES('267', '54');
INSERT INTO help_relation VALUES('300', '55');
INSERT INTO help_relation VALUES('158', '56');
INSERT INTO help_relation VALUES('306', '57');
INSERT INTO help_relation VALUES('64', '58');
INSERT INTO help_relation VALUES('372', '59');
INSERT INTO help_relation VALUES('352', '60');
INSERT INTO help_relation VALUES('0', '61');
INSERT INTO help_relation VALUES('205', '62');
INSERT INTO help_relation VALUES('237', '62');
INSERT INTO help_relation VALUES('300', '62');
INSERT INTO help_relation VALUES('338', '62');
INSERT INTO help_relation VALUES('148', '63');
INSERT INTO help_relation VALUES('364', '63');
INSERT INTO help_relation VALUES('148', '64');
INSERT INTO help_relation VALUES('369', '64');
INSERT INTO help_relation VALUES('20', '65');
INSERT INTO help_relation VALUES('117', '66');
INSERT INTO help_relation VALUES('283', '66');
INSERT INTO help_relation VALUES('376', '66');
INSERT INTO help_relation VALUES('30', '67');
INSERT INTO help_relation VALUES('117', '67');
INSERT INTO help_relation VALUES('283', '67');
INSERT INTO help_relation VALUES('372', '68');
INSERT INTO help_relation VALUES('205', '69');
INSERT INTO help_relation VALUES('20', '70');
INSERT INTO help_relation VALUES('96', '71');
INSERT INTO help_relation VALUES('109', '72');
INSERT INTO help_relation VALUES('364', '72');
INSERT INTO help_relation VALUES('380', '73');
INSERT INTO help_relation VALUES('166', '74');
INSERT INTO help_relation VALUES('283', '75');
INSERT INTO help_relation VALUES('70', '76');
INSERT INTO help_relation VALUES('150', '76');
INSERT INTO help_relation VALUES('332', '77');
INSERT INTO help_relation VALUES('62', '78');
INSERT INTO help_relation VALUES('372', '79');
INSERT INTO help_relation VALUES('117', '80');
INSERT INTO help_relation VALUES('388', '80');
INSERT INTO help_relation VALUES('341', '81');
INSERT INTO help_relation VALUES('227', '82');
INSERT INTO help_relation VALUES('104', '83');
INSERT INTO help_relation VALUES('274', '84');
INSERT INTO help_relation VALUES('20', '85');
INSERT INTO help_relation VALUES('19', '86');
INSERT INTO help_relation VALUES('119', '86');
INSERT INTO help_relation VALUES('149', '86');
INSERT INTO help_relation VALUES('220', '86');
INSERT INTO help_relation VALUES('15', '87');
INSERT INTO help_relation VALUES('62', '87');
INSERT INTO help_relation VALUES('117', '88');
INSERT INTO help_relation VALUES('190', '88');
INSERT INTO help_relation VALUES('369', '88');
INSERT INTO help_relation VALUES('372', '88');
INSERT INTO help_relation VALUES('137', '89');
INSERT INTO help_relation VALUES('369', '90');
INSERT INTO help_relation VALUES('372', '90');
INSERT INTO help_relation VALUES('261', '91');
INSERT INTO help_relation VALUES('267', '91');
INSERT INTO help_relation VALUES('375', '91');
INSERT INTO help_relation VALUES('25', '92');
INSERT INTO help_relation VALUES('114', '92');
INSERT INTO help_relation VALUES('210', '92');
INSERT INTO help_relation VALUES('174', '93');
INSERT INTO help_relation VALUES('30', '94');
INSERT INTO help_relation VALUES('60', '94');
INSERT INTO help_relation VALUES('109', '94');
INSERT INTO help_relation VALUES('145', '94');
INSERT INTO help_relation VALUES('167', '94');
INSERT INTO help_relation VALUES('369', '94');
INSERT INTO help_relation VALUES('376', '94');
INSERT INTO help_relation VALUES('392', '94');
INSERT INTO help_relation VALUES('158', '95');
INSERT INTO help_relation VALUES('20', '96');
INSERT INTO help_relation VALUES('97', '96');
INSERT INTO help_relation VALUES('209', '96');
INSERT INTO help_relation VALUES('300', '96');
INSERT INTO help_relation VALUES('41', '97');
INSERT INTO help_relation VALUES('176', '97');
INSERT INTO help_relation VALUES('274', '97');
INSERT INTO help_relation VALUES('166', '98');
INSERT INTO help_relation VALUES('369', '98');
INSERT INTO help_relation VALUES('372', '98');
INSERT INTO help_relation VALUES('372', '99');
INSERT INTO help_relation VALUES('148', '100');
INSERT INTO help_relation VALUES('0', '101');
INSERT INTO help_relation VALUES('37', '102');
INSERT INTO help_relation VALUES('148', '103');
INSERT INTO help_relation VALUES('372', '104');
INSERT INTO help_relation VALUES('248', '105');
INSERT INTO help_relation VALUES('158', '106');
INSERT INTO help_relation VALUES('360', '107');
INSERT INTO help_relation VALUES('227', '108');
INSERT INTO help_relation VALUES('158', '109');
INSERT INTO help_relation VALUES('104', '110');
INSERT INTO help_relation VALUES('37', '111');
INSERT INTO help_relation VALUES('260', '111');
INSERT INTO help_relation VALUES('158', '112');
INSERT INTO help_relation VALUES('34', '113');
INSERT INTO help_relation VALUES('87', '113');
INSERT INTO help_relation VALUES('186', '113');
INSERT INTO help_relation VALUES('274', '113');
INSERT INTO help_relation VALUES('283', '113');
INSERT INTO help_relation VALUES('288', '113');
INSERT INTO help_relation VALUES('360', '113');
INSERT INTO help_relation VALUES('23', '114');
INSERT INTO help_relation VALUES('78', '114');
INSERT INTO help_relation VALUES('352', '114');
INSERT INTO help_relation VALUES('0', '115');
INSERT INTO help_relation VALUES('20', '116');
INSERT INTO help_relation VALUES('372', '117');
INSERT INTO help_relation VALUES('252', '118');
INSERT INTO help_relation VALUES('274', '119');
INSERT INTO help_relation VALUES('283', '119');
INSERT INTO help_relation VALUES('274', '120');
INSERT INTO help_relation VALUES('372', '121');
INSERT INTO help_relation VALUES('127', '122');
INSERT INTO help_relation VALUES('127', '123');
INSERT INTO help_relation VALUES('332', '124');
INSERT INTO help_relation VALUES('127', '125');
INSERT INTO help_relation VALUES('274', '126');
INSERT INTO help_relation VALUES('332', '126');
INSERT INTO help_relation VALUES('200', '127');
INSERT INTO help_relation VALUES('372', '128');
INSERT INTO help_relation VALUES('369', '129');
INSERT INTO help_relation VALUES('372', '129');
INSERT INTO help_relation VALUES('43', '130');
INSERT INTO help_relation VALUES('369', '130');
INSERT INTO help_relation VALUES('131', '131');
INSERT INTO help_relation VALUES('372', '132');
INSERT INTO help_relation VALUES('19', '133');
INSERT INTO help_relation VALUES('122', '133');
INSERT INTO help_relation VALUES('352', '134');
INSERT INTO help_relation VALUES('332', '135');
INSERT INTO help_relation VALUES('34', '136');
INSERT INTO help_relation VALUES('60', '136');
INSERT INTO help_relation VALUES('283', '136');
INSERT INTO help_relation VALUES('289', '136');
INSERT INTO help_relation VALUES('369', '136');
INSERT INTO help_relation VALUES('0', '137');
INSERT INTO help_relation VALUES('34', '137');
INSERT INTO help_relation VALUES('200', '138');
INSERT INTO help_relation VALUES('158', '139');
INSERT INTO help_relation VALUES('15', '140');
INSERT INTO help_relation VALUES('94', '140');
INSERT INTO help_relation VALUES('131', '140');
INSERT INTO help_relation VALUES('248', '140');
INSERT INTO help_relation VALUES('252', '140');
INSERT INTO help_relation VALUES('300', '140');
INSERT INTO help_relation VALUES('397', '140');
INSERT INTO help_relation VALUES('252', '141');
INSERT INTO help_relation VALUES('327', '142');
INSERT INTO help_relation VALUES('274', '143');
INSERT INTO help_relation VALUES('369', '144');
INSERT INTO help_relation VALUES('372', '144');
INSERT INTO help_relation VALUES('376', '144');
INSERT INTO help_relation VALUES('114', '145');
INSERT INTO help_relation VALUES('108', '146');
INSERT INTO help_relation VALUES('274', '146');
INSERT INTO help_relation VALUES('109', '147');
INSERT INTO help_relation VALUES('274', '148');
INSERT INTO help_relation VALUES('360', '149');
INSERT INTO help_relation VALUES('87', '150');
INSERT INTO help_relation VALUES('288', '150');
INSERT INTO help_relation VALUES('332', '150');
INSERT INTO help_relation VALUES('283', '151');
INSERT INTO help_relation VALUES('300', '152');
INSERT INTO help_relation VALUES('372', '153');
INSERT INTO help_relation VALUES('315', '154');
INSERT INTO help_relation VALUES('370', '155');
INSERT INTO help_relation VALUES('356', '156');
INSERT INTO help_relation VALUES('96', '157');
INSERT INTO help_relation VALUES('145', '157');
INSERT INTO help_relation VALUES('352', '157');
INSERT INTO help_relation VALUES('372', '158');
INSERT INTO help_relation VALUES('104', '159');
INSERT INTO help_relation VALUES('283', '160');
INSERT INTO help_relation VALUES('0', '161');
INSERT INTO help_relation VALUES('23', '161');
INSERT INTO help_relation VALUES('283', '161');
INSERT INTO help_relation VALUES('332', '162');
INSERT INTO help_relation VALUES('158', '163');
INSERT INTO help_relation VALUES('109', '164');
INSERT INTO help_relation VALUES('158', '165');
INSERT INTO help_relation VALUES('274', '166');
INSERT INTO help_relation VALUES('0', '167');
INSERT INTO help_relation VALUES('174', '168');
INSERT INTO help_relation VALUES('158', '169');
INSERT INTO help_relation VALUES('369', '170');
INSERT INTO help_relation VALUES('324', '171');
INSERT INTO help_relation VALUES('369', '172');
INSERT INTO help_relation VALUES('332', '173');
INSERT INTO help_relation VALUES('372', '173');
INSERT INTO help_relation VALUES('283', '174');
INSERT INTO help_relation VALUES('23', '175');
INSERT INTO help_relation VALUES('30', '175');
INSERT INTO help_relation VALUES('34', '175');
INSERT INTO help_relation VALUES('60', '175');
INSERT INTO help_relation VALUES('117', '175');
INSERT INTO help_relation VALUES('332', '175');
INSERT INTO help_relation VALUES('158', '176');
INSERT INTO help_relation VALUES('372', '177');
INSERT INTO help_relation VALUES('119', '178');
INSERT INTO help_relation VALUES('149', '178');
INSERT INTO help_relation VALUES('167', '178');
INSERT INTO help_relation VALUES('274', '178');
INSERT INTO help_relation VALUES('127', '179');
INSERT INTO help_relation VALUES('385', '180');
INSERT INTO help_relation VALUES('368', '181');
INSERT INTO help_relation VALUES('0', '182');
INSERT INTO help_relation VALUES('43', '182');
INSERT INTO help_relation VALUES('61', '182');
INSERT INTO help_relation VALUES('166', '182');
INSERT INTO help_relation VALUES('274', '182');
INSERT INTO help_relation VALUES('369', '182');
INSERT INTO help_relation VALUES('372', '182');
INSERT INTO help_relation VALUES('335', '183');
INSERT INTO help_relation VALUES('285', '184');
INSERT INTO help_relation VALUES('216', '185');
INSERT INTO help_relation VALUES('24', '186');
INSERT INTO help_relation VALUES('267', '186');
INSERT INTO help_relation VALUES('0', '187');
INSERT INTO help_relation VALUES('205', '188');
INSERT INTO help_relation VALUES('338', '188');
INSERT INTO help_relation VALUES('283', '189');
INSERT INTO help_relation VALUES('15', '190');
INSERT INTO help_relation VALUES('94', '190');
INSERT INTO help_relation VALUES('131', '190');
INSERT INTO help_relation VALUES('248', '190');
INSERT INTO help_relation VALUES('252', '190');
INSERT INTO help_relation VALUES('397', '190');
INSERT INTO help_relation VALUES('158', '191');
INSERT INTO help_relation VALUES('148', '192');
INSERT INTO help_relation VALUES('148', '193');
INSERT INTO help_relation VALUES('306', '194');
INSERT INTO help_relation VALUES('167', '195');
INSERT INTO help_relation VALUES('205', '195');
INSERT INTO help_relation VALUES('338', '195');
INSERT INTO help_relation VALUES('148', '196');
INSERT INTO help_relation VALUES('369', '197');
INSERT INTO help_relation VALUES('372', '197');
INSERT INTO help_relation VALUES('24', '198');
INSERT INTO help_relation VALUES('43', '198');
INSERT INTO help_relation VALUES('118', '198');
INSERT INTO help_relation VALUES('220', '198');
INSERT INTO help_relation VALUES('267', '198');
INSERT INTO help_relation VALUES('274', '198');
INSERT INTO help_relation VALUES('285', '198');
INSERT INTO help_relation VALUES('288', '198');
INSERT INTO help_relation VALUES('375', '198');
INSERT INTO help_relation VALUES('372', '199');
INSERT INTO help_relation VALUES('19', '200');
INSERT INTO help_relation VALUES('220', '200');
INSERT INTO help_relation VALUES('372', '200');
INSERT INTO help_relation VALUES('376', '200');
INSERT INTO help_relation VALUES('148', '201');
INSERT INTO help_relation VALUES('283', '202');
INSERT INTO help_relation VALUES('372', '203');
INSERT INTO help_relation VALUES('369', '204');
INSERT INTO help_relation VALUES('62', '205');
INSERT INTO help_relation VALUES('148', '206');
INSERT INTO help_relation VALUES('262', '207');
INSERT INTO help_relation VALUES('283', '207');
INSERT INTO help_relation VALUES('289', '207');
INSERT INTO help_relation VALUES('283', '208');
INSERT INTO help_relation VALUES('249', '209');
INSERT INTO help_relation VALUES('299', '209');
INSERT INTO help_relation VALUES('300', '209');
INSERT INTO help_relation VALUES('194', '210');
INSERT INTO help_relation VALUES('372', '211');
INSERT INTO help_relation VALUES('114', '212');
INSERT INTO help_relation VALUES('43', '213');
INSERT INTO help_relation VALUES('119', '213');
INSERT INTO help_relation VALUES('127', '213');
INSERT INTO help_relation VALUES('166', '213');
INSERT INTO help_relation VALUES('274', '213');
INSERT INTO help_relation VALUES('372', '213');
INSERT INTO help_relation VALUES('372', '214');
INSERT INTO help_relation VALUES('158', '215');
INSERT INTO help_relation VALUES('182', '216');
INSERT INTO help_relation VALUES('274', '217');
INSERT INTO help_relation VALUES('237', '218');
INSERT INTO help_relation VALUES('274', '218');
INSERT INTO help_relation VALUES('372', '219');
INSERT INTO help_relation VALUES('301', '220');
INSERT INTO help_relation VALUES('110', '221');
INSERT INTO help_relation VALUES('79', '222');
INSERT INTO help_relation VALUES('372', '223');
INSERT INTO help_relation VALUES('24', '224');
INSERT INTO help_relation VALUES('30', '225');
INSERT INTO help_relation VALUES('205', '226');
INSERT INTO help_relation VALUES('41', '227');
INSERT INTO help_relation VALUES('108', '227');
INSERT INTO help_relation VALUES('176', '227');
INSERT INTO help_relation VALUES('186', '227');
INSERT INTO help_relation VALUES('237', '227');
INSERT INTO help_relation VALUES('158', '228');
INSERT INTO help_relation VALUES('242', '228');
INSERT INTO help_relation VALUES('283', '228');
INSERT INTO help_relation VALUES('372', '229');
INSERT INTO help_relation VALUES('261', '230');
INSERT INTO help_relation VALUES('372', '231');
INSERT INTO help_relation VALUES('186', '232');
INSERT INTO help_relation VALUES('104', '233');
INSERT INTO help_relation VALUES('20', '234');
INSERT INTO help_relation VALUES('110', '235');
INSERT INTO help_relation VALUES('250', '235');
INSERT INTO help_relation VALUES('248', '236');
INSERT INTO help_relation VALUES('78', '237');
INSERT INTO help_relation VALUES('20', '238');
INSERT INTO help_relation VALUES('30', '239');
INSERT INTO help_relation VALUES('204', '239');
INSERT INTO help_relation VALUES('274', '240');
INSERT INTO help_relation VALUES('103', '241');
INSERT INTO help_relation VALUES('158', '242');
INSERT INTO help_relation VALUES('148', '243');
INSERT INTO help_relation VALUES('145', '244');
INSERT INTO help_relation VALUES('360', '245');
INSERT INTO help_relation VALUES('15', '246');
INSERT INTO help_relation VALUES('82', '246');
INSERT INTO help_relation VALUES('20', '247');
INSERT INTO help_relation VALUES('148', '248');
INSERT INTO help_relation VALUES('332', '249');
INSERT INTO help_relation VALUES('369', '250');
INSERT INTO help_relation VALUES('158', '251');
INSERT INTO help_relation VALUES('148', '252');
INSERT INTO help_relation VALUES('20', '253');
INSERT INTO help_relation VALUES('158', '254');
INSERT INTO help_relation VALUES('274', '255');
INSERT INTO help_relation VALUES('301', '255');
INSERT INTO help_relation VALUES('62', '256');
INSERT INTO help_relation VALUES('186', '256');
INSERT INTO help_relation VALUES('283', '256');
INSERT INTO help_relation VALUES('369', '257');
INSERT INTO help_relation VALUES('283', '258');
INSERT INTO help_relation VALUES('158', '259');
INSERT INTO help_relation VALUES('158', '260');
INSERT INTO help_relation VALUES('283', '261');
INSERT INTO help_relation VALUES('353', '262');
INSERT INTO help_relation VALUES('114', '263');
INSERT INTO help_relation VALUES('148', '264');
INSERT INTO help_relation VALUES('332', '265');
INSERT INTO help_relation VALUES('37', '266');
INSERT INTO help_relation VALUES('260', '266');
INSERT INTO help_relation VALUES('158', '267');
INSERT INTO help_relation VALUES('91', '268');
INSERT INTO help_relation VALUES('148', '269');
INSERT INTO help_relation VALUES('20', '270');
INSERT INTO help_relation VALUES('109', '271');
INSERT INTO help_relation VALUES('352', '271');
INSERT INTO help_relation VALUES('20', '272');
INSERT INTO help_relation VALUES('107', '273');
INSERT INTO help_relation VALUES('15', '274');
INSERT INTO help_relation VALUES('369', '275');
INSERT INTO help_relation VALUES('0', '276');
INSERT INTO help_relation VALUES('43', '277');
INSERT INTO help_relation VALUES('122', '277');
INSERT INTO help_relation VALUES('158', '277');
INSERT INTO help_relation VALUES('369', '277');
INSERT INTO help_relation VALUES('372', '278');
INSERT INTO help_relation VALUES('0', '279');
INSERT INTO help_relation VALUES('283', '279');
INSERT INTO help_relation VALUES('0', '280');
INSERT INTO help_relation VALUES('274', '281');
INSERT INTO help_relation VALUES('332', '282');
INSERT INTO help_relation VALUES('226', '283');
INSERT INTO help_relation VALUES('158', '284');
INSERT INTO help_relation VALUES('372', '285');
INSERT INTO help_relation VALUES('300', '286');
INSERT INTO help_relation VALUES('370', '286');
INSERT INTO help_relation VALUES('283', '287');
INSERT INTO help_relation VALUES('78', '288');
INSERT INTO help_relation VALUES('392', '289');
INSERT INTO help_relation VALUES('274', '290');
INSERT INTO help_relation VALUES('220', '291');
INSERT INTO help_relation VALUES('283', '292');
INSERT INTO help_relation VALUES('352', '293');
INSERT INTO help_relation VALUES('372', '294');
INSERT INTO help_relation VALUES('109', '295');
INSERT INTO help_relation VALUES('24', '296');
INSERT INTO help_relation VALUES('20', '297');
INSERT INTO help_relation VALUES('158', '298');
INSERT INTO help_relation VALUES('20', '299');
INSERT INTO help_relation VALUES('158', '300');
INSERT INTO help_relation VALUES('372', '300');
INSERT INTO help_relation VALUES('376', '300');
INSERT INTO help_relation VALUES('394', '301');
INSERT INTO help_relation VALUES('352', '302');
INSERT INTO help_relation VALUES('94', '303');
INSERT INTO help_relation VALUES('19', '304');
INSERT INTO help_relation VALUES('220', '304');
INSERT INTO help_relation VALUES('376', '304');
INSERT INTO help_relation VALUES('294', '305');
INSERT INTO help_relation VALUES('352', '306');
INSERT INTO help_relation VALUES('119', '307');
INSERT INTO help_relation VALUES('246', '307');
INSERT INTO help_relation VALUES('261', '308');
INSERT INTO help_relation VALUES('372', '309');
INSERT INTO help_relation VALUES('109', '310');
INSERT INTO help_relation VALUES('260', '310');
INSERT INTO help_relation VALUES('19', '311');
INSERT INTO help_relation VALUES('119', '311');
INSERT INTO help_relation VALUES('149', '311');
INSERT INTO help_relation VALUES('220', '311');
INSERT INTO help_relation VALUES('364', '312');
INSERT INTO help_relation VALUES('369', '313');
INSERT INTO help_relation VALUES('78', '314');
INSERT INTO help_relation VALUES('372', '315');
INSERT INTO help_relation VALUES('34', '316');
INSERT INTO help_relation VALUES('60', '316');
INSERT INTO help_relation VALUES('78', '316');
INSERT INTO help_relation VALUES('186', '316');
INSERT INTO help_relation VALUES('283', '316');
INSERT INTO help_relation VALUES('274', '317');
INSERT INTO help_relation VALUES('369', '317');
INSERT INTO help_relation VALUES('43', '318');
INSERT INTO help_relation VALUES('117', '318');
INSERT INTO help_relation VALUES('369', '318');
INSERT INTO help_relation VALUES('372', '318');
INSERT INTO help_relation VALUES('376', '318');
INSERT INTO help_relation VALUES('372', '319');
INSERT INTO help_relation VALUES('283', '320');
INSERT INTO help_relation VALUES('30', '321');
INSERT INTO help_relation VALUES('117', '321');
INSERT INTO help_relation VALUES('388', '321');
INSERT INTO help_relation VALUES('369', '322');
INSERT INTO help_relation VALUES('372', '322');
INSERT INTO help_relation VALUES('190', '323');
INSERT INTO help_relation VALUES('372', '323');
INSERT INTO help_relation VALUES('372', '324');
INSERT INTO help_relation VALUES('376', '324');
INSERT INTO help_relation VALUES('23', '325');
INSERT INTO help_relation VALUES('96', '326');
INSERT INTO help_relation VALUES('352', '326');
INSERT INTO help_relation VALUES('119', '327');
INSERT INTO help_relation VALUES('149', '327');
INSERT INTO help_relation VALUES('274', '327');
INSERT INTO help_relation VALUES('294', '328');
INSERT INTO help_relation VALUES('376', '328');
INSERT INTO help_relation VALUES('267', '329');
INSERT INTO help_relation VALUES('25', '330');
INSERT INTO help_relation VALUES('37', '330');
INSERT INTO help_relation VALUES('108', '330');
INSERT INTO help_relation VALUES('176', '330');
INSERT INTO help_relation VALUES('260', '330');
INSERT INTO help_relation VALUES('332', '331');
INSERT INTO help_relation VALUES('283', '332');
INSERT INTO help_relation VALUES('289', '332');
INSERT INTO help_relation VALUES('332', '333');
INSERT INTO help_relation VALUES('369', '334');
INSERT INTO help_relation VALUES('372', '335');
INSERT INTO help_relation VALUES('158', '336');
INSERT INTO help_relation VALUES('23', '337');
INSERT INTO help_relation VALUES('261', '337');
INSERT INTO help_relation VALUES('267', '337');
INSERT INTO help_relation VALUES('332', '337');
INSERT INTO help_relation VALUES('375', '337');
INSERT INTO help_relation VALUES('229', '338');
INSERT INTO help_relation VALUES('283', '338');
INSERT INTO help_relation VALUES('289', '338');
INSERT INTO help_relation VALUES('307', '338');
INSERT INTO help_relation VALUES('341', '338');
INSERT INTO help_relation VALUES('380', '338');
INSERT INTO help_relation VALUES('148', '339');
INSERT INTO help_relation VALUES('158', '340');
INSERT INTO help_relation VALUES('23', '341');
INSERT INTO help_relation VALUES('274', '341');
INSERT INTO help_relation VALUES('393', '342');
INSERT INTO help_relation VALUES('158', '343');
INSERT INTO help_relation VALUES('117', '344');
INSERT INTO help_relation VALUES('283', '344');
INSERT INTO help_relation VALUES('166', '345');
INSERT INTO help_relation VALUES('78', '346');
INSERT INTO help_relation VALUES('369', '346');
INSERT INTO help_relation VALUES('372', '346');
INSERT INTO help_relation VALUES('274', '347');
INSERT INTO help_relation VALUES('41', '348');
INSERT INTO help_relation VALUES('87', '348');
INSERT INTO help_relation VALUES('148', '348');
INSERT INTO help_relation VALUES('210', '348');
INSERT INTO help_relation VALUES('237', '348');
INSERT INTO help_relation VALUES('288', '348');
INSERT INTO help_relation VALUES('252', '349');
INSERT INTO help_relation VALUES('372', '349');
INSERT INTO help_relation VALUES('372', '350');
INSERT INTO help_relation VALUES('157', '351');
INSERT INTO help_relation VALUES('372', '352');



DROP TABLE IF EXISTS help_topic;
CREATE TABLE help_topic (
   help_topic_id int(10) unsigned NOT NULL,
   name varchar(64) NOT NULL,
   help_category_id smallint(5) unsigned NOT NULL,
   description text NOT NULL,
   example text NOT NULL,
   url varchar(128) NOT NULL,
   PRIMARY KEY (help_topic_id),
   KEY name (name)
);

INSERT INTO help_topic VALUES('0', 'JOIN', '6', 'MySQL supports the following JOIN syntaxes for the\ntable_references part of SELECT statements and multiple-table\nDELETE and UPDATE statements:\n\ntable_reference, table_reference\ntable_reference [INNER | CROSS] JOIN table_reference [join_condition]\ntable_reference STRAIGHT_JOIN table_reference\ntable_reference LEFT [OUTER] JOIN table_reference join_condition\ntable_reference NATURAL [LEFT [OUTER]] JOIN table_reference\n{ OJ table_reference LEFT OUTER JOIN table_reference\n    ON conditional_expr }\ntable_reference RIGHT [OUTER] JOIN table_reference join_condition\ntable_reference NATURAL [RIGHT [OUTER]] JOIN table_reference\n\ntable_reference is defined as:\n\ntbl_name [[AS] alias]\n    [[USE INDEX (key_list)]\n      | [IGNORE INDEX (key_list)]\n      | [FORCE INDEX (key_list)]]\n\njoin_condition is defined as:\n\nON conditional_expr | USING (column_list)\n', 'mysql> SELECT table1.* FROM table1\n    ->        LEFT JOIN table2 ON table1.id=table2.id\n    ->        WHERE table2.id IS NULL;', ');
INSERT INTO help_topic VALUES('1', 'HEX', '23', '   HEX(N_or_S)\n\nIf N_OR_S is a number, returns a string representation of the hexadecimal\nvalue of N, where N is a longlong (BIGINT) number.\nThis is equivalent to CONV(N,10,16).\n\nFrom MySQL 4.0.1 and up,\nif N_OR_S is a string, returns a hexadecimal string of N_OR_S\nwhere each character in N_OR_S is converted to two hexadecimal digits.\n', 'mysql> SELECT HEX(255);\n        -> \'\'FF\'\'\nmysql> SELECT 0x616263;\n        -> \'\'abc\'\'\nmysql> SELECT HEX(\'\'abc\'\');\n        -> 616263', ');
INSERT INTO help_topic VALUES('2', 'REPLACE', '23', '   REPLACE(str,from_str,to_str)\nReturns the string str with all occurrences of the string\nfrom_str replaced by the string to_str.\n', 'mysql> SELECT REPLACE(\'\'www.mysql.com\'\', \'\'w\'\', \'\'Ww\'\');\n        -> \'\'WwWwWw.mysql.com\'\', ');
INSERT INTO help_topic VALUES('3', 'REPEAT', '23', '   REPEAT(str,count)\nReturns a string consisting of the string str repeated count\ntimes. If count <= 0, returns an empty string. Returns NULL if\nstr or count are NULL.\n', 'mysql> SELECT REPEAT(\'\'MySQL\'\', 3);\n        -> \'\'MySQLMySQLMySQL\'\', ');
INSERT INTO help_topic VALUES('4', 'CONTAINS', '11', '   Contains(g1,g2)\nReturns 1 or 0 to indicate whether or not g1 completely contains\ng2.\n', ', ');
INSERT INTO help_topic VALUES('5', 'SRID', '19', '   SRID(g)\nReturns an integer indicating the Spatial Reference System ID for the geometry\nvalue g.\n\nIn MySQL, the SRID value is just an integer associated with the geometry\nvalue. All calculations are done assuming Euclidean (planar) geometry.\n', 'mysql> SELECT SRID(GeomFromText(\'\'LineString(1 1,2 2)\'\',101));\n+-----------------------------------------------+\n| SRID(GeomFromText(\'\'LineString(1 1,2 2)\'\',101)) |\n+-----------------------------------------------+\n|                                           101 |\n+-----------------------------------------------+', ');
INSERT INTO help_topic VALUES('6', 'CURRENT_TIMESTAMP', '14', '   CURRENT_TIMESTAMP\n   CURRENT_TIMESTAMP()\n\nCURRENT_TIMESTAMP and CURRENT_TIMESTAMP() are synonyms for\nNOW().\n', ', ');
INSERT INTO help_topic VALUES('7', 'VARIANCE', '12', '   VARIANCE(expr)\nReturns the population standard variance of expr.  This is an\nextension to standard SQL, available in MySQL 4.1 or later.  As of MySQL\n5.0.3, the standard SQL function VAR_POP() can be used instead.\n', ', ');
INSERT INTO help_topic VALUES('8', 'VAR_SAMP', '12', '   VAR_SAMP(expr)\nReturns the sample variance of expr.  That is, the denominator is the\nnumber of rows minus one.  This function was added in MySQL 5.0.3.\n', ', ');
INSERT INTO help_topic VALUES('9', 'CONCAT', '23', '   CONCAT(str1,str2,...)\nReturns the string that results from concatenating the arguments.  Returns\nNULL if any argument is NULL.  May have one or more arguments.\nIf all arguments are non-binary strings, the result is a non-binary string.\nIf the arguments include any binary strings, the result is a binary string.\nA numeric argument is converted to its equivalent binary string form.\n', 'mysql> SELECT CONCAT(\'\'My\'\', \'\'S\'\', \'\'QL\'\');\n        -> \'\'MySQL\'\'\nmysql> SELECT CONCAT(\'\'My\'\', NULL, \'\'QL\'\');\n        -> NULL\nmysql> SELECT CONCAT(14.3);\n        -> \'\'14.3\'\', ');
INSERT INTO help_topic VALUES('10', 'GEOMETRY HIERARCHY', '24', 'Geometry is the base class. It\'\'s an abstract class.\nThe instantiable subclasses of Geometry are restricted to zero-, one-,\nand two-dimensional geometric objects that exist in\ntwo-dimensional coordinate space. All instantiable geometry classes are\ndefined so that valid instances of a geometry class are topologically closed\n(that is, all defined geometries include their boundary).\n\nThe base Geometry class has subclasses for Point,\nCurve, Surface, and GeometryCollection:\n\n\n --- Point represents zero-dimensional objects.\n\n --- Curve represents one-dimensional objects, and has subclass\nLineString, with sub-subclasses Line and LinearRing.\n\n --- Surface is designed for two-dimensional objects and\nhas subclass Polygon.\n\n --- GeometryCollection\nhas specialized zero-, one-, and two-dimensional collection classes named\nMultiPoint, MultiLineString, and MultiPolygon\nfor modeling geometries corresponding to collections of\nPoints, LineStrings, and Polygons, respectively.\nMultiCurve and MultiSurface are introduced as abstract superclasses\nthat generalize the collection interfaces to handle Curves and Surfaces.\n\n\nGeometry, Curve, Surface, MultiCurve,\nand MultiSurface are defined as non-instantiable classes.\nThey define a common set of methods for their subclasses and\nare included for extensibility.\n\nPoint, LineString, Polygon, GeometryCollection,\nMultiPoint, MultiLineString, and\nMultiPolygon are instantiable classes.\n', ', ');
INSERT INTO help_topic VALUES('11', 'CHAR FUNCTION', '23', '   CHAR(N,...)\nCHAR() interprets the arguments as integers and returns a string\nconsisting of the characters given by the code values of those\nintegers. NULL values are skipped.\n', 'mysql> SELECT CHAR(77,121,83,81,\'\'76\'\');\n        -> \'\'MySQL\'\'\nmysql> SELECT CHAR(77,77.3,\'\'77.3\'\');\n        -> \'\'MMM\'\', ');
INSERT INTO help_topic VALUES('12', 'DATETIME', '1', 'A date and time combination.  The supported range is \'\'1000-01-01\n00:00:00\'\' to \'\'9999-12-31 23:59:59\'\'.  MySQL displays\nDATETIME values in \'\'YYYY-MM-DD HH:MM:SS\'\' format, but allows you\nto assign values to DATETIME columns using either strings or numbers.\n', ', ');
INSERT INTO help_topic VALUES('13', 'LOWER', '23', '   LOWER(str)\nReturns the string str with all characters changed to lowercase\naccording to the current character set mapping (the default is ISO-8859-1\nLatin1).\n', 'mysql> SELECT LOWER(\'\'QUADRATICALLY\'\');\n        -> \'\'quadratically\'\', ');
INSERT INTO help_topic VALUES('14', 'MONTH', '14', '   MONTH(date)\nReturns the month for date, in the range 1 to 12.\n', 'mysql> SELECT MONTH(\'\'1998-02-03\'\');\n        -> 2', ');
INSERT INTO help_topic VALUES('15', 'TINYINT', '1', '   TINYINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA very small integer. The signed range is -128 to 127. The\nunsigned range is 0 to 255.\n', ', ');
INSERT INTO help_topic VALUES('16', 'ISCLOSED', '18', '   IsClosed(ls)\nReturns 1 if the LineString value ls is closed\n(that is, its StartPoint() and EndPoint() values are the same).\nReturns 0 if ls is not closed, and -1 if it is NULL.\n', 'mysql> SET @ls = \'\'LineString(1 1,2 2,3 3)\'\';\nmysql> SELECT IsClosed(GeomFromText(@ls));\n+-----------------------------+\n| IsClosed(GeomFromText(@ls)) |\n+-----------------------------+\n|                           0 |\n+-----------------------------+', ');
INSERT INTO help_topic VALUES('17', 'MASTER_POS_WAIT', '21', '   MASTER_POS_WAIT(log_name,log_pos[,timeout])\n\nThis function is useful for control of master/slave synchronization.\nIt blocks until the slave has read and applied all updates up to the specified\nposition in the master log.\nThe return value is the number of log events it had to wait for to get to\nthe specified position.  The function returns NULL if the slave SQL thread\nis not started, the slave\'\'s master information is not initialized, the\narguments are incorrect, or an error occurs. It returns -1 if the\ntimeout has been exceeded. If the slave SQL thread stops while\nMASTER_POS_WAIT() is waiting, the function returns NULL.\nIf the slave is past the specified position, the function returns\nimmediately.\n', 'SELECT MASTER_POS_WAIT(\'\'master_log_file\'\', master_log_pos)', ');
INSERT INTO help_topic VALUES('18', '^', '27', '   ^\nBitwise XOR:\n', 'mysql> SELECT 1 ^ 1;\n        -> 0\nmysql> SELECT 1 ^ 0;\n        -> 1\nmysql> SELECT 11 ^ 3;\n        -> 8', ');
INSERT INTO help_topic VALUES('19', 'DROP VIEW', '28', 'DROP VIEW removes one or more views. You must have the DROP\nprivilege for each view.\n\nYou can use the keywords IF EXISTS to prevent an error from occurring\nfor views that don\'\'t exist.  When this clause is given, a NOTE is\ngenerated for each non-existent view.\nSee also : [SHOW WARNINGS,  , SHOW WARNINGS].\n\nRESTRICT and CASCADE, if given, are parsed and ignored.\n', 'DROP VIEW [IF EXISTS]\n    view_name [, view_name] ...\n    [RESTRICT | CASCADE]', ');
INSERT INTO help_topic VALUES('20', 'DATE OPERATIONS', '14', '   DATE_ADD(date,INTERVAL expr type)\n   DATE_SUB(date,INTERVAL expr type)\n\nThese functions perform date arithmetic.\ndate is a DATETIME or DATE value specifying the starting\ndate.  expr is an expression specifying the interval value to be added\nor subtracted from the starting date.  expr is a string; it may start\nwith a \'\'-\'\' for negative intervals.  type is a keyword indicating\nhow the expression should be interpreted.\n', 'mysql> SELECT \'\'1997-12-31 23:59:59\'\' + INTERVAL 1 SECOND;\n        -> \'\'1998-01-01 00:00:00\'\'\nmysql> SELECT INTERVAL 1 DAY + \'\'1997-12-31\'\';\n        -> \'\'1998-01-01\'\'\nmysql> SELECT \'\'1998-01-01\'\' - INTERVAL 1 SECOND;\n        -> \'\'1997-12-31 23:59:59\'\'\nmysql> SELECT DATE_ADD(\'\'1997-12-31 23:59:59\'\',\n    ->                 INTERVAL 1 SECOND);\n        -> \'\'1998-01-01 00:00:00\'\'\nmysql> SELECT DATE_ADD(\'\'1997-12-31 23:59:59\'\',\n    ->                 INTERVAL 1 DAY);\n        -> \'\'1998-01-01 23:59:59\'\'\nmysql> SELECT DATE_ADD(\'\'1997-12-31 23:59:59\'\',\n    ->                 INTERVAL \'\'1:1\'\' MINUTE_SECOND);\n        -> \'\'1998-01-01 00:01:00\'\'\nmysql> SELECT DATE_SUB(\'\'1998-01-01 00:00:00\'\',\n    ->                 INTERVAL \'\'1 1:1:1\'\' DAY_SECOND);\n        -> \'\'1997-12-30 22:58:59\'\'\nmysql> SELECT DATE_ADD(\'\'1998-01-01 00:00:00\'\',\n    ->                 INTERVAL \'\'-1 10\'\' DAY_HOUR);\n        -> \'\'1997-12-30 14:00:00\'\'\nmysql> SELECT DATE_SUB(\'\'1998-01-02\'\', INTERVAL 31 DAY);\n        -> \'\'1997-12-02\'\'\nmysql> SELECT DATE_ADD(\'\'1992-12-31 23:59:59.000002\'\',\n    ->            INTERVAL \'\'1.999999\'\' SECOND_MICROSECOND);\n        -> \'\'1993-01-01 00:00:01.000001\'\', ');
INSERT INTO help_topic VALUES('21', 'WITHIN', '11', '   Within(g1,g2)\nReturns 1 or 0 to indicate whether or not g1 is spatially within\ng2.\n', ', ');
INSERT INTO help_topic VALUES('22', 'WEEK', '14', '   WEEK(date[,mode])\nThe function returns the week number for date.  The two-argument form\nof WEEK() allows you to specify whether the week starts on Sunday or\nMonday and whether the return value should be in the range from 0 to\n53 or from 1 to 53. If the mode argument is\nomitted, the value of the default_week_format system variable is\nused (or 0 before MySQL 4.0.14).\nSee also : [Server system variables].\n\nThe following table describes how the mode argument works:\n\n     	 First day 	 	\n   Mode 	 of week 	 Range 	 Week 1 is the first week...\n   0 	 Sunday 	 0-53 	 with a Sunday in this year\n   1 	 Monday 	 0-53 	 with more than 3 days this year\n   2 	 Sunday 	 1-53 	 with a Sunday in this year\n   3 	 Monday 	 1-53 	 with more than 3 days this year\n   4 	 Sunday 	 0-53 	 with more than 3 days this year\n   5 	 Monday 	 0-53 	 with a Monday in this year\n   6 	 Sunday 	 1-53 	 with more than 3 days this year\n   7 	 Monday 	 1-53 	 with a Monday in this year\n  \n\nA mode value of 3 can be used as of MySQL 4.0.5.\nValues of 4 and above can be used as of MySQL 4.0.17.\n', 'mysql> SELECT WEEK(\'\'1998-02-20\'\');\n        -> 7\nmysql> SELECT WEEK(\'\'1998-02-20\'\',0);\n        -> 7\nmysql> SELECT WEEK(\'\'1998-02-20\'\',1);\n        -> 8\nmysql> SELECT WEEK(\'\'1998-12-31\'\',1);\n        -> 53', ');
INSERT INTO help_topic VALUES('23', 'LOCK', '10', 'LOCK TABLES locks tables for the current thread.  UNLOCK\nTABLES releases any locks held by the current thread.  All tables that\nare locked by the current thread are implicitly unlocked when the\nthread issues another LOCK TABLES, or when the connection to the\nserver is closed.\n', 'LOCK TABLES\n    tbl_name [AS alias] {READ [LOCAL] | [LOW_PRIORITY] WRITE}\n    [, tbl_name [AS alias] {READ [LOCAL] | [LOW_PRIORITY] WRITE}] ...\nUNLOCK TABLES', ');
INSERT INTO help_topic VALUES('24', 'CHECK', '7', 'Checks a table or tables for errors.  CHECK TABLE works for\nMyISAM and InnoDB tables.  For MyISAM tables, the key statistics are updated.\n\nAs of MySQL 5.0.2, CHECK TABLE also can check views for problems, such\nas tables that are referenced in the view definition that no longer exist.\n', 'CHECK TABLE tbl_name [, tbl_name] ... [option] ...\n\noption = {QUICK | FAST | MEDIUM | EXTENDED | CHANGED}', ');
INSERT INTO help_topic VALUES('25', 'RESET SLAVE', '7', 'RESET SLAVE\n\nMakes the slave forget its replication position in the master\'\'s binary logs.\nThis statement is meant to be used for a clean start: It deletes the\n*master.info and *relay-log.info files, all the relay logs,\nand starts a new relay log.\n\nNote: All relay logs are deleted, even if they have not been\ntotally executed by the slave SQL thread.  (This is a condition likely to\nexist on a replication slave if you have issued a STOP SLAVE\nstatement or if the slave is highly loaded.)\n\nConnection information stored in the *master.info file is immediately\nreset using any values specified in the corresponding startup options.\nThis information includes values such as master host, master port, master\nuser, and master password.  If the slave SQL thread was in the middle of\nreplicating temporary tables when it was stopped, and RESET SLAVE\nis issued, these replicated temporary tables are deleted on the slave.\n\nThis statement was named FLUSH SLAVE before MySQL 3.23.26.\n', ', ');
INSERT INTO help_topic VALUES('26', 'POLYGON', '2', '   Polygon(ls1,ls2,...)\nConstructs a WKB Polygon value from a number of WKB LineString\narguments. If any argument does not represent the WKB of a LinearRing\n(that is, not a closed and simple LineString) the return value\nis NULL.\n', ', ');
INSERT INTO help_topic VALUES('27', 'MINUTE', '14', '   MINUTE(time)\nReturns the minute for time, in the range 0 to 59.\n', 'mysql> SELECT MINUTE(\'\'98-02-03 10:05:03\'\');\n        -> 5', ');
INSERT INTO help_topic VALUES('28', 'DAY', '14', '   DAY(date)\n\nDAY() is a synonym for DAYOFMONTH().\nIt is available as of MySQL 4.1.1.\n', ', ');
INSERT INTO help_topic VALUES('29', 'MID', '23', '   MID(str,pos,len)\n\nMID(str,pos,len) is a synonym for\nSUBSTRING(str,pos,len).\n', ', ');
INSERT INTO help_topic VALUES('30', 'REPLACE INTO', '6', 'REPLACE works exactly like INSERT, except that if an old\nrecord in the table has the same value as a new record for a PRIMARY\nKEY or a UNIQUE index, the old record is deleted before the new\nrecord is inserted.\nSee also : [INSERT, ,INSERT].\n\nNote that unless the table has a PRIMARY KEY or UNIQUE index,\nusing a REPLACE statement makes no sense. It becomes equivalent to\nINSERT, because there is no index to be used to determine whether a new\nrow duplicates another.\n\nValues for all columns are taken from the values specified in the\nREPLACE statement.  Any missing columns are set to their default\nvalues, just as happens for INSERT.  You can\'\'t refer to values from\nthe current row and use them in the new row.  If you use an assignment such\nas SET col_name = col_name + 1, the reference to the\ncolumn name on the right hand side is treated as\nDEFAULT(col_name), so the assignment is equivalent to SET\ncol_name = DEFAULT(col_name) + 1.\n\nTo be able to use REPLACE, you must have INSERT and\nDELETE privileges for the table.\n', 'REPLACE [LOW_PRIORITY | DELAYED]\n    [INTO] tbl_name [(col_name,...)]\n    VALUES ({expr | DEFAULT},...),(...),...', ');
INSERT INTO help_topic VALUES('31', 'UUID', '21', '   UUID()\n\nReturns a Universal Unique Identifier (UUID) generated\naccording to ``DCE 1.1: Remote Procedure Call\'\'\'\' (Appendix A)\nCAE (Common Applications Environment) Specifications\npublished by The Open Group in October 1997 (Document Number C706).\n\nA UUID is designed as a number that is globally unique in space and\ntime. Two calls to UUID() are expected to generate two different\nvalues, even if these calls are performed on two separate computers that are\nnot connected to each other.\n\nA UUID is a 128-bit number represented by a string\nof five hexadecimal numbers in aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee\nformat:\n\n\n --- The first three numbers are generated from a timestamp.\n\n --- The fourth number preserves temporal uniqueness in case the timestamp value loses\nmonotonicity (for example, due to daylight saving time).\n\n --- The fifth number is an IEEE 802 node number that provides spatial uniqueness.  A\nrandom number is substituted if the latter is not available (for example,\nbecause the host computer has no Ethernet card, or we do not know how to\nfind the hardware address of an interface on your operating system).  In\nthis case, spatial uniqueness cannot be guaranteed. Nevertheless, a\ncollision should have /very/ low probability.\n\nCurrently, the MAC address of an interface is taken into account only on\nFreeBSD and Linux. On other operating systems, MySQL uses a randomly generated\n48-bit number.\n', 'mysql> SELECT UUID();\n        -> \'\'6ccd780c-baba-1026-9564-0040f4311e29\'\', ');
INSERT INTO help_topic VALUES('32', 'LINESTRING', '2', '   LineString(pt1,pt2,...)\nConstructs a WKB LineString value from a number of WKB Point\narguments.  If any argument is not a WKB Point, the return value\nis NULL.  If the number of Point arguments is less than two,\nthe return value is NULL.\n', ', ');
INSERT INTO help_topic VALUES('33', 'CONNECTION_ID', '25', '   CONNECTION_ID()\nReturns the connection ID (thread ID) for the connection.\nEvery connection has its own unique ID.\n', 'mysql> SELECT CONNECTION_ID();\n        -> 23786', ');
INSERT INTO help_topic VALUES('34', 'DELETE', '6', 'DELETE deletes rows from tbl_name that satisfy the condition\ngiven by where_definition, and returns the number of records deleted.\n\nIf you issue a DELETE statement with no WHERE clause, all\nrows are deleted.  A faster way to do this, when you don\'\'t want to know\nthe number of deleted rows, is to use TRUNCATE TABLE.\nSee also : [TRUNCATE,  , TRUNCATE].\n', 'DELETE [LOW_PRIORITY] [QUICK] [IGNORE] FROM tbl_name\n       [WHERE where_definition]\n       [ORDER BY ...]\n       [LIMIT row_count]', ');
INSERT INTO help_topic VALUES('35', 'ROUND', '4', '   ROUND(X)\n   ROUND(X,D)\nReturns the argument X, rounded to the nearest integer.\nWith two arguments, returns X rounded to D decimals.\nD can be negative to round D digits left of the decimal\npoint of the value X.\n', 'mysql> SELECT ROUND(-1.23);\n        -> -1\nmysql> SELECT ROUND(-1.58);\n        -> -2\nmysql> SELECT ROUND(1.58);\n        -> 2\nmysql> SELECT ROUND(1.298, 1);\n        -> 1.3\nmysql> SELECT ROUND(1.298, 0);\n        -> 1\nmysql> SELECT ROUND(23.298, -1);\n        -> 20', ');
INSERT INTO help_topic VALUES('36', 'NULLIF', '9', '   NULLIF(expr1,expr2)\nReturns NULL if expr1 = expr2 is true, else returns expr1.\nThis is the same as CASE WHEN expr1 = expr2 THEN NULL ELSE expr1 END.\n', 'mysql> SELECT NULLIF(1,1);\n        -> NULL\nmysql> SELECT NULLIF(1,2);\n        -> 1', ');
INSERT INTO help_topic VALUES('37', 'STOP SLAVE', '7', 'STOP SLAVE [thread_type [, thread_type] ... ]\n\nthread_type: IO_THREAD | SQL_THREAD\n\nStops the slave threads.\nSTOP SLAVE requires the SUPER privilege.\n\nLike START SLAVE, as of MySQL 4.0.2, this statement\nmay be used with the IO_THREAD and SQL_THREAD options to name\nthe thread or threads to stop.\n', ', ');
INSERT INTO help_topic VALUES('38', 'TIMEDIFF', '14', '   TIMEDIFF(expr,expr2)\n\n\nTIMEDIFF() returns the time between the start time\nexpr and the end time expr2.\nexpr and expr2 are time or date-and-time expressions, but both\nmust be of the same type.\n', 'mysql> SELECT TIMEDIFF(\'\'2000:01:01 00:00:00\'\',\n    ->                 \'\'2000:01:01 00:00:00.000001\'\');\n        -> \'\'-00:00:00.000001\'\'\nmysql> SELECT TIMEDIFF(\'\'1997-12-31 23:59:59.000001\'\',\n    ->                 \'\'1997-12-30 01:01:01.000002\'\');\n        -> \'\'46:58:57.999999\'\', ');
INSERT INTO help_topic VALUES('39', 'RELATED', '11', '   Related(g1,g2,pattern_matrix)\nReturns 1 or 0 to indicate whether or not the spatial relationship specified\nby pattern_matrix exists between g1 and g2.\nReturns -1 if the arguments are NULL.\nThe pattern matrix is a string. Its specification will be noted here if this\nfunction is implemented.\n', ', ');
INSERT INTO help_topic VALUES('40', 'LINEFROMTEXT', '3', '   LineFromText(wkt[,srid])\n   LineStringFromText(wkt[,srid])\nConstructs a LINESTRING value using its WKT representation and SRID.\n', ', ');
INSERT INTO help_topic VALUES('41', 'SHOW MASTER STATUS', '6', 'SHOW MASTER STATUS\n\nProvides status information on the binary log files of the master.\n', ', ');
INSERT INTO help_topic VALUES('42', 'ADDTIME', '14', '   ADDTIME(expr,expr2)\n\n\nADDTIME() adds expr2 to expr and returns the result.\nexpr is a time or datetime expression, and expr2 is a time\nexpression.\n', 'mysql> SELECT ADDTIME(\'\'1997-12-31 23:59:59.999999\'\',\n    ->                \'\'1 1:1:1.000002\'\');\n        -> \'\'1998-01-02 01:01:01.000001\'\'\nmysql> SELECT ADDTIME(\'\'01:00:00.999999\'\', \'\'02:00:00.999998\'\');\n        -> \'\'03:00:01.999997\'\', ');
INSERT INTO help_topic VALUES('43', 'SPATIAL', '24', 'MySQL can create spatial indexes using syntax similar to that for creating\nregular indexes, but extended with the SPATIAL keyword.\nSpatial columns that are indexed currently must be declared NOT NULL.\nThe following examples demonstrate how to create spatial indexes.\n\n\n   With CREATE TABLE:\n\nmysql> CREATE TABLE geom (g GEOMETRY NOT NULL, SPATIAL INDEX(g));\n\n   With ALTER TABLE:\n\nmysql> ALTER TABLE geom ADD SPATIAL INDEX(g);\n\n   With CREATE INDEX:\n\nmysql> CREATE SPATIAL INDEX sp_index ON geom (g);\n\n\nTo drop spatial indexes, use ALTER TABLE or DROP INDEX:\n\n\n   With ALTER TABLE:\n\nmysql> ALTER TABLE geom DROP INDEX g;\n\n   With DROP INDEX:\n\nmysql> DROP INDEX sp_index ON geom;\n\n\nExample: Suppose that a table geom contains more than 32,000 geometries,\nwhich are stored in the column g of type GEOMETRY.\nThe table also has an AUTO_INCREMENT column fid for storing\nobject ID values.\n', ', ');
INSERT INTO help_topic VALUES('44', 'TIMESTAMPDIFF', '14', '   TIMESTAMPDIFF(interval,datetime_expr1,datetime_expr2)\n\nReturns the integer difference between the date or datetime expressions\ndatetime_expr1 and\ndatetime_expr2. The unit for the result is given by the\ninterval argument. The legal values for interval are the same as\nthose listed in the description of the TIMESTAMPADD() function.\n', ', ');
INSERT INTO help_topic VALUES('45', 'UPPER', '23', '   UPPER(str)\nReturns the string str with all characters changed to uppercase\naccording to the current character set mapping (the default is ISO-8859-1\nLatin1).\n', 'mysql> SELECT UPPER(\'\'Hej\'\');\n        -> \'\'HEJ\'\', ');
INSERT INTO help_topic VALUES('46', 'FROM_UNIXTIME', '14', '   FROM_UNIXTIME(unix_timestamp)\n   FROM_UNIXTIME(unix_timestamp,format)\nReturns a representation of the unix_timestamp argument as a value in\n\'\'YYYY-MM-DD HH:MM:SS\'\' or YYYYMMDDHHMMSS format, depending on\nwhether the function is used in a string or numeric context.\n\nmysql> SELECT FROM_UNIXTIME(875996580);\n        -> \'\'1997-10-04 22:23:00\'\'\nmysql> SELECT FROM_UNIXTIME(875996580) + 0;\n        -> 19971004222300\n\nIf format is given, the result is formatted according to the\nformat string. format may contain the same specifiers as\nthose listed in the entry for the DATE_FORMAT() function.\n', 'mysql> SELECT FROM_UNIXTIME(UNIX_TIMESTAMP(),\n    ->                      \'\'%Y %D %M %h:%i:%s %x\'\');\n        -> \'\'2003 6th August 06:22:58 2003\'\', ');
INSERT INTO help_topic VALUES('47', 'MEDIUMBLOB', '1', '   MEDIUMBLOB\n\nA BLOB column with a maximum length of 16,777,215\n(2^24 - 1) bytes.\n', ', ');
INSERT INTO help_topic VALUES('48', 'IFNULL', '9', '   IFNULL(expr1,expr2)\nIf expr1 is not NULL, IFNULL() returns expr1,\nelse it returns expr2.  IFNULL() returns a numeric or string\nvalue, depending on the context in which it is used.\n', 'mysql> SELECT IFNULL(1,0);\n        -> 1\nmysql> SELECT IFNULL(NULL,10);\n        -> 10\nmysql> SELECT IFNULL(1/0,10);\n        -> 10\nmysql> SELECT IFNULL(1/0,\'\'yes\'\');\n        -> \'\'yes\'\', ');
INSERT INTO help_topic VALUES('49', 'LEAST', '26', '   LEAST(value1,value2,...)\nWith two or more arguments, returns the smallest (minimum-valued) argument.\nThe arguments are compared using the following rules.\n\n --- If the return value is used in an INTEGER context or all arguments\nare integer-valued, they are compared as integers.\n\n --- If the return value is used in a REAL context or all arguments are\nreal-valued, they are compared as reals.\n\n --- If any argument is a case-sensitive string, the arguments are compared\nas case-sensitive strings.\n\n --- In other cases, the arguments are compared as case-insensitive strings.\n', 'mysql> SELECT LEAST(2,0);\n        -> 0\nmysql> SELECT LEAST(34.0,3.0,5.0,767.0);\n        -> 3.0\nmysql> SELECT LEAST(\'\'B\'\',\'\'A\'\',\'\'C\'\');\n        -> \'\'A\'\', ');
INSERT INTO help_topic VALUES('50', '=', '26', '   =\nEqual:\n', 'mysql> SELECT 1 = 0;\n        -> 0\nmysql> SELECT \'\'0\'\' = 0;\n        -> 1\nmysql> SELECT \'\'0.0\'\' = 0;\n        -> 1\nmysql> SELECT \'\'0.01\'\' = 0;\n        -> 0\nmysql> SELECT \'\'.01\'\' = 0.01;\n        -> 1', ');
INSERT INTO help_topic VALUES('51', 'REVERSE', '23', '   REVERSE(str)\nReturns the string str with the order of the characters reversed.\n', 'mysql> SELECT REVERSE(\'\'abc\'\');\n        -> \'\'cba\'\', ');
INSERT INTO help_topic VALUES('52', 'ISNULL', '26', '   ISNULL(expr)\nIf expr is NULL, ISNULL() returns 1, otherwise\nit returns 0.\n', 'mysql> SELECT ISNULL(1+1);\n        -> 0\nmysql> SELECT ISNULL(1/0);\n        -> 1', ');
INSERT INTO help_topic VALUES('53', 'BINARY', '1', '   BINARY(M)\n\nThe BINARY type is similar to the CHAR type, but stores\nbinary byte strings rather than non-binary character strings.\n\nThis type was added in MySQL 4.1.2.\n', ', ');
INSERT INTO help_topic VALUES('54', 'BOUNDARY', '19', '   Boundary(g)\nReturns a geometry that is the closure of the combinatorial boundary of the\ngeometry value g.\n', ', ');
INSERT INTO help_topic VALUES('55', 'CREATE USER', '7', 'The CREATE USER statement creates new MySQL accounts.  To use it, you\nmust have the global CREATE USER privilege or INSERT\nprivilege on mysql database.\nFor each account, CREATE USER creates a new record in the\nmysql.user table that has no privileges. An error occurs if the\naccount already exists.  The account can be given a password with the\noptional IDENTIFIED BY clause.  The user value and the password\nare given the same way as for the GRANT statement.\n', 'CREATE USER user [IDENTIFIED BY [PASSWORD] \'\'password\'\']\n    [, user [IDENTIFIED BY [PASSWORD] \'\'password\'\']] ...', ');
INSERT INTO help_topic VALUES('56', 'POINT', '2', '   Point(x,y)\nConstructs a WKB Point using its coordinates.\n', ', ');
INSERT INTO help_topic VALUES('57', 'CURRENT_USER', '25', '   CURRENT_USER()\nReturns the username and hostname combination that the current session was\nauthenticated as. This value corresponds to the MySQL account that\ndetermines your access privileges. It can be different from the value of\nUSER().\n', 'mysql> SELECT USER();\n        -> \'\'davida@localhost\'\'\nmysql> SELECT * FROM mysql.user;\nERROR 1044: Access denied for user \'\'\'\'@\'\'localhost\'\' to\ndatabase \'\'mysql\'\'\nmysql> SELECT CURRENT_USER();\n        -> \'\'@localhost\'\', ');
INSERT INTO help_topic VALUES('58', 'LCASE', '23', '   LCASE(str)\n\nLCASE() is a synonym for LOWER().\n', ', ');
INSERT INTO help_topic VALUES('59', '<=', '26', '   <=\nLess than or equal:\n', 'mysql> SELECT 0.1 <= 2;\n        -> 1', ');
INSERT INTO help_topic VALUES('60', 'UPDATE', '6', 'The UPDATE statement updates columns in existing table rows with\nnew values.  The SET clause indicates which columns to modify\nand the values they should be given.  The WHERE clause, if given,\nspecifies which rows should be updated.  Otherwise, all rows are updated. If\nthe ORDER BY clause is specified, the rows are updated in the\norder that is specified. The LIMIT clause places a limit on the\nnumber of rows that can be updated.\n\nThe UPDATE statement supports the following modifiers:\n\n\n --- If you specify the LOW_PRIORITY keyword, execution of the\nUPDATE is delayed until no other clients are reading from the table.\n\n --- If you specify the IGNORE keyword, the update statement does not\nabort even if errors occur during the update.  Rows for which duplicate-key\nconflicts occur are not updated. Rows for which columns are updated to\nvalues that would cause data conversion errors are updated to the closet\nvalid values instead.\n', 'UPDATE [LOW_PRIORITY] [IGNORE] tbl_name\n    SET col_name1=expr1 [, col_name2=expr2 ...]\n    [WHERE where_definition]\n    [ORDER BY ...]\n    [LIMIT row_count]', ');
INSERT INTO help_topic VALUES('61', 'DROP INDEX', '28', 'DROP INDEX drops the index named index_name from the table\ntbl_name.  In MySQL 3.22 or later, DROP INDEX is mapped to an\nALTER TABLE statement to drop the index.  See also : [ALTER TABLE, ,\nALTER TABLE].  DROP INDEX doesn\'\'t do anything prior to MySQL\n3.22.\n', 'DROP INDEX index_name ON tbl_name', ');
INSERT INTO help_topic VALUES('62', 'MATCH AGAINST', '23', 'As of MySQL 3.23.23, MySQL has support for full-text indexing\nand searching.  A full-text index in MySQL is an index of type\nFULLTEXT.  FULLTEXT indexes are used with MyISAM tables\nonly and can be created from CHAR, VARCHAR,\nor TEXT columns at CREATE TABLE time or added later with\nALTER TABLE or CREATE INDEX.  For large datasets, it is\nmuch faster to load your data into a table that has no FULLTEXT\nindex, then create the index with ALTER TABLE (or\nCREATE INDEX).  Loading data into a table that has an existing\nFULLTEXT index could be significantly slower.\n', 'mysql> SELECT id, body, MATCH (title,body) AGAINST\n    -> (\'\'Security implications of running MySQL as root\'\') AS score\n    -> FROM articles WHERE MATCH (title,body) AGAINST\n    -> (\'\'Security implications of running MySQL as root\'\');\n+----+-------------------------------------+-----------------+\n| id | body                                | score           |\n+----+-------------------------------------+-----------------+\n|  4 | 1. Never run mysqld as root. 2. ... | 1.5219271183014 |\n|  6 | When configured properly, MySQL ... | 1.3114095926285 |\n+----+-------------------------------------+-----------------+\n2 rows in set (0.00 sec)', ');
INSERT INTO help_topic VALUES('63', 'ABS', '4', '   ABS(X)\nReturns the absolute value of X.\n', 'mysql> SELECT ABS(2);\n        -> 2\nmysql> SELECT ABS(-32);\n        -> 32', ');
INSERT INTO help_topic VALUES('64', 'POLYFROMWKB', '13', '   PolyFromWKB(wkb[,srid])\n   PolygonFromWKB(wkb[,srid])\nConstructs a POLYGON value using its WKB representation and SRID.\n', ', ');
INSERT INTO help_topic VALUES('65', 'NOT LIKE', '23', '   expr NOT LIKE pat [ESCAPE \'\'escape-char\'\']\n\nThis is the same as NOT (expr LIKE pat [ESCAPE \'\'escape-char\'\']).\n', ', ');
INSERT INTO help_topic VALUES('66', 'SPACE', '23', '   SPACE(N)\nReturns a string consisting of N space characters.\n', 'mysql> SELECT SPACE(6);\n        -> \'\'      \'\', ');
INSERT INTO help_topic VALUES('67', 'MBR DEFINITION', '8', 'Every geometry occupies some position in space. The exterior of\na geometry is all space not occupied by the geometry. The interior\nis the space occupied by the geometry. The boundary is the\ninterface between the geometry\'\'s interior and exterior.\n\n --- Its MBR (Minimum Bounding Rectangle), or Envelope.\nThis is the bounding geometry, formed by the minimum and maximum (X,Y)\ncoordinates:\n', '((MINX MINY, MAXX MINY, MAXX MAXY, MINX MAXY, MINX MINY))', ');
INSERT INTO help_topic VALUES('68', 'GEOMETRYCOLLECTION', '2', '   GeometryCollection(g1,g2,...)\nConstructs a WKB GeometryCollection. If any argument is not a\nwell-formed WKB representation of a geometry, the return value is\nNULL.\n', ', ');
INSERT INTO help_topic VALUES('69', '*', '4', '   *\nMultiplication:\n', 'mysql> SELECT 3*5;\n        -> 15\nmysql> SELECT 18014398509481984*18014398509481984.0;\n        -> 324518553658426726783156020576256.0\nmysql> SELECT 18014398509481984*18014398509481984;\n        -> 0', ');
INSERT INTO help_topic VALUES('70', 'TIMESTAMP', '1', '   TIMESTAMP[(M)]\n\nA timestamp.  The range is \'\'1970-01-01 00:00:00\'\' to partway through the\nyear 2037.\n\nA TIMESTAMP column is useful for recording the date and time of an\nINSERT or UPDATE operation. The first TIMESTAMP column\nin a table is automatically set to the date and time of the most recent\noperation if you don\'\'t assign it a value yourself.  You can also set any\nTIMESTAMP column to the current date and time by assigning it a\nNULL value.\n\nFrom MySQL 4.1 on, TIMESTAMP is returned as a string with the format\n\'\'YYYY-MM-DD HH:MM:SS\'\'. If you want to obtain the value as a number,\nyou should add +0 to the timestamp column. Different timestamp\ndisplay widths are not supported.\n\nIn MySQL 4.0 and earlier, TIMESTAMP values are displayed in\nYYYYMMDDHHMMSS, YYMMDDHHMMSS, YYYYMMDD, or YYMMDD\nformat, depending on whether M is 14 (or missing), 12,\n8, or 6, but allows you to assign values to TIMESTAMP\ncolumns using either strings or numbers.\nThe M argument affects only how a TIMESTAMP column is displayed,\nnot storage.  Its values always are stored using four bytes each.\nFrom MySQL 4.0.12, the --new option can be used\nto make the server behave as in MySQL 4.1.\n\nNote that TIMESTAMP(M) columns where M is 8 or 14 are reported to\nbe numbers, whereas other TIMESTAMP(M) columns are reported to be\nstrings.  This is just to ensure that you can reliably dump and restore\nthe table with these types.\n', ', ');
INSERT INTO help_topic VALUES('71', 'DES_DECRYPT', '17', '   DES_DECRYPT(crypt_str[,key_str])\n\nDecrypts a string encrypted with DES_ENCRYPT().\nOn error, this function returns NULL.\n\nNote that this function works only if MySQL has been configured with\nSSL support. See also : [Secure connections].\n\nIf no key_str argument is given, DES_DECRYPT() examines\nthe first byte of the encrypted string to determine the DES key number\nthat was used to encrypt the original string, and then reads the key\nfrom the DES key file to decrypt the message.  For this to work,\nthe user must have the SUPER privilege. The key file can be specified\nwith the --des-key-file server option.\n\nIf you pass this function a key_str argument, that string\nis used as the key for decrypting the message.\n\nIf the crypt_str argument doesn\'\'t look like an encrypted string,\nMySQL returns the given crypt_str.\n', ', ');
INSERT INTO help_topic VALUES('72', 'CHECKSUM', '7', '\nReports a table checksum.\n\nIf QUICK is specified, the live table checksum is reported if it is\navailable, or NULL otherwise.  This is very fast.  A live checksum\nis enabled by specifying the CHECKSUM=1 table option, currently\nsupported only for MyISAM tables.\nSee also : [CREATE TABLE,  , CREATE TABLE].\n\nIn EXTENDED mode the whole table is read row by row and the checksum\nis calculated. This can be very slow for large tables.\n\nBy default, if neither QUICK nor EXTENDED is specified, MySQL\nreturns a live checksum if the table storage engine supports it and scans\nthe table otherwise.\n\nCHECKSUM TABLE returns NULL for non-existent tables.\nAs of MySQL 5.0.3, a warning is generated for this condition.\n\nThis statement is implemented in MySQL 4.1.1.\n\n\n  @subsubsection OPTIMIZE TABLE Syntax\n\n\n\n\nOPTIMIZE [LOCAL | NO_WRITE_TO_BINLOG] TABLE tbl_name [, tbl_name] ...\n\nOPTIMIZE TABLE should be used if you have deleted a large part of a\ntable or if you have made many changes to a table with variable-length rows\n(tables that have VARCHAR, BLOB, or TEXT columns).\nDeleted records are maintained in a linked list and subsequent INSERT\noperations reuse old record positions. You can use OPTIMIZE TABLE to\nreclaim the unused space and to defragment the data file.\n', 'CHECKSUM TABLE tbl_name [, tbl_name] ... [ QUICK | EXTENDED ]', ');
INSERT INTO help_topic VALUES('73', 'ENDPOINT', '18', '   EndPoint(ls)\nReturns the Point that is the end point of the LineString value\nls.\n', 'mysql> SET @ls = \'\'LineString(1 1,2 2,3 3)\'\';\nmysql> SELECT AsText(EndPoint(GeomFromText(@ls)));\n+-------------------------------------+\n| AsText(EndPoint(GeomFromText(@ls))) |\n+-------------------------------------+\n| POINT(3 3)                          |\n+-------------------------------------+', ');
INSERT INTO help_topic VALUES('74', 'CACHE INDEX', '6', 'The CACHE INDEX statement assigns table indexes to a specific key\ncache. It is used only for MyISAM tables.\n\nThe following statement assigns indexes from the tables t1,\nt2, and t3 to the key cache named hot_cache:\n\nmysql> CACHE INDEX t1, t2, t3 IN hot_cache;\n+---------+--------------------+----------+----------+\n| Table   | Op                 | Msg_type | Msg_text |\n+---------+--------------------+----------+----------+\n| test.t1 | assign_to_keycache | status   | OK       |\n| test.t2 | assign_to_keycache | status   | OK       |\n| test.t3 | assign_to_keycache | status   | OK       |\n+---------+--------------------+----------+----------+\n', 'CACHE INDEX\n  tbl_index_list [, tbl_index_list] ...\n  IN key_cache_name\n\ntbl_index_list:\n  tbl_name [[INDEX|KEY] (index_name[, index_name] ...)]', ');
INSERT INTO help_topic VALUES('75', 'COMPRESS', '23', '   COMPRESS(string_to_compress)\nCompresses a string. This function requires MySQL to have been compiled\nwith a compression library such as zlib. Otherwise, the return\nvalue is always NULL. The compressed string can be uncompressed with\nUNCOMPRESS().\n', 'mysql> SELECT LENGTH(COMPRESS(REPEAT(\'\'a\'\',1000)));\n        -> 21\nmysql> SELECT LENGTH(COMPRESS(\'\'\'\'));\n        -> 0\nmysql> SELECT LENGTH(COMPRESS(\'\'a\'\'));\n        -> 13\nmysql> SELECT LENGTH(COMPRESS(REPEAT(\'\'a\'\',16)));\n        -> 15', ');
INSERT INTO help_topic VALUES('76', 'COUNT', '12', '   COUNT(expr)\nReturns a count of the number of non-NULL values in the rows\nretrieved by a SELECT statement.\n', 'mysql> SELECT student.student_name,COUNT(*)\n    ->        FROM student,course\n    ->        WHERE student.student_id=course.student_id\n    ->        GROUP BY student_name;', ');
INSERT INTO help_topic VALUES('77', 'INSERT', '23', '   INSERT(str,pos,len,newstr)\nReturns the string str, with the substring beginning at position\npos and len characters long replaced by the string\nnewstr.  Returns the original string if pos is not within\nthe length of the string.  Replaces the rest of the string from position\npos is len is not within the length of the rest of the string.\nReturns NULL if any argument is null.\n', 'mysql> SELECT INSERT(\'\'Quadratic\'\', 3, 4, \'\'What\'\');\n        -> \'\'QuWhattic\'\'\nmysql> SELECT INSERT(\'\'Quadratic\'\', -1, 4, \'\'What\'\');\n        -> \'\'Quadratic\'\'\nmysql> SELECT INSERT(\'\'Quadratic\'\', 3, 100, \'\'What\'\');\n        -> \'\'QuWhat\'\', ');
INSERT INTO help_topic VALUES('78', 'HANDLER', '6', 'The HANDLER statement provides direct access to table storage engine\ninterfaces.  It is available for MyISAM tables as MySQL 4.0.0 and\nInnoDB tables as of MySQL 4.0.3.\n', 'HANDLER tbl_name OPEN [ AS alias ]\nHANDLER tbl_name READ index_name { = | >= | <= | < } (value1,value2,...)\n    [ WHERE where_condition ] [LIMIT ... ]\nHANDLER tbl_name READ index_name { FIRST | NEXT | PREV | LAST }\n    [ WHERE where_condition ] [LIMIT ... ]\nHANDLER tbl_name READ { FIRST | NEXT }\n    [ WHERE where_condition ] [LIMIT ... ]\nHANDLER tbl_name CLOSE', ');
INSERT INTO help_topic VALUES('79', 'MLINEFROMTEXT', '3', '   MLineFromText(wkt[,srid])\n   MultiLineStringFromText(wkt[,srid])\nConstructs a MULTILINESTRING value using its WKT representation and SRID.\n', ', ');
INSERT INTO help_topic VALUES('80', 'GEOMCOLLFROMWKB', '13', '   GeomCollFromWKB(wkb[,srid])\n   GeometryCollectionFromWKB(wkt[,srid])\nConstructs a GEOMETRYCOLLECTION value using its WKB representation and SRID.\n', ', ');
INSERT INTO help_topic VALUES('81', 'RENAME TABLE', '28', 'RENAME TABLE tbl_name TO new_tbl_name\n    [, tbl_name2 TO new_tbl_name2] ...\n\nThis statement renames one or more tables.  It was added in MySQL 3.23.23.\n\nThe rename operation is done atomically, which means that no other thread\ncan access any of the tables while the rename is running. For example,\nif you have an existing table old_table, you can create another\ntable new_table that has the same structure but is empty, and then\nreplace the existing table with the empty one as follows:\n', 'CREATE TABLE new_table (...);\nRENAME TABLE old_table TO backup_table, new_table TO old_table;', ');
INSERT INTO help_topic VALUES('82', 'BOOLEAN', '1', '   BOOL\n   BOOLEAN\nThese are synonyms for TINYINT(1).\nThe BOOLEAN synonym was added in MySQL 4.1.0.\nA value of zero is considered false. Non-zero values are considered true.\n\nIn the future,\nfull boolean type handling will be introduced in accordance with standard SQL.\n', ', ');
INSERT INTO help_topic VALUES('83', 'DEFAULT', '21', '   DEFAULT(col_name)\nReturns the default value for a table column.\nStarting from MySQL 5.0.2, you get an error if the column doesn\'\'t have\na default value.\n', 'mysql> UPDATE t SET i = DEFAULT(i)+1 WHERE id < 100;', ');
INSERT INTO help_topic VALUES('84', 'TINYTEXT', '1', '   TINYTEXT\n\nA TEXT column with a maximum length of 255\n(2^8 - 1) characters.\n', ', ');
INSERT INTO help_topic VALUES('85', 'DECODE', '17', '   DECODE(crypt_str,pass_str)\nDecrypts the encrypted string crypt_str using pass_str as the\npassword.  crypt_str should be a string returned from\nENCODE().\n', ', ');
INSERT INTO help_topic VALUES('86', '<=>', '26', '   <=>\nNULL-safe equal.\nThis operator performs an equality comparison like the = operator, but\nreturns 1 rather than NULL if both operands are NULL,\nand 0 rather than NULL if one operand is NULL.\n', 'mysql> SELECT 1 <=> 1, NULL <=> NULL, 1 <=> NULL;\n        -> 1, 1, 0\nmysql> SELECT 1 = 1, NULL = NULL, 1 = NULL;\n        -> 1, NULL, NULL', ');
INSERT INTO help_topic VALUES('87', 'LOAD DATA FROM MASTER', '6', 'LOAD DATA FROM MASTER\n\nTakes a snapshot of the master and copies it to the slave.  It updates the\nvalues of MASTER_LOG_FILE and MASTER_LOG_POS so that the slave\nstarts replicating from the correct position. Any table and database\nexclusion rules specified with the --replicate-*-do-* and\n--replicate-*-ignore-* options are honored.\n--replicate-rewrite-db is /not/ taken into account (because one user\ncould, with this option, set up a non-unique mapping such as\n--replicate-rewrite-db=db1->db3 and\n--replicate-rewrite-db=db2->db3, which would confuse the slave when\nit loads the master\'\'s tables).\n\nUse of this statement is subject to the following conditions:\n\n\n --- It works only with MyISAM tables.\n\n --- It acquires a global read lock on the master while taking the snapshot,\nwhich prevents updates on the master during the load operation.\n\n\nIn the future, it is planned to make this statement work with\nInnoDB tables and to remove the need for a global read lock by using\nnon-blocking online backup.\n\nIf you are loading big tables, you might have to increase the values\nof net_read_timeout and net_write_timeout\non both your master and slave servers.\nSee also : [Server system variables].\n\nNote that LOAD DATA FROM MASTER does /not/ copy any\ntables from the mysql database.  This makes it easy to have\ndifferent users and privileges on the master and the slave.\n\nThe LOAD DATA FROM MASTER statement\nrequires the replication account that is used to connect to the master\nto have the RELOAD and SUPER privileges on the master and the\nSELECT privilege for all master tables you want to load. All\nmaster tables for which the user does not have the SELECT privilege are\nignored by LOAD DATA FROM MASTER. This is because the\nmaster hides them from the user: LOAD DATA FROM MASTER calls\nSHOW DATABASES to know the master databases to load, but\nSHOW DATABASES returns only databases for which the user has\nsome privilege.\nSee [SHOW DATABASES,  , SHOW DATABASES].\nOn the slave\'\'s side, the user that issues LOAD DATA FROM MASTER should\nhave grants to drop and create the databases and tables that are copied.\n', ', ');
INSERT INTO help_topic VALUES('88', 'RESET', '6', 'The RESET statement is used to clear the state of various server\noperations. It also acts as a stronger\nversion of the FLUSH statement.  See also : [FLUSH, , FLUSH].\n', 'RESET reset_option [, reset_option] ...', ');
INSERT INTO help_topic VALUES('89', 'GET_LOCK', '21', '   GET_LOCK(str,timeout)\nTries to obtain a lock with a name given by the string str, with a\ntimeout of timeout seconds.  Returns 1 if the lock was obtained\nsuccessfully, 0 if the attempt timed out (for example, because another\nclient has previously locked the name), or NULL if an error\noccurred (such as running out of memory or the thread was killed with\nmysqladmin kill).  If you have a lock obtained with GET_LOCK(),\nit is released when you execute\nRELEASE_LOCK(), execute a new GET_LOCK(), or your connection\nterminates (either normally or abnormally).\n\nThis function can be used to implement application locks or to\nsimulate record locks.  Names are locked on a server-wide basis.\nIf a name has been locked by one client, GET_LOCK() blocks\nany request by another client for a lock with the same name. This\nallows clients that agree on a given lock name to use the name to\nperform cooperative advisory locking.\n', 'mysql> SELECT GET_LOCK(\'\'lock1\'\',10);\n        -> 1\nmysql> SELECT IS_FREE_LOCK(\'\'lock2\'\');\n        -> 1\nmysql> SELECT GET_LOCK(\'\'lock2\'\',10);\n        -> 1\nmysql> SELECT RELEASE_LOCK(\'\'lock2\'\');\n        -> 1\nmysql> SELECT RELEASE_LOCK(\'\'lock1\'\');\n        -> NULL', ');
INSERT INTO help_topic VALUES('90', 'UCASE', '23', '   UCASE(str)\n\nUCASE() is a synonym for UPPER().\n', ', ');
INSERT INTO help_topic VALUES('91', 'MPOLYFROMWKB', '13', '   MPolyFromWKB(wkb[,srid])\n   MultiPolygonFromWKB(wkb[,srid])\nConstructs a MULTIPOLYGON value using its WKB representation and SRID.\n', ', ');
INSERT INTO help_topic VALUES('92', 'DO', '6', 'DO executes the expressions but doesn\'\'t return any results.  This is\nshorthand for SELECT expr, ..., but has the advantage that it\'\'s\nslightly faster when you don\'\'t care about the result.\n\nDO is useful mainly with functions that have side effects, such as\nRELEASE_LOCK().\n', 'DO expr [, expr] ...', ');
INSERT INTO help_topic VALUES('93', 'CURTIME', '14', '   CURTIME()\n\nReturns the current time as a value in \'\'HH:MM:SS\'\' or HHMMSS\nformat, depending on whether the function is used in a string or numeric\ncontext.\n', 'mysql> SELECT CURTIME();\n        -> \'\'23:50:26\'\'\nmysql> SELECT CURTIME() + 0;\n        -> 235026', ');
INSERT INTO help_topic VALUES('94', 'BIGINT', '1', '   BIGINT[(M)] [UNSIGNED] [ZEROFILL]\nA large integer. The signed range is -9223372036854775808 to\n9223372036854775807. The unsigned range is 0 to\n18446744073709551615.\n', ', ');
INSERT INTO help_topic VALUES('95', 'CHAR_LENGTH', '23', '   CHAR_LENGTH(str)\n\nReturns the length of the string str, measured in characters.\nA multi-byte character counts as a single character.\nThis means that for a string containing five two-byte characters,\nLENGTH() returns 10, whereas CHAR_LENGTH() returns\n5.\n', ', ');
INSERT INTO help_topic VALUES('96', 'SET', '6', 'SET sets different types of variables that affect the operation of the\nserver or your client. It can be used to assign values to user variables or\nsystem variables.\n', 'SET variable_assignment [, variable_assignment] ...\n\nvariable_assignment:\n      user_var_name = expr\n    | [GLOBAL | SESSION] system_var_name = expr\n    | @@[global. | session.]system_var_name = expr', ');
INSERT INTO help_topic VALUES('97', 'DATE', '1', 'A date.  The supported range is \'\'1000-01-01\'\' to \'\'9999-12-31\'\'.\nMySQL displays DATE values in \'\'YYYY-MM-DD\'\' format, but\nallows you to assign values to DATE columns using either strings or\nnumbers.\n', ', ');
INSERT INTO help_topic VALUES('98', 'CONV', '23', '   CONV(N,from_base,to_base)\nConverts numbers between different number bases.  Returns a string\nrepresentation of the number N, converted from base from_base\nto base to_base.  Returns NULL if any argument is NULL.\nThe argument N is interpreted as an integer, but may be specified as\nan integer or a string.  The minimum base is 2 and the maximum base is\n36.  If to_base is a negative number, N is regarded as a\nsigned number.  Otherwise, N is treated as unsigned.  CONV() works\nwith 64-bit precision.\n', 'mysql> SELECT CONV(\'\'a\'\',16,2);\n        -> \'\'1010\'\'\nmysql> SELECT CONV(\'\'6E\'\',18,8);\n        -> \'\'172\'\'\nmysql> SELECT CONV(-17,10,-18);\n        -> \'\'-H\'\'\nmysql> SELECT CONV(10+\'\'10\'\'+\'\'10\'\'+0xa,10,10);\n        -> \'\'40\'\', ');
INSERT INTO help_topic VALUES('99', 'EXTRACT', '14', '   EXTRACT(type FROM date)\n\nThe EXTRACT() function uses the same kinds of interval type\nspecifiers as DATE_ADD() or DATE_SUB(), but extracts parts\nfrom the date rather than performing date arithmetic.\n', 'mysql> SELECT EXTRACT(YEAR FROM \'\'1999-07-02\'\');\n       -> 1999\nmysql> SELECT EXTRACT(YEAR_MONTH FROM \'\'1999-07-02 01:02:03\'\');\n       -> 199907\nmysql> SELECT EXTRACT(DAY_MINUTE FROM \'\'1999-07-02 01:02:03\'\');\n       -> 20102\nmysql> SELECT EXTRACT(MICROSECOND\n    ->                FROM \'\'2003-01-02 10:30:00.00123\'\');\n        -> 123', ');
INSERT INTO help_topic VALUES('100', 'ENCRYPT', '17', '   ENCRYPT(str[,salt])\nEncrypt str using the Unix crypt() system call. The\nsalt argument should be a string with two characters.\n(As of MySQL 3.22.16, salt may be longer than two characters.)\nIf no salt argument is given, a random value is used.\n', 'mysql> SELECT ENCRYPT(\'\'hello\'\');\n        -> \'\'VxuFAJXVARROc\'\', ');
INSERT INTO help_topic VALUES('101', 'OLD_PASSWORD', '17', '   OLD_PASSWORD(str)\n\nOLD_PASSWORD() is available as of MySQL 4.1, when the implementation of\nPASSWORD() was changed to improve security. OLD_PASSWORD()\nreturns the value of the pre-4.1 implementation of PASSWORD().\n[Password hashing].\n\n   PASSWORD(str)\nCalculates and returns a password string from the plaintext password\nstr, or NULL if the argument was NULL. This is\nthe function that is used for encrypting MySQL passwords for storage\nin the Password column of the user grant table.\n', ', ');
INSERT INTO help_topic VALUES('102', 'FORMAT', '21', '   FORMAT(X,D)\nFormats the number X to a format like \'\'#,###,###.##\'\', rounded\nto D decimals, and returns the result as a string.\nIf D is 0, the result has no\ndecimal point or fractional part.\n', 'mysql> SELECT FORMAT(12332.123456, 4);\n        -> \'\'12,332.1235\'\'\nmysql> SELECT FORMAT(12332.1,4);\n        -> \'\'12,332.1000\'\'\nmysql> SELECT FORMAT(12332.2,0);\n        -> \'\'12,332\'\', ');
INSERT INTO help_topic VALUES('103', '||', '20', '   OR\n   ||\nLogical OR.\nWhen both operands are non-NULL, the result is 1 if any\noperand is non-zero, and 0 otherwise.  With a NULL operand,\nthe result is 1 if the other operand is non-zero, and NULL\notherwise.  If both operands are NULL, the result is NULL.\n', 'mysql> SELECT 1 || 1;\n        -> 1\nmysql> SELECT 1 || 0;\n        -> 1\nmysql> SELECT 0 || 0;\n        -> 0\nmysql> SELECT 0 || NULL;\n        -> NULL\nmysql> SELECT 1 || NULL;\n        -> 1', ');
INSERT INTO help_topic VALUES('104', 'CASE', '9', '   CASE value WHEN [compare-value] THEN result [WHEN [compare-value] THEN result ...] [ELSE result] END\n   CASE WHEN [condition] THEN result [WHEN [condition] THEN result ...] [ELSE result] END\n\nThe first version returns the result where\nvalue=compare-value. The second version returns the result for\nthe first condition that is true. If there was no matching result\nvalue, the result after ELSE is returned, or NULL if there is no\nELSE part.\n', 'mysql> SELECT CASE 1 WHEN 1 THEN \'\'one\'\'\n    ->     WHEN 2 THEN \'\'two\'\' ELSE \'\'more\'\' END;\n        -> \'\'one\'\'\nmysql> SELECT CASE WHEN 1>0 THEN \'\'true\'\' ELSE \'\'false\'\' END;\n        -> \'\'true\'\'\nmysql> SELECT CASE BINARY \'\'B\'\'\n    ->     WHEN \'\'a\'\' THEN 1 WHEN \'\'b\'\' THEN 2 END;\n        -> NULL', ');
INSERT INTO help_topic VALUES('105', 'BIT_LENGTH', '23', '   BIT_LENGTH(str)\nReturns the length of the string str in bits.\n', 'mysql> SELECT BIT_LENGTH(\'\'text\'\');\n        -> 32', ');
INSERT INTO help_topic VALUES('106', 'EXTERIORRING', '0', '   ExteriorRing(poly)\nReturns the exterior ring of the Polygon value poly\nas a LineString.\n', 'mysql> SET @poly =\n    -> \'\'Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))\'\';\nmysql> SELECT AsText(ExteriorRing(GeomFromText(@poly)));\n+-------------------------------------------+\n| AsText(ExteriorRing(GeomFromText(@poly))) |\n+-------------------------------------------+\n| LINESTRING(0 0,0 3,3 3,3 0,0 0)           |\n+-------------------------------------------+', ');
INSERT INTO help_topic VALUES('107', 'GEOMFROMWKB', '13', '   GeomFromWKB(wkb[,srid])\n   GeometryFromWKB(wkt[,srid])\nConstructs a geometry value of any type using its WKB representation and SRID.\n', ', ');
INSERT INTO help_topic VALUES('108', 'SHOW SLAVE HOSTS', '6', 'SHOW SLAVE HOSTS\n\nDisplays a list of slaves currently registered with the master.\nAny slave not started with the --report-host=slave_name\noption is not visible in that list.\n', ', ');
INSERT INTO help_topic VALUES('109', 'START TRANSACTION', '10', 'By default, MySQL runs with autocommit mode enabled. This means that\nas soon as you execute a statement that updates (modifies) a table,\nMySQL stores the update on disk.\n\nIf you are using transaction-safe tables (like InnoDB or BDB),\nyou can disable autocommit mode with the following statement:\n\nSET AUTOCOMMIT=0;\n\nAfter disabling autocommit mode by setting the AUTOCOMMIT variable to\nzero, you must use COMMIT to store your changes to disk or\nROLLBACK if you want to ignore the changes you have made since\nthe beginning of your transaction.\n\nIf you want to disable autocommit mode for a single series of\nstatements, you can use the START TRANSACTION statement:\n', 'START TRANSACTION;\nSELECT @A:=SUM(salary) FROM table1 WHERE type=1;\nUPDATE table2 SET summary=@A WHERE type=1;\nCOMMIT;', ');
INSERT INTO help_topic VALUES('110', 'BETWEEN AND', '26', '   expr BETWEEN min AND max\nIf expr is greater than or equal to min and expr is\nless than or equal to max, BETWEEN returns 1,\notherwise it returns 0.  This is equivalent to the expression\n(min <= expr AND expr <= max) if all the arguments are of the\nsame type. Otherwise type conversion takes place according to the rules\ndescribed at the beginning of this section, but applied to all the three\narguments. Note: Before MySQL\n4.0.5, arguments were converted to the type of expr instead.\n', 'mysql> SELECT 1 BETWEEN 2 AND 3;\n        -> 0\nmysql> SELECT \'\'b\'\' BETWEEN \'\'a\'\' AND \'\'c\'\';\n        -> 1\nmysql> SELECT 2 BETWEEN 2 AND \'\'3\'\';\n        -> 1\nmysql> SELECT 2 BETWEEN 2 AND \'\'x-3\'\';\n        -> 0', ');
INSERT INTO help_topic VALUES('111', 'MULTIPOLYGON', '2', '   MultiPolygon(poly1,poly2,...)\nConstructs a WKB MultiPolygon value from a set of WKB Polygon\narguments.\nIf any argument is not a WKB Polygon, the return value is NULL.\n', ', ');
INSERT INTO help_topic VALUES('112', 'TIME_FORMAT', '14', '   TIME_FORMAT(time,format)\nThis is used like the DATE_FORMAT() function, but the\nformat string may contain only those format specifiers that handle\nhours, minutes, and seconds.  Other specifiers produce a NULL value or\n0.\n', ', ');
INSERT INTO help_topic VALUES('113', 'LEFT', '23', '   LEFT(str,len)\nReturns the leftmost len characters from the string str.\n', 'mysql> SELECT LEFT(\'\'foobarbar\'\', 5);\n        -> \'\'fooba\'\', ');
INSERT INTO help_topic VALUES('114', 'FLUSH QUERY CACHE', '7', 'You can defragment the query cache to better utilize its memory\nwith the FLUSH QUERY CACHE statement.\nThe statement does not remove any queries from the cache.\n\nThe RESET QUERY CACHE statement removes all query results from the\nquery cache.  The FLUSH TABLES statement also does this.\n', ', ');
INSERT INTO help_topic VALUES('115', 'RAND', '4', '   RAND()\n   RAND(N)\nReturns a random floating-point value in the range from 0 to 1.0.\nIf an integer argument N is specified, it is used as the seed value\n(producing a repeatable sequence).\n', 'mysql> SELECT RAND();\n        -> 0.9233482386203\nmysql> SELECT RAND(20);\n        -> 0.15888261251047\nmysql> SELECT RAND(20);\n        -> 0.15888261251047\nmysql> SELECT RAND();\n        -> 0.63553050033332\nmysql> SELECT RAND();\n        -> 0.70100469486881', ');
INSERT INTO help_topic VALUES('116', 'RPAD', '23', '   RPAD(str,len,padstr)\nReturns the string str, right-padded with the string padstr\nto a length of len characters. If str is longer\nthan len, the return value is shortened to len characters.\n', 'mysql> SELECT RPAD(\'\'hi\'\',5,\'\'?\'\');\n        -> \'\'hi???\'\'\nmysql> SELECT RPAD(\'\'hi\'\',1,\'\'?\'\');\n        -> \'\'h\'\', ');
INSERT INTO help_topic VALUES('117', 'INSERT INTO', '6', 'INSERT inserts new rows into an existing table.  The INSERT ...\nVALUES and INSERT ... SET forms of the statement insert rows based\non explicitly specified values.  The INSERT ... SELECT form inserts\nrows selected from another table or tables.  The INSERT ... VALUES\nform with multiple value lists is supported in MySQL 3.22.5 or\nlater.  The INSERT ... SET syntax is supported in MySQL\n3.22.10 or later.\nINSERT ... SELECT is discussed further in\nSee also : [INSERT SELECT,  , INSERT SELECT].\n', 'INSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name [(col_name,...)]\n    VALUES ({expr | DEFAULT},...),(...),...\n    [ ON DUPLICATE KEY UPDATE col_name=expr, ... ]', ');
INSERT INTO help_topic VALUES('118', 'RESTORE', '7', '\nRESTORE TABLE tbl_name [, tbl_name] ... FROM \'\'/path/to/backup/directory\'\'\n\nRestores the table or tables from a backup that was made with BACKUP\nTABLE. Existing tables are not overwritten; if you try to restore over\nan existing table, you get an error.  Just as BACKUP TABLE,\nRESTORE TABLE currently works only for MyISAM tables.\nThe directory should be specified as a full pathname.\n\nThe backup for each table consists of its *.frm format file and\n*.MYD data file. The restore operation restores those files, then\nuses them to rebuild the *.MYI index file.  Restoring takes longer\nthan backing up due to the need to rebuild the indexes. The more indexes the\ntable has, the longer it takes.\n', ', ');
INSERT INTO help_topic VALUES('119', 'CREATE DATABASE', '28', 'CREATE DATABASE creates a database with the given name.  To use\nCREATE DATABASE, you need the CREATE privilege on the database.\n', 'CREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name\n    [create_specification [, create_specification] ...]\n\ncreate_specification:\n    [DEFAULT] CHARACTER SET charset_name\n  | [DEFAULT] COLLATE collation_name', ');
INSERT INTO help_topic VALUES('120', 'VAR_POP', '12', '   VAR_POP(expr)\nReturns the population standard variance of expr.  It considers rows\nas the whole population, not as a sample, so it has the number of rows as\nthe denominator.  This function was added in MySQL 5.0.3.  Before 5.0.3, you\ncan use VARIANCE(), which is equivalent but not standard SQL.\n', ', ');
INSERT INTO help_topic VALUES('121', 'ELT', '23', '   ELT(N,str1,str2,str3,...)\nReturns str1 if N = 1, str2 if N =\n2, and so on.  Returns NULL if N is less than 1\nor greater than the number of arguments.  ELT() is the complement of\nFIELD().\n', 'mysql> SELECT ELT(1, \'\'ej\'\', \'\'Heja\'\', \'\'hej\'\', \'\'foo\'\');\n        -> \'\'ej\'\'\nmysql> SELECT ELT(4, \'\'ej\'\', \'\'Heja\'\', \'\'hej\'\', \'\'foo\'\');\n        -> \'\'foo\'\', ');
INSERT INTO help_topic VALUES('122', 'ALTER VIEW', '28', 'This statement changes the definition of an existing view.\nThe syntax is similar to that for CREATE VIEW.\nSee also : [CREATE VIEW,  , CREATE VIEW].\nThis statement requires the CREATE VIEW and DELETE privileges\nfor the view, and some privilege for each column referred to in the\nSELECT statement.\n', 'ALTER [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]\n    VIEW view_name [(column_list)]\n    AS select_statement\n    [WITH [CASCADED | LOCAL] CHECK OPTION]', ');
INSERT INTO help_topic VALUES('123', '~', '27', '   ~\nInvert all bits.\n', 'mysql> SELECT 5 & ~1;\n        -> 4', ');
INSERT INTO help_topic VALUES('124', 'CONCAT_WS', '23', '   CONCAT_WS(separator,str1,str2,...)\n\nCONCAT_WS() stands for CONCAT With Separator and is a special form of\nCONCAT().  The first argument is the separator for the rest of the\narguments.\nThe separator is added between the strings to be concatenated.\nThe separator can be a string as can the rest of the\narguments. If the separator is NULL, the result is NULL.\nThe function skips any NULL values after the\nseparator argument.\n', 'mysql> SELECT CONCAT_WS(\'\',\'\',\'\'First name\'\',\'\'Second name\'\',\'\'Last Name\'\');\n        -> \'\'First name,Second name,Last Name\'\'\nmysql> SELECT CONCAT_WS(\'\',\'\',\'\'First name\'\',NULL,\'\'Last Name\'\');\n        -> \'\'First name,Last Name\'\', ');
INSERT INTO help_topic VALUES('125', 'ROW_COUNT', '25', '   ROW_COUNT()\n\nROW_COUNT() returns the number of rows updated, inserted, or deleted\nby the preceding statement.  This is the same as the row count that the\nmysql client displays and the value from the\nmysql_affected_rows() C API function.\n', 'mysql> INSERT INTO t VALUES(1),(2),(3);\nQuery OK, 3 rows affected (0.00 sec)\nRecords: 3  Duplicates: 0  Warnings: 0\n\nmysql> SELECT ROW_COUNT();\n+-------------+\n| ROW_COUNT() |\n+-------------+\n|           3 |\n+-------------+\n1 row in set (0.00 sec)\n\nmysql> DELETE FROM t WHERE i IN(1,2);\nQuery OK, 2 rows affected (0.00 sec)\n\nmysql> SELECT ROW_COUNT();\n+-------------+\n| ROW_COUNT() |\n+-------------+\n|           2 |\n+-------------+\n1 row in set (0.00 sec)', ');
INSERT INTO help_topic VALUES('126', 'ASIN', '4', '   ASIN(X)\nReturns the arc sine of X, that is, the value whose sine is\nX. Returns NULL if X is not in the range -1 to\n1.\n', 'mysql> SELECT ASIN(0.2);\n        -> 0.201358\nmysql> SELECT ASIN(\'\'foo\'\');\n        -> 0.000000', ');
INSERT INTO help_topic VALUES('127', 'FUNCTION', '22', 'A user-defined function (UDF) is a way to extend MySQL with a new\nfunction that works like a native (built-in) MySQL function such as\nABS() or CONCAT().\n\nfunction_name is the name that should be used in SQL statements to\ninvoke the function.  The RETURNS clause indicates the type of the\nfunction\'\'s return value.  shared_library_name is the basename of the\nshared object file that contains the code that implements the function. The\nfile must be located in a directory that is searched by your system\'\'s\ndynamic linker.\n\nTo create a function, you must have the INSERT and privilege for the\nmysql database.  To drop a function, you must have the DELETE\nprivilege for the mysql database.  This is because CREATE\nFUNCTION adds a row to the mysql.func system table that records the\nfunction\'\'s name, type, and shared library name, and DROP FUNCTION\ndeletes the function\'\'s row from that table.  If you do not have this table,\nyou should run the mysql_fix_privilege_tables script to create it.\nSee also : [Upgrading-grant-tables].\n', 'CREATE [AGGREGATE] FUNCTION function_name RETURNS {STRING|INTEGER|REAL}\n       SONAME shared_library_name\n\nDROP FUNCTION function_name', ');
INSERT INTO help_topic VALUES('128', 'SIGN', '4', '   SIGN(X)\nReturns the sign of the argument as -1, 0, or 1, depending\non whether X is negative, zero, or positive.\n', 'mysql> SELECT SIGN(-32);\n        -> -1\nmysql> SELECT SIGN(0);\n        -> 0\nmysql> SELECT SIGN(234);\n        -> 1', ');
INSERT INTO help_topic VALUES('129', 'SEC_TO_TIME', '14', '   SEC_TO_TIME(seconds)\nReturns the seconds argument, converted to hours, minutes, and seconds,\nas a value in \'\'HH:MM:SS\'\' or HHMMSS format, depending on whether\nthe function is used in a string or numeric context.\n', 'mysql> SELECT SEC_TO_TIME(2378);\n        -> \'\'00:39:38\'\'\nmysql> SELECT SEC_TO_TIME(2378) + 0;\n        -> 3938', ');
INSERT INTO help_topic VALUES('130', 'YEAR TYPE', '1', '   YEAR[(2|4)]\n\nA year in two-digit or four-digit format. The default is four-digit format.\nIn four-digit format, the\nallowable values are 1901 to 2155, and 0000.\nIn two-digit format, the allowable values are\n70 to 69, representing years from\n1970 to 2069.  MySQL displays YEAR values in\nYYYY format, but allows you to assign values to YEAR columns\nusing either strings or numbers. The YEAR type is unavailable prior\nto MySQL 3.22.\n', ', ');
INSERT INTO help_topic VALUES('131', 'FLOAT', '1', '   FLOAT(p) [UNSIGNED] [ZEROFILL]\n\nA floating-point number.  p represents the precision. It can be from\n0 to 24 for a single-precision floating-point number and from 25 to 53 for a\ndouble-precision floating-point number. These types are like the FLOAT\nand DOUBLE types described immediately following.  FLOAT(p)\nhas the same range as the corresponding FLOAT and DOUBLE\ntypes, but the display width and number of decimals are undefined.\n\nAs of MySQL 3.23, this is a true floating-point value.  In\nearlier MySQL versions, FLOAT(p) always has two decimals.\n\nThis syntax is provided for ODBC compatibility.\n\nUsing FLOAT might give you some unexpected problems because\nall calculations in MySQL are done with double precision.\nSee also : [No matching rows].\n\n   FLOAT[(M,D)] [UNSIGNED] [ZEROFILL]\n\nA small (single-precision) floating-point number.  Allowable values are\n-3.402823466E+38 to -1.175494351E-38, 0,\nand 1.175494351E-38 to 3.402823466E+38.  If\nUNSIGNED is specified, negative values are disallowed.  M\nis the display width and D is the number of decimals.  FLOAT\nwithout arguments or FLOAT(p) (where p is in the range from\n0 to 24) stands for a single-precision floating-point number.\n', ', ');
INSERT INTO help_topic VALUES('132', 'LOCATE', '23', '   LOCATE(substr,str)\n   LOCATE(substr,str,pos)\n\nThe first syntax\nreturns the position of the first occurrence of substring substr\nin string str.\nThe second syntax\nreturns the position of the first occurrence of substring substr in\nstring str, starting at position pos.\nReturns 0 if substr is not in str.\n', ', ');
INSERT INTO help_topic VALUES('133', 'CHARSET', '25', '   CHARSET(str)\nReturns the character set of the string argument.\n', 'mysql> SELECT CHARSET(\'\'abc\'\');\n        -> \'\'latin1\'\'\nmysql> SELECT CHARSET(CONVERT(\'\'abc\'\' USING utf8));\n        -> \'\'utf8\'\'\nmysql> SELECT CHARSET(USER());\n        -> \'\'utf8\'\', ');
INSERT INTO help_topic VALUES('134', 'PURGE MASTER LOGS BEFORE TO', '6', 'PURGE {MASTER | BINARY} LOGS TO \'\'log_name\'\'\nPURGE {MASTER | BINARY} LOGS BEFORE \'\'date\'\'\n\nDeletes all the binary logs listed in the log\nindex that are strictly prior to the specified log or date.\nThe logs also are removed from the list recorded in the log index file,\nso that the given log becomes the first.\n', ', ');
INSERT INTO help_topic VALUES('135', 'SUBDATE', '14', '   SUBDATE(date,INTERVAL expr type)\n   SUBDATE(expr,days)\n\nWhen invoked with the INTERVAL form of the second argument,\nSUBDATE() is a synonym for DATE_SUB().\nFor information on the INTERVAL argument, see the\ndiscussion for DATE_ADD().\n\nmysql> SELECT DATE_SUB(\'\'1998-01-02\'\', INTERVAL 31 DAY);\n        -> \'\'1997-12-02\'\'\nmysql> SELECT SUBDATE(\'\'1998-01-02\'\', INTERVAL 31 DAY);\n        -> \'\'1997-12-02\'\'\n\nAs of MySQL 4.1.1, the second syntax is allowed, where expr is a date\nor datetime expression and days is the number of days to be\nsubtracted from expr.\n\nmysql> SELECT SUBDATE(\'\'1998-01-02 12:00:00\'\', 31);\n        -> \'\'1997-12-02 12:00:00\'\'\n', ', ');
INSERT INTO help_topic VALUES('136', 'DAYOFYEAR', '14', '   DAYOFYEAR(date)\nReturns the day of the year for date, in the range 1 to\n366.\n', 'mysql> SELECT DAYOFYEAR(\'\'1998-02-03\'\');\n        -> 34', ');
INSERT INTO help_topic VALUES('137', '%', '4', '   MOD(N,M)\n   N % M\n   N MOD M\nModulo operation.\nReturns the remainder of N divided by M.\n', 'mysql> SELECT MOD(234, 10);\n        -> 4\nmysql> SELECT 253 % 7;\n        -> 1\nmysql> SELECT MOD(29,9);\n        -> 2\nmysql> SELECT 29 MOD 9;\n        -> 2', ');
INSERT INTO help_topic VALUES('138', 'LONGTEXT', '1', '   LONGTEXT\n\nA TEXT column with a maximum length of 4,294,967,295 or\n4GB (2^32 - 1) characters.  Up to MySQL\n3.23, the client/server protocol and MyISAM tables had a limit\nof 16MB per communication packet / table row. From MySQL 4.0, the maximum\nallowed length of LONGTEXT columns depends on the\nconfigured maximum packet size in the client/server protocol and available\nmemory.\n', ', ');
INSERT INTO help_topic VALUES('139', 'DISJOINT', '11', '   Disjoint(g1,g2)\nReturns 1 or 0 to indicate whether or not g1 is spatially disjoint\nfrom (does not intersect) g2.\n', ', ');
INSERT INTO help_topic VALUES('140', 'KILL', '6', 'Each connection to mysqld runs in a separate thread.  You can see\nwhich threads are running with the SHOW PROCESSLIST statement and kill\na thread with the KILL thread_id statement.\n\nAs of MySQL 5.0.0, KILL allows the optional CONNECTION or\nQUERY modifiers:\n\n\n --- KILL CONNECTION is the same as KILL with no modifier:\nIt terminates the connection associated with the given thread_id.\n\n --- KILL QUERY terminates the statement that the connection currently\nis executing, but leaves the connection intact.\n\n\nIf you have the PROCESS privilege, you can see all threads.\nIf you have the SUPER privilege, you can kill all threads and\nstatements.  Otherwise, you can see and kill only your own threads and\nstatements.\n\nYou can also use the mysqladmin processlist and mysqladmin kill\ncommands to examine and kill threads.\n\nNote: You currently cannot use KILL with the Embedded MySQL\nServer library, because the embedded server merely runs inside the threads\nof the host application, it does not create connection threads of its own.\n', 'KILL [CONNECTION | QUERY] thread_id', ');
INSERT INTO help_topic VALUES('141', 'ASTEXT', '3', '   AsText(g)\nConverts a value in internal geometry format to its WKT representation\nand returns the string result.\n', 'mysql> SELECT AsText(g) FROM geom;\n+-------------------------+\n| AsText(p1)              |\n+-------------------------+\n| POINT(1 1)              |\n| LINESTRING(0 0,1 1,2 2) |\n+-------------------------+', ');
INSERT INTO help_topic VALUES('142', 'LPAD', '23', '   LPAD(str,len,padstr)\nReturns the string str, left-padded with the string padstr\nto a length of len characters. If str is longer\nthan len, the return value is shortened to len characters.\n', 'mysql> SELECT LPAD(\'\'hi\'\',4,\'\'??\'\');\n        -> \'\'??hi\'\'\nmysql> SELECT LPAD(\'\'hi\'\',1,\'\'??\'\');\n        -> \'\'h\'\', ');
INSERT INTO help_topic VALUES('143', 'OVERLAPS', '11', '   Overlaps(g1,g2)\nReturns 1 or 0 to indicate whether or not g1 spatially overlaps\ng2.\nThe term /spatially overlaps/ is used if two\ngeometries intersect and their intersection results in a geometry of the\nsame dimension but not equal to either of the given geometries.\n', ', ');
INSERT INTO help_topic VALUES('144', 'NUMGEOMETRIES', '5', '   NumGeometries(gc)\nReturns the number of geometries in the GeometryCollection value\ngc.\n', 'mysql> SET @gc = \'\'GeometryCollection(Point(1 1),LineString(2 2, 3 3))\'\';\nmysql> SELECT NumGeometries(GeomFromText(@gc));\n+----------------------------------+\n| NumGeometries(GeomFromText(@gc)) |\n+----------------------------------+\n|                                2 |\n+----------------------------------+', ');
INSERT INTO help_topic VALUES('145', 'SET GLOBAL SQL_SLAVE_SKIP_COUNTER', '7', 'SET GLOBAL SQL_SLAVE_SKIP_COUNTER = n\n\nSkip the next n events from the master. This is\nuseful for recovering from replication stops caused by a statement.\n\nThis statement is valid only when the slave thread is not running.\nOtherwise, it produces an error.\n\nBefore MySQL 4.0, omit the GLOBAL keyword from the statement.\n', ', ');
INSERT INTO help_topic VALUES('146', 'MONTHNAME', '14', '   MONTHNAME(date)\nReturns the full name of the month for date.\n', 'mysql> SELECT MONTHNAME(\'\'1998-02-05\'\');\n        -> \'\'February\'\', ');
INSERT INTO help_topic VALUES('147', 'MBREQUAL', '8', '   MBREqual(g1,g2)\nReturns 1 or 0 to indicate whether or not the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 are the same.\n', ', ');
INSERT INTO help_topic VALUES('148', 'CHANGE MASTER TO', '6', '\nCHANGE MASTER TO master_def [, master_def] ...\n\nmaster_def:\n      MASTER_HOST = \'\'host_name\'\'\n    | MASTER_USER = \'\'user_name\'\'\n    | MASTER_PASSWORD = \'\'password\'\'\n    | MASTER_PORT = port_num\n    | MASTER_CONNECT_RETRY = count\n    | MASTER_LOG_FILE = \'\'master_log_name\'\'\n    | MASTER_LOG_POS = master_log_pos\n    | RELAY_LOG_FILE = \'\'relay_log_name\'\'\n    | RELAY_LOG_POS = relay_log_pos\n    | MASTER_SSL = {0|1}\n    | MASTER_SSL_CA = \'\'ca_file_name\'\'\n    | MASTER_SSL_CAPATH = \'\'ca_directory_name\'\'\n    | MASTER_SSL_CERT = \'\'cert_file_name\'\'\n    | MASTER_SSL_KEY = \'\'key_file_name\'\'\n    | MASTER_SSL_CIPHER = \'\'cipher_list\'\'\n\nChanges the parameters that the slave server uses for connecting to and\ncommunicating with the master server.\n\nMASTER_USER, MASTER_PASSWORD, MASTER_SSL,\nMASTER_SSL_CA, MASTER_SSL_CAPATH, MASTER_SSL_CERT,\nMASTER_SSL_KEY, and MASTER_SSL_CIPHER provide information for\nthe slave about how to connect to its master.\n\nThe relay log options (RELAY_LOG_FILE and RELAY_LOG_POS) are\navailable beginning with MySQL 4.0.\n\nThe SSL options\n(MASTER_SSL,\nMASTER_SSL_CA,\nMASTER_SSL_CAPATH,\nMASTER_SSL_CERT,\nMASTER_SSL_KEY,\nand\nMASTER_SSL_CIPHER)\nare available beginning with MySQL 4.1.1.\nYou can change these options even on slaves that are compiled without SSL\nsupport. They are saved to the *master.info file, but are ignored\nuntil you use a server that has SSL support enabled.\n\nIf you don\'\'t specify a given parameter, it keeps its old\nvalue, except as indicated in the following discussion. For example, if the password to connect to your MySQL master has\nchanged, you just need to issue these statements\nto tell the slave about the new password:\n\nmysql> STOP SLAVE; -- if replication was running\nmysql> CHANGE MASTER TO MASTER_PASSWORD=\'\'new3cret\'\';\nmysql> START SLAVE; -- if you want to restart replication\n\nThere is no need to specify the parameters that do\nnot change (host, port, user, and so forth).\n\nMASTER_HOST and MASTER_PORT are the hostname (or IP address) of\nthe master host and its TCP/IP port. Note that if MASTER_HOST is\nequal to localhost, then, like in other parts of MySQL, the port\nmay be ignored (if Unix socket files can be used, for example).\n\nIf you specify MASTER_HOST or MASTER_PORT,\nthe slave assumes that the master server is different than\nbefore (even if you specify a host or port value that is\nthe same as the current value.) In this case, the old values for the master\nbinary log name and position are considered no longer applicable, so if you\ndo not specify MASTER_LOG_FILE and MASTER_LOG_POS in the\nstatement, MASTER_LOG_FILE=\'\'\'\' and MASTER_LOG_POS=4 are\nsilently appended to it.\n\nMASTER_LOG_FILE and MASTER_LOG_POS are the coordinates\nat which the slave I/O thread should begin reading from the master the\nnext time the thread starts.\nIf you specify either of them, you can\'\'t specify RELAY_LOG_FILE or\nRELAY_LOG_POS.\nIf neither of MASTER_LOG_FILE or MASTER_LOG_POS are\nspecified, the slave uses the last coordinates of the /slave SQL thread/\nbefore CHANGE MASTER was issued. This ensures that\nreplication has no discontinuity, even if the slave SQL thread was late\ncompared to the slave I/O thread, when you just want to change, say, the\npassword to use. This safe behavior was introduced starting from MySQL\n4.0.17 and 4.1.1. (Before these versions, the coordinates used were\nthe last coordinates of the slave I/O thread before CHANGE MASTER\nwas issued. This caused the SQL thread to possibly lose some events\nfrom the master, thus breaking replication.)\n\nCHANGE MASTER /deletes all relay log files/ and starts\na new one, unless you specify RELAY_LOG_FILE or\nRELAY_LOG_POS. In that case, relay logs are kept;\nas of MySQL 4.1.1 the relay_log_purge global variable\nis set silently to 0.\n\nCHANGE MASTER TO updates the contents of the *master.info and\n*relay-log.info files.\n\nCHANGE MASTER is useful for setting up a slave when you have\nthe snapshot of the master and have recorded the log and the offset\ncorresponding to it.  After loading the snapshot into the slave, you\ncan run CHANGE MASTER TO MASTER_LOG_FILE=\'\'log_name_on_master\'\',\nMASTER_LOG_POS=log_offset_on_master on the slave.\n\nExamples:\n\nmysql> CHANGE MASTER TO\n    ->     MASTER_HOST=\'\'master2.mycompany.com\'\',\n    ->     MASTER_USER=\'\'replication\'\',\n    ->     MASTER_PASSWORD=\'\'bigs3cret\'\',\n    ->     MASTER_PORT=3306,\n    ->     MASTER_LOG_FILE=\'\'master2-bin.001\'\',\n    ->     MASTER_LOG_POS=4,\n    ->     MASTER_CONNECT_RETRY=10;\n\nmysql> CHANGE MASTER TO\n    ->     RELAY_LOG_FILE=\'\'slave-relay-bin.006\'\',\n    ->     RELAY_LOG_POS=4025;\n', ', ');
INSERT INTO help_topic VALUES('149', 'DROP DATABASE', '28', 'DROP DATABASE drops all tables in the database and deletes the\ndatabase.  Be /very/ careful with this statement!\nTo use DROP DATABASE, you need the DROP privilege on the\ndatabase.\n\nIn MySQL 3.22 or later, you can use the keywords IF EXISTS\nto prevent an error from occurring if the database doesn\'\'t exist.\n\nDROP SCHEMA can be used as of MySQL 5.0.2.\n', 'DROP {DATABASE | SCHEMA} [IF EXISTS] db_name', ');
INSERT INTO help_topic VALUES('150', 'TIMESTAMP FUNCTION', '14', '   TIMESTAMP(expr)\n   TIMESTAMP(expr,expr2)\n\nWith one argument, returns the date or datetime expression expr\nas a datetime value.\nWith two arguments, adds the time expression expr2 to the\ndate or datetime expression expr and returns a datetime value.\n', 'mysql> SELECT TIMESTAMP(\'\'2003-12-31\'\');\n        -> \'\'2003-12-31 00:00:00\'\'\nmysql> SELECT TIMESTAMP(\'\'2003-12-31 12:00:00\'\',\'\'12:00:00\'\');\n        -> \'\'2004-01-01 00:00:00\'\', ');
INSERT INTO help_topic VALUES('151', 'CHARACTER_LENGTH', '23', '   CHARACTER_LENGTH(str)\n\nCHARACTER_LENGTH() is a synonym for CHAR_LENGTH().\n', ', ');
INSERT INTO help_topic VALUES('152', 'CREATE VIEW  ALGORITHM MERGE TEMPTABLE WITH CHECK OPTION', '28', ', 'CREATE [OR REPLACE] [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]\n    VIEW view_name [(column_list)]\n    AS select_statement\n    [WITH [CASCADED | LOCAL] CHECK OPTION]', ');
INSERT INTO help_topic VALUES('153', 'TIMESTAMPDIFF FUNCTION', '14', ', 'mysql> SELECT TIMESTAMPDIFF(MONTH,\'\'2003-02-01\'\',\'\'2003-05-01\'\');\n        -> 3\nmysql> SELECT TIMESTAMPDIFF(YEAR,\'\'2002-05-01\'\',\'\'2001-01-01\'\');\n        -> -1', ');
INSERT INTO help_topic VALUES('154', 'CRC32', '4', '   CRC32(expr)\nComputes a cyclic redundancy check value and returns a 32-bit unsigned value.\nThe result is NULL if the argument is NULL.\nThe argument is expected be a string and is treated as one if it is not.\n', 'mysql> SELECT CRC32(\'\'MySQL\'\');\n        -> 3259397556', ');
INSERT INTO help_topic VALUES('155', 'XOR', '20', '   XOR\nLogical XOR.\nReturns NULL if either operand is NULL.\nFor non-NULL operands, evaluates to 1 if an odd number\nof operands is non-zero,\notherwise 0 is returned.\n', 'mysql> SELECT 1 XOR 1;\n        -> 0\nmysql> SELECT 1 XOR 0;\n        -> 1\nmysql> SELECT 1 XOR NULL;\n        -> NULL\nmysql> SELECT 1 XOR 1 XOR 1;\n        -> 1', ');
INSERT INTO help_topic VALUES('156', 'STARTPOINT', '18', '   StartPoint(ls)\nReturns the Point that is the start point of the LineString value\nls.\n', 'mysql> SET @ls = \'\'LineString(1 1,2 2,3 3)\'\';\nmysql> SELECT AsText(StartPoint(GeomFromText(@ls)));\n+---------------------------------------+\n| AsText(StartPoint(GeomFromText(@ls))) |\n+---------------------------------------+\n| POINT(1 1)                            |\n+---------------------------------------+', ');
INSERT INTO help_topic VALUES('157', 'MPOLYFROMTEXT', '3', '   MPolyFromText(wkt[,srid])\n   MultiPolygonFromText(wkt[,srid])\nConstructs a MULTIPOLYGON value using its WKT representation and SRID.\n', ', ');
INSERT INTO help_topic VALUES('158', 'GRANT', '7', 'The GRANT and REVOKE statements allow system administrators to\ncreate MySQL user accounts and to grant rights to and revoke them from\naccounts.  GRANT and REVOKE are implemented in MySQL 3.22.11\nor later. For earlier MySQL versions, these statements do nothing.\n\nMySQL account information is stored in the tables of the mysql\ndatabase. This database and the access control system are discussed\nextensively in [MySQL Database Administration], which you should consult\nfor additional details.\n\nIf the grant tables contain privilege records that contain mixed-case\ndatabase or table names and the lower_case_table_names system\nvariable is set, REVOKE cannot be used to revoke the privileges. It\nwill be necessary to manipulate the grant tables directly. (GRANT\nwill not create such records when lower_case_table_names is set,\nbut such records might have been created prior to setting the variable.)\n\nPrivileges can be granted at several levels:\n\n   Global level\nGlobal privileges apply to all databases on a given server. These privileges\nare stored in the mysql.user table.\nGRANT ALL ON *.* and\nREVOKE ALL ON *.* grant and revoke only global privileges.\n\n   Database level\nDatabase privileges apply to all objects in a given database. These privileges\nare stored in the mysql.db and mysql.host tables.\nGRANT ALL ON db_name.* and\nREVOKE ALL ON db_name.* grant and revoke only database privileges.\n\n   Table level\nTable privileges apply to all columns in a given table. These privileges are\nstored in the mysql.tables_priv table.\nGRANT ALL ON db_name.tbl_name and\nREVOKE ALL ON db_name.tbl_name grant and revoke only table privileges.\n\n   Column level\nColumn privileges apply to single columns in a given table. These privileges are\nstored in the mysql.columns_priv table.\nWhen using REVOKE, you must specify the same columns that were granted.\n\n   Routine level\nThe CREATE ROUTINE, ALTER ROUTINE, EXECUTE, and\nGRANT privileges apply to stored routines. They can be granted at the\nglobal and database levels. Also, except for CREATE ROUTINE, these\nprivileges can be granted at the routine level for individual routines and\nare stored in the mysql.procs_priv table.\n\n  \n', 'GRANT priv_type [(column_list)] [, priv_type [(column_list)]] ...\n    ON {tbl_name | * | *.* | db_name.*}\n    TO user [IDENTIFIED BY [PASSWORD] \'\'password\'\']\n        [, user [IDENTIFIED BY [PASSWORD] \'\'password\'\']] ...\n    [REQUIRE\n        NONE |\n        [{SSL| X509}]\n        [CIPHER \'\'cipher\'\' [AND]]\n        [ISSUER \'\'issuer\'\' [AND]]\n        [SUBJECT \'\'subject\'\']]\n    [WITH [GRANT OPTION | MAX_QUERIES_PER_HOUR count |\n                          MAX_UPDATES_PER_HOUR count |\n                          MAX_CONNECTIONS_PER_HOUR count |\n                          MAX_USER_CONNECTIONS count]]', ');
INSERT INTO help_topic VALUES('159', 'MBRINTERSECTS', '8', '   MBRIntersects(g1,g2)\nReturns 1 or 0 to indicate whether or not the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 intersect.\n', ', ');
INSERT INTO help_topic VALUES('160', 'BIT_OR', '12', '   BIT_OR(expr)\nReturns the bitwise OR of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n', ', ');
INSERT INTO help_topic VALUES('161', 'YEARWEEK', '14', '   YEARWEEK(date)\n   YEARWEEK(date,start)\nReturns year and week for a date.  The start argument works exactly\nlike the start argument to WEEK().  The year in the\nresult may be\ndifferent from the year in the date argument for the first and the last\nweek of the year.\n', 'mysql> SELECT YEARWEEK(\'\'1987-01-01\'\');\n        -> 198653', ');
INSERT INTO help_topic VALUES('162', 'NOT BETWEEN', '26', '   expr NOT BETWEEN min AND max\nThis is the same as NOT (expr BETWEEN min AND max).\n', ', ');
INSERT INTO help_topic VALUES('163', 'LOG10', '4', '   LOG10(X)\nReturns the base-10 logarithm of X.\n', 'mysql> SELECT LOG10(2);\n        -> 0.301030\nmysql> SELECT LOG10(100);\n        -> 2.000000\nmysql> SELECT LOG10(-100);\n        -> NULL', ');
INSERT INTO help_topic VALUES('164', 'SQRT', '4', '   SQRT(X)\nReturns the non-negative square root of X.\n', 'mysql> SELECT SQRT(4);\n        -> 2.000000\nmysql> SELECT SQRT(20);\n        -> 4.472136', ');
INSERT INTO help_topic VALUES('165', 'GEOMETRYN', '5', '   GeometryN(gc,n)\nReturns the n-th geometry in the GeometryCollection value\ngc.  Geometry numbers begin at 1.\n', 'mysql> SET @gc = \'\'GeometryCollection(Point(1 1),LineString(2 2, 3 3))\'\';\nmysql> SELECT AsText(GeometryN(GeomFromText(@gc),1));\n+----------------------------------------+\n| AsText(GeometryN(GeomFromText(@gc),1)) |\n+----------------------------------------+\n| POINT(1 1)                             |\n+----------------------------------------+', ');
INSERT INTO help_topic VALUES('166', 'CREATE INDEX', '28', 'In MySQL 3.22 or later, CREATE INDEX is mapped to an\nALTER TABLE statement to create indexes.\nSee also : [ALTER TABLE, , ALTER TABLE].\nThe CREATE INDEX statement doesn\'\'t do anything prior\nto MySQL 3.22.\n', 'CREATE [UNIQUE|FULLTEXT|SPATIAL] INDEX index_name\n    [USING index_type]\n    ON tbl_name (index_col_name,...)\n\nindex_col_name:\n    col_name [(length)] [ASC | DESC]', ');
INSERT INTO help_topic VALUES('167', 'ALTER DATABASE', '28', '\nALTER DATABASE allows you to change the overall characteristics of a\ndatabase.  These characteristics are stored in the *db.opt file in the\ndatabase directory.\nTo use ALTER DATABASE, you need the ALTER privilege on the\ndatabase.\n', 'ALTER {DATABASE | SCHEMA} [db_name]\n    alter_specification [, alter_specification] ...\n\nalter_specification:\n    [DEFAULT] CHARACTER SET charset_name\n  | [DEFAULT] COLLATE collation_name', ');
INSERT INTO help_topic VALUES('168', '<<', '27', 'Shifts a longlong (BIGINT) number to the left.\n   <<\n', 'mysql> SELECT 1 << 2;\n        -> 4', ');
INSERT INTO help_topic VALUES('169', 'MD5', '17', '   MD5(str)\nCalculates an MD5 128-bit checksum for the string. The value is returned\nas a binary string of 32 hex digits,\nor NULL if the argument was NULL.\nThe return value can, for example, be used as a hash key.\n', 'mysql> SELECT MD5(\'\'testing\'\');\n        -> \'\'ae2b1fca515949e5d54fb22b8ed95575\'\', ');
INSERT INTO help_topic VALUES('170', '<', '26', '   <\nLess than:\n', 'mysql> SELECT 2 < 2;\n        -> 0', ');
INSERT INTO help_topic VALUES('171', 'UNIX_TIMESTAMP', '14', '   UNIX_TIMESTAMP()\n   UNIX_TIMESTAMP(date)\nIf called with no argument, returns a Unix timestamp (seconds since\n\'\'1970-01-01 00:00:00\'\' GMT) as an unsigned integer. If\nUNIX_TIMESTAMP() is called with a date argument, it\nreturns the value of the argument as seconds since \'\'1970-01-01\n00:00:00\'\' GMT.  date may be a DATE string, a\nDATETIME string, a TIMESTAMP, or a number in the format\nYYMMDD or YYYYMMDD in local time.\n', 'mysql> SELECT UNIX_TIMESTAMP();\n        -> 882226357\nmysql> SELECT UNIX_TIMESTAMP(\'\'1997-10-04 22:23:00\'\');\n        -> 875996580', ');
INSERT INTO help_topic VALUES('172', 'DAYOFMONTH', '14', '   DAYOFMONTH(date)\nReturns the day of the month for date, in the range 1 to\n31.\n', 'mysql> SELECT DAYOFMONTH(\'\'1998-02-03\'\');\n        -> 3', ');
INSERT INTO help_topic VALUES('173', 'ASCII', '23', '   ASCII(str)\nReturns the numeric value of the leftmost character of the string\nstr. Returns 0 if str is the empty string.  Returns\nNULL if str is NULL.\nASCII() works for characters with numeric values from 0 to\n255.\n', 'mysql> SELECT ASCII(\'\'2\'\');\n        -> 50\nmysql> SELECT ASCII(2);\n        -> 50\nmysql> SELECT ASCII(\'\'dx\'\');\n        -> 100', ');
INSERT INTO help_topic VALUES('174', 'DIV', '4', 'Integer division.\nSimilar to FLOOR() but safe with BIGINT values.\n', 'mysql> SELECT 5 DIV 2;\n        -> 2', ');
INSERT INTO help_topic VALUES('175', 'RENAME USER', '7', 'The RENAME USER statement renames existing MySQL accounts.\nTo use it, you must have the global CREATE USER privilege or\nUPDATE privilege on mysql database.\nAn error occurs if any old account does not exist or any new\naccount exists.  The old_user and new_user values are given the\nsame way as for the GRANT statement.\n', 'RENAME USER old_user TO new_user\n    [, old_user TO new_user] ...', ');
INSERT INTO help_topic VALUES('176', 'SHOW SLAVE STATUS', '7', 'SHOW SLAVE STATUS\n\nProvides status information on\nessential parameters of the slave threads. If you issue this statement using\nthe\nmysql client, you can use a \\G statement terminator rather than\nsemicolon to get a more readable vertical layout:\n\nmysql> SHOW SLAVE STATUS\\G\n*************************** 1. row ***************************\n       Slave_IO_State: Waiting for master to send event\n          Master_Host: localhost\n          Master_User: root\n          Master_Port: 3306\n        Connect_Retry: 3\n      Master_Log_File: gbichot-bin.005\n  Read_Master_Log_Pos: 79\n       Relay_Log_File: gbichot-relay-bin.005\n        Relay_Log_Pos: 548\nRelay_Master_Log_File: gbichot-bin.005\n     Slave_IO_Running: Yes\n    Slave_SQL_Running: Yes\n      Replicate_Do_DB:\n  Replicate_Ignore_DB:\n           Last_Errno: 0\n           Last_Error:\n         Skip_Counter: 0\n  Exec_Master_Log_Pos: 79\n      Relay_Log_Space: 552\n      Until_Condition: None\n       Until_Log_File:\n        Until_Log_Pos: 0\n   Master_SSL_Allowed: No\n   Master_SSL_CA_File:\n   Master_SSL_CA_Path:\n      Master_SSL_Cert:\n    Master_SSL_Cipher:\n       Master_SSL_Key:\nSeconds_Behind_Master: 8\n', ', ');
INSERT INTO help_topic VALUES('177', 'GEOMETRY', '24', 'MySQL provides a standard way of creating spatial columns for\ngeometry types, for example, with CREATE TABLE or ALTER TABLE.\nCurrently, spatial columns are supported only for MyISAM tables.\n', 'mysql> CREATE TABLE geom (g GEOMETRY);\nQuery OK, 0 rows affected (0.02 sec)', ');
INSERT INTO help_topic VALUES('178', 'NUMPOINTS', '18', '   NumPoints(ls)\nReturns the number of points in the LineString value ls.\n', 'mysql> SET @ls = \'\'LineString(1 1,2 2,3 3)\'\';\nmysql> SELECT NumPoints(GeomFromText(@ls));\n+------------------------------+\n| NumPoints(GeomFromText(@ls)) |\n+------------------------------+\n|                            3 |\n+------------------------------+', ');
INSERT INTO help_topic VALUES('179', '&', '27', '   &\nBitwise AND:\n', 'mysql> SELECT 29 & 15;\n        -> 13', ');
INSERT INTO help_topic VALUES('180', 'LOCALTIMESTAMP', '14', '   LOCALTIMESTAMP\n   LOCALTIMESTAMP()\n\nLOCALTIMESTAMP and LOCALTIMESTAMP() are synonyms for\nNOW().\n', ', ');
INSERT INTO help_topic VALUES('181', 'ADDDATE', '14', '   ADDDATE(date,INTERVAL expr type)\n   ADDDATE(expr,days)\n\nWhen invoked with the INTERVAL form of the second argument,\nADDDATE() is a synonym for DATE_ADD().  The related\nfunction SUBDATE() is a synonym for DATE_SUB().\nFor information on the INTERVAL argument, see the\ndiscussion for DATE_ADD().\n\nmysql> SELECT DATE_ADD(\'\'1998-01-02\'\', INTERVAL 31 DAY);\n        -> \'\'1998-02-02\'\'\nmysql> SELECT ADDDATE(\'\'1998-01-02\'\', INTERVAL 31 DAY);\n        -> \'\'1998-02-02\'\'\n\nAs of MySQL 4.1.1, the second syntax is allowed, where expr is a date\nor datetime expression and days is the number of days to be added to\nexpr.\n\nmysql> SELECT ADDDATE(\'\'1998-01-02\'\', 31);\n        -> \'\'1998-02-02\'\'\n', ', ');
INSERT INTO help_topic VALUES('182', 'SMALLINT', '1', '   SMALLINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA small integer. The signed range is -32768 to 32767. The\nunsigned range is 0 to 65535.\n', ', ');
INSERT INTO help_topic VALUES('183', 'ORD', '23', '   ORD(str)\nIf the leftmost character of the string str is a multi-byte character,\nreturns the code for that character, calculated from the numeric values\nof its constituent bytes using this formula:\n\n  (1st byte code)\n+ (2nd byte code * 256)\n+ (3rd byte code * 256^2) ...\n\nIf the leftmost character is not a multi-byte character, ORD()\nreturns the same value as the ASCII() function.\n', 'mysql> SELECT ORD(\'\'2\'\');\n        -> 50', ');
INSERT INTO help_topic VALUES('184', 'ENVELOPE', '19', '   Envelope(g)\nReturns the Minimum Bounding Rectangle (MBR) for the geometry value g.\nThe result is returned as a Polygon value.\n\nmysql> SELECT AsText(Envelope(GeomFromText(\'\'LineString(1 1,2 2)\'\')));\n+-------------------------------------------------------+\n| AsText(Envelope(GeomFromText(\'\'LineString(1 1,2 2)\'\'))) |\n+-------------------------------------------------------+\n| POLYGON((1 1,2 1,2 2,1 2,1 1))                        |\n+-------------------------------------------------------+\n\nThe polygon is defined by the corner points of the bounding box:\n\nPOLYGON((MINX MINY, MAXX MINY, MAXX MAXY, MINX MAXY, MINX MINY))\n', ', ');
INSERT INTO help_topic VALUES('185', 'IS_FREE_LOCK', '21', '   IS_FREE_LOCK(str)\nChecks whether the lock named str is free to use (that is, not locked).\nReturns 1 if the lock is free (no one is using the lock),\n0 if the lock is in use, and\nNULL on errors (such as incorrect arguments).\n', ', ');
INSERT INTO help_topic VALUES('186', 'SHOW BINLOG', '6', 'SHOW BINLOG EVENTS\n   [IN \'\'log_name\'\'] [FROM pos] [LIMIT [offset,] row_count]\n\nShows the events in the binary log.\nIf you do not specify \'\'log_name\'\', the first binary log is displayed.\n', ', ');
INSERT INTO help_topic VALUES('187', 'TOUCHES', '11', '   Touches(g1,g2)\nReturns 1 or 0 to indicate whether or not g1 spatially touches\ng2. Two geometries /spatially touch/ if the interiors of\nthe geometries do not intersect, but the boundary of one of the geometries\nintersects either the boundary or the interior of the other.\n', ', ');
INSERT INTO help_topic VALUES('188', 'TIMESTAMPADD FUNCTION', '14', ', 'mysql> SELECT TIMESTAMPADD(MINUTE,1,\'\'2003-01-02\'\');\n        -> \'\'2003-01-02 00:01:00\'\'\nmysql> SELECT TIMESTAMPADD(WEEK,1,\'\'2003-01-02\'\');\n        -> \'\'2003-01-09\'\', ');
INSERT INTO help_topic VALUES('189', 'INET_ATON', '21', '   INET_ATON(expr)\nGiven the dotted-quad representation of a network address as a string,\nreturns an integer that represents the numeric value of the address.\nAddresses may be 4- or 8-byte addresses.\n', 'mysql> SELECT INET_ATON(\'\'209.207.224.40\'\');\n        -> 3520061480', ');
INSERT INTO help_topic VALUES('190', 'AUTO_INCREMENT', '1', 'The AUTO_INCREMENT attribute can be used to generate a unique\nidentity for new rows:\n', 'CREATE TABLE animals (\n             id MEDIUMINT NOT NULL AUTO_INCREMENT,\n             name CHAR(30) NOT NULL,\n             PRIMARY KEY (id)\n             );\nINSERT INTO animals (name) VALUES (\'\'dog\'\'),(\'\'cat\'\'),(\'\'penguin\'\'),\n                                  (\'\'lax\'\'),(\'\'whale\'\'),(\'\'ostrich\'\');\nSELECT * FROM animals;', ');
INSERT INTO help_topic VALUES('191', 'UNCOMPRESS', '23', '   UNCOMPRESS(string_to_uncompress)\nUncompresses a string compressed by the COMPRESS() function.\nIf the argument is not a compressed value, the result is NULL.\nThis function requires MySQL to have been compiled with a compression library\nsuch as zlib. Otherwise, the return value is always NULL.\n', 'mysql> SELECT UNCOMPRESS(COMPRESS(\'\'any string\'\'));\n        -> \'\'any string\'\'\nmysql> SELECT UNCOMPRESS(\'\'any string\'\');\n        -> NULL', ');
INSERT INTO help_topic VALUES('192', 'ISSIMPLE', '19', '   IsSimple(g)\n\nCurrently, this function is a placeholder and should not be used.\nIf implemented, its behavior will be as described in the next paragraph.\n\nReturns 1 if the geometry value g has no anomalous geometric points,\nsuch as self-intersection or self-tangency. IsSimple() returns 0 if the\nargument is not simple, and -1 if it is NULL.\n\nThe description of each instantiable geometric class given earlier in\nthe chapter includes the specific conditions that cause an instance of\nthat class to be classified as not simple.\n', ', ');
INSERT INTO help_topic VALUES('193', '- BINARY', '4', '   -\nSubtraction:\n', 'mysql> SELECT 3-5;\n        -> -2', ');
INSERT INTO help_topic VALUES('194', 'GEOMCOLLFROMTEXT', '3', '   GeomCollFromText(wkt[,srid])\n   GeometryCollectionFromText(wkt[,srid])\nConstructs a GEOMETRYCOLLECTION value using its WKT representation and SRID.\n', ', ');
INSERT INTO help_topic VALUES('195', 'WKT DEFINITION', '3', 'The Well-Known Text (WKT) representation of Geometry is designed to\nexchange geometry data in ASCII form.\n', ', ');
INSERT INTO help_topic VALUES('196', 'CURRENT_TIME', '14', '   CURRENT_TIME\n   CURRENT_TIME()\n\nCURRENT_TIME and CURRENT_TIME() are synonyms for\nCURTIME().\n', ', ');
INSERT INTO help_topic VALUES('197', 'REVOKE', '7', ', 'REVOKE priv_type [(column_list)] [, priv_type [(column_list)]] ...\n    ON {tbl_name | * | *.* | db_name.*}\n    FROM user [, user] ...\n\nREVOKE ALL PRIVILEGES, GRANT OPTION FROM user [, user] ...', ');
INSERT INTO help_topic VALUES('198', 'LAST_INSERT_ID', '25', '   LAST_INSERT_ID()\n   LAST_INSERT_ID(expr)\nReturns the last automatically generated value that was inserted into\nan AUTO_INCREMENT column.\n', 'mysql> SELECT LAST_INSERT_ID();\n        -> 195', ');
INSERT INTO help_topic VALUES('199', 'LAST_DAY', '14', '   LAST_DAY(date)\n\nTakes a date or datetime value and returns the corresponding value for the\nlast day of the month.  Returns NULL if the argument is invalid.\n', 'mysql> SELECT LAST_DAY(\'\'2003-02-05\'\');\n        -> \'\'2003-02-28\'\'\nmysql> SELECT LAST_DAY(\'\'2004-02-05\'\');\n        -> \'\'2004-02-29\'\'\nmysql> SELECT LAST_DAY(\'\'2004-01-01 01:01:01\'\');\n        -> \'\'2004-01-31\'\'\nmysql> SELECT LAST_DAY(\'\'2003-03-32\'\');\n        -> NULL', ');
INSERT INTO help_topic VALUES('200', 'MEDIUMINT', '1', '   MEDIUMINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA medium-size integer. The signed range is -8388608 to\n8388607. The unsigned range is 0 to 16777215.\n', ', ');
INSERT INTO help_topic VALUES('201', 'FLOOR', '4', '   FLOOR(X)\nReturns the largest integer value not greater than X.\n', 'mysql> SELECT FLOOR(1.23);\n        -> 1\nmysql> SELECT FLOOR(-1.23);\n        -> -2', ');
INSERT INTO help_topic VALUES('202', 'RTRIM', '23', '   RTRIM(str)\nReturns the string str with trailing space characters removed.\n', 'mysql> SELECT RTRIM(\'\'barbar   \'\');\n        -> \'\'barbar\'\', ');
INSERT INTO help_topic VALUES('203', 'DEGREES', '4', '   DEGREES(X)\nReturns the argument X, converted from radians to degrees.\n', 'mysql> SELECT DEGREES(PI());\n        -> 180.000000', ');
INSERT INTO help_topic VALUES('204', 'EXPLAIN', '6', 'The EXPLAIN statement can be used either as a synonym for\nDESCRIBE or as a way to obtain information about how MySQL executes\na SELECT statement:\n\n --- The EXPLAIN tbl_name syntax is synonymous with DESCRIBE tbl_name\nor\nSHOW COLUMNS FROM tbl_name.\n --- When you precede a SELECT statement with the keyword EXPLAIN,\nMySQL explains how it would process the SELECT, providing\ninformation about how tables are joined and in which order.\n', 'EXPLAIN tbl_name', ');
INSERT INTO help_topic VALUES('205', 'VARCHAR', '1', '   [NATIONAL] VARCHAR(M) [BINARY]\n\nA variable-length string.  M represents the maximum column length.\nThe range of M is 1 to 255 before MySQL 4.0.2, 0 to 255 as of MySQL\n4.0.2, and 0 to 65,535 as of MySQL 5.0.3. (The maximum actual length of a\nVARCHAR in MySQL 5.0 is determined by the maximum row size and the\ncharacter set you use. The maximum effective length is 65,532 bytes.)\n\nNote: Before 5.0.3, trailing spaces were removed when\nVARCHAR values were stored, which differs from the standard SQL\nspecification.\n\nFrom MySQL 4.1.0 to 5.0.2, a VARCHAR column with a length\nspecification greater than 255 is converted to the smallest TEXT\ntype that can hold values of the given length.  For example,\nVARCHAR(500) is converted to TEXT, and\nVARCHAR(200000) is converted to MEDIUMTEXT.  This is a\ncompatibility feature.  However, this conversion affects trailing-space\nremoval.\n\nVARCHAR is shorthand for CHARACTER VARYING.\n\nAs of MySQL 4.1.2, the BINARY attribute is shorthand for specifying\nthe binary collation of the column character set.  Sorting and comparison is\nbased on numeric character values.  Before 4.1.2, BINARY attribute\ncauses the column to be treated as a binary string.  Sorting and comparison\nis based on numeric byte values.\n\nStarting from MySQL 5.0.3, VARCHAR is stored with a one-byte or\ntwo-byte length prefix + data.  The length prefix is two bytes if the\nVARCHAR column is declared with a length greater than 255.\n', ', ');
INSERT INTO help_topic VALUES('206', 'UNHEX', '23', '   UNHEX(str)\n\nDoes the opposite of HEX(str). That is, it interprets each pair of\nhexadecimal digits in the argument as a number and converts it to the\ncharacter represented by the number. The resulting characters are returned as\na binary string.\n', 'mysql> SELECT UNHEX(\'\'4D7953514C\'\');\n        -> \'\'MySQL\'\'\nmysql> SELECT 0x4D7953514C;\n        -> \'\'MySQL\'\'\nmysql> SELECT UNHEX(HEX(\'\'string\'\'));\n        -> \'\'string\'\'\nmysql> SELECT HEX(UNHEX(\'\'1267\'\'));\n        -> \'\'1267\'\', ');
INSERT INTO help_topic VALUES('207', '- UNARY', '4', '   -\nUnary minus. Changes the sign of the argument.\n', 'mysql> SELECT - 2;\n        -> -2', ');
INSERT INTO help_topic VALUES('208', 'COS', '4', '   COS(X)\nReturns the cosine of X, where X is given in radians.\n', 'mysql> SELECT COS(PI());\n        -> -1.000000', ');
INSERT INTO help_topic VALUES('209', 'DATE FUNCTION', '14', '   DATE(expr)\n\nExtracts the date part of the date or datetime expression expr.\n', 'mysql> SELECT DATE(\'\'2003-12-31 01:02:03\'\');\n        -> \'\'2003-12-31\'\', ');
INSERT INTO help_topic VALUES('210', 'RESET MASTER', '6', 'RESET MASTER\n\nDeletes all binary logs listed in the index file,\nresets the binary log index file to be empty, and creates a new binary log\nfile.\n\nThis statement was named FLUSH MASTER before MySQL 3.23.26.\n', ', ');
INSERT INTO help_topic VALUES('211', 'TAN', '4', '   TAN(X)\nReturns the tangent of X, where X is given in radians.\n', 'mysql> SELECT TAN(PI()+1);\n        -> 1.557408', ');
INSERT INTO help_topic VALUES('212', 'PI', '4', '   PI()\nReturns the value of PI. The default number of decimals displayed is five, but\nMySQL internally uses the full double-precision value for PI.\n', 'mysql> SELECT PI();\n        -> 3.141593\nmysql> SELECT PI()+0.000000000000000000;\n        -> 3.141592653589793116', ');
INSERT INTO help_topic VALUES('213', 'WEEKOFYEAR', '14', '   WEEKOFYEAR(date)\n\nReturns the calendar week of the date as a number in the\nrange from 1 to 53. It is a compatibility function\nthat is equivalent to WEEK(date,3).\n', 'mysql> SELECT WEEKOFYEAR(\'\'1998-02-20\'\');\n        -> 8', ');
INSERT INTO help_topic VALUES('214', '/', '4', '   /\nDivision:\n', 'mysql> SELECT 3/5;\n        -> 0.60', ');
INSERT INTO help_topic VALUES('215', 'STDDEV_SAMP', '12', '   STDDEV_SAMP(expr)\nReturns the sample standard deviation of expr (the square root of\nVAR_SAMP().  This function was added in MySQL 5.0.3.\n', ', ');
INSERT INTO help_topic VALUES('216', 'MLINEFROMWKB', '13', '   MLineFromWKB(wkb[,srid])\n   MultiLineStringFromWKB(wkb[,srid])\nConstructs a MULTILINESTRING value using its WKB representation and SRID.\n', ', ');
INSERT INTO help_topic VALUES('217', 'UNCOMPRESSED_LENGTH', '23', '   UNCOMPRESSED_LENGTH(compressed_string)\nReturns the length of a compressed string before compression.\n', 'mysql> SELECT UNCOMPRESSED_LENGTH(COMPRESS(REPEAT(\'\'a\'\',30)));\n        -> 30', ');
INSERT INTO help_topic VALUES('218', 'LOG2', '4', '   LOG2(X)\nReturns the base-2 logarithm of X.\n', 'mysql> SELECT LOG2(65536);\n        -> 16.000000\nmysql> SELECT LOG2(-100);\n        -> NULL', ');
INSERT INTO help_topic VALUES('219', 'SUBTIME', '14', '   SUBTIME(expr,expr2)\n\n\nSUBTIME() subtracts expr2 from expr and returns the result.\nexpr is a time or datetime expression, and expr2 is a time\nexpression.\n', 'mysql> SELECT SUBTIME(\'\'1997-12-31 23:59:59.999999\'\',\n    ->                \'\'1 1:1:1.000002\'\');\n        -> \'\'1997-12-30 22:58:58.999997\'\'\nmysql> SELECT SUBTIME(\'\'01:00:00.999999\'\', \'\'02:00:00.999998\'\');\n        -> \'\'-00:59:59.999999\'\', ');
INSERT INTO help_topic VALUES('220', 'DROP TABLE', '28', 'DROP TABLE removes one or more tables. You must have the DROP\nprivilege for each table. All table data and the table\ndefinition are /removed/, so /be careful/ with this statement!\n\nIn MySQL 3.22 or later, you can use the keywords IF EXISTS\nto prevent an error from occurring for tables that don\'\'t exist.  As of\nMySQL 4.1, a NOTE is generated for each non-existent table when\nusing IF EXISTS.\nSee also : [SHOW WARNINGS,  , SHOW WARNINGS].\n\nRESTRICT and CASCADE are allowed to make porting easier.\nFor the moment, they do nothing.\n\nNote: DROP TABLE automatically commits the current\nactive transaction, unless you are using MySQL 4.1 or higher and the\nTEMPORARY keyword.\n', 'DROP [TEMPORARY] TABLE [IF EXISTS]\n    tbl_name [, tbl_name] ...\n    [RESTRICT | CASCADE]', ');
INSERT INTO help_topic VALUES('221', 'DUAL', '22', 'SELECT ... FROM DUAL is an alias for SELECT ....\n(To be compatible with some other databases).\n', ', ');
INSERT INTO help_topic VALUES('222', 'INSTR', '23', '   INSTR(str,substr)\nReturns the position of the first occurrence of substring substr in\nstring str. This is the same as the two-argument form of\nLOCATE(), except that the arguments are swapped.\n', 'mysql> SELECT INSTR(\'\'foobarbar\'\', \'\'bar\'\');\n        -> 4\nmysql> SELECT INSTR(\'\'xbar\'\', \'\'foobar\'\');\n        -> 0', ');
INSERT INTO help_topic VALUES('223', 'NOW', '14', '   NOW()\n\nReturns the current date and time as a value in \'\'YYYY-MM-DD HH:MM:SS\'\'\nor YYYYMMDDHHMMSS format, depending on whether the function is used in\na string or numeric context.\n', 'mysql> SELECT NOW();\n        -> \'\'1997-12-15 23:50:26\'\'\nmysql> SELECT NOW() + 0;\n        -> 19971215235026', ');
INSERT INTO help_topic VALUES('224', '>=', '26', '   >=\nGreater than or equal:\n', 'mysql> SELECT 2 >= 2;\n        -> 1', ');
INSERT INTO help_topic VALUES('225', 'EXP', '4', '   EXP(X)\nReturns the value of e (the base of natural logarithms) raised to\nthe power of X.\n', 'mysql> SELECT EXP(2);\n        -> 7.389056\nmysql> SELECT EXP(-2);\n        -> 0.135335', ');
INSERT INTO help_topic VALUES('226', 'SHA', '17', '   SHA1(str)\n   SHA(str)\nCalculates an SHA1 160-bit checksum for the string, as described in\nRFC 3174 (Secure Hash Algorithm). The value is returned as a string of 40 hex\ndigits, or NULL if the argument was NULL.\nOne of the possible uses for this function is as a hash key. You can\nalso use it as a cryptographically safe function for storing passwords.\n', 'mysql> SELECT SHA1(\'\'abc\'\');\n        -> \'\'a9993e364706816aba3e25717850c26c9cd0d89d\'\', ');
INSERT INTO help_topic VALUES('227', 'LONGBLOB', '1', '   LONGBLOB\n\nA BLOB column with a maximum length of 4,294,967,295 or\n4GB (2^32 - 1) bytes.  Up to MySQL\n3.23, the client/server protocol and MyISAM tables had a limit\nof 16MB per communication packet / table row. From MySQL 4.0, the maximum\nallowed length of LONGBLOB columns depends on the\nconfigured maximum packet size in the client/server protocol and available\nmemory.\n', ', ');
INSERT INTO help_topic VALUES('228', 'POINTN', '18', '   PointN(ls,n)\nReturns the n-th point in the Linestring value ls.\nPoint numbers begin at 1.\n', 'mysql> SET @ls = \'\'LineString(1 1,2 2,3 3)\'\';\nmysql> SELECT AsText(PointN(GeomFromText(@ls),2));\n+-------------------------------------+\n| AsText(PointN(GeomFromText(@ls),2)) |\n+-------------------------------------+\n| POINT(2 2)                          |\n+-------------------------------------+', ');
INSERT INTO help_topic VALUES('229', 'SUM', '12', '   SUM([DISTINCT] expr)\nReturns the sum of expr.  If the return set has no rows,\nSUM() returns NULL.\nThe DISTINCT keyword can be used as of MySQL 5.0.0 to sum only the\ndistinct values of expr.\n', ', ');
INSERT INTO help_topic VALUES('230', 'OCT', '23', '   OCT(N)\nReturns a string representation of the octal value of N, where\nN is a longlong (BIGINT)number.  This is equivalent to\nCONV(N,10,8).\nReturns NULL if N is NULL.\n', 'mysql> SELECT OCT(12);\n        -> \'\'14\'\', ');
INSERT INTO help_topic VALUES('231', 'SYSDATE', '14', '   SYSDATE()\n\nSYSDATE() is a synonym for NOW().\n', ', ');
INSERT INTO help_topic VALUES('232', 'ASBINARY', '13', '   AsBinary(g)\nConverts a value in internal geometry format to its WKB representation\nand returns the binary result.\n', 'SELECT AsBinary(g) FROM geom;', ');
INSERT INTO help_topic VALUES('233', 'MAKEDATE', '14', '   MAKEDATE(year,dayofyear)\n\nReturns a date, given year and day-of-year values.\ndayofyear must be greater than 0 or the result is NULL.\n', 'mysql> SELECT MAKEDATE(2001,31), MAKEDATE(2001,32);\n        -> \'\'2001-01-31\'\', \'\'2001-02-01\'\'\nmysql> SELECT MAKEDATE(2001,365), MAKEDATE(2004,365);\n        -> \'\'2001-12-31\'\', \'\'2004-12-30\'\'\nmysql> SELECT MAKEDATE(2001,0);\n        -> NULL', ');
INSERT INTO help_topic VALUES('234', 'BINARY OPERATOR', '23', '   BINARY\nThe BINARY operator casts the string following it to a binary string.\nThis is an easy way to force a column comparison to be done byte by byte\nrather than character by character. This causes the comparison to be\ncase sensitive even\nif the column isn\'\'t defined as BINARY or BLOB.\nBINARY also causes trailing spaces to be significant.\n', 'mysql> SELECT \'\'a\'\' = \'\'A\'\';\n        -> 1\nmysql> SELECT BINARY \'\'a\'\' = \'\'A\'\';\n        -> 0\nmysql> SELECT \'\'a\'\' = \'\'a \'\';\n        -> 1\nmysql> SELECT BINARY \'\'a\'\' = \'\'a \'\';\n        -> 0', ');
INSERT INTO help_topic VALUES('235', 'MBROVERLAPS', '8', '   MBROverlaps(g1,g2)\nReturns 1 or 0 to indicate whether or not the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 overlap.\n', ', ');
INSERT INTO help_topic VALUES('236', 'SOUNDEX', '23', '   SOUNDEX(str)\nReturns a soundex string from str. Two strings that sound almost the\nsame should have identical soundex strings. A standard soundex string\nis four characters long, but the SOUNDEX() function returns an\narbitrarily long string. You can use SUBSTRING() on the result to get\na standard soundex string.  All non-alphabetic characters are ignored in the\ngiven string. All international alphabetic characters outside the A-Z range\nare treated as vowels.\n', 'mysql> SELECT SOUNDEX(\'\'Hello\'\');\n        -> \'\'H400\'\'\nmysql> SELECT SOUNDEX(\'\'Quadratically\'\');\n        -> \'\'Q36324\'\', ');
INSERT INTO help_topic VALUES('237', 'SHOW MASTER LOGS', '6', 'SHOW MASTER LOGS\nSHOW BINARY LOGS\n\nLists the binary log files on the server. This statement is used as part of\nthe procedure described in [PURGE MASTER LOGS,  , PURGE MASTER LOGS]\nfor determining which logs can be purged.\n', ', ');
INSERT INTO help_topic VALUES('238', 'MBRTOUCHES', '8', '   MBRTouches(g1,g2)\nReturns 1 or 0 to indicate whether or not the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 touch.\n', ', ');
INSERT INTO help_topic VALUES('239', 'INSERT SELECT', '6', 'INSERT [LOW_PRIORITY] [IGNORE] [INTO] tbl_name [(column_list)]\n    SELECT ...\n\nWith INSERT ... SELECT, you can quickly insert many rows\ninto a table from one or many tables.\n', 'INSERT INTO tbl_temp2 (fld_id)\n    SELECT tbl_temp1.fld_order_id\n    FROM tbl_temp1 WHERE tbl_temp1.fld_order_id > 100;', ');
INSERT INTO help_topic VALUES('240', 'VARBINARY', '1', '   VARBINARY(M)\n\nThe VARBINARY type is similar to the VARCHAR type, but stores\nbinary byte strings rather than non-binary character strings.\n\nThis type was added in MySQL 4.1.2.\n', ', ');
INSERT INTO help_topic VALUES('241', 'LOAD INDEX', '6', 'The LOAD INDEX INTO CACHE statement preloads a table index into the\nkey cache to which it has been assigned by an explicit CACHE INDEX\nstatement, or into the default key cache otherwise.  LOAD INDEX INTO\nCACHE is used only for MyISAM tables.\n\nThe IGNORE LEAVES modifier causes only blocks for the non-leaf\nnodes of the index to be preloaded.\n', 'LOAD INDEX INTO CACHE\n  tbl_index_list [, tbl_index_list] ...\n\ntbl_index_list:\n  tbl_name\n    [[INDEX|KEY] (index_name[, index_name] ...)]\n    [IGNORE LEAVES]', ');
INSERT INTO help_topic VALUES('242', 'UNION', '6', 'UNION is used to combine the result from many SELECT\nstatements into one result set.  UNION is available from MySQL 4.0.0\non.\n\nSelected columns listed in corresponding positions of each SELECT\nstatement should have the same type. (For example, the first column selected\nby the first statement should have the same type as the first column selected\nby the other statements.) The column names used in\nthe first SELECT statement are used as the column names for the\nresults returned.\n', 'SELECT ...\nUNION [ALL | DISTINCT]\nSELECT ...\n  [UNION [ALL | DISTINCT]\n   SELECT ...]', ');
INSERT INTO help_topic VALUES('243', 'TO_DAYS', '14', '   TO_DAYS(date)\nGiven a date date, returns a daynumber (the number of days since year\n0).\n', 'mysql> SELECT TO_DAYS(950501);\n        -> 728779\nmysql> SELECT TO_DAYS(\'\'1997-10-07\'\');\n        -> 729669', ');
INSERT INTO help_topic VALUES('244', 'NOT REGEXP', '23', '   expr NOT REGEXP pat\n   expr NOT RLIKE pat\n\nThis is the same as NOT (expr REGEXP pat).\n', ', ');
INSERT INTO help_topic VALUES('245', 'NOT IN', '26', '   expr NOT IN (value,...)\nThis is the same as NOT (expr IN (value,...)).\n', ', ');
INSERT INTO help_topic VALUES('246', '!', '20', '   NOT\n   !\nLogical NOT.\nEvaluates to 1 if the operand is 0,\nto 0 if the operand is non-zero,\nand NOT NULL returns NULL.\n', 'mysql> SELECT NOT 10;\n        -> 0\nmysql> SELECT NOT 0;\n        -> 1\nmysql> SELECT NOT NULL;\n        -> NULL\nmysql> SELECT ! (1+1);\n        -> 0\nmysql> SELECT ! 1+1;\n        -> 1', ');
INSERT INTO help_topic VALUES('247', 'TEXT TYPE', '1', '   TEXT\n\nA TEXT column with a maximum length of 65,535\n(2^16 - 1) characters.\n', ', ');
INSERT INTO help_topic VALUES('248', 'DOUBLE', '1', '   DOUBLE[(M,D)] [UNSIGNED] [ZEROFILL]\n\nA normal-size (double-precision) floating-point number.\nAllowable values are -1.7976931348623157E+308 to\n-2.2250738585072014E-308, 0, and\n2.2250738585072014E-308 to 1.7976931348623157E+308.  If\nUNSIGNED is specified, negative values are disallowed.\nM is the display width and D is the number of decimals.\nDOUBLE without arguments or FLOAT(p) (where\np is in the\nrange from 25 to 53) stands for a double-precision floating-point number.\n\n   DOUBLE PRECISION[(M,D)] [UNSIGNED] [ZEROFILL]\n   REAL[(M,D)] [UNSIGNED] [ZEROFILL]\n\nThese are synonyms for DOUBLE.\nException: If the server SQL mode includes the REAL_AS_FLOAT option,\nREAL is a synonym for FLOAT rather than DOUBLE.\n', ', ');
INSERT INTO help_topic VALUES('249', 'TIME', '1', '   TIME\n\nA time.  The range is \'\'-838:59:59\'\' to \'\'838:59:59\'\'.\nMySQL displays TIME values in \'\'HH:MM:SS\'\' format, but\nallows you to assign values to TIME columns using either strings or\nnumbers.\n', ', ');
INSERT INTO help_topic VALUES('250', '&&', '20', '   AND\n   &&\nLogical AND.\nEvaluates to 1 if all operands are non-zero and not NULL,\nto 0 if one or more operands are 0,\notherwise NULL is returned.\n', 'mysql> SELECT 1 && 1;\n        -> 1\nmysql> SELECT 1 && 0;\n        -> 0\nmysql> SELECT 1 && NULL;\n        -> NULL\nmysql> SELECT 0 && NULL;\n        -> 0\nmysql> SELECT NULL && 0;\n        -> 0', ');
INSERT INTO help_topic VALUES('251', 'X', '16', '   X(p)\nReturns the X-coordinate value for the point p as a double-precision\nnumber.\n', 'mysql> SELECT X(GeomFromText(\'\'Point(56.7 53.34)\'\'));\n+--------------------------------------+\n| X(GeomFromText(\'\'Point(56.7 53.34)\'\')) |\n+--------------------------------------+\n|                                 56.7 |\n+--------------------------------------+', ');
INSERT INTO help_topic VALUES('252', 'NUMERIC', '1', '   DECIMAL[(M[,D])] [UNSIGNED] [ZEROFILL]\n\n\nFor MySQL 5.0.3 and above:\n\nA packed ``exact\'\'\'\' fixed-point number. M is the total number of\ndigits and D is the number of decimals.  The decimal point and\n(for negative numbers) the \'\'-\'\' sign are not counted in M.\nIf D is 0, values have no\ndecimal point or fractional part.  The maximum number of digits\n(M) for DECIMAL is 64. The maximum number of supported\ndecimals (D) is 30.  If UNSIGNED is specified, negative\nvalues are disallowed.\n\nIf D is omitted, the default is 0.  If M is omitted, the\ndefault is 10.\n\nAll basic calculations (+, -, *, /) with DECIMAL columns are\ndone with a precision of 64 decimal digits.\n\nBefore MySQL 5.0.3:\n\nAn unpacked fixed-point number.  Behaves like a CHAR column;\n``unpacked\'\'\'\' means the number is stored as a string, using one character for\neach digit of the value.  M is the total number of digits and\nD is the number of decimals.  The decimal point and (for negative\nnumbers) the \'\'-\'\' sign are not counted in M, although space for\nthem is reserved. If D is 0, values have no decimal point or\nfractional part.  The maximum range of DECIMAL values is the same as\nfor DOUBLE, but the actual range for a given DECIMAL column\nmay be constrained by the choice of M and D.  If\nUNSIGNED is specified, negative values are disallowed.\n\nIf D is omitted, the default is 0.  If M is omitted, the\ndefault is 10.\n\nBefore MySQL 3.23:\n\nAs just described, with the exception that the M value must be large\nenough to include the space needed for the sign and the decimal point\ncharacters.\n\n   DEC[(M[,D])] [UNSIGNED] [ZEROFILL]\n   NUMERIC[(M[,D])] [UNSIGNED] [ZEROFILL]\n   FIXED[(M[,D])] [UNSIGNED] [ZEROFILL]\n\nThese are synonyms for DECIMAL.  The FIXED synonym was added\nin MySQL 4.1.0 for compatibility with other servers.\n', ', ');
INSERT INTO help_topic VALUES('253', 'FOUND_ROWS', '25', '\nA SELECT statement may include a LIMIT clause to restrict the\nnumber of rows the server returns to the client.\nIn some cases, it is desirable to know how many rows the statement would have\nreturned without the LIMIT, but without running the statement again.\nTo get this row count, include a SQL_CALC_FOUND_ROWS option in the\nSELECT statement, then invoke FOUND_ROWS() afterward:\n', 'mysql> SELECT SQL_CALC_FOUND_ROWS * FROM tbl_name\n    -> WHERE id > 100 LIMIT 10;\nmysql> SELECT FOUND_ROWS();', ');
INSERT INTO help_topic VALUES('254', 'SYSTEM_USER', '25', '   SYSTEM_USER()\n\nSYSTEM_USER() is a synonym for USER().\n', ', ');
INSERT INTO help_topic VALUES('255', 'CROSSES', '11', '   Crosses(g1,g2)\nReturns 1 if g1 spatially crosses g2.\nReturns NULL if g1 is a Polygon or a MultiPolygon,\nor if g2 is a Point or a MultiPoint.\nOtherwise, returns 0.\n\nThe term /spatially crosses/ denotes a spatial relation between two given\ngeometries that has the following properties:\n\n\n --- The two geometries intersect\n\n --- Their intersection results in a geometry that has\na dimension that is one less than the maximum dimension of the two given\ngeometries\n\n --- Their intersection is not equal to either of the two given geometries\n', ', ');
INSERT INTO help_topic VALUES('256', 'TRUNCATE TABLE', '6', 'TRUNCATE TABLE empties a table completely.\nLogically, this is equivalent to a DELETE statement that deletes all\nrows, but there are practical differences under some circumstances.\n\nFor InnoDB before version 5.0.3, TRUNCATE TABLE is\nmapped to DELETE, so there is no difference.  Starting with\nMySQL/InnoDB-5.0.3, fast TRUNCATE TABLE is available.  The\noperation is still mapped to DELETE if there are foreign\nkey constraints that reference the table.\n\nFor other storage engines, TRUNCATE TABLE differs from\nDELETE FROM in the following ways from MySQL 4.0 and up:\n\n --- Truncate operations drop and re-create the table, which is much faster\nthan deleting rows one by one.\n --- Truncate operations are not transaction-safe; you get an error if\nyou have an active transaction or an active table lock.\n --- The number of deleted rows is not returned.\n --- As long as the table definition file *tbl_name.frm is\nvalid, the table can be re-created as an empty table with TRUNCATE\nTABLE, even if the data or index files have become corrupted.\n --- The table handler does not remember the last used AUTO_INCREMENT\nvalue, but starts counting from the beginning.  This is true even for\nMyISAM and InnoDB, which normally does not reuse sequence values.\n\nIn MySQL 3.23, TRUNCATE TABLE is mapped to\nCOMMIT; DELETE FROM tbl_name, so it behaves like DELETE.\nSee also : [DELETE,  , DELETE].\n\nTRUNCATE TABLE is an Oracle SQL extension.\nThis statement was added in MySQL 3.23.28, although from 3.23.28\nto 3.23.32, the keyword TABLE must be omitted.\n', 'TRUNCATE TABLE tbl_name', ');
INSERT INTO help_topic VALUES('257', 'CURRENT_DATE', '14', '   CURRENT_DATE\n   CURRENT_DATE()\n\nCURRENT_DATE and CURRENT_DATE() are synonyms for\nCURDATE().\n', ', ');
INSERT INTO help_topic VALUES('258', 'BIT_XOR', '12', '   BIT_XOR(expr)\nReturns the bitwise XOR of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n', ', ');
INSERT INTO help_topic VALUES('259', 'AREA', '0', '   Area(poly)\nReturns as a double-precision number the area of the Polygon value\npoly, as measured in its spatial reference system.\n', 'mysql> SET @poly = \'\'Polygon((0 0,0 3,3 0,0 0),(1 1,1 2,2 1,1 1))\'\';\nmysql> SELECT Area(GeomFromText(@poly));\n+---------------------------+\n| Area(GeomFromText(@poly)) |\n+---------------------------+\n|                         4 |\n+---------------------------+', ');
INSERT INTO help_topic VALUES('260', 'START SLAVE', '7', 'START SLAVE [thread_type [, thread_type] ... ]\nSTART SLAVE [SQL_THREAD] UNTIL\n    MASTER_LOG_FILE = \'\'log_name\'\', MASTER_LOG_POS = log_pos\nSTART SLAVE [SQL_THREAD] UNTIL\n    RELAY_LOG_FILE = \'\'log_name\'\', RELAY_LOG_POS = log_pos\n\nthread_type: IO_THREAD | SQL_THREAD\n\nSTART SLAVE with no options starts both of the slave threads.\nThe I/O thread reads queries from the master server and stores them in the\nrelay log.  The SQL thread reads the relay log and executes the\nqueries.\nSTART SLAVE requires the SUPER privilege.\n\nIf START SLAVE succeeds in starting the slave threads, it\nreturns without any error. However, even in that case, it might be that the slave\nthreads start and then later stop (for example, because they don\'\'t manage to\nconnect to the master or read its binary logs, or some other\nproblem). START SLAVE does not warn you about this. You must\ncheck your slave\'\'s error log for error messages generated by\nthe slave threads, or check that they are running fine with SHOW\nSLAVE STATUS.\n', ', ');
INSERT INTO help_topic VALUES('261', 'FLUSH', '6', 'You should use the FLUSH statement if you want to clear some of the\ninternal caches MySQL uses.  To execute FLUSH, you must have\nthe RELOAD privilege.\n', 'FLUSH [LOCAL | NO_WRITE_TO_BINLOG] flush_option [, flush_option] ...', ');
INSERT INTO help_topic VALUES('262', 'DESCRIBE', '7', '{DESCRIBE | DESC} tbl_name [col_name | wild]\n\nDESCRIBE provides information about the columns in a table.  It is a\nshortcut for SHOW COLUMNS FROM. As of MySQL 5.0.1, these statements\nalso display information for views.\n', ', ');
INSERT INTO help_topic VALUES('263', 'STDDEV_POP', '12', '   STDDEV_POP(expr)\nReturns the population standard deviation of expr (the square root of\nVAR_POP()).  This function was added in MySQL 5.0.3.  Before 5.0.3,\nyou can use STD() or STDDEV(), which are equivalent but not\nstandard SQL.\n', ', ');
INSERT INTO help_topic VALUES('264', 'SUBSTRING', '23', '   SUBSTRING(str,pos)\n   SUBSTRING(str FROM pos)\n   SUBSTRING(str,pos,len)\n   SUBSTRING(str FROM pos FOR len)\n\nThe forms without a len argument\nreturn a substring from string str starting at position pos.\nThe forms with a len argument\nreturn a substring len characters long from string str,\nstarting at position pos.\nThe forms that use FROM are standard SQL syntax.\n', 'mysql> SELECT SUBSTRING(\'\'Quadratically\'\',5);\n        -> \'\'ratically\'\'\nmysql> SELECT SUBSTRING(\'\'foobarbar\'\' FROM 4);\n        -> \'\'barbar\'\'\nmysql> SELECT SUBSTRING(\'\'Quadratically\'\',5,6);\n        -> \'\'ratica\'\', ');
INSERT INTO help_topic VALUES('265', 'ISEMPTY', '19', '   IsEmpty(g)\nReturns 1 if the geometry value g is the empty geometry, 0 if it is not\nempty, and -1 if the argument is NULL.\nIf the geometry is empty, it represents the empty point set.\n', ', ');
INSERT INTO help_topic VALUES('266', 'LTRIM', '23', '   LTRIM(str)\nReturns the string str with leading space characters removed.\n', 'mysql> SELECT LTRIM(\'\'  barbar\'\');\n        -> \'\'barbar\'\', ');
INSERT INTO help_topic VALUES('267', 'REPAIR', '7', 'REPAIR TABLE repairs a possibly corrupted table.\nBy default,\nit has the same effect as myisamchk --recover tbl_name.\nREPAIR TABLE works only on MyISAM tables.\n', 'REPAIR [LOCAL | NO_WRITE_TO_BINLOG] TABLE\n    tbl_name [, tbl_name] ... [QUICK] [EXTENDED] [USE_FRM]', ');
INSERT INTO help_topic VALUES('268', 'INTERSECTS', '11', '   Intersects(g1,g2)\nReturns 1 or 0 to indicate whether or not g1 spatially intersects\ng2.\n', ', ');
INSERT INTO help_topic VALUES('269', 'MBRDISJOINT', '8', '   MBRDisjoint(g1,g2)\nReturns 1 or 0 to indicate whether or not the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 are disjoint (do not intersect).\n', ', ');
INSERT INTO help_topic VALUES('270', 'SUBSTRING_INDEX', '23', '   SUBSTRING_INDEX(str,delim,count)\nReturns the substring from string str before count\noccurrences of the delimiter delim.\nIf count is positive, everything to the left of the final delimiter\n(counting from the left) is returned.\nIf count is negative, everything to the right of the final delimiter\n(counting from the right) is returned.\n', 'mysql> SELECT SUBSTRING_INDEX(\'\'www.mysql.com\'\', \'\'.\'\', 2);\n        -> \'\'www.mysql\'\'\nmysql> SELECT SUBSTRING_INDEX(\'\'www.mysql.com\'\', \'\'.\'\', -2);\n        -> \'\'mysql.com\'\', ');
INSERT INTO help_topic VALUES('271', 'ENCODE', '17', '   ENCODE(str,pass_str)\nEncrypt str using pass_str as the password.\nTo decrypt the result, use DECODE().\n\nThe result is a binary string of the same length as str.\nIf you want to save it in a column, use a BLOB column type.\n', ', ');
INSERT INTO help_topic VALUES('272', 'TRUNCATE', '4', '   TRUNCATE(X,D)\nReturns the number X, truncated to D decimals.  If D\nis 0, the result has no decimal point or fractional part.\nD can be negative to truncate (make zero) D digits left of the\ndecimal point of the value X.\n', 'mysql> SELECT TRUNCATE(1.223,1);\n        -> 1.2\nmysql> SELECT TRUNCATE(1.999,1);\n        -> 1.9\nmysql> SELECT TRUNCATE(1.999,0);\n        -> 1\nmysql> SELECT TRUNCATE(-1.999,1);\n        -> -1.9\nmysql> SELECT TRUNCATE(122,-2);\n       -> 100', ');
INSERT INTO help_topic VALUES('273', 'TIMESTAMPADD', '14', '   TIMESTAMPADD(interval,int_expr,datetime_expr)\n\nAdds the integer expression int_expr to the date or datetime expression\ndatetime_expr. The unit for int_expr is given by the\ninterval argument, which should be one of the following values:\nFRAC_SECOND,\nSECOND,\nMINUTE,\nHOUR,\nDAY,\nWEEK,\nMONTH,\nQUARTER,\nor\nYEAR.\n\nThe interval value may be specified using one of keywords as shown,\nor with a prefix of SQL_TSI_. For example, DAY or\nSQL_TSI_DAY both are legal.\n', ', ');
INSERT INTO help_topic VALUES('274', 'SHOW', '6', '\nSHOW has many forms that provide information about databases,\ntables, columns, or status information about the server.\nThis section describes those following:\n\nSHOW [FULL] COLUMNS FROM tbl_name [FROM db_name] [LIKE \'\'pattern\'\']\nSHOW CREATE DATABASE db_name\nSHOW CREATE TABLE tbl_name\nSHOW DATABASES [LIKE \'\'pattern\'\']\nSHOW [STORAGE] ENGINES\nSHOW ERRORS [LIMIT [offset,] row_count]\nSHOW GRANTS FOR user\nSHOW INDEX FROM tbl_name [FROM db_name]\nSHOW INNODB STATUS\nSHOW [BDB] LOGS\nSHOW PRIVILEGES\nSHOW [FULL] PROCESSLIST\nSHOW STATUS [LIKE \'\'pattern\'\']\nSHOW TABLE STATUS [FROM db_name] [LIKE \'\'pattern\'\']\nSHOW [OPEN] TABLES [FROM db_name] [LIKE \'\'pattern\'\']\nSHOW [GLOBAL | SESSION] VARIABLES [LIKE \'\'pattern\'\']\nSHOW WARNINGS [LIMIT [offset,] row_count]\n\nIf the syntax for a given SHOW statement includes a LIKE\n\'\'pattern\'\' part, \'\'pattern\'\' is a string that can contain the SQL \'\'%\'\'\nand \'\'_\'\' wildcard characters.\nThe pattern is useful for restricting statement output to matching values.\n', ', ');
INSERT INTO help_topic VALUES('275', 'GREATEST', '26', '   GREATEST(value1,value2,...)\nWith two or more arguments, returns the largest (maximum-valued) argument.\nThe arguments are compared using the same rules as for LEAST().\n', 'mysql> SELECT GREATEST(2,0);\n        -> 2\nmysql> SELECT GREATEST(34.0,3.0,5.0,767.0);\n        -> 767.0\nmysql> SELECT GREATEST(\'\'B\'\',\'\'A\'\',\'\'C\'\');\n        -> \'\'C\'\', ');
INSERT INTO help_topic VALUES('276', 'OCTETLENGTH', '23', '   OCTET_LENGTH(str)\n\nOCTET_LENGTH() is a synonym for LENGTH().\n', ', ');
INSERT INTO help_topic VALUES('277', 'SECOND', '14', '   SECOND(time)\nReturns the second for time, in the range 0 to 59.\n', 'mysql> SELECT SECOND(\'\'10:05:03\'\');\n        -> 3', ');
INSERT INTO help_topic VALUES('278', 'BIT_AND', '12', '   BIT_AND(expr)\nReturns the bitwise AND of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n', 'mysql> SELECT order.custid, customer.name, MAX(payments)\n    ->        FROM order,customer\n    ->        WHERE order.custid = customer.custid\n    ->        GROUP BY order.custid;', ');
INSERT INTO help_topic VALUES('279', 'ATAN2', '4', '   ATAN(Y,X)\n   ATAN2(Y,X)\nReturns the arc tangent of the two variables X and Y. It is\nsimilar to calculating the arc tangent of Y / X, except that the\nsigns of both arguments are used to determine the quadrant of the\nresult.\n', 'mysql> SELECT ATAN(-2,2);\n        -> -0.785398\nmysql> SELECT ATAN2(PI(),0);\n        -> 1.570796', ');
INSERT INTO help_topic VALUES('280', 'MBRCONTAINS', '8', '   MBRContains(g1,g2)\nReturns 1 or 0 to indicate whether or not the Minimum Bounding Rectangle of\ng1 contains the Minimum Bounding Rectangle of g2.\n', 'mysql> SET @g1 = GeomFromText(\'\'Polygon((0 0,0 3,3 3,3 0,0 0))\'\');\nmysql> SET @g2 = GeomFromText(\'\'Point(1 1)\'\');\nmysql> SELECT MBRContains(@g1,@g2), MBRContains(@g2,@g1);\n----------------------+----------------------+\n| MBRContains(@g1,@g2) | MBRContains(@g2,@g1) |\n+----------------------+----------------------+\n|                    1 |                    0 |\n+----------------------+----------------------+', ');
INSERT INTO help_topic VALUES('281', 'HOUR', '14', '   HOUR(time)\nReturns the hour for time. The range of the return value is\n0 to 23 for time-of-day values.\n', 'mysql> SELECT HOUR(\'\'10:05:03\'\');\n        -> 10', ');
INSERT INTO help_topic VALUES('282', 'TYPE SET', '1', '   SET(\'\'value1\'\',\'\'value2\'\',...)\n\nA set.  A string object that can have zero or more values, each of which must\nbe chosen from the list of values \'\'value1\'\', \'\'value2\'\',\n... A SET column can have a maximum of 64 members.\nSET values are represented internally as integers.\n  \n', ', ');
INSERT INTO help_topic VALUES('283', 'SELECT', '6', 'SELECT is used to retrieve rows selected from one or more tables.\nSupport for UNION statements and subqueries is available as of MySQL\n4.0 and 4.1, respectively.\nSee [UNION,  , UNION] and [Subqueries].\n\n --- Each select_expr indicates a column you want to retrieve.\n\n --- table_references indicates the table or tables from which to retrieve rows.\nIts syntax is described in [JOIN,  , JOIN].\n\n --- where_definition consists of the keyword WHERE followed by\nan expression that indicates the condition or conditions that rows\nmust satisfy to be selected.\n\n\nSELECT can also be used to retrieve rows computed without reference to\nany table.\n', 'SELECT\n    [ALL | DISTINCT | DISTINCTROW ]\n      [HIGH_PRIORITY]\n      [STRAIGHT_JOIN]\n      [SQL_SMALL_RESULT] [SQL_BIG_RESULT] [SQL_BUFFER_RESULT]\n      [SQL_CACHE | SQL_NO_CACHE] [SQL_CALC_FOUND_ROWS]\n    select_expr, ...\n    [INTO OUTFILE \'\'file_name\'\' export_options\n      | INTO DUMPFILE \'\'file_name\'\']\n    [FROM table_references\n      [WHERE where_definition]\n      [GROUP BY {col_name | expr | position}\n        [ASC | DESC], ... [WITH ROLLUP]]\n      [HAVING where_definition]\n      [ORDER BY {col_name | expr | position}\n        [ASC | DESC] , ...]\n      [LIMIT {[offset,] row_count | row_count OFFSET offset}]\n      [PROCEDURE procedure_name(argument_list)]\n      [FOR UPDATE | LOCK IN SHARE MODE]]', ');
INSERT INTO help_topic VALUES('284', 'COT', '4', '   COT(X)\nReturns the cotangent of X.\n', 'mysql> SELECT COT(12);\n        -> -1.57267341\nmysql> SELECT COT(0);\n        -> NULL', ');
INSERT INTO help_topic VALUES('285', 'BACKUP TABLE', '7', 'Note: This statement is deprecated. We are working on a better\nreplacement for it that will provide online backup capabilities.\nIn the meantime, the mysqlhotcopy script can be used instead.\n\nBACKUP TABLE copies to the backup directory the minimum number of\ntable files needed to restore the table, after flushing any buffered changes\nto disk. The statement works only for MyISAM tables.  It copies the\n*.frm definition  and *.MYD data files. The *.MYI\nindex file can be rebuilt from those two files.\nThe directory should be specified as a full pathname.\n', 'BACKUP TABLE tbl_name [, tbl_name] ... TO \'\'/path/to/backup/directory\'\', ');
INSERT INTO help_topic VALUES('286', 'LOAD_FILE', '23', '   LOAD_FILE(file_name)\nReads the file and returns the file contents as a string.  The file\nmust be located on the server, you must specify the full pathname to the\nfile, and you must have the FILE privilege.  The file must\nbe readable by all and be smaller than max_allowed_packet bytes.\n\nIf the file doesn\'\'t exist or cannot be read because one of the preceding\nconditions is not satisfied, the function returns NULL.\n', 'mysql> UPDATE tbl_name\n           SET blob_column=LOAD_FILE(\'\'/tmp/picture\'\')\n           WHERE id=1;', ');
INSERT INTO help_topic VALUES('287', 'POINTFROMTEXT', '3', '   PointFromText(wkt[,srid])\nConstructs a POINT value using its WKT representation and SRID.\n', ', ');
INSERT INTO help_topic VALUES('288', 'LOAD TABLE FROM MASTER', '6', 'LOAD TABLE tbl_name FROM MASTER\n\nTransfers a copy of the table from master to the slave. This statement is\nimplemented mainly for debugging of LOAD DATA FROM MASTER.\nIt requires that the account used for connecting to the master server has the\nRELOAD and SUPER privileges on the master and the\nSELECT privilege on the master table to load.\nOn the slave side, the user that issues LOAD TABLE FROM MASTER should\nhave privileges to drop and create the table.\n\nThe conditions for LOAD DATA FROM MASTER apply here, too. For\nexample, LOAD TABLE FROM MASTER works only for MyISAM tables.\nThe timeout notes for LOAD DATA FROM MASTER apply as well.\n', ', ');
INSERT INTO help_topic VALUES('289', 'GROUP_CONCAT', '12', '   GROUP_CONCAT(expr)\nThis function returns a string result with the concatenated non-NULL\nvalues from a group.  It returns NULL if there are no non-NULL\nvalues. The full syntax is as follows:\n\nGROUP_CONCAT([DISTINCT] expr [,expr ...]\n             [ORDER BY {unsigned_integer | col_name | expr}\n                 [ASC | DESC] [,col_name ...]]\n             [SEPARATOR str_val])\n', 'mysql> SELECT student_name,\n    ->     GROUP_CONCAT(test_score)\n    ->     FROM student\n    ->     GROUP BY student_name;', ');
INSERT INTO help_topic VALUES('290', 'DATE_FORMAT', '14', '   DATE_FORMAT(date,format)\nFormats the date value according to the format string. The\nfollowing specifiers may be used in the format string:\n\n     Specifier 	 Description\n   %a 	 Abbreviated weekday name (Sun..Sat)\n   %b 	 Abbreviated month name (Jan..Dec)\n   %c 	 Month, numeric (0..12)\n   %D 	 Day of the month with English suffix (0th, 1st, 2nd, 3rd, ...)\n   %d 	 Day of the month, numeric (00..31)\n   %e 	 Day of the month, numeric (0..31)\n   %f 	 Microseconds (000000..999999)\n   %H 	 Hour (00..23)\n   %h 	 Hour (01..12)\n   %I 	 Hour (01..12)\n   %i 	 Minutes, numeric (00..59)\n   %j 	 Day of year (001..366)\n   %k 	 Hour (0..23)\n   %l 	 Hour (1..12)\n   %M 	 Month name (January..December)\n   %m 	 Month, numeric (00..12)\n   %p 	 AM or PM\n   %r 	 Time, 12-hour (hh:mm:ss followed by AM or PM)\n   %S 	 Seconds (00..59)\n   %s 	 Seconds (00..59)\n   %T 	 Time, 24-hour (hh:mm:ss)\n   %U 	 Week (00..53), where Sunday is the first day of the week\n   %u 	 Week (00..53), where Monday is the first day of the week\n   %V 	 Week (01..53), where Sunday is the first day of the week; used with %X\n   %v 	 Week (01..53), where Monday is the first day of the week; used with %x\n   %W 	 Weekday name (Sunday..Saturday)\n   %w 	 Day of the week (0=Sunday..6=Saturday)\n   %X 	 Year for the week where Sunday is the first day of the week, numeric, four digits; used with %V\n   %x 	 Year for the week, where Monday is the first day of the week, numeric, four digits; used with %v\n   %Y 	 Year, numeric, four digits\n   %y 	 Year, numeric, two digits\n   %% 	 A literal \'\'%\'\'.\n  \n\nAll other characters are copied to the result without interpretation.\n\nThe %v, %V, %x, and %X format specifiers are\navailable as of MySQL 3.23.8.  %f is available as of MySQL 4.1.1.\n\nAs of MySQL 3.23, the \'\'%\'\' character is required before\nformat specifier characters.  In earlier versions of MySQL,\n\'\'%\'\' was optional.\n\nThe reason the ranges for the month and day specifiers begin with zero\nis that MySQL allows incomplete dates such as \'\'2004-00-00\'\' to be\nstored as of MySQL 3.23.\n', 'mysql> SELECT DATE_FORMAT(\'\'1997-10-04 22:23:00\'\', \'\'%W %M %Y\'\');\n        -> \'\'Saturday October 1997\'\'\nmysql> SELECT DATE_FORMAT(\'\'1997-10-04 22:23:00\'\', \'\'%H:%i:%s\'\');\n        -> \'\'22:23:00\'\'\nmysql> SELECT DATE_FORMAT(\'\'1997-10-04 22:23:00\'\',\n                          \'\'%D %y %a %d %m %b %j\'\');\n        -> \'\'4th 97 Sat 04 10 Oct 277\'\'\nmysql> SELECT DATE_FORMAT(\'\'1997-10-04 22:23:00\'\',\n                          \'\'%H %k %I %r %T %S %w\'\');\n        -> \'\'22 22 10 10:23:00 PM 22:23:00 00 6\'\'\nmysql> SELECT DATE_FORMAT(\'\'1999-01-01\'\', \'\'%X %V\'\');\n        -> \'\'1998 52\'\', ');
INSERT INTO help_topic VALUES('291', 'BENCHMARK', '25', '   BENCHMARK(count,expr)\nThe BENCHMARK() function executes the expression expr\nrepeatedly count times.  It may be used to time how fast MySQL\nprocesses the expression.  The result value is always 0.  The intended\nuse is from within the mysql client, which reports query execution times:\n', 'mysql> SELECT BENCHMARK(1000000,ENCODE(\'\'hello\'\',\'\'goodbye\'\'));\n+----------------------------------------------+\n| BENCHMARK(1000000,ENCODE(\'\'hello\'\',\'\'goodbye\'\')) |\n+----------------------------------------------+\n|                                            0 |\n+----------------------------------------------+\n1 row in set (4.74 sec)', ');
INSERT INTO help_topic VALUES('292', 'YEAR', '14', '   YEAR(date)\nReturns the year for date, in the range 1000 to 9999.\n', 'mysql> SELECT YEAR(\'\'98-02-03\'\');\n        -> 1998', ');
INSERT INTO help_topic VALUES('293', 'RELEASE_LOCK', '21', '   RELEASE_LOCK(str)\nReleases the lock named by the string str that was obtained with\nGET_LOCK(). Returns 1 if the lock was released, 0 if the\nlock wasn\'\'t locked by this thread (in which case the lock is not released),\nand NULL if the named lock didn\'\'t exist.  The lock does not exist if\nit was never obtained by a call to GET_LOCK() or if it has previously\nbeen released.\n\nThe DO statement is convenient to use with RELEASE_LOCK().\nSee also : [DO,  , DO].\n', ', ');
INSERT INTO help_topic VALUES('294', 'IS NULL', '26', '   IS NULL\n   IS NOT NULL\nTests whether a value is or is not NULL.\n', 'mysql> SELECT 1 IS NULL, 0 IS NULL, NULL IS NULL;\n        -> 0, 0, 1\nmysql> SELECT 1 IS NOT NULL, 0 IS NOT NULL, NULL IS NOT NULL;\n        -> 1, 1, 0', ');
INSERT INTO help_topic VALUES('295', 'CONVERT_TZ', '14', '   CONVERT_TZ(dt,from_tz,to_tz)\n\nCONVERT_TZ()\nconverts a datetime value dt from time zone given by from_tz\nto the time zone given by to_tz and returns the resulting value.\nTime zones may be specified as described in [Time zone support].\nThis function returns NULL if the arguments are invalid.\n', 'mysql> SELECT CONVERT_TZ(\'\'2004-01-01 12:00:00\'\',\'\'GMT\'\',\'\'MET\'\');\n        -> \'\'2004-01-01 13:00:00\'\'\nmysql> SELECT CONVERT_TZ(\'\'2004-01-01 12:00:00\'\',\'\'+00:00\'\',\'\'-07:00\'\');\n        -> \'\'2004-01-01 05:00:00\'\', ');
INSERT INTO help_topic VALUES('296', 'TIME_TO_SEC', '14', '   TIME_TO_SEC(time)\nReturns the time argument, converted to seconds.\n', 'mysql> SELECT TIME_TO_SEC(\'\'22:23:00\'\');\n        -> 80580\nmysql> SELECT TIME_TO_SEC(\'\'00:39:38\'\');\n        -> 2378', ');
INSERT INTO help_topic VALUES('297', 'WEEKDAY', '14', '   WEEKDAY(date)\nReturns the weekday index for\ndate (0 = Monday, 1 = Tuesday, ... 6 = Sunday).\n', 'mysql> SELECT WEEKDAY(\'\'1998-02-03 22:23:00\'\');\n        -> 1\nmysql> SELECT WEEKDAY(\'\'1997-11-05\'\');\n        -> 2', ');
INSERT INTO help_topic VALUES('298', 'EXPORT_SET', '23', '   EXPORT_SET(bits,on,off[,separator[,number_of_bits]])\nReturns a string in which for every bit set in the value bits, you\nget an on string and for every reset bit you get an off\nstring.  Bits in bits are examined from right to left (from low-order\nto high-order bits). Strings are added to the result from left to right,\nseparated by the separator string (default \'\',\'\'). The number of\nbits examined is given by number_of_bits (default 64).\n', 'mysql> SELECT EXPORT_SET(5,\'\'Y\'\',\'\'N\'\',\'\',\'\',4);\n        -> \'\'Y,N,Y,N\'\'\nmysql> SELECT EXPORT_SET(6,\'\'1\'\',\'\'0\'\',\'\',\'\',10);\n        -> \'\'0,1,1,0,0,0,0,0,0,0\'\', ');
INSERT INTO help_topic VALUES('299', 'TIME FUNCTION', '14', '   TIME(expr)\n\nExtracts the time part of the time or datetime expression expr.\n', 'mysql> SELECT TIME(\'\'2003-12-31 01:02:03\'\');\n        -> \'\'01:02:03\'\'\nmysql> SELECT TIME(\'\'2003-12-31 01:02:03.000123\'\');\n        -> \'\'01:02:03.000123\'\', ');
INSERT INTO help_topic VALUES('300', 'CAST', '23', 'The CAST() and CONVERT() functions can be used to take a\nvalue of one type and produce a value of another type.\n\nThe type can be one of the following values:\n\n --- BINARY\n --- CHAR\n --- DATE\n --- DATETIME\n --- SIGNED [INTEGER]\n --- TIME\n --- UNSIGNED [INTEGER]\n\nBINARY produces a binary string. See the entry for the BINARY\noperator in this section for a description of how this affects comparisons.\n\nCAST() and CONVERT() are available as of MySQL 4.0.2.\nThe CHAR conversion type is available as of 4.0.6.\nThe USING form of CONVERT() is available as of 4.1.0.\n\nCAST() and CONVERT(... USING ...) are standard SQL syntax.\nThe non-USING form of CONVERT() is ODBC syntax.\n\nCONVERT() with USING is used to convert data between different\ncharacter sets.  In MySQL, transcoding names are the same as the\ncorresponding character set names.  For example, this statement converts\nthe string \'\'abc\'\' in the server\'\'s default character set to the\ncorresponding string in the utf8 character set:\n\nSELECT CONVERT(\'\'abc\'\' USING utf8);\n\n  \n\nThe cast functions are useful when you want to create a column with\na specific type in a CREATE ... SELECT statement:\n', 'SELECT enum_col FROM tbl_name ORDER BY CAST(enum_col AS CHAR);', ');
INSERT INTO help_topic VALUES('301', 'SOUNDS LIKE', '23', '   expr1 SOUNDS LIKE expr2\n\nThis is the same as SOUNDEX(expr1) = SOUNDEX(expr2). It is\navailable only in MySQL 4.1 or later.\n', ', ');
INSERT INTO help_topic VALUES('302', 'PERIOD_DIFF', '14', '   PERIOD_DIFF(P1,P2)\nReturns the number of months between periods P1 and P2.\nP1 and P2 should be in the format YYMM or YYYYMM.\nNote that the period arguments P1 and P2 are /not/\ndate values.\n', 'mysql> SELECT PERIOD_DIFF(9802,199703);\n        -> 11', ');
INSERT INTO help_topic VALUES('303', 'LIKE', '23', '   expr LIKE pat [ESCAPE \'\'escape-char\'\']\nPattern matching using\nSQL simple regular expression comparison. Returns 1 (TRUE) or 0\n(FALSE).  If either expr or pat is NULL, the result is\nNULL.\n\nThe pattern need not be a literal string. For example, it can be specified\nas a string expression or table column.\n\nWith LIKE you can use the following two wildcard characters\nin the pattern:\n\n     Character 	 Description\n   % 	 Matches any number of characters, even zero characters\n   _ 	 Matches exactly one character\n  \n', 'mysql> SELECT \'\'David!\'\' LIKE \'\'David_\'\';\n        -> 1\nmysql> SELECT \'\'David!\'\' LIKE \'\'%D%v%\'\';\n        -> 1', ');
INSERT INTO help_topic VALUES('304', 'MULTIPOINT', '2', '   MultiPoint(pt1,pt2,...)\nConstructs a WKB MultiPoint value using WKB Point arguments.\nIf any argument is not a WKB Point, the return value is NULL.\n', ', ');
INSERT INTO help_topic VALUES('305', '>>', '27', '   >>\nShifts a longlong (BIGINT) number to the right.\n', 'mysql> SELECT 4 >> 2;\n        -> 1', ');
INSERT INTO help_topic VALUES('306', 'TRUE FALSE', '22', 'TRUE and FALSE added as alias for 1 and 0, respectively.\n', ', ');
INSERT INTO help_topic VALUES('307', 'AVG', '12', '   AVG([DISTINCT] expr)\nReturns the average value of expr.\nThe DISTINCT option can be used as of MySQL 5.0.3 to return the averge\nof the distinct values of expr.\n', 'mysql> SELECT student_name, AVG(test_score)\n    ->        FROM student\n    ->        GROUP BY student_name;', ');
INSERT INTO help_topic VALUES('308', 'MBRWITHIN', '8', '   MBRWithin(g1,g2)\nReturns 1 or 0 to indicate whether or not the Minimum Bounding Rectangle\nof g1 is within the Minimum Bounding Rectangle of g2.\n', 'mysql> SET @g1 = GeomFromText(\'\'Polygon((0 0,0 3,3 3,3 0,0 0))\'\');\nmysql> SET @g2 = GeomFromText(\'\'Polygon((0 0,0 5,5 5,5 0,0 0))\'\');\nmysql> SELECT MBRWithin(@g1,@g2), MBRWithin(@g2,@g1);\n+--------------------+--------------------+\n| MBRWithin(@g1,@g2) | MBRWithin(@g2,@g1) |\n+--------------------+--------------------+\n|                  1 |                  0 |\n+--------------------+--------------------+', ');
INSERT INTO help_topic VALUES('309', 'IN', '26', '   expr IN (value,...)\nReturns 1 if expr is any of the values in the IN list,\nelse returns 0.  If all values are constants, they are\nevaluated according to the type of expr and sorted. The search for the\nitem then is done using a binary search. This means IN is very quick\nif the IN value list consists entirely of constants.  If expr\nis a case-sensitive string expression, the string comparison is performed in\ncase-sensitive fashion.\n', 'mysql> SELECT 2 IN (0,3,5,\'\'wefwf\'\');\n        -> 0\nmysql> SELECT \'\'wefwf\'\' IN (0,3,5,\'\'wefwf\'\');\n        -> 1', ');
INSERT INTO help_topic VALUES('310', 'QUOTE', '23', '   QUOTE(str)\nQuotes a string to produce a result that can be used as a properly escaped\ndata value in an SQL statement.  The string is returned surrounded by single\nquotes and with each instance of single quote (\'\'\'\'\'\'), backslash (\'\'\\\'\'),\nASCII NUL, and Control-Z preceded by a backslash.  If the argument is\nNULL, the return value is the word ``NULL\'\'\'\' without surrounding\nsingle quotes.\nThe QUOTE() function was added in MySQL 4.0.3.\n', 'mysql> SELECT QUOTE(\'\'Don\\\'\'t!\'\');\n        -> \'\'Don\\\'\'t!\'\'\nmysql> SELECT QUOTE(NULL);\n        -> NULL', ');
INSERT INTO help_topic VALUES('311', 'SESSION_USER', '25', '   SESSION_USER()\n\nSESSION_USER() is a synonym for USER().\n', ', ');
INSERT INTO help_topic VALUES('312', 'QUARTER', '14', '   QUARTER(date)\nReturns the quarter of the year for date, in the range 1\nto 4.\n', 'mysql> SELECT QUARTER(\'\'98-04-01\'\');\n        -> 2', ');
INSERT INTO help_topic VALUES('313', 'POSITION', '23', '   POSITION(substr IN str)\n\nPOSITION(substr IN str) is a synonym for LOCATE(substr,str).\n', 'mysql> SELECT LOCATE(\'\'bar\'\', \'\'foobarbar\'\');\n        -> 4\nmysql> SELECT LOCATE(\'\'xbar\'\', \'\'foobar\'\');\n        -> 0\nmysql> SELECT LOCATE(\'\'bar\'\', \'\'foobarbar\'\',5);\n        -> 7', ');
INSERT INTO help_topic VALUES('314', 'IS_USED_LOCK', '21', '   IS_USED_LOCK(str)\nChecks whether the lock named str is in use (that is, locked).\nIf so, it returns the connection identifier of the client that holds\nthe lock.\nOtherwise, it returns NULL.\n', ', ');
INSERT INTO help_topic VALUES('315', 'POLYFROMTEXT', '3', '   PolyFromText(wkt[,srid])\n   PolygonFromText(wkt[,srid])\nConstructs a POLYGON value using its WKT representation and SRID.\n', ', ');
INSERT INTO help_topic VALUES('316', 'DES_ENCRYPT', '17', '   DES_ENCRYPT(str[,(key_num|key_str)])\n\nEncrypts the string with the given key using the Triple-DES algorithm.\nOn error, this function returns NULL.\n\nNote that this function works only if MySQL has been configured with\nSSL support. See also : [Secure connections].\n\nThe encryption key to use is chosen based on the second argument to\nDES_ENCRYPT(), if one was given:\n\n     Argument 	 Description\n   No argument 	\nThe first key from the DES key file is used.\n   key_num 	\nThe given key number (0-9) from the DES key file is used.\n   key_str 	\nThe given key string is used to encrypt str.\n  \n\nThe key file can be specified with the --des-key-file server option.\n\nThe return string is a binary string where the first character\nis CHAR(128 | key_num).\n\nThe 128 is added to make it easier to recognize an encrypted key.\nIf you use a string key, key_num is 127.\n\nThe string length for the result is\nnew_len = orig_len + (8-(orig_len % 8))+1.\n', 'key_num des_key_str', ');
INSERT INTO help_topic VALUES('317', 'LENGTH', '23', '   LENGTH(str)\nReturns the length of the string str, measured in bytes.\nA multi-byte character counts as multiple bytes.\nThis means that for a string containing five two-byte characters,\nLENGTH() returns 10, whereas CHAR_LENGTH() returns\n5.\n', 'mysql> SELECT LENGTH(\'\'text\'\');\n        -> 4', ');
INSERT INTO help_topic VALUES('318', 'DISTANCE', '11', '   Distance(g1,g2)\nReturns as a double-precision number\nthe shortest distance between any two points in the two geometries.\n', ', ');
INSERT INTO help_topic VALUES('319', 'STR_TO_DATE', '14', '   STR_TO_DATE(str,format)\nThis is the reverse function of the DATE_FORMAT() function. It takes a\nstring str and a format string format.\nSTR_TO_DATE() returns a DATETIME value if the format\nstring contains both date and time parts, or a DATE or TIME\nvalue if the string contains only date or time parts.\n\nThe date, time, or datetime values contained in str should be given\nin the format indicated by format. For the specifiers that can be\nused in format, see the table in the DATE_FORMAT() function\ndescription. All other characters are just taken verbatim, thus not being\ninterpreted.\nIf str contains an illegal date, time, or datetime value,\nSTR_TO_DATE() returns NULL.  Starting from MySQL 5.0.3, an\nillegal value also produces a warning.\n', '@c next example commented out until format string becomes optional\n@c mysql> SELECT STR_TO_DATE(\'\'2003-10-03\'\');\n@c         -> 2003-10-03 00:00:00\nmysql> SELECT STR_TO_DATE(\'\'03.10.2003 09.20\'\',\n    ->                    \'\'%d.%m.%Y %H.%i\'\');\n        -> \'\'2003-10-03 09:20:00\'\'\nmysql> SELECT STR_TO_DATE(\'\'10arp\'\', \'\'%carp\'\');\n        -> \'\'0000-10-00 00:00:00\'\'\nmysql> SELECT STR_TO_DATE(\'\'2003-15-10 00:00:00\'\',\n    ->                    \'\'%Y-%m-%d %H:%i:%s\'\');\n        -> NULL', ');
INSERT INTO help_topic VALUES('320', 'Y', '16', '   Y(p)\nReturns the Y-coordinate value for the point p as a double-precision\nnumber.\n', 'mysql> SELECT Y(GeomFromText(\'\'Point(56.7 53.34)\'\'));\n+--------------------------------------+\n| Y(GeomFromText(\'\'Point(56.7 53.34)\'\')) |\n+--------------------------------------+\n|                                53.34 |\n+--------------------------------------+', ');
INSERT INTO help_topic VALUES('321', 'NUMINTERIORRINGS', '0', '   NumInteriorRings(poly)\nReturns the number of interior rings in the Polygon value poly.\n', 'mysql> SET @poly =\n    -> \'\'Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))\'\';\nmysql> SELECT NumInteriorRings(GeomFromText(@poly));\n+---------------------------------------+\n| NumInteriorRings(GeomFromText(@poly)) |\n+---------------------------------------+\n|                                     1 |\n+---------------------------------------+', ');
INSERT INTO help_topic VALUES('322', 'INTERIORRINGN', '0', '   InteriorRingN(poly,n)\nReturns the n-th interior ring for the Polygon value\npoly as a LineString.\nRing numbers begin at 1.\n', 'mysql> SET @poly =\n    -> \'\'Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))\'\';\nmysql> SELECT AsText(InteriorRingN(GeomFromText(@poly),1));\n+----------------------------------------------+\n| AsText(InteriorRingN(GeomFromText(@poly),1)) |\n+----------------------------------------------+\n| LINESTRING(1 1,1 2,2 2,2 1,1 1)              |\n+----------------------------------------------+', ');
INSERT INTO help_topic VALUES('323', 'UTC_TIME', '14', '   UTC_TIME\n   UTC_TIME()\nReturns the current UTC time as a value in \'\'HH:MM:SS\'\' or HHMMSS\nformat, depending on whether the function is used in a string or numeric\ncontext.\n', 'mysql> SELECT UTC_TIME(), UTC_TIME() + 0;\n        -> \'\'18:07:53\'\', 180753', ');
INSERT INTO help_topic VALUES('324', 'STDDEV', '12', '   STD(expr)\n   STDDEV(expr)\nReturns the population standard deviation of expr.  This is an\nextension to standard SQL. The STDDEV() form of this function is\nprovided for Oracle compatibility. As of MySQL 5.0.3, the standard SQL\nfunction STDDEV_POP() can be used instead.\n', ', ');
INSERT INTO help_topic VALUES('325', 'PERIOD_ADD', '14', '   PERIOD_ADD(P,N)\nAdds N months to period P (in the format YYMM or\nYYYYMM). Returns a value in the format YYYYMM.\nNote that the period argument P is /not/ a date value.\n', 'mysql> SELECT PERIOD_ADD(9801,2);\n        -> 199803', ');
INSERT INTO help_topic VALUES('326', '|', '27', '   |\nBitwise OR:\n', 'mysql> SELECT 29 | 15;\n        -> 31', ');
INSERT INTO help_topic VALUES('327', 'GEOMFROMTEXT', '3', '   GeomFromText(wkt[,srid])\n   GeometryFromText(wkt[,srid])\nConstructs a geometry value of any type using its WKT representation and SRID.\n', ', ');
INSERT INTO help_topic VALUES('328', 'RIGHT', '23', '   RIGHT(str,len)\nReturns the rightmost len characters from the string str.\n', 'mysql> SELECT RIGHT(\'\'foobarbar\'\', 4);\n        -> \'\'rbar\'\', ');
INSERT INTO help_topic VALUES('329', 'DATEDIFF', '14', '   DATEDIFF(expr,expr2)\n\n\nDATEDIFF() returns the number of days between the start date\nexpr and the end date expr2.\nexpr and expr2 are date or date-and-time expressions.\nOnly the date parts of the values are used in the calculation.\n', 'mysql> SELECT DATEDIFF(\'\'1997-12-31 23:59:59\'\',\'\'1997-12-30\'\');\n        -> 1\nmysql> SELECT DATEDIFF(\'\'1997-11-30 23:59:59\'\',\'\'1997-12-31\'\');\n        -> -31', ');
INSERT INTO help_topic VALUES('330', 'BIN', '23', '   BIN(N)\nReturns a string representation of the binary value of N, where\nN is a longlong (BIGINT) number.  This is equivalent to\nCONV(N,10,2).  Returns NULL if N is NULL.\n', 'mysql> SELECT BIN(12);\n        -> \'\'1100\'\', ');
INSERT INTO help_topic VALUES('331', 'MULTILINESTRING', '2', '   MultiLineString(ls1,ls2,...)\nConstructs a WKB MultiLineString value using WKB LineString\narguments.  If any argument is not a WKB LineString, the return\nvalue is NULL.\n', ', ');
INSERT INTO help_topic VALUES('332', 'LOAD DATA', '6', 'The LOAD DATA INFILE statement reads rows from a text file into a\ntable at a very high speed.\nFor more information about the efficiency of INSERT versus\nLOAD DATA INFILE and speeding up LOAD DATA INFILE,\n[Insert speed].\n\nYou can also load data files by using the mysqlimport utility; it\noperates by sending a LOAD DATA INFILE statement to the server.  The\n--local option causes mysqlimport to read data files from the\nclient host.  You can specify the --compress option to get better\nperformance over slow networks if the client and server support the\ncompressed protocol.\nSee also : [mysqlimport,  , mysqlimport].\n\nIf you specify the LOW_PRIORITY keyword, execution of the\nLOAD DATA statement is delayed until no other clients are reading\nfrom the table.\n\nIf you specify the CONCURRENT keyword with a MyISAM table that\nsatisfies the condition for concurrent inserts (that is, it contains no free\nblocks in the middle),\nthen other threads can retrieve data from the table while LOAD DATA\nis executing. Using this option affects the performance of LOAD DATA\na bit, even if no other thread is using the table at the same time.\n\nIf the LOCAL keyword is specified, it is\ninterpreted with respect to the client end of the connection:\n\n\n --- If LOCAL is specified, the file is read by the client program on the\nclient host and sent to the server. The file can be given as a full pathname\nto specify its exact location. If given as a relative pathname, the name is\ninterpreted relative to the directory in which the client program was started.\n\n --- If LOCAL is not specified, the\nfile must be located on the server host and is read directly by the server.\n\n\nLOCAL is available in MySQL 3.22.6 or later.\n\nWhen locating files on the server host, the server uses the following rules:\n\n --- If an absolute pathname is given, the server uses the pathname as is.\n\n --- If a relative pathname with one or more leading components is given,\nthe server searches for the file relative to the server\'\'s data directory.\n\n --- If a filename with no leading components is given, the server looks for\nthe file in the database directory of the default database.\n\nNote that these rules mean that a file named as *./myfile.txt is read from\nthe server\'\'s data directory, whereas the same file named as *myfile.txt is\nread from the database directory of the default database.  For example,\nthe following LOAD DATA statement reads the file *data.txt\nfrom the database directory for db1 because db1 is the current\ndatabase, even though the statement explicitly loads the file into a\ntable in the db2 database:\n\nmysql> USE db1;\nmysql> LOAD DATA INFILE \'\'data.txt\'\' INTO TABLE db2.my_table;\n\nNote that Windows pathnames are specified using forward slashes rather than\nbackslashes.  If you do use backslashes, you must double them.\n\nFor security reasons, when reading text files located on the server, the\nfiles must either reside in the database directory or be readable by all.\nAlso, to use LOAD DATA INFILE on server files, you must have the\nFILE privilege.\n', 'LOAD DATA [LOW_PRIORITY | CONCURRENT] [LOCAL] INFILE \'\'file_name.txt\'\'\n    [REPLACE | IGNORE]\n    INTO TABLE tbl_name\n    [FIELDS\n        [TERMINATED BY \'\'\\t\'\']\n        [[OPTIONALLY] ENCLOSED BY \'\'\'\']\n        [ESCAPED BY \'\'\\\\\'\' ]\n    ]\n    [LINES\n        [STARTING BY \'\'\'\']\n        [TERMINATED BY \'\'\\n\'\']\n    ]\n    [IGNORE number LINES]\n    [(col_name,...)]', ');
INSERT INTO help_topic VALUES('333', 'BLOB TYPE', '1', '   BLOB\n\nA BLOB column with a maximum length of 65,535\n(2^16 - 1) bytes.\n', ', ');
INSERT INTO help_topic VALUES('334', 'LOCALTIME', '14', '   LOCALTIME\n   LOCALTIME()\n\nLOCALTIME and LOCALTIME() are synonyms for\nNOW().\n', ', ');
INSERT INTO help_topic VALUES('335', 'MPOINTFROMTEXT', '3', '   MPointFromText(wkt[,srid])\n   MultiPointFromText(wkt[,srid])\nConstructs a MULTIPOINT value using its WKT representation and SRID.\n', ', ');
INSERT INTO help_topic VALUES('336', 'BLOB', '1', 'A BLOB is a binary large object that can hold a variable amount of\ndata.  The four BLOB types, TINYBLOB, BLOB,\nMEDIUMBLOB, and LONGBLOB, differ only in the maximum length of\nthe values they can hold.\n', ', ');
INSERT INTO help_topic VALUES('337', 'PASSWORD', '17', ', 'mysql> SELECT PASSWORD(\'\'badpwd\'\');\n        -> \'\'7f84554057dd964b\'\', ');
INSERT INTO help_topic VALUES('338', 'CHAR', '1', '   [NATIONAL] CHAR(M) [BINARY | ASCII | UNICODE]\n\nA fixed-length string that is always right-padded with spaces to the\nspecified length when stored.  M represents the column length.  The\nrange of M is 0 to 255 characters (1 to 255 prior to MySQL 3.23).\n\nNote: Trailing spaces are removed when CHAR values are\nretrieved.\n\nFrom MySQL 4.1.0 to 5.0.2, a CHAR column with a length specification\ngreater than 255 is converted to the smallest TEXT type that can hold\nvalues of the given length.  For example, CHAR(500) is converted to\nTEXT, and CHAR(200000) is converted to MEDIUMTEXT.\nThis is a compatibility feature.  However, this conversion causes the column\nto become a variable-length column, and also affects trailing-space removal.\n\nCHAR is shorthand for CHARACTER.\nNATIONAL CHAR (or its equivalent short form, NCHAR) is the\nstandard SQL way to define that a CHAR column should use the default\ncharacter set.  This is the default in MySQL.\n\nAs of MySQL 4.1.2, the BINARY attribute is shorthand for specifying\nthe binary collation of the column character set.  Sorting and comparison is\nbased on numeric character values.  Before 4.1.2, BINARY attribute\ncauses the column to be treated as a binary string.  Sorting and comparison\nis based on numeric byte values.\n\nFrom MySQL 4.1.0 on, column type CHAR BYTE is an alias for\nCHAR BINARY. This is a compatibility feature.\n\nFrom MySQL 4.1.0 on, the ASCII attribute can be specified for\nCHAR. It assigns the latin1 character set.\n\nFrom MySQL 4.1.1 on, the UNICODE attribute can be specified for\nCHAR. It assigns the ucs2 character set.\n\nMySQL allows you to create a column of type CHAR(0). This is mainly\nuseful when you have to be compliant with some old applications that depend\non the existence of a column but that do not actually use the value.  This\nis also quite nice when you need a column that can take only two values: A\nCHAR(0) column that is not defined as NOT NULL occupies only\none bit and can take only the values NULL and \'\'\'\' (the empty\nstring).\n\n   CHAR\nThis is a synonym for CHAR(1).\n', ', ');
INSERT INTO help_topic VALUES('339', 'UTC_DATE', '14', '   UTC_DATE\n   UTC_DATE()\nReturns the current UTC date as a value in \'\'YYYY-MM-DD\'\' or\nYYYYMMDD format, depending on whether the function is used in a\nstring or numeric context.\n', 'mysql> SELECT UTC_DATE(), UTC_DATE() + 0;\n        -> \'\'2003-08-14\'\', 20030814', ');
INSERT INTO help_topic VALUES('340', 'DIMENSION', '19', '   Dimension(g)\nReturns the inherent dimension of the geometry value g. The result\ncan be -1, 0, 1, or 2. (The meaning of these values is given in\n[GIS class geometry].)\n', 'mysql> SELECT Dimension(GeomFromText(\'\'LineString(1 1,2 2)\'\'));\n+------------------------------------------------+\n| Dimension(GeomFromText(\'\'LineString(1 1,2 2)\'\')) |\n+------------------------------------------------+\n|                                              1 |\n+------------------------------------------------+', ');
INSERT INTO help_topic VALUES('341', 'COUNT DISTINCT', '12', '   COUNT(DISTINCT expr,[expr...])\nReturns a count of the number of different non-NULL values.\n', 'mysql> SELECT COUNT(DISTINCT results) FROM student;', ');
INSERT INTO help_topic VALUES('342', 'BIT', '1', '   BIT[(M)]\n\nA bit-field type. M indicates the number of bits per value, from 1 to\n64. The default is 1 if M is omitted.  Currently, BIT is\nsupported only for MyISAM.\n\nThis data type was added in MySQL 5.0.3.  Before 5.0.3, BIT is a\nsynonym for TINYINT(1).\n', ', ');
INSERT INTO help_topic VALUES('343', 'EQUALS', '11', '   Equals(g1,g2)\nReturns 1 or 0 to indicate whether or not g1 is spatially equal to\ng2.\n', ', ');
INSERT INTO help_topic VALUES('344', 'SHOW CREATE VIEW', '6', 'This statement shows a CREATE VIEW statement that creates\nthe given view.\n', 'SHOW CREATE VIEW view_name', ');
INSERT INTO help_topic VALUES('345', 'INTERVAL', '26', '   INTERVAL(N,N1,N2,N3,...)\nReturns 0 if N < N1, 1 if N < N2\nand so on or -1 if N is NULL. All arguments are treated\nas integers.  It is required that N1 < N2 < N3 <\n... < Nn for this function to work correctly. This is because\na binary search is used (very fast).\n', 'mysql> SELECT INTERVAL(23, 1, 15, 17, 30, 44, 200);\n        -> 3\nmysql> SELECT INTERVAL(10, 1, 10, 100, 1000);\n        -> 2\nmysql> SELECT INTERVAL(22, 23, 30, 44, 200);\n        -> 0', ');
INSERT INTO help_topic VALUES('346', 'FROM_DAYS', '14', '   FROM_DAYS(N)\nGiven a daynumber N, returns a DATE value.\n', 'mysql> SELECT FROM_DAYS(729669);\n        -> \'\'1997-10-07\'\', ');
INSERT INTO help_topic VALUES('347', 'BIT_COUNT', '27', '   BIT_COUNT(N)\nReturns the number of bits that are set in the argument N.\n', 'mysql> SELECT BIT_COUNT(29);\n        -> 4', ');
INSERT INTO help_topic VALUES('348', 'UTC_TIMESTAMP', '14', '   UTC_TIMESTAMP\n   UTC_TIMESTAMP()\nReturns the current UTC date and time as a value in \'\'YYYY-MM-DD HH:MM:SS\'\'\nor YYYYMMDDHHMMSS format, depending on whether the function is used in\na string or numeric context.\n', 'mysql> SELECT UTC_TIMESTAMP(), UTC_TIMESTAMP() + 0;\n        -> \'\'2003-08-14 18:08:04\'\', 20030814180804', ');
INSERT INTO help_topic VALUES('349', '+', '4', '   +\nAddition:\n', 'mysql> SELECT 3+5;\n        -> 8', ');
INSERT INTO help_topic VALUES('350', 'INET_NTOA', '21', '   INET_NTOA(expr)\nGiven a numeric network address (4 or 8 byte), returns the dotted-quad\nrepresentation of the address as a string.\n', 'mysql> SELECT INET_NTOA(3520061480);\n        -> \'\'209.207.224.40\'\', ');
INSERT INTO help_topic VALUES('351', 'ACOS', '4', '   ACOS(X)\nReturns the arc cosine of X, that is, the value whose cosine is\nX. Returns NULL if X is not in the range -1 to\n1.\n', 'mysql> SELECT ACOS(1);\n        -> 0.000000\nmysql> SELECT ACOS(1.0001);\n        -> NULL\nmysql> SELECT ACOS(0);\n        -> 1.570796', ');
INSERT INTO help_topic VALUES('352', 'ISOLATION', '10', 'SET [GLOBAL | SESSION] TRANSACTION ISOLATION LEVEL\n{ READ UNCOMMITTED | READ COMMITTED | REPEATABLE READ | SERIALIZABLE }\n\nThis statement\nsets the transaction isolation level for the next transaction, globally, or\nfor the current session.\n\nThe default behavior of SET TRANSACTION is to set the isolation level\nfor the next (not yet\nstarted) transaction.  If you use the GLOBAL keyword, the statement\nsets the default transaction level globally for all new connections\ncreated from that point on. Existing connections are unaffected.\nYou need the SUPER\nprivilege to do this.  Using the SESSION keyword sets the\ndefault transaction level for all future transactions performed on the\ncurrent connection.\n\nFor descriptions of each InnoDB transaction isolation level, see\n[InnoDB transaction isolation, InnoDB transaction isolation].\nInnoDB supports each of these levels\nfrom MySQL 4.0.5 on. The default level is REPEATABLE READ.\n\nYou can set the initial default global isolation level for mysqld with\nthe --transaction-isolation option.\nSee also : [Server options].\n', ', ');
INSERT INTO help_topic VALUES('353', 'CEILING', '4', '   CEILING(X)\n   CEIL(X)\nReturns the smallest integer value not less than X.\n', 'mysql> SELECT CEILING(1.23);\n        -> 2\nmysql> SELECT CEIL(-1.23);\n        -> -1', ');
INSERT INTO help_topic VALUES('354', 'SIN', '4', '   SIN(X)\nReturns the sine of X, where X is given in radians.\n', 'mysql> SELECT SIN(PI());\n        -> 0.000000', ');
INSERT INTO help_topic VALUES('355', 'DAYOFWEEK', '14', '   DAYOFWEEK(date)\nReturns the weekday index\nfor date (1 = Sunday, 2 = Monday, ..., 7 =\nSaturday).  These index values correspond to the ODBC standard.\n', 'mysql> SELECT DAYOFWEEK(\'\'1998-02-03\'\');\n        -> 3', ');
INSERT INTO help_topic VALUES('356', 'LINEFROMWKB', '13', '   LineFromWKB(wkb[,srid])\n   LineStringFromWKB(wkb[,srid])\nConstructs a LINESTRING value using its WKB representation and SRID.\n', ', ');
INSERT INTO help_topic VALUES('357', 'GEOMETRYTYPE', '19', '   GeometryType(g)\nReturns as a string the name of the geometry type of which\nthe geometry instance g is a member.\nThe name corresponds to one of the instantiable Geometry subclasses.\n', 'mysql> SELECT GeometryType(GeomFromText(\'\'POINT(1 1)\'\'));\n+------------------------------------------+\n| GeometryType(GeomFromText(\'\'POINT(1 1)\'\')) |\n+------------------------------------------+\n| POINT                                    |\n+------------------------------------------+', ');
INSERT INTO help_topic VALUES('358', 'GRANT TYPES', '7', 'For the GRANT and REVOKE statements, priv_type can be\nspecified as any of the following:\n\n     Privilege 	 Meaning\n   ALL [PRIVILEGES] 	 Sets all simple privileges except GRANT OPTION\n   ALTER  	 Allows use of ALTER TABLE\n   ALTER ROUTINE  	 Alter or drop stored routines\n   CREATE 	 Allows use of CREATE TABLE\n   CREATE ROUTINE 	 Create stored routines\n   CREATE TEMPORARY TABLES 	 Allows use of CREATE TEMPORARY TABLE\n   CREATE USER 	 Allows use of CREATE USER, DROP USER, RENAME USER, and REVOKE ALL PRIVILEGES.\n   CREATE VIEW 	 Allows use of CREATE VIEW\n   DELETE 	 Allows use of DELETE\n   DROP 	 Allows use of DROP TABLE\n   EXECUTE 	 Allows the user to run stored routines\n   FILE 	 Allows use of SELECT ... INTO OUTFILE and LOAD DATA INFILE\n   INDEX 	 Allows use of CREATE INDEX and DROP INDEX\n   INSERT 	 Allows use of INSERT\n   LOCK TABLES 	 Allows use of LOCK TABLES on tables for which you have the SELECT privilege\n   PROCESS 	 Allows use of SHOW FULL PROCESSLIST\n   REFERENCES 	 Not implemented\n   RELOAD 	 Allows use of FLUSH\n   REPLICATION CLIENT 	 Allows the user to ask where slave or master servers are\n   REPLICATION SLAVE 	 Needed for replication slaves (to read binary log events from the master)\n   SELECT 	 Allows use of SELECT\n   SHOW DATABASES 	 SHOW DATABASES shows all databases\n   SHOW VIEW 	 Allows use of SHOW CREATE VIEW\n   SHUTDOWN 	 Allows use of mysqladmin shutdown\n   SUPER 	 Allows use of CHANGE MASTER, KILL,\nPURGE MASTER LOGS, and SET GLOBAL statements, the mysqladmin debug command; allows you to connect (once) even if max_connections is reached\n   UPDATE 	 Allows use of UPDATE\n   USAGE 	 Synonym for ``no privileges\'\'\'\'\n   GRANT OPTION 	 Allows privileges to be granted\n  \n', ', ');
INSERT INTO help_topic VALUES('359', 'CREATE VIEW', '28', 'This statement creates a new view, or replaces an existing one if the\nOR REPLACE clause is given. The select_statement is a\nSELECT statement that provides the definition of the view.\nThe statement can select from base tables or other views.\n\nThis statement requires the CREATE VIEW privilege for the view, and\nsome privilege for each column referred to in the SELECT statement.\nIf the OR REPLACE clause is present, you must also have the\nDELETE privilege for the view.\n\nA view belongs to a database.  By default, a new view is created in the\ncurrent database.  To create the view explicitly in a given database,\nspecify the name as db_name.view_name when you create it.\n\nmysql> CREATE VIEW test.v AS SELECT * FROM t;\n\nTables and views share the same namespace within a database, so a database\ncannot contain a table and a view that have the same name.\n\nViews must have unique column names with no duplicates, just like base\ntables.  By default, the names of the columns retrieved by the SELECT\nstatement are used for the view column names.  To define explicit names for\nthe view columns, the optional column_list clause can be given as a\nlist of comma-separated identifiers.  The number of names in\ncolumn_list must be the same as the number of columns retrieved by the\nSELECT statement.\n\nColumns retrieved by the SELECT statement can be simple references to\ntable columns. They can also be expressions that use functions, constant\nvalues, operators, and so forth.\n\nUnqualified table or view names in the SELECT statement are\ninterpreted with respect to the default database.  A view can refer to\ntables or views in other databases by qualifying the table or view name with\nthe proper database name.\n\nA view can be created from many kinds of SELECT statements.  It can\nrefer to base tables or other views.  It can use joins, UNION, and\nsubqueries.  The SELECT need not even refer to any tables. The\nfollowing example defines a view that selects two columns from another\ntable, as well as an expression calculated from those columns:\n\nmysql> CREATE TABLE t (qty INT, price INT);\nmysql> INSERT INTO t VALUES(3, 50);\nmysql> CREATE VIEW v AS SELECT qty, price, qty*price AS value FROM t;\nmysql> SELECT * FROM v;\n+------+-------+-------+\n| qty  | price | value |\n+------+-------+-------+\n|    3 |    50 |   150 |\n+------+-------+-------+\n\nA view definition is subject to the following restrictions:\n\n\n --- The SELECT statement cannot contain a subquery in the FROM\nclause.\n\n --- The SELECT statement cannot refer to system or user variables.\n\n --- Within a stored procedure, the definition cannot refer to procedure\nparameters or local variables.\n\n --- Any table or view referred to in the definition must exist.  However, after\na view has been created, it is possible to drop a table or view that the\ndefinition refers to.  To check a view definition for problems of this kind,\nuse the CHECK TABLE statement.\n\n --- The definition cannot refer to a TEMPORARY table, and you cannot\ncreate a TEMPORARY view.\n\n --- The tables named in the view definition must already exist.\n\n --- You cannot associate a trigger with a view.\n\n\nORDER BY is allowed in a view definition, but it is ignored if you\nselect from a view using a statement that has its own ORDER BY.\n\nFor other options or clauses in the definition, they are added to the\noptions or clauses of the statement that references the view, but the effect\nis undefined.  For example, if a view definition includes a LIMIT\nclause, and you select from the view using a statement that has its own\nLIMIT clause, it is undefined which limit applies.  This same\nprinciple applies to options such as ALL, DISTINCT, or\nSQL_SMALL_RESULT that follow the SELECT keyword, and to\nclauses such as INTO, FOR UPDATE, LOCK IN SHARE MODE,\nand PROCEDURE.\n\nIf you create a view and then change the query processing environment by\nchanging system variables, that may affect the results you get from the\nview:\n\nmysql> CREATE VIEW v AS SELECT CHARSET(CHAR(65)), COLLATION(CHAR(65));\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SET NAMES \'\'latin1\'\';\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT * FROM v;\n+-------------------+---------------------+\n| CHARSET(CHAR(65)) | COLLATION(CHAR(65)) |\n+-------------------+---------------------+\n| latin1            | latin1_swedish_ci   |\n+-------------------+---------------------+\n1 row in set (0.00 sec)\n\nmysql> SET NAMES \'\'utf8\'\';\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT * FROM v;\n+-------------------+---------------------+\n| CHARSET(CHAR(65)) | COLLATION(CHAR(65)) |\n+-------------------+---------------------+\n| utf8              | utf8_general_ci     |\n+-------------------+---------------------+\n1 row in set (0.00 sec)\n\nThe optional ALGORITHM clause is a MySQL extension to standard SQL.\nALGORITHM takes three values: MERGE, TEMPTABLE, or\nUNDEFINED. The default algorithm is UNDEFINED if no\nALGORITHM clause is present.  The algorithm affects how MySQL\nprocesses the view.\n\nFor MERGE, the text of a statement that refers to the view and the view\ndefinition are merged such that parts of the view definition replace\ncorresponding parts of the statement.\n\nFor TEMPTABLE, the results from the view are retrieved into a\ntemporary table, which then is used to execute the statement.\n\nFor UNDEFINED, MySQL chooses which algorithm to use.  It prefers\nMERGE over TEMPTABLE if possible, because MERGE is\nusually more efficient and because a view cannot be updatable if a temporary\ntable is used.\n\nA reason to choose TEMPTABLE explicitly is that locks can be released\non underlying tables after the temporary table has been created and before\nit is used to finish processing the statement.  This might result in quicker\nlock release than the MERGE algorithm so that other clients that use\nthe view are not blocked as long.\n\nA view algorithm can be UNDEFINED three ways:\n\n\n --- No ALGORITHM clause is present in the CREATE VIEW statement.\n\n --- The CREATE VIEW statement has an explicit ALGORITHM = UNDEFINED\nclause.\n\n --- ALGORITHM = MERGE is specified for a view that can be processed only\nwith a temporary table.  In this case, MySQL generates a warning and sets\nthe algorithm to UNDEFINED.\n\n\n\nAs mentioned earlier, MERGE is handled by merging corresponding parts\nof a view definition into the statement that refers to the view.  The\nfollowing examples briefly illustrate how the MERGE algorithm works.\nThe examples assume that there is a view v_merge that has this\ndefinition:\n\nCREATE ALGORITHM = MERGE VIEW v_merge (vc1, vc2) AS\nSELECT c1, c2 FROM t WHERE c3 > 100;\n\nExample 1: Suppose that we issue this statement:\n\nSELECT * FROM v_merge;\n\nMySQL handles the statement as follows:\n\n\n --- v_merge becomes t\n\n --- * becomes vc1, vc2, which corresponds to c1, c2\n\n --- The view WHERE clause is added\n\n\nThe resulting statement to be executed becomes:\n\nSELECT c1, c2 FROM t WHERE c3 > 100;\n\nExample 2: Suppose that we issue this statement:\n\nSELECT * FROM v_merge WHERE vc1 < 100;\n\nThis statement is handled similarly to the previous one, except that\nvc1 < 100 becomes c1 < 100 and the view WHERE clause is\nadded to the statement WHERE clause using an AND connective\n(and parentheses are added to make sure the parts of the clause are executed\nwith correct precedence).  The resulting statement to be executed becomes:\n\nSELECT c1, c2 FROM t WHERE (c3 > 100) AND (c1 < 100);\n\nEffectively, the statement to be executed has a WHERE clause of this\nform:\n\nWHERE (select WHERE) AND (view WHERE)\n\nThe MERGE algorithm requires a one-to relationship between the rows\nin the view and the rows in the underlying table. If this relationship does\nnot hold, a temporary table must be used instead.  Lack of a one-to-one\nrelationship occurs if the view contains any of a number of constructs:\n\n\n --- Aggregate functions (SUM(), MIN(), MAX(),\nCOUNT(), and so forth)\n\n --- DISTINCT\n\n --- GROUP BY\n\n --- HAVING\n\n --- UNION or UNION ALL\n\n --- Refers only to literal values (in this case, there is no underlying table)\n\n\nSome views are updatable. That is, you can use them in statements such as\nUPDATE, DELETE, or INSERT to update the contents of the\nunderlying table.  For a view to be updatable, there must be a one-to\nrelationship between the rows in the view and the rows in the underlying\ntable.  There are also certain other constructs that make a view\nnon-updatable. To be more specific, a view is not updatable if it contains\nany of the following:\n\n\n --- Aggregate functions (SUM(), MIN(), MAX(),\nCOUNT(), and so forth)\n\n --- DISTINCT\n\n --- GROUP BY\n\n --- HAVING\n\n --- UNION or UNION ALL\n\n --- Subquery in the select list\n\n --- Join\n\n --- Non-updatable view in the FROM clause\n\n --- A subquery in the WHERE clause that refers to a table in the\nFROM clause\n\n --- Refers only to literal values (in this case, there is no underlying table to\nupdate)\n\n --- ALGORITHM = TEMPTABLE (use of a temporary table always makes a view\nnon-updatable)\n\n\nWith respect to insertability (being updatable with INSERT\nstatements), an updatable view is insertable if it also satisfies these\nadditional requirements for the view columns:\n\n\n --- There must be no duplicate view column names.\n\n --- The view must contain all columns in the base table that do not have a\ndefault value.\n\n --- The view columns must be simple column references and not derived columns.\nA derived column is one that is not a simple column reference but is derived\nfrom an expression.  These are examples of derived columns:\n\n3.14159\ncol1 + 3\nUPPER(col2)\ncol3 / col4\n(subquery)\n\n\nA view that has a mix of simple column references and derived columns is not\ninsertable, but it can be updatable if you update only those columns that\nare not derived.  Consider this view:\n\nCREATE VIEW v AS SELECT col1, 1 AS col2 FROM t;\n\nThis view is not insertable because col2 is derived from an\nexpression. But it is updatable if the update does not try to update\ncol2.  This update is allowable:\n\nUPDATE v SET col1 = 0;\n\nThis update is not allowable because it attempts to update a derived column:\n\nUPDATE v SET col2 = 0;\n\nIt is sometimes possible for a multiple-table view to be updatable, assuming\nthat it can be processed with the MERGE algorithm.  For this to work,\nthe view must use an inner join (not an outer join or a UNION). Also,\nonly a single table in the view definition can be updated, so the SET\nclause must name only columns from one of the tables in the view.  Views\nthat use UNION ALL are disallowed even though they might be\ntheoretically updatable, because the implementation uses temporary tables to\nprocess them.\n\n\nFor a multiple-table updatable view, INSERT can work if it inserts into a\nsingle table.  DELETE is not supported.\n\nThe WITH CHECK OPTION clause can be given for an updatable view to\nprevent inserts or updates to rows except those for which the WHERE\nclause in the select_statement is true.\n', ', ');
INSERT INTO help_topic VALUES('360', 'TRIM', '23', '   TRIM([{BOTH | LEADING | TRAILING} [remstr] FROM] str)\n   TRIM(remstr FROM] str)\nReturns the string str with all remstr prefixes and/or suffixes\nremoved. If none of the specifiers BOTH, LEADING, or\nTRAILING is given, BOTH is assumed. If remstr is optional\nand not specified, spaces are removed.\n', 'mysql> SELECT TRIM(\'\'  bar   \'\');\n        -> \'\'bar\'\'\nmysql> SELECT TRIM(LEADING \'\'x\'\' FROM \'\'xxxbarxxx\'\');\n        -> \'\'barxxx\'\'\nmysql> SELECT TRIM(BOTH \'\'x\'\' FROM \'\'xxxbarxxx\'\');\n        -> \'\'bar\'\'\nmysql> SELECT TRIM(TRAILING \'\'xyz\'\' FROM \'\'barxxyz\'\');\n        -> \'\'barx\'\', ');
INSERT INTO help_topic VALUES('361', 'IS', '26', '   IS boolean_value\n   IS NOT boolean_value\nTests whether a value against a boolean value, where boolean_value can\nbe TRUE, FALSE, or UNKNOWN.\n', 'mysql> SELECT 1 IS TRUE, 0 IS FALSE, NULL IS UNKNOWN;\n        -> 1, 1, 1\nmysql> SELECT 1 IS NOT UNKNOWN, 0 IS NOT UNKNOWN, NULL IS NOT UNKNOWN;\n        -> 1, 1, 0', ');
INSERT INTO help_topic VALUES('362', 'GET_FORMAT', '14', '   GET_FORMAT(DATE|TIME|DATETIME, \'\'EUR\'\'|\'\'USA\'\'|\'\'JIS\'\'|\'\'ISO\'\'|\'\'INTERNAL\'\')\nReturns a format string. This function is useful in combination with the\nDATE_FORMAT() and the STR_TO_DATE() functions.\nThe three possible values for the first argument\nand the five possible values for the second argument result in 15 possible\nformat strings (for the specifiers used, see the table in the\nDATE_FORMAT() function description).\n     Function Call 	 Result\n   GET_FORMAT(DATE,\'\'USA\'\') 	 \'\'%m.%d.%Y\'\'\n   GET_FORMAT(DATE,\'\'JIS\'\') 	 \'\'%Y-%m-%d\'\'\n   GET_FORMAT(DATE,\'\'ISO\'\') 	 \'\'%Y-%m-%d\'\'\n   GET_FORMAT(DATE,\'\'EUR\'\') 	 \'\'%d.%m.%Y\'\'\n   GET_FORMAT(DATE,\'\'INTERNAL\'\') 	 \'\'%Y%m%d\'\'\n   GET_FORMAT(DATETIME,\'\'USA\'\') 	 \'\'%Y-%m-%d-%H.%i.%s\'\'\n   GET_FORMAT(DATETIME,\'\'JIS\'\') 	 \'\'%Y-%m-%d %H:%i:%s\'\'\n   GET_FORMAT(DATETIME,\'\'ISO\'\') 	 \'\'%Y-%m-%d %H:%i:%s\'\'\n   GET_FORMAT(DATETIME,\'\'EUR\'\') 	 \'\'%Y-%m-%d-%H.%i.%s\'\'\n   GET_FORMAT(DATETIME,\'\'INTERNAL\'\') 	 \'\'%Y%m%d%H%i%s\'\'\n   GET_FORMAT(TIME,\'\'USA\'\') 	 \'\'%h:%i:%s %p\'\'\n   GET_FORMAT(TIME,\'\'JIS\'\') 	 \'\'%H:%i:%s\'\'\n   GET_FORMAT(TIME,\'\'ISO\'\') 	 \'\'%H:%i:%s\'\'\n   GET_FORMAT(TIME,\'\'EUR\'\') 	 \'\'%H.%i.%S\'\'\n   GET_FORMAT(TIME,\'\'INTERNAL\'\') 	 \'\'%H%i%s\'\'\n  \nISO format is ISO 9075, not ISO 8601.\n\nAs of MySQL 4.1.4, TIMESTAMP can also be used;\nGET_FORMAT() returns the same values as for DATETIME.\n', 'mysql> SELECT DATE_FORMAT(\'\'2003-10-03\'\',GET_FORMAT(DATE,\'\'EUR\'\'));\n        -> \'\'03.10.2003\'\'\nmysql> SELECT STR_TO_DATE(\'\'10.31.2003\'\',GET_FORMAT(DATE,\'\'USA\'\'));\n        -> 2003-10-31\n@c Following is commented out because not yet implemented\n@c mysql> SET DATE_FORMAT=GET_FORMAT(DATE, \'\'USA\'\'); SELECT \'\'2003-10-31\'\';\n@c         -> 10-31-2003', ');
INSERT INTO help_topic VALUES('363', 'TINYBLOB', '1', '   TINYBLOB\n\nA BLOB column with a maximum length of 255\n(2^8 - 1) bytes.\n', ', ');
INSERT INTO help_topic VALUES('364', 'SAVEPOINT', '10', 'SAVEPOINT identifier\nROLLBACK TO SAVEPOINT identifier\n\nStarting from MySQL 4.0.14 and 4.1.1, InnoDB supports the SQL statements\nSAVEPOINT and ROLLBACK TO SAVEPOINT.\n', ', ');
INSERT INTO help_topic VALUES('365', 'IF', '9', '   IF(expr1,expr2,expr3)\nIf expr1 is TRUE (expr1 <> 0 and expr1 <> NULL) then\nIF() returns expr2, else it returns expr3.\nIF() returns a numeric or string value, depending on the context\nin which it is used.\n', 'mysql> SELECT IF(1>2,2,3);\n        -> 3\nmysql> SELECT IF(1<2,\'\'yes\'\',\'\'no\'\');\n        -> \'\'yes\'\'\nmysql> SELECT IF(STRCMP(\'\'test\'\',\'\'test1\'\'),\'\'no\'\',\'\'yes\'\');\n        -> \'\'no\'\', ');
INSERT INTO help_topic VALUES('366', 'PURGE', '6', ', 'PURGE MASTER LOGS TO \'\'mysql-bin.010\'\';\nPURGE MASTER LOGS BEFORE \'\'2003-04-02 22:46:26\'\';', ');
INSERT INTO help_topic VALUES('367', 'USER', '25', '   USER()\n\nReturns the current MySQL username and hostname.\n', 'mysql> SELECT USER();\n        -> \'\'davida@localhost\'\', ');
INSERT INTO help_topic VALUES('368', 'MPOINTFROMWKB', '13', '   MPointFromWKB(wkb[,srid])\n   MultiPointFromWKB(wkb[,srid])\nConstructs a MULTIPOINT value using its WKB representation and SRID.\n', ', ');
INSERT INTO help_topic VALUES('369', 'ALTER TABLE', '28', 'ALTER TABLE allows you to change the structure of an existing table.\nFor example, you can add or delete columns, create or destroy indexes, change\nthe type of existing columns, or rename columns or the table itself.  You can\nalso change the comment for the table and type of the table.\n', 'ALTER [IGNORE] TABLE tbl_name\n    alter_specification [, alter_specification] ...\n\nalter_specification:\n    ADD [COLUMN] column_definition [FIRST | AFTER col_name ]\n  | ADD [COLUMN] (column_definition,...)\n  | ADD INDEX [index_name] [index_type] (index_col_name,...)\n  | ADD [CONSTRAINT [symbol]]\n        PRIMARY KEY [index_type] (index_col_name,...)\n  | ADD [CONSTRAINT [symbol]]\n        UNIQUE [index_name] [index_type] (index_col_name,...)\n  | ADD [FULLTEXT|SPATIAL] [index_name] (index_col_name,...)\n  | ADD [CONSTRAINT [symbol]]\n        FOREIGN KEY [index_name] (index_col_name,...)\n        [reference_definition]\n  | ALTER [COLUMN] col_name {SET DEFAULT literal | DROP DEFAULT}\n  | CHANGE [COLUMN] old_col_name column_definition\n        [FIRST|AFTER col_name]\n  | MODIFY [COLUMN] column_definition [FIRST | AFTER col_name]\n  | DROP [COLUMN] col_name\n  | DROP PRIMARY KEY\n  | DROP INDEX index_name\n  | DROP FOREIGN KEY fk_symbol\n  | DISABLE KEYS\n  | ENABLE KEYS\n  | RENAME [TO] new_tbl_name\n  | ORDER BY col_name\n  | CONVERT TO CHARACTER SET charset_name [COLLATE collation_name]\n  | [DEFAULT] CHARACTER SET charset_name [COLLATE collation_name]\n  | DISCARD TABLESPACE\n  | IMPORT TABLESPACE\n  | table_options', ');
INSERT INTO help_topic VALUES('370', 'CHAR BYTE', '22', 'CHAR BYTE is an alias for CHAR BINARY.\n', ', ');
INSERT INTO help_topic VALUES('371', 'MERGE', '7', '\n@menu\n* MERGE table problems::        MERGE Table Problems\n@end menu\n\nThe MERGE storage engine was introduced in MySQL 3.23.25. It\nis also known as the MRG_MyISAM engine.\n\nA MERGE table is a collection of identical MyISAM tables that\ncan be used as one.  ``Identical\'\'\'\' means that all tables have\nidentical column and index information.  You can\'\'t merge tables in which the\ncolumns are listed in a different order, don\'\'t have exactly the same columns, or\nhave the indexes in different order.  However, any or all of the tables can be\ncompressed with myisampack.\nSee also : [myisampack, , myisampack].\nDifferences in table options such as AVG_ROW_LENGTH, MAX_ROWS,\nor PACK_KEYS do not matter.\n', 'mysql> CREATE TABLE t1 (\n    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,\n    ->    message CHAR(20));\nmysql> CREATE TABLE t2 (\n    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,\n    ->    message CHAR(20));\nmysql> INSERT INTO t1 (message) VALUES (\'\'Testing\'\'),(\'\'table\'\'),(\'\'t1\'\');\nmysql> INSERT INTO t2 (message) VALUES (\'\'Testing\'\'),(\'\'table\'\'),(\'\'t2\'\');\nmysql> CREATE TABLE total (\n    ->    a INT NOT NULL AUTO_INCREMENT,\n    ->    message CHAR(20), INDEX(a))\n    ->    TYPE=MERGE UNION=(t1,t2) INSERT_METHOD=LAST;', ');
INSERT INTO help_topic VALUES('372', 'CREATE TABLE', '28', 'CREATE TABLE creates a table with the given name.\nYou must have the CREATE privilege for the table.\n\nRules for allowable table names are given in [Legal names].\nBy default, the table is created in the current database.\nAn error occurs if the table exists, if there is no current database,\nor if the database does not exist.\n', 'CREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name\n    [(create_definition,...)]\n    [table_options] [select_statement]', ');
INSERT INTO help_topic VALUES('373', '>', '26', '   >\nGreater than:\n', 'mysql> SELECT 2 > 2;\n        -> 0', ');
INSERT INTO help_topic VALUES('374', 'MICROSECOND', '14', '   MICROSECOND(expr)\n\nReturns the microseconds from the time or datetime expression expr as a\nnumber in the range from 0 to 999999.\n', 'mysql> SELECT MICROSECOND(\'\'12:00:00.123456\'\');\n        -> 123456\nmysql> SELECT MICROSECOND(\'\'1997-12-31 23:59:59.000010\'\');\n        -> 10', ');
INSERT INTO help_topic VALUES('375', 'ANALYZE', '7', 'This statement analyzes and stores the key distribution for a table.\nDuring the analysis, the table is locked with a read lock.  This works on\nMyISAM and BDB tables and (as of MySQL 4.0.13) InnoDB\ntables. For MyISAM tables, this\nstatement is equivalent to using myisamchk -a.\n\nMySQL uses the stored key distribution to decide the order in which\ntables should be joined when you perform a join on something other than a\nconstant.\n', 'ANALYZE [LOCAL | NO_WRITE_TO_BINLOG] TABLE tbl_name [, tbl_name] ...', ');
INSERT INTO help_topic VALUES('376', 'CONSTRAINT', '7', 'The syntax of a foreign key constraint definition in InnoDB looks like\nthis:\n\n[CONSTRAINT symbol] FOREIGN KEY [id] (index_col_name, ...)\n    REFERENCES tbl_name (index_col_name, ...)\n    [ON DELETE {RESTRICT | CASCADE | SET NULL | NO ACTION | SET DEFAULT}]\n    [ON UPDATE {RESTRICT | CASCADE | SET NULL | NO ACTION | SET DEFAULT}]\n', 'CREATE TABLE product (category INT NOT NULL, id INT NOT NULL,\n                      price DECIMAL,\n                      PRIMARY KEY(category, id)) TYPE=INNODB;\nCREATE TABLE customer (id INT NOT NULL,\n                      PRIMARY KEY (id)) TYPE=INNODB;\nCREATE TABLE product_order (no INT NOT NULL AUTO_INCREMENT,\n                      product_category INT NOT NULL,\n                      product_id INT NOT NULL,\n                      customer_id INT NOT NULL,\n                      PRIMARY KEY(no),\n                      INDEX (product_category, product_id),\n                      FOREIGN KEY (product_category, product_id)\n                        REFERENCES product(category, id)\n                        ON UPDATE CASCADE ON DELETE RESTRICT,\n                      INDEX (customer_id),\n                      FOREIGN KEY (customer_id)\n                        REFERENCES customer(id)) TYPE=INNODB;', ');
INSERT INTO help_topic VALUES('377', 'FIELD', '23', '   FIELD(str,str1,str2,str3,...)\nReturns the index of str in the str1, str2,\nstr3, ... list.\nReturns 0 if str is not found.\nIf str is NULL, the return value is 0 because\nNULL fails equality comparison with any value.\nFIELD() is the complement of ELT().\n', 'mysql> SELECT FIELD(\'\'ej\'\', \'\'Hej\'\', \'\'ej\'\', \'\'Heja\'\', \'\'hej\'\', \'\'foo\'\');\n        -> 2\nmysql> SELECT FIELD(\'\'fo\'\', \'\'Hej\'\', \'\'ej\'\', \'\'Heja\'\', \'\'hej\'\', \'\'foo\'\');\n        -> 0', ');
INSERT INTO help_topic VALUES('378', 'MAKETIME', '14', '   MAKETIME(hour,minute,second)\n\nReturns a time value calculated from the hour, minute, and\nsecond arguments.\n', 'mysql> SELECT MAKETIME(12,15,30);\n        -> \'\'12:15:30\'\', ');
INSERT INTO help_topic VALUES('379', 'CURDATE', '14', '   CURDATE()\n\nReturns the current date as a value in \'\'YYYY-MM-DD\'\' or YYYYMMDD\nformat, depending on whether the function is used in a string or numeric\ncontext.\n', 'mysql> SELECT CURDATE();\n        -> \'\'1997-12-15\'\'\nmysql> SELECT CURDATE() + 0;\n        -> 19971215', ');
INSERT INTO help_topic VALUES('380', 'MIN MAX', '12', '   MIN([DISTINCT] expr)\n   MAX([DISTINCT] expr)\nReturns the minimum or maximum value of expr.  MIN() and\nMAX() may take a string argument; in such cases they return the\nminimum or maximum string value. See also : [MySQL indexes].\nThe DISTINCT keyword can be used as of MySQL 5.0.0 to find the minimum\nor maximum of the distinct values of expr; this is supported, but\nproduces the same result as omitting DISTINCT.\n', 'mysql> SELECT student_name, MIN(test_score), MAX(test_score)\n    ->        FROM student\n    ->        GROUP BY student_name;', ');
INSERT INTO help_topic VALUES('381', 'SET PASSWORD', '7', ', 'SET PASSWORD = PASSWORD(\'\'some password\'\')\nSET PASSWORD FOR user = PASSWORD(\'\'some password\'\')', ');
INSERT INTO help_topic VALUES('382', 'ENUM', '1', '   ENUM(\'\'value1\'\',\'\'value2\'\',...)\n\nAn enumeration.  A string object that can have only one value, chosen\nfrom the list of values \'\'value1\'\', \'\'value2\'\', ...,\nNULL or the special \'\'\'\' error value.  An ENUM column can\nhave a maximum of 65,535 distinct values.\nENUM values are represented internally as integers.\n', ', ');
INSERT INTO help_topic VALUES('383', 'DATABASE', '25', '   DATABASE()\nReturns the default (current) database name.\nAs of MySQL 4.1, the string has the utf8 character set.\n', 'mysql> SELECT DATABASE();\n        -> \'\'test\'\', ');
INSERT INTO help_topic VALUES('384', 'POINTFROMWKB', '13', '   PointFromWKB(wkb[,srid])\nConstructs a POINT value using its WKB representation and SRID.\n', ', ');
INSERT INTO help_topic VALUES('385', 'POWER', '4', '   POW(X,Y)\n   POWER(X,Y)\nReturns the value of X raised to the power of Y.\n', 'mysql> SELECT POW(2,2);\n        -> 4.000000\nmysql> SELECT POW(2,-2);\n        -> 0.250000', ');
INSERT INTO help_topic VALUES('386', 'ATAN', '4', '   ATAN(X)\nReturns the arc tangent of X, that is, the value whose tangent is\nX.\n', 'mysql> SELECT ATAN(2);\n        -> 1.107149\nmysql> SELECT ATAN(-2);\n        -> -1.107149', ');
INSERT INTO help_topic VALUES('387', 'STRCMP', '23', '   STRCMP(expr1,expr2)\nSTRCMP()\nreturns 0 if the strings are the same, -1 if the first\nargument is smaller than the second according to the current sort order,\nand 1 otherwise.\n', 'mysql> SELECT STRCMP(\'\'text\'\', \'\'text2\'\');\n        -> -1\nmysql> SELECT STRCMP(\'\'text2\'\', \'\'text\'\');\n        -> 1\nmysql> SELECT STRCMP(\'\'text\'\', \'\'text\'\');\n        -> 0', ');
INSERT INTO help_topic VALUES('388', 'INSERT DELAYED', '6', 'The DELAYED option for the INSERT statement is a\nMySQL extension to standard SQL that is very useful if you have clients\nthat can\'\'t wait for the INSERT to complete.  This is a common\nproblem when you use MySQL for logging and you also\nperiodically run SELECT and UPDATE statements that take a\nlong time to complete.  DELAYED was introduced in MySQL\n3.22.15.\n\nWhen a client uses INSERT DELAYED, it gets an okay from the server at\nonce, and the row is queued to be inserted when the table is not in use by\nany other thread.\n\nAnother major benefit of using INSERT DELAYED is that inserts\nfrom many clients are bundled together and written in one block. This is much\nfaster than doing many separate inserts.\n\nThere are some constraints on the use of DELAYED:\n\n\n --- INSERT DELAYED works only with MyISAM and ISAM\ntables.\nFor MyISAM tables, if there are no free blocks in the middle of the\ndata file, concurrent SELECT and INSERT statements are supported.\nUnder these circumstances, you very seldom need to use INSERT\nDELAYED with MyISAM.\nSee also : [MyISAM  storage engine,  , MyISAM storage engine].\n\n --- INSERT DELAYED should be used only for INSERT statements that\nspecify value lists. This is enforced as of MySQL 4.0.18.  The server ignores\nDELAYED for INSERT DELAYED ... SELECT statements.\n\n --- The server ignores\nDELAYED for INSERT DELAYED ... ON DUPLICATE UPDATE statements.\n\n --- Because the statement returns immediately before the rows are inserted,\nyou cannot use LAST_INSERT_ID() to get the AUTO_INCREMENT\nvalue the statement might generate.\n\n --- DELAYED rows are not visible to SELECT statements until they\nactually have been inserted.\n', 'INSERT DELAYED ...', ');
INSERT INTO help_topic VALUES('389', 'MEDIUMTEXT', '1', '   MEDIUMTEXT\n\nA TEXT column with a maximum length of 16,777,215\n(2^24 - 1) characters.\n', ', ');
INSERT INTO help_topic VALUES('390', 'LN', '4', '   LN(X)\nReturns the natural logarithm of X.\n', 'mysql> SELECT LN(2);\n        -> 0.693147\nmysql> SELECT LN(-2);\n        -> NULL', ');
INSERT INTO help_topic VALUES('391', 'LOG', '4', '   LOG(X)\n   LOG(B,X)\nIf called with one parameter, this function returns the natural logarithm\nof X.\n', 'mysql> SELECT LOG(2);\n        -> 0.693147\nmysql> SELECT LOG(-2);\n        -> NULL', ');
INSERT INTO help_topic VALUES('392', 'SET SQL_LOG_BIN', '6', 'SET SQL_LOG_BIN = {0|1}\n\nDisables or enables binary logging for the current connection\n(SQL_LOG_BIN is a session variable)\nif the client connects using an account that has the SUPER privilege.\nThe statement is refused with an error if the client does not have that\nprivilege. (Before MySQL 4.1.2, the statement was simply ignored in that case.)\n', ', ');
INSERT INTO help_topic VALUES('393', '!=', '26', '   <>\n   !=\nNot equal:\n', 'mysql> SELECT \'\'.01\'\' <> \'\'0.01\'\';\n        -> 1\nmysql> SELECT .01 <> \'\'0.01\'\';\n        -> 0\nmysql> SELECT \'\'zapp\'\' <> \'\'zappp\'\';\n        -> 1', ');
INSERT INTO help_topic VALUES('394', 'AES_DECRYPT', '17', '   AES_ENCRYPT(str,key_str)\n   AES_DECRYPT(crypt_str,key_str)\nThese functions allow encryption and decryption of data using the official\nAES (Advanced Encryption Standard) algorithm, previously known as \"Rijndael.\"\nEncoding with a 128-bit key length is used, but you can extend it up to\n256 bits by modifying the source. We chose 128 bits because it is much\nfaster and it is usually secure enough.\n\nThe input arguments may be any length. If either argument is NULL,\nthe result of this function is also NULL.\n\nBecause AES is a block-level algorithm, padding is used to encode uneven length\nstrings and so the result string length may be calculated as\n16*(trunc(string_length/16)+1).\n\nIf AES_DECRYPT() detects invalid data or incorrect padding, it\nreturns NULL. However, it is possible for AES_DECRYPT()\nto return a non-NULL value (possibly garbage) if the input data or\nthe key is invalid.\n\nYou can use the AES functions to store data in an encrypted form by\nmodifying your queries:\n', 'INSERT INTO t VALUES (1,AES_ENCRYPT(\'\'text\'\',\'\'password\'\'));', ');
INSERT INTO help_topic VALUES('395', 'DAYNAME', '14', '   DAYNAME(date)\nReturns the name of the weekday for date.\n', 'mysql> SELECT DAYNAME(\'\'1998-02-05\'\');\n        -> \'\'Thursday\'\', ');
INSERT INTO help_topic VALUES('396', 'COERCIBILITY', '25', '   COERCIBILITY(str)\nReturns the collation coercibility value of the string argument.\n', 'mysql> SELECT COERCIBILITY(\'\'abc\'\' COLLATE latin1_swedish_ci);\n        -> 0\nmysql> SELECT COERCIBILITY(USER());\n        -> 3\nmysql> SELECT COERCIBILITY(\'\'abc\'\');\n        -> 4', ');
INSERT INTO help_topic VALUES('397', 'INT', '1', '   INT[(M)] [UNSIGNED] [ZEROFILL]\n\nA normal-size integer. The signed range is -2147483648 to\n2147483647.  The unsigned range is 0 to 4294967295.\n\n   INTEGER[(M)] [UNSIGNED] [ZEROFILL]\n\nThis is a synonym for INT.\n', ', ');
INSERT INTO help_topic VALUES('398', 'RLIKE', '23', '   expr REGEXP pat\n   expr RLIKE pat\n\nPerforms a pattern match of a string expression expr against a pattern\npat.  The pattern can be an extended regular expression.  The syntax\nfor regular expressions is discussed in [Regexp].  Returns 1\nif expr matches pat, otherwise returns 0.  If either\nexpr or pat is NULL, the result is NULL.\nRLIKE is a synonym for REGEXP, provided for mSQL\ncompatibility.\n\nThe pattern need not be a literal string. For example, it can be specified\nas a string expression or table column.\n\nNote: Because MySQL uses the C escape syntax in strings (for example,\n\'\'\\n\'\' to represent newline), you must double any \'\'\\\'\' that you\nuse in your REGEXP strings.\n\nAs of MySQL 3.23.4, REGEXP is not case sensitive for normal (not\nbinary) strings.\n', 'mysql> SELECT \'\'Monty!\'\' REGEXP \'\'m%y%%\'\';\n        -> 0\nmysql> SELECT \'\'Monty!\'\' REGEXP \'\'.*\'\';\n        -> 1\nmysql> SELECT \'\'new*\\n*line\'\' REGEXP \'\'new\\\\*.\\\\*line\'\';\n        -> 1\nmysql> SELECT \'\'a\'\' REGEXP \'\'A\'\', \'\'a\'\' REGEXP BINARY \'\'A\'\';\n        -> 1  0\nmysql> SELECT \'\'a\'\' REGEXP \'\'^[a-d]\'\';\n        -> 1', ');
INSERT INTO help_topic VALUES('399', 'GLENGTH', '18', '   GLength(ls)\nReturns as a double-precision number the length of the LineString\nvalue ls in its associated spatial reference.\n', 'mysql> SET @ls = \'\'LineString(1 1,2 2,3 3)\'\';\nmysql> SELECT GLength(GeomFromText(@ls));\n+----------------------------+\n| GLength(GeomFromText(@ls)) |\n+----------------------------+\n|            2.8284271247462 |\n+----------------------------+', ');
INSERT INTO help_topic VALUES('400', 'RADIANS', '4', '   RADIANS(X)\nReturns the argument X, converted from degrees to radians.\n', 'mysql> SELECT RADIANS(90);\n        -> 1.570796', ');
INSERT INTO help_topic VALUES('401', 'COLLATION', '25', '   COLLATION(str)\nReturns the collation for the character set of the string argument.\n', 'mysql> SELECT COLLATION(\'\'abc\'\');\n        -> \'\'latin1_swedish_ci\'\'\nmysql> SELECT COLLATION(_utf8\'\'abc\'\');\n        -> \'\'utf8_general_ci\'\', ');
INSERT INTO help_topic VALUES('402', 'COALESCE', '26', '   COALESCE(value,...)\nReturns the first non-NULL value in the list.\n', 'mysql> SELECT COALESCE(NULL,1);\n        -> 1\nmysql> SELECT COALESCE(NULL,NULL,NULL);\n        -> NULL', ');
INSERT INTO help_topic VALUES('403', 'VERSION', '25', '   VERSION()\nReturns a string that indicates the MySQL server version.\nAs of MySQL 4.1, the string has the utf8 character set.\n', 'mysql> SELECT VERSION();\n        -> \'\'4.1.3-beta-log\'\', ');
INSERT INTO help_topic VALUES('404', 'MAKE_SET', '23', '   MAKE_SET(bits,str1,str2,...)\nReturns a set value (a string containing substrings separated by \'\',\'\'\ncharacters) consisting of the strings that have the corresponding bit in\nbits set.  str1 corresponds to bit 0, str2 to bit 1,\nand so on.  NULL values in str1, str2, ...\nare not appended to the result.\n', 'mysql> SELECT MAKE_SET(1,\'\'a\'\',\'\'b\'\',\'\'c\'\');\n        -> \'\'a\'\'\nmysql> SELECT MAKE_SET(1 | 4,\'\'hello\'\',\'\'nice\'\',\'\'world\'\');\n        -> \'\'hello,world\'\'\nmysql> SELECT MAKE_SET(1 | 4,\'\'hello\'\',\'\'nice\'\',NULL,\'\'world\'\');\n        -> \'\'hello\'\'\nmysql> SELECT MAKE_SET(0,\'\'a\'\',\'\'b\'\',\'\'c\'\');\n        -> \'\'\'\', ');
INSERT INTO help_topic VALUES('405', 'FIND_IN_SET', '23', '   FIND_IN_SET(str,strlist)\nReturns a value 1 to N if the string str is in the string list\nstrlist consisting of N substrings. A string list is a string\ncomposed of substrings separated by \'\',\'\' characters. If the first\nargument is a constant string and the second is a column of type SET,\nthe FIND_IN_SET() function is optimized to use bit arithmetic.\nReturns 0 if str is not in strlist or if strlist\nis the empty string.  Returns NULL if either argument is NULL.\nThis function does not work properly if the first argument contains a comma\n(\'\',\'\') character.\n', 'mysql> SELECT FIND_IN_SET(\'\'b\'\',\'\'a,b,c,d\'\');\n        -> 2', ');



DROP TABLE IF EXISTS host;
CREATE TABLE host (
   Host char(60) NOT NULL,
   Db char(64) NOT NULL,
   Select_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Insert_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Update_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Delete_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Create_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Drop_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Grant_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   References_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Index_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Alter_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Create_tmp_table_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Lock_tables_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   PRIMARY KEY (Host,Db)
);




DROP TABLE IF EXISTS tables_priv;
CREATE TABLE tables_priv (
   Host char(60) NOT NULL,
   Db char(64) NOT NULL,
   User char(16) NOT NULL,
   Table_name char(64) NOT NULL,
   Grantor char(77) NOT NULL,
   Timestamp timestamp DEFAULT 'CURRENT_TIMESTAMP',
   Table_priv set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter') NOT NULL,
   Column_priv set('Select','Insert','Update','References') NOT NULL,
   PRIMARY KEY (Host,Db,User,Table_name),
   KEY Grantor (Grantor)
);




DROP TABLE IF EXISTS time_zone;
CREATE TABLE time_zone (
   Time_zone_id int(10) unsigned NOT NULL auto_increment,
   Use_leap_seconds enum('Y','N') DEFAULT 'N' NOT NULL,
   PRIMARY KEY (Time_zone_id)
);




DROP TABLE IF EXISTS time_zone_leap_second;
CREATE TABLE time_zone_leap_second (
   Transition_time bigint(20) NOT NULL,
   Correction int(11) NOT NULL,
   PRIMARY KEY (Transition_time)
);




DROP TABLE IF EXISTS time_zone_name;
CREATE TABLE time_zone_name (
   Name char(64) NOT NULL,
   Time_zone_id int(10) unsigned NOT NULL,
   PRIMARY KEY (Name)
);




DROP TABLE IF EXISTS time_zone_transition;
CREATE TABLE time_zone_transition (
   Time_zone_id int(10) unsigned NOT NULL,
   Transition_time bigint(20) NOT NULL,
   Transition_type_id int(10) unsigned NOT NULL,
   PRIMARY KEY (Time_zone_id,Transition_time)
);




DROP TABLE IF EXISTS time_zone_transition_type;
CREATE TABLE time_zone_transition_type (
   Time_zone_id int(10) unsigned NOT NULL,
   Transition_type_id int(10) unsigned NOT NULL,
   Offset int(11) NOT NULL,
   Is_DST tinyint(3) unsigned NOT NULL,
   Abbreviation char(8) NOT NULL,
   PRIMARY KEY (Time_zone_id,Transition_type_id)
);




DROP TABLE IF EXISTS user;
CREATE TABLE user (
   Host varchar(60) NOT NULL,
   User varchar(16) NOT NULL,
   Password varchar(41) NOT NULL,
   Select_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Insert_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Update_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Delete_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Create_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Drop_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Reload_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Shutdown_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Process_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   File_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Grant_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   References_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Index_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Alter_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Show_db_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Super_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Create_tmp_table_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Lock_tables_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Execute_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Repl_slave_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   Repl_client_priv enum('N','Y') DEFAULT 'N' NOT NULL,
   ssl_type enum('','ANY','X509','SPECIFIED') NOT NULL,
   ssl_cipher blob NOT NULL,
   x509_issuer blob NOT NULL,
   x509_subject blob NOT NULL,
   max_questions int(11) unsigned NOT NULL,
   max_updates int(11) unsigned NOT NULL,
   max_connections int(11) unsigned NOT NULL,
   PRIMARY KEY (Host,User)
);

INSERT INTO user VALUES('localhost', 'root', '*BD580564C7C6DE6EFB62734625D1533B2BF772F5', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'rbiehler', '*A91F43E9FB696A6321D1BFFA6B3FBEE51284872C', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'joe', '*C2694435B5CF3EBC616D9DA1F8CC24EEAE8CE5B2', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'jay', '*C2A98188C78528FB3E818D9D5047A4E101105B48', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'jovita', '*F10F7C81E6735F2E55CEB62FE46A6A254F2F6AE4', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'matango', '*F10F7C81E6735F2E55CEB62FE46A6A254F2F6AE4', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'CodeDone_Main', '*A411CFE869E20A10E18847F371AE2AE667A26D87', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'lacy', '*49AD306A637E35C0A8AEF4B8F84BE62EED00341A', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'shibleyb', '*BF6BD2E92B77F9378DFC7A06BE3100691599911E', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'admin', '*FAD5B057223B9B729D10986A8347732DD41EE28F', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'lenhodgeman', '*4EAF03DE1489530508FC23B029FF86AE8124823E', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'PERRY', '*099F203D6552A3FBA82071CC3E0F08948A537C7B', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'girish', '*528C039E70BC0F64BDDABD26E1AA9E634AC4C448', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'mysticallady', '*B4056BAEEACB37FF4613E4FDAC64B25874D6E895', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'Nolte', '*2A64CD3E624F01926222A034B03C4BAA0B49EE9D', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'nolte', '*2A64CD3E624F01926222A034B03C4BAA0B49EE9D', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'BlogUser', '*7B3D93B0D028F50FFA3E4169B14392F0DA1524B8', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'kevin', '*0B4917F011EF21B1F0E2F12646F04E3E8A64D67F', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'philippe', '*0B4917F011EF21B1F0E2F12646F04E3E8A64D67F', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'hdit', '*63BE3FF219884BEFFB3317FF8DD8256170DEDA87', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'stephen', '*AA550D5340202C83F53F7AFDBB6EDE5EA226D454', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'nhughes', '*352132F54A07ECD9DC54A01D5A321FBC0726EC14', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'ameraabd', '*CA0E477495680F06A10FF041D2C7A63B689AA632', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'lenar', '*87D73F821C904980F66403F4B75DA51D9506D2BD', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'links_root', '*D61994AAB9327E97C4BECC73E497951CFC723C99', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'likvid', '*6F8214288B141B7C1499CD421DFAFFA4006E92EE', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'Panchu', '*24A154E138D2A8637B6CB0CA0E13C33922E9D397', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'bazerbashi', '*8F0DDD32B68EC510977D403E5B30112DBA3ABD83', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'crusprin', '*B153C2DDE3F1DC46D9B7A4A14122AA2F0F8F00EC', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'EZLOOKIN', '*7C1A6287F7D27266BDD97A73C133090245C46793', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'alex', '*113B1C732566564570507665CD44AD6C8AD2D95C', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'wabs27', '*26B7EA65D1E8A3CC0208CACA69D5ED6584E52D2B', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'wordpress', '*A411CFE869E20A10E18847F371AE2AE667A26D87', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'HCFFA1', '*34FB791C3558CB15ED9546AB9CD94F2E07C7538D', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'LDATA', '*7B00F482999DC500E4077DA8E72CF9DB148A10EF', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'osCom', '*FA683F61E6F91D40B4393CB768A0E72FD1B9D73E', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'rlkf', '*A405F30667A37B125A869A171BB2E79FA8B25F04', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'webuser', '*D7BE30BCCD3733109CC6EBD9B024858B3C735E7B', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'mysqladmin', '*722B466BDB8784168797F789F2FCFD2684D6A311', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');
INSERT INTO user VALUES('%', 'wwwuser', '*98A8F1CD2664C835CFCB4AA1334F25147C14E9D5', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', ', ', ', ', '0', '0', '0');



