public class updateEmailOnContactApex {
    public static Boolean temp = true;
    public static void updateEmailField(List<Contact> Contactlst,Map<Id,Contact>oldMapCon){
        
        List<Account>accLst = new List<Account>();
        set<Id> conId = new set<Id>();
        set<Id> prestconId = new set<Id>();
        List<SObject> wholelist = new List<SObject>();
        
        for(Contact conlst:Contactlst){
            conId.add(conlst.AccountId);
            prestconId.add(conlst.Id);
            if(oldMapCon.get(conlst.Id).Email != conlst.Email){
                Account acc = new Account();
                acc.Id= conlst.AccountId;
                acc.AccountEmail__c=conlst.Email;
              //  accLst.add(acc);
                wholelist.add(acc);
            }
        }
        
        system.debug('searchCon??????'+conId);
        List<Contact>searchCon = [select Email,Id from Contact where AccountId=:conId AND Id NOT IN:prestconId];
        
        
        system.debug('searchCon??????9999999999'+searchCon.size());
        for(Contact c1:searchCon){
            if(temp){
            Contact con = new Contact();
            con.Id= c1.Id;
            con.Email = c1.Email;
            wholelist.add(con);
            }
            
        }
        system.debug('wholelist>>>>>>>>>>>>>>'+wholelist);
        
        if(wholelist!=null){
            system.debug('wholelist>>>>>>>>>>>>>>'+wholelist);
            temp=false;
            update wholelist;
            
        }
        
    }
    

}