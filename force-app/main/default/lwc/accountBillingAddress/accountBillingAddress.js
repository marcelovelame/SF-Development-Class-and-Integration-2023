import { api, LightningElement } from 'lwc';

export default class AccountBillingAddress extends LightningElement {

    billingAddress;

    constructor () {
        super();
        console.log('AccountBillingAddress ::::: Run Constructor')

        this.billingAddress = {
            street : 'Rua Oscar Freire',
            streetNumber : '961',
            additionalInfo : 'Apto 442',
            zipCode : '05515-100',
            city : 'São Paulo',
            state : 'SP'
        }


    }

    connectedCallback () {
        console.log('AccountBillingAddress ::::: Connected Callback')

    }
    renderedCallback () {
        console.log('AccountBillingAddress ::::: Rendered Callback')

    }

    handleChangedAddress (event) {
        this.billingAddress = event.detail;
        console.log('billingAddress changed');
    }




}