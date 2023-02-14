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
   public List<Account> findByName (String name) {

      return [SELECT Id, Name, Type, BillingCity, BillingState, BillingPostalCode,
      BillingCountry, CreatedDate, CreatedBy.Name, 
      (SELECT Id, FirstName, LastName FROM Contacts)
      FROM Account
      WHERE Name 
      LIKE :name ];
     }

}





