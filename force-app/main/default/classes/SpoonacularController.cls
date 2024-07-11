public class SpoonacularController {
    public static void getRecipe(){
        Spoonacular__mdt spoon = [select Id,API_key__c,EndPoint_Api__c	from Spoonacular__mdt where DeveloperName='Spoonacular_Data'];
        HttpRequest req = new HttpRequest();
        string endpoint = spoon.EndPoint_Api__c+'?ingredients=apples,+flour,+sugar&number=2';
     	req.setEndpoint(endpoint);
        req.setHeader('x-api-key',spoon.API_key__c);
     	req.setMethod('GET');
        
       
        Http http = new Http();
     	HTTPResponse res = http.send(req);
        if(res.getStatusCode()==200){
            
            List<SpoonacularWrapper> spoonacularlsit = (List<SpoonacularWrapper>)JSON.deserialize(res.getBody(),List<SpoonacularWrapper>.class);
            System.debug('res.getBody====='+spoonacularlsit[0].UsedIngredients[0].name);
        }
     	
    }

}