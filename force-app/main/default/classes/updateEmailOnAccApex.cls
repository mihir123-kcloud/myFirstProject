public class updateEmailOnAccApex {
    public static void updateEmailfiled(List<Account> lstOfAcc,Map<Id,Account>oldAccMap){
        set<Id> accId = new set<Id>();
        List<Contact> updateCon = new List<Contact>();
        if(lstOfAcc!=null){
            for(Account acc:lstOfAcc){
                accId.add(acc.Id);
            }
        }
        
        List<Contact>searchLst = [select Id,Email,AccountId,Account.AccountEmail__c from Contact where AccountId=:accId];
        
        for(Contact conlst:searchLst){
            if(oldAccMap.get(conlst.AccountId).AccountEmail__c != conlst.Account.AccountEmail__c){
            Contact con = new Contact();
            con.Id = conlst.Id;
            con.Email=conlst.Account.AccountEmail__c;
            updateCon.add(con);
            }
        }
        
        if(updateCon!=null){
            update updateCon;
        }
    }
    
     
   /* public static void stopforupdation(List<Account> lstOfAcc,Map<Id,Account>oldAccMap){
        for(Account acc:lstOfAcc){
            if(oldAccMap.get(acc.Id).AccountEmail__c != acc.AccountEmail__c && !getUserProfileName='System Administrator'){
                acc.addError('you can not update the record');
           
            }
        }
        
    }*/

}