/**
 * Classe Trigger Handler não pode ser grande!!!
 * A classe triggre handler delega.
 * 
 *  - Filtra (Filter)
 *  - Validar (Validator)
 *  - Enriquecer (Enricher)
 *  - Publicar(Publisher)
 * 
 * @author: mvelame - Salesforce
 */

public virtual with sharing class AccountTH extends TriggerHandler {
    
    List<Account> newAccounts; // = (List<Account> Trigger.new;

    Map<Id, Account> oldAccounts; //(Map<Id, Account>) Trigger.oldMap;

    AccountFilter filter;

    AccountValidator validator;

    
    public AccountTH(){
        this ( (List<Account>) Trigger.new, (Map<Id, Account>) Trigger.oldMap);
    }
    
    public AccountTH(List<Account> newAccounts, Map<Id, Account> oldAccounts ){
        
        this.newAccounts = newAccounts;
        this.oldAccounts = oldAccounts;

        this.filter = new AccountFilter();
        this.validator = new AccountValidator();

    }

    virtual
    override
    public void beforeInsert() {
        validateDocumentNumber();
    }
    
    virtual
    override
    public void beforeUpdate() {
        validateDocumentNumber();
        
    }

/**
    virtual
    override
    public void afterInsert() {

        System.debug ( 'Trigger de Conta acionada' + Trigger.operationType );
        System.debug ( JSON.serialize(newAccounts) );

    }
    
    virtual
    override
    public void afterUpdate() {

        System.debug ( 'Trigger de Conta acionada' + Trigger.operationType );
        System.debug ( JSON.serialize(newAccounts) );
        System.debug ( JSON.serialize(oldAccounts) );

    }
 */

    virtual
    public void validateDocumentNumber () {
            
        List<Account> filteredAccounts = this.filter.filterByChangedDocumentNumber (newAccounts, 
                                                                                    oldAccounts);
        this.validator.validateDocumentNumber(filteredAccounts);
        
    }


}