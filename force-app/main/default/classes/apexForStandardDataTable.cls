public class apexForStandardDataTable {
    @AuraEnabled(cacheable=true)
        public static List<Contact> getContactRecord(String accId){
            List<Contact> conLst = [select Name,FirstName,LastName,Email,Phone from Contact where AccountId=:accId];
            return conLst;
        }
    

}