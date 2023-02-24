/**
 * @author: mvelame - Salesforce
 */

public with sharing class GetAddressOutbounService {
   
    public ViaCepAddressResponse findAddress ( String zipCode ) {

        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://run.mocky.io/v3/d15a4704-259e-49db-ab0e-4fd4f598db62');
        request.setMethod('GET');
        
        Http http = new Http();
        HttpResponse response = http.send(request);

        String payload = response.getBody();
        System.debug('Status -----' + response.getStatus());
        System.debug('Status Code -----' + response.getStatusCode());
        System.debug(payload);



        return ( ViaCepAddressResponse ) JSON.deserialize(payload, ViaCepAddressResponse.class);
        
    }
}