@RestResource(urlMapping='/createAccountRecord')
global class MyRestWebServices {
    @HttpPost
    global static void sendAccountRecord(){
        RestRequest req =  RestContext.request;
        RestResponse resp =  RestContext.response;
        
        AccountWrapper reqBody = (AccountWrapper)JSON.deserialize(req.requestBody.toString(),AccountWrapper.class);
        if(reqBody!=null){
            Account acc = new Account();
            acc.Name= reqBody.name;
            acc.Rating=reqBody.rating;
            acc.Type=reqBody.type;
            
            if(acc!=null){
                insert acc;
            }
        }
    }
    
    global class AccountWrapper{
        global String name;
        global String rating;
        global String type;
    }

}