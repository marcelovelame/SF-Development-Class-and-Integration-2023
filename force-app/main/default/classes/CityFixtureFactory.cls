/**
 * @author: mvelame - Salesforce
 * 
 * Quando chama o método 'public City__c createCity(String ibge, String city){...}' ele encontra
 * o 'newCity(ibge, city)' dentro do bloco do método.
 * e depois chama o método 'public City__c newCity ( String ibge, String city ) {...}',
 * cria uma instância e depois chama o método 'public City__c createCity (City__c city){...}' que
 * insere no banco de dados
 */

 @isTest
public class CityFixtureFactory {

    //static SObject NewNomeObject --> cria a instancia do mesmo
    //static SObject createNOmeObject --> com os parametros do New chama o insere
    //static SObject createNOmeObject --> City insere no banco


    public static City__c newCity () {
    
        return newCity ('3550308', 'São Paulo');
    
    } 
    
    public static City__c newCity ( String ibge, String city ) {

        return new City__c ( IbgeCode__c = ibge, 
                             CityName__c = city );
    }

    public static City__c createCity () {
        
        return createCity ( newCity() );

    }
    
    public static City__c createCity ( String ibge, String city ) {

        return createCity ( newCity ( ibge, city ) );
    }
    
    public static City__c createCity ( String ibge, String city ) {

        return createCity ( newCity ( ibge, city ) );
    }
    
    public static City__c createCity ( City__c city ) {
        insert city;
        return city; 
    }

}