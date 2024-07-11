import { LightningElement,api,track,wire } from 'lwc';
//import callApex from '@salesforce/apex/callApex.getaccount';
import getContacts from '@salesforce/apex/callApex.getContacts';
import { updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';


const columns = [
    {
        label: 'Name',
        fieldName: 'Name',
        type: 'text',
    }, {
        label: 'FirstName',
        fieldName: 'FirstName',
        type: 'text',
        editable: true,
    }, {
        label: 'LastName',
        fieldName: 'LastName',
        type: 'text',
        editable: true,
    }, {
        label: 'Phone',
        fieldName: 'Phone',
        type: 'phone',
        editable: true
    }
];
export default class ShowTable extends LightningElement {

/*     a=3;
 b=4;
    connectedCallback() {
        
        this.add(this.a,this.b);
    } */

    /* @api enterName;
    @track showAccountLst=[];

    handlechange(event){
        this.enterName= event.target.value;
        if(this.enterName.length === 0){
            this.showAccountLst=[];
        }
        else{
            this.showAccLst();
        }
        
    }

    showAccLst(){
        callApex({enterVal:this.enterName})
        .then(result=>{
             */
           // 
           /* for(let i=0;i<result.length;i++){
               console.log('OUTPUT : hello',result[i].Name);
               for(let j=0;j<result[i].Name.length;j++){
                   console.log('OUTPUT : ',result[i].Name[j]);
                   if(result[i].Name[j]==this.enterName){
                       console.log('OUTPUT conform: ',);
                       this.showAccountLst.push({
                           Name:result[i].Name,
                           Phone:result[i].Phone
                       });
                       break;
                       
                   }
                   
               }
           } */
          /*  this.showAccountLst=result;
            console.log('OUTPUT this.showAccountLst: ',JSON.stringify(this.showAccountLst));    
        }) */
        
/*     handleClickHere(event){
        alert('hello');
        console.log('OUTPUT >>>>>>>>>: ',event.detail.value);
        console.log('OUTPUT >>>>>>>>>: ',event.detail.value2);
    }

    
sayHello(){
    console.log('hello : ');
}

sayHi(){
    console.log('Hi: ',);
}

add(num1,num2){
    this.sayHello();
    this.sayHi();
    console.log('OUTPUT : ',num1+num2);
} */

columns = columns;
    @track contacts;
    saveDraftValues = [];
 
    @wire(getContacts)
    contactData(result) {
        this.contacts = result;
        if (result.error) {
            this.contacts = undefined;
        }
    };
 
    handleSave(event) {
        this.saveDraftValues = event.detail.draftValues;
        console.log('this.saveDraftValues>>>>>>>> : ',JSON.stringify(this.saveDraftValues));
        console.log('this.saveDraftValues.slice()>>>>>>> : ',JSON.stringify(this.saveDraftValues.slice()));
        const recordInputs = this.saveDraftValues.slice().map(draft => {
            const fields = Object.assign({}, draft);
            return { fields };
        });
 
        // Updateing the records using the UiRecordAPi
        const promises = recordInputs.map(recordInput => updateRecord(recordInput));
        Promise.all(promises).then(res => {
            this.ShowToast('Success', 'Records Updated Successfully!', 'success', 'dismissable');
            this.saveDraftValues = [];
            return this.refresh();
        }).catch(error => {
            this.ShowToast('Error', 'An Error Occured!!', 'error', 'dismissable');
        }).finally(() => {
            this.saveDraftValues = [];
        });
    }
 
    ShowToast(title, message, variant, mode){
        const evt = new ShowToastEvent({
                title: title,
                message:message,
                variant: variant,
                mode: mode
            });
            this.dispatchEvent(evt);
    }
 
    // This function is used to refresh the table once data updated
    async refresh() {
        await refreshApex(this.contacts);
    }



 
}