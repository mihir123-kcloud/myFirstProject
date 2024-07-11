public inherited sharing class getAccountDetails {
/*@AuraEnabled(cacheable=true)
public static List<Opportunity> getAccount(){
    List<Opportunity> lstOpp = [select Id,Account.Name,StageName from Opportunity];
    return lstOpp;
}*/

public static list<SObject> createSharingForStandardObject(String strShareObjectName, String strParentField, map<Id, set<Id>> mapObjectIdUserIds, String strAccessLevelFieldName, String strAccessLevel, String strRowCause) {
        SObjectType objectType = Schema.getGlobalDescribe().get(strShareObjectName);
    	system.debug('objectType>>>>>>>>>>>>>>>'+objectType);
        list<SObject> lstObjects = new list<SObject>();
        
        for(Id objectId : mapObjectIdUserIds.keySet()) {
          for(Id userOrGroupId : mapObjectIdUserIds.get(objectId)) {
            SObject shareRecord = objectType.newsObject();
            shareRecord.put(strParentField, objectId);
            shareRecord.put('UserOrGroupId', userOrGroupId);
            shareRecord.put(strAccessLevelFieldName, strAccessLevel);
            shareRecord.put('RowCause', strRowCause);
            lstObjects.add(shareRecord);
          }
        }
        
        if(!lstObjects.isEmpty()) {
         insert lstObjects;
        }
       return lstObjects;

}
}