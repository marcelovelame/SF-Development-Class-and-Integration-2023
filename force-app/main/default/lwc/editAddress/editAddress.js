import { api, LightningElement } from 'lwc';

export default class EditAddress extends LightningElement {

    @api
    address;

    constructor () {
        super();
        console.log('EditAddress ::::: Run Constructor')

        this.address = {
                street : 'Avenida Brigadeiro Faria Lima',
                streetNumber : '1200',
                additionalInfo : 'Apto 652',
                zipCode : '05426200',
                city : 'São Paulo',
                state : 'SP'
        }
    }

    connectedCallback () {
        console.log('EditAddress ::::: Connected Callback')

    }
    renderedCallback () {
        console.log('EditAddress ::::: Rendered Callback')

    }


    handleSearchedAddress (event) {

        console.log ( JSON.stringify ( event.detail ) );
        this.address = event.detail;

    }




}