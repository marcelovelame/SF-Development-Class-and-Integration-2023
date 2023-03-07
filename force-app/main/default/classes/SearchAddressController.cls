public with sharing class SearchAddressController {
    
    @AuraEnabled(cacheable=true)
    public static ZipCodeAddress searchAddress(String zipCode) {
        GetAddressOutbounService service = new GetAddressOutbounService();

        ZipCodeAddress address;

        try{
            address = service.findAddress(zipCode);
        } catch (Exception e ) {
            throw new AuraException (e.getMessage()); 
        }
        
        return address;
        
    }      
    
}