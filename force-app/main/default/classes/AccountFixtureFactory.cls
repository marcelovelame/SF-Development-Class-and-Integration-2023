/**
 * @author: mvelame - Salesforce
 */

@isTest
public class AccountFixtureFactory {

     //O ideal é o método ter no máximo 3 parâmetros, utilizado no cenário 4 parâmetros
     public static Account newAccount ( String name, String documentNumber,
                                        City__c city, Cnae__c cnae ) {
        
        Account account = newAccount( name, documentNumber );
        account.BillingCity__c = city.Id;
        account.BillingCity__r = city;
        account.Cnae__c = cnae.Id;
        account.Cnae__r = cnae;

    return account;
}
    
    //Método que gera uma instância
    public static Account newAccount ( String name, String documentNumber ) {

	    return new Account ( Name = name, 
				             DocumentNumber__c = documentNumber );
    }
    
    //Método que promove a criação de conta
    public static Account createAccount ( String name, String documentNumber ) {

	    return createAccount ( newAccount ( name, documentNumber ) );
    }

    public static Account createAccount(String name, String documentNumber, 
                                        City__c city, Cnae__c cnae ){

        return createAccount ( newAccount( name, documentNumber, city, cnae ) );
                                        }

    
    //Método que com create que sabe inserir no banco de dados
    public static Account createAccount ( Account account ) {
        insert account;
        return account;
    }

    public static Account newDefaultAccount () {
        
        String payload = '{"Name":"GenePoint","Type":"Customer - Channel","BillingStreet":"345 Shoreline Park\nMountain View, CA 94043\nUSA","BillingCity":"Mountain View","BillingState":"CA","BillingAddress":{"city":"Mountain View","country":null,"geocodeAccuracy":null,"latitude":null,"longitude":null,"postalCode":null,"state":"CA","street":"345 Shoreline Park\nMountain View, CA 94043\nUSA"},"ShippingStreet":"345 Shoreline Park\nMountain View, CA 94043\nUSA","ShippingAddress":{"city":null,"country":null,"geocodeAccuracy":null,"latitude":null,"longitude":null,"postalCode":null,"state":null,"street":"345 Shoreline Park\nMountain View, CA 94043\nUSA"},"Phone":"(650) 867-3450","Fax":"(650) 867-9895","AccountNumber":"CC978213","Sic":"3712","Industry":"Biotechnology","AnnualRevenue":30000000,"NumberOfEmployees":265,"Ownership":"Private","Description":"Genomics company engaged in mapping and sequencing of the human genome and developing gene-based drugs","Rating":"Cold","IsPartner":false,"IsCustomerPortal":false,"CustomerPriority__c":"Low","SLA__c":"Bronze","Active__c":"Yes","NumberofLocations__c":1,"UpsellOpportunity__c":"Yes","SLASerialNumber__c":"7324","SLAExpirationDate__c":"2022-06-21"}';
    
        return fromJson (payload);
    }

    public static Account fromJson ( String payload ) {
          
        return (Account) JSON.deserialize ( payload, Account.class);
    }

    public static Map<String, SObject> createIntegratedScenario () {

        Map<String, SObject> records = new Map<String, SObject> ();

        City__c city = CityFixtureFactory.createCity ();
        records.put ('city-sp', city);

        Cnae__c cnae = CnaeFixtureFactory.createCnae ();
        records.put ('cnae', cnae);

        Account account = createAccount('Velame Account', '42364324000159', city, cnae);
        records.put ('account', cnae);

        return records;

    }

}