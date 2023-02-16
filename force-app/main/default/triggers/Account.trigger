//SObject
//  ^
//Account	

trigger Account on Account (before insert, before update, before delete, after insert, after update, after delete) {
    
    System.debug('Trigger de Conta acionada' + Trigger.operationType);

    List<Account> newAccounts = (List<Account>) Trigger.new;

    Map<Id, Account> oldAccounts = (Map<Id, Account>) Trigger.oldMap;

    Account account = newAccounts.get(0);
<<<<<<< HEAD
    if (oldAccounts.containsKey(account.Id)) {
        Account oldAccount = oldAccounts.get(account.Id);
    }
 
=======
    if(oldAccounts.containsKey(account.Id)) {
        Account oldAccount = oldAccounts.get(account.Id);
    }

>>>>>>> 59dde8e4b82d55b5f0313afc2865d4e513574f09

    System.debug('New Accounts');

    System.debug(JSON.serialize (newAccounts));

        if (oldAccounts != null && !oldAccounts.isEmpty()) {
            
            System.debug('Old Accounts');
            
            System.debug(JSON.serialize (oldAccounts));
        }
}

<<<<<<< HEAD

}


//Filtro
//Validação
//Enriquecimento
//Chamada Externa - Publicação
=======
//Filtro
//Enriquecendo
//
>>>>>>> 59dde8e4b82d55b5f0313afc2865d4e513574f09
