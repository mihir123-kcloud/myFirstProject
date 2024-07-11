trigger updateEmailOnAcc on Account (after update) {
    
    if(trigger.isafter){
        if(UtlilityClass.isExecutingAcc){
        UtlilityClass.isExecutingCon=false;
       // updateEmailOnAccApex.updateEmailfiled(trigger.new,trigger.oldMap);
        }
    }
    
   /* if(trigger.isbefore){
        updateEmailOnAccApex.stopforupdation(trigger.new,trigger.oldMap);
    }*/

}