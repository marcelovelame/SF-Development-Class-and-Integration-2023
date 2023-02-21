/**
 * @author: mvelame - Salesforce
 */

 @isTest
public class CnaeFixtureFactory {
   
    public static Cnae__c newCnae () {
        return new Cnae__c ( Cnae__c = '23123',
                             Description__c = 'XXXXX');
    }

    public static Cnae__C createCnae () {
        return createCnae ( newCnae () );
    }
    
    public static Cnae__c createCnae ( Cnae__C cnae ) {
        insert cnae;
        return cnae;
    }

}