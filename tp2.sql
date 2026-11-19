Create table COMPTE_CCP  (
    Num_ccp  VARCHAR(10),
    Titulaire  VARCHAR(30)  NOT NULL,                  
    Solde INT                       ,
    Cle_securite INT,
    CONSTRAINT CHK_SOLDE CHECK (Solde >= 0),
    CONSTRAINT PK_COMPTE_CCP
     PRIMARY KEY (Num_ccp )
    );
 Insert into COMPTE_CCP (Num_ccp, Titulaire, Solde, Cle_securite)      
  values ('0017123456', 'Belkacemi', 20000, 45);
  Insert into COMPTE_CCP (Num_ccp, Titulaire, Solde, Cle_securite)      
  values ('0008987654', 'Meziane', 5000, 82); 
  commit ;
   DROP TABLE IF EXISTS COMPTE_CCP;
   SELECT * FROM COMPTE_CCP;
   
   UPDATE COMPTE_CCP
SET Solde = Solde - 5000
WHERE Num_ccp = '0017123456';
ROLLBACK;


UPDATE COMPTE_CCP
SET Solde = Solde - 5000
WHERE Num_ccp = '0017123456';
SAVEPOINT sp_debit;
UPDATE COMPTE_CCP
SET Solde = Solde - 50
WHERE Num_ccp = '0017123456';
ROLLBACK TO sp_debit;
UPDATE COMPTE_CCP
SET Solde = Solde + 5000
WHERE Num_ccp = '0008987654';
commit;
UPDATE COMPTE_CCP
SET Solde = 10000
WHERE Num_ccp = '0017123456';

COMMIT;

/*ROLLBACK cancels uncommitted changes and restores the previous state.
 & update lock the row for session 1 and s2 need to wait 