BEGIN;
  CREATE TABLE fl_bildertypen (
    "name" character varying(50) NOT NULL, 
    titel character varying(100),
    width integer NOT NULL, 
    height integer NOT NULL, 

    CONSTRAINT fl_bildertypen_pk PRIMARY KEY ("name"), 
    CONSTRAINT fl_bildertypen_check_positivezahlen CHECK (width >= 0 AND height >= 0)
  );

  INSERT INTO fl_bildertypen ( "name", titel, width, height ) VALUES
    ('cover', 'Cover', 300, 300);
  INSERT INTO fl_bildertypen ( "name", titel, width, height ) VALUES
    ('account', 'Account', 300, 300);
  INSERT INTO fl_bildertypen ( "name", titel, width, height ) VALUES
    ('merchandise', 'Merchandise', 300, 0);
  INSERT INTO fl_bildertypen ( "name", titel, width, height ) VALUES
    ('kleidung', 'Kleidung', 300, 0);
  INSERT INTO fl_bildertypen ( "name", titel, width, height ) VALUES
    ('poster', 'Poster', 300, 0);
  INSERT INTO fl_bildertypen ( "name", titel, width, height ) VALUES
    ('dvd', 'DVD/CD', 300, 420);

  CREATE TABLE fl_bilder_daten (
    id serial, 
    bildertyp character varying(50) NOT NULL, 
    titel character varying(100), 
    tags character varying(255), 
    beschreibung text, 
    account_id integer, 

    CONSTRAINT fl_bilder_pk PRIMARY KEY (id), 
    CONSTRAINT fl_bilder_fk_accounts 
      FOREIGN KEY (account_id) REFERENCES fl_accounts (id) 
      ON UPDATE CASCADE ON DELETE SET NULL, 
    CONSTRAINT fl_bilder_fk_bildertypen 
      FOREIGN KEY (bildertyp) REFERENCES fl_bildertypen ("name")
      ON UPDATE CASCADE ON DELETE NO ACTION
  );


  CREATE OR REPLACE VIEW fl_bilder AS
    SELECT b.id AS id, b.account_id AS account_id, t.name AS kategorie, 
      b.titel AS titel, b.tags AS tags, b.beschreibung AS beschreibung, 
      t.width AS width, t.height AS height
    FROM fl_bilder_daten AS b
    INNER JOIN fl_bildertypen AS t ON ( b.bildertyp = t.name );

  CREATE OR REPLACE RULE fl_bilder_insert AS ON INSERT TO fl_bilder
  DO INSTEAD 
    INSERT INTO fl_bilder_daten ( bildertyp, titel, tags, beschreibung, account_id )
    VALUES ( NEW.kategorie, NEW.titel, NEW.tags, NEW.beschreibung, NEW.account_id );
    

  CREATE OR REPLACE RULE fl_bilder_update AS ON UPDATE TO fl_bilder
  DO INSTEAD
    UPDATE fl_bilder_daten SET
      id = NEW.id,
      account_id = NEW.account_id,
      bildertyp = NEW.kategorie,
      titel = NEW.titel,
      tags = NEW.tags,
      beschreibung = NEW.beschreibung
    WHERE id = OLD.id;

  CREATE OR REPLACE RULE fl_bilder_delete AS ON DELETE TO fl_bilder
  DO INSTEAD
    UPDATE fl_bilder_daten SET
      account_id = NULL
    WHERE id = OLD.id;
COMMIT;
