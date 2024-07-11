trigger updateEmailOnContact on Contact (after update) {
    if(trigger.isafter){
        //if(UtlilityClass.isExecutingCon){
   // UtlilityClass.isExecutingAcc=false;
        if(updateEmailOnContactApex.temp){
    updateEmailOnContactApex.updateEmailField(trigger.new,trigger.oldMap);
        }

    }
}