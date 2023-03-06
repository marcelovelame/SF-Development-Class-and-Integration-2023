import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

/**
 * @author: mvelame - Salesforce
 */


export default class NewCase extends LightningElement {

    handleSuccess () {

        const toast = new ShowToastEvent({
            title: 'Case Success Created',
            message: 'Caso criado com sucesso!!! :D'

        });
        
        this.dispatchEvent(toast);
    }

}