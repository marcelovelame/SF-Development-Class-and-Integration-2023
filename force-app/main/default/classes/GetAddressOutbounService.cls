/**
 * @author: mvelame - Salesforce
 */

public with sharing class GetAddressOutbounService {

    ZipCodeAddressTransformer transformer;

    public GetAddressOutbounService () {
        transformer = new ZipCodeAddressTransformer();
    }



    public ZipCodeAddress findAddress(String zipCode) {

        return transformer.toAddress ( findViaCepAddress(zipCode) );


    }
   
    private ViaCepAddressResponse findViaCepAddress ( String zipCode ) {

        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://viacep.com.br/ws/' + zipCode + '/json');
        request.setMethod('GET');
        
        Http http = new Http();
        HttpResponse response = http.send(request);

        String payload = response.getBody();

        System.debug('Status -----' + response.getStatus());
        System.debug('Status Code -----' + response.getStatusCode());

        System.debug(payload);

        if (response.getStatusCode() >= 400) {
            throw new CalloutException ('service unavailable');
        }

        return ( ViaCepAddressResponse ) JSON.deserialize(payload, ViaCepAddressResponse.class);
        
    }
}