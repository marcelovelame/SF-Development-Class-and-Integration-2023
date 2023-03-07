public with sharing class SearchAddressController {
    
    
    @AuraEnabled
    public static ZipCodeAddress searchAddress (String zipCode) {

        GetAddressOutbounService service = new GetAddressOutbounService();

        return service.findAddress(zipCode);
    }
}