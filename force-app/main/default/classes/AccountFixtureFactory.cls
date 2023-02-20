/**
 * @author: mvelame - Salesforce
 */


@isTest
public class AccountFixtureFactory {

    //Método que gera uma instância
    public static Account newAccount ( String name, String documentNumber ) {

	    return new Account ( Name = name, 
				             DocumentNumber__c = documentNumber );
    }
    
    //Método que promove a criação de conta
    public static Account createAccount ( String name, String documentNumber ) {

	    return createAccount ( newAccount ( name, documentNumber ) );
    }
    
    //Método que com create que sabe inserir no banco de dados
    public static Account createAccount ( Account account ) {
        insert account;
        return account;
    }

}