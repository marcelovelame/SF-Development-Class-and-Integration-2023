/**
 * 
 * @author: mvelame - Salesforce
 * Customer
 *    ^
 * SpecialCustomer
 *      ^
 * MegaSpecialCustomer
*/

public virtual class SpecialCustomer extends Customer implements Notificable {
   
    public SpecialCustomer () {
        this.descount = 0;

    }

    override
    public void save () {

        String value = '';
    }

    public void notify () {

    }

}