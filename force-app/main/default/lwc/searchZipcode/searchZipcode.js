import { api, LightningElement } from 'lwc';
//import searchAddress from '@salesforce/apex/SearchAddressController.searchAddress';

export default class SearchZipcode extends LightningElement {

    @api
    zipCode;
    
    constructor () {
        super();
        console.log('SearchZipcode :::: : Run Constructor')

    }

    connectedCallback () {
        console.log('SearchZipcode ::::: Connected Callback')

    }
    renderedCallback () {
        console.log('SearchZipcode ::::: Rendered Callback')

    }

    handleBlur (event) {

        if (!event.target.value) return;

        searchAddress ( event.target.value).then(result => {

            this.publishAddressChanged();
        });
        console.log 

    }




    publishAddressChanged () {

        let searchedAddressEvent = new CustomEvent ('searchedaddress', {
            detail : {
                street : 'Rua Oscar Freire',
                streetNumber : '1375',
                additionalInfo : 'Apto 652',
                zipCode : '05409010',
                city : 'São Paulo',
                state : 'SP'
            }
        });

        this.dispatchEvent ( searchedAddressEvent );


    }








    
}