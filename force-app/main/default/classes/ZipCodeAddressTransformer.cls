/**
 * @author: mvelame - Salesforce
 */

public with sharing class ZipCodeAddressTransformer {
   
    public ZipCodeAddress toAddress ( ViaCepAddressResponse viaCepAddress ) {

        ZipCodeAddress address = new ZipCodeAddress ();
        address.street = viaCepAddress.logradouro;
        address.state = viaCepAddress.uf;
        address.zipCode = viaCepAddress.cep;
        address.city = viaCepAddress.localidade;

        System.debug( address );

        return address;

    }
}