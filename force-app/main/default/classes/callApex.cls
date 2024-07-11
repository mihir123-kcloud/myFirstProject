public class callApex {
    @AuraEnabled(cacheable=true)
    public static List<Account> getaccount(String enterVal){
        String enterValue = enterVal+'%';
        List<Account> acclst = [select Name,Phone from Account where Name LIKE : enterValue];
        System.debug('acclst>>>>>>>>>>>>'+acclst);
        return acclst;
    }

    @AuraEnabled(Cacheable = true)
    public static List<Contact> getContacts() {
        return [SELECT Id, Name, FirstName, LastName, Phone, Email 
                FROM Contact 
                limit 20];
    }


}