import { LightningElement,api,track,wire } from 'lwc';
import getAccountDeatils from '@salesforce/apex/getAccountDetails.getAccount'


export default class EditableDataTable extends LightningElement {

    @track columns=[{label:'Name',fieldName:'Name',editable:true},
         {label:'Opp Stage',fieldName:'Stage',editable:true}];

    @track dataList
    @track templist
    @track draftValues=[];

    @wire(getAccountDeatils)
    wiredData({ error, data }) {
      if (data) {
         
           this.templist=data.map(temp=>{
               console.log('temp.Account.Name : ',temp.Account.Name);
               return(
              {
                  'Name':temp.Account.Name,
                  'Stage':temp.StageName
              }
           )});
           this.draftValues = this.templist;

          console.log('OUTPUT >>>>>>>>: ',JSON.stringify(this.templist));
          
      } else if (error) {
        console.error('Error:', error);
      }
    }

    handleEditValue(event){
        
        console.log('OUTPUT : ',event.details.draftValues);
    }
    

}