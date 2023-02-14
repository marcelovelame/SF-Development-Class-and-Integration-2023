// NomeDaClasse

// <public | private | global> [modificadores] Class <NomeDaClasse> {

//}


public virtual class Customer {

    public Decimal amount;
    protected Double descount;
    Integer 
    String name;
    String status;
    CustomerType type;

    List<Contact> contacts;

    Set<Contact> createdContacts;


    //index
    Map<String, Contact> regionContacts = new Map<String, Contact> {
        'SP' => new Contact ( FirstName = 'Vela')
        , 'SP' => new Contact ( FirstName = 'Velame')
    };
    

    //agrupamento
    Map<String, List<Contact>> contactsByRegion = new Map<String, List<Contact>> {
        'SP' => new List<Contact> { new Conntact ( FirstName = 'Vela' ) }
        , 'SP' => new List<Contact> { new Contact ( FirstName = 'Velame' ) }
    };


    public List<Contact> filterContactsByRegion () {
        List<Contact> filteredContacts = new List <Contact>();
    
    for (Contact contact : this.contacts) {
    
        if (contact.Name == 'XXX') {
            filteredContacts.add(contact);
        }
    }
    
        return contacts;
    }

    
    // [modificadores] <Tipo de Retorno> nomeDoMetodo ([Parametros...]) {}
    //
    // [public | protect | private | default]
    
    virtual
    public void save () {

        String value = '';

    }

    enum CustomerType {

        PRIME, STANDARD, PREMIUM
       
    }

}