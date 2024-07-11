import { LightningElement,api,wire } from 'lwc';
import getContactRecord from '@salesforce/apex/apexForStandardDataTable.getContactRecord';
import { updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const columns = [
    { label: 'First Name', fieldName: 'FirstName',editable:true },
    { label: 'Last Name', fieldName: 'LastName',editable:true },
    { label: 'Phone', fieldName: 'Phone', type: 'phone',editable:true },
    { label: 'Email', fieldName: 'Email', type: 'email',editable:true },
];
export default class PracticeStandardDataTable extends LightningElement {

    @api recordId;
    contactData=[];
    columns = columns;
    draftValues=[];


    @wire(getContactRecord, { accId: '$recordId' })
    getConOutput({ error, data }) {
      if (data) {
        this.contactData=data;
      } else if (error) {
         console.error('Error:', error);
      }
    }


    /* getSelectedName(event){
        const selectedRows = event.detail.selectedRows;
        // Display that fieldName of the selected rows
        for (let i = 0; i < selectedRows.length; i++) {
            alert('You selected: ' + selectedRows[i].Id);
        }
    } */

     async handleSave(event){
        console.log('OUTPUT :423 ',JSON.stringify(this.draftValues));
        let records= event.detail.draftValues;
        console.log('OUTPUT : ',records);
        let updateRecordArray = records.map(item => {
            let filedInput ={...item};
            return {
                fields: filedInput
            };
        });

        console.log('OUTPUT : updateRecordArray',JSON.stringify(updateRecordArray));

        this.draftValues=[];
        let updateArrayPromise=updateRecordArray.map((item=>
            updateRecord(item)
        ));

        await Promise.all(updateArrayPromise);
        const eventtoast = new ShowToastEvent({
            title: 'Get Help',
            message:
                'Salesforce documentation is available in the app. Click ? in the upper-right corner.',
        });
        this.dispatchEvent(eventtoast);
    }
}