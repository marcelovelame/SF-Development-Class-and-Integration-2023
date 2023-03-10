/**
@author mvelame - Salesforce
 */


public virtual class AccountRepository {
   
   //crud
   virtual
   public List<Account> findByName (String name) {

    return [SELECT Id, Name, Type, BillingCity, BillingState, BillingPostalCode, BillingCountry, CreatedDate
    FROM Account
    WHERE Name 
    LIKE :name ];
   }

   virtual
   public List<Account> findWithContactsByName (String name) {

      return [SELECT Id, Name, Type, BillingCity, BillingState, BillingPostalCode,
      BillingCountry, CreatedDate, CreatedBy.Name, 
      (SELECT Id, FirstName, LastName FROM Contacts)
      FROM Account
      WHERE Name 
      LIKE :name ];
     }

     virtual
     public List<Account> create (List<Account> accounts) {
      insert accounts;
      return accounts;
     }
     
     virtual
     public List<Account> store (List<Account> accounts) {
      update accounts;
      return accounts;
     }
     
     virtual
     public List<Account> remove (List<Account> accounts) {
      delete accounts;
      return accounts;
     }
}