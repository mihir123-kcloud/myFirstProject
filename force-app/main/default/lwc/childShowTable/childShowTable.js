import { LightningElement } from 'lwc';
export default class ChildShowTable extends LightningElement {

    handleClick(){
        let selectEvent = new CustomEvent('select',{
            detail: {value:'I am from child compoentnt 4 to 6',
            value2:'this is value 2'}
        });
        this.dispatchEvent(selectEvent);
    }
}