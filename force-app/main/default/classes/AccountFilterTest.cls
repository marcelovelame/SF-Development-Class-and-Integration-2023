/**
* @author: mvelame - Salesforce
*/

@isTest
public with sharing class AccountFilterTest {

    //BDD given When Then
    @isTest
    static void filterAccountsByDocumentNumberTest () {

    Map<String, SObject> records = AccountFixtureFactory.createIntegratedScenario ();

    List<Account> accounts = new List<Account> { 
        (Account) records.get ('account')
    };


    /**Inserçao de uma Account normalmente sem uma classe de FixtureFactory
        * 
        * accounts.add (new Account (Name = 'Teste 01', DocumentNumber__c = '54570553000109' ) );
        * accounts.add (new Account (Name = 'Teste 02', DocumentNumber__c = '42364324000159' ) );
        * insert accounts;
        * 
        */

        //Criação de uma Account chamando uma classe FixtureFactory, no exemplo AccountFixtureFactory
        /**List<Account> accounts = new List<Account> { 
            AccountFixtureFactory.createAccount( 'Teste 01', '42364324000159' )
        };
        */

        AccountFilter filter = new AccountFilter();

        List<Account> filteredAccounts = filter.filterByChangedDocumentNumber ( accounts, null );

        System.assertEquals ( accounts.size(), filteredAccounts.size() );
        
        filteredAccounts = filter.filterByChangedDocumentNumber ( accounts, new Map<Id, Account>() );
        
        System.assertEquals ( accounts.size(), filteredAccounts.size() );

        Map<Id, Account> oldAccounts = new Map<Id, Account>(accounts);
        
        Account changedAccount = accounts.get(0).clone(true, true, true, true);
        changedAccount.DocumentNumber__c = 'X';
        oldAccounts.put(changedAccount.Id, changedAccount);

        filteredAccounts = filter.filterByChangedDocumentNumber(accounts, oldAccounts);

        System.assertNotEquals ( accounts.size(), filteredAccounts.size() );
        System.assert ( filteredAccounts.size() == 1 );
        
        accounts = new List<Account>();
        accounts.add(new Account (Name = 'Teste01') );
        accounts.add(new Account (Name = 'Teste02') );
        
        filteredAccounts = filter.filterByChangedDocumentNumber ( accounts, null );
        
        System.assert ( filteredAccounts.isEmpty() );
    }

}