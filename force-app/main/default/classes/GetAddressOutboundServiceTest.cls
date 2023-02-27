/**
 * @author: mvelame - Salesforce
 */

 @isTest
public with sharing class GetAddressOutboundServiceTest {

    @isTest
    public static void givenZipCodeWhenCallViaCepServiceThenReturnValidZipCodeAddress () {

        //BDD
        //Given
        //When
        //Then
        String payload = '{"cep": "01001-000", "logradouro": "Praça da Sé", "complemento": "lado ímpar", "bairro": "Sé", "localidade": "São Paulo","uf": "SP", "ibge": "3550308","gia": "1004", "ddd": "11", "siafi": "7107"}';
        

        Test.setMock( HttpCalloutMock.class, new ViaCepSuccessHttpMock(payload) );

        Test.startTest();

        GetAddressOutbounService service = new GetAddressOutbounService ();
        ZipCodeAddress response = service.findAddress('01001000');

        Test.stopTest();

        System.assertEquals ( '01001-000', response.zipCode );
        System.assertEquals ( 'Praça da Sé', response.street );
        System.assertEquals ( 'São Paulo', response.city );

    }

    @isTest
    public static void givenZipCodeWhenCallViaCepServiceThenFailToReturnAndThrowException () {

        //BDD
        //Given
        //When
        //Then
        String payload = '{ "code" : "400", "message" : "fail to return" }';
        
        

        Test.setMock( HttpCalloutMock.class, new viaCepFailHttpMock(payload) );

        Test.startTest();

        GetAddressOutbounService service = new GetAddressOutbounService ();

        try {
            
            ZipCodeAddress response = service.findAddress('01001000');

            System.assert(false, 'Exception expected');

        } catch (CalloutException e) {
            
            System.assert(true);

        }

        Test.stopTest();

    }
    
    public class viaCepSuccessHttpMock implements HttpCalloutMock {

        String payload;

        public viaCepSuccessHttpMock (String payload) {
            this.payload = payload;
        }

        public HttpResponse respond (HttpRequest request) {

            HttpResponse response = new HttpResponse();

            response.setBody(payload);
            response.setStatusCode(200);

            return response;
        }


    }

    public class viaCepFailHttpMock implements HttpCalloutMock {

        String payload;

        public viaCepFailHttpMock (String payload) {
            this.payload = payload;
        }

        public HttpResponse respond (HttpRequest request) {

            HttpResponse response = new HttpResponse();

            response.setBody(payload);
            response.setStatusCode(400);

            return response;
        }

    }

}