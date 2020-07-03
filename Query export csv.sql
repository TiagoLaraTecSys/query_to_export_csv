SELECT * FROM industri_MultiLogger.teste;

-- Query com prepare statement para sufixo com data

SET @ts = date_format(NOW(),'_%Y_%m_%d_%H_%i_%s');

SET @folder = '/media/sd/';
SET @prefix = 'relatório';
SET @EXT	= '.CSV';

SET @UN = "(SELECT 'ID','TURNO','DTDATA') UNION";
SET @CMD = CONCAT("(SELECT * FROM teste INTO OUTFILE '", @FOLDER, @prefix,@ts,@EXT,
 "' FIELDS ENCLOSED BY '\"' TERMINATED BY ';' ESCAPED BY '\"'", " LINES TERMINATED BY '\r\n');");
 SET @quer = CONCAT(@UN,@CMD);
 
 PREPARE statement FROM @quer;
 
 EXECUTE statement;

-- Query comum
(SELECT 'ID','TURNO','DTDATA')
UNION
(SELECT id, turno, dtdata from teste into outfile '/media/sd/teste2.csv'
FIELDS ENCLOSED BY '"'
terminated by ';'
escaped by '"'
lines terminated by '\r\n');
