public class InegrationWithNews {
    public static void getnewsdetails(){
        HttpRequest req = new HttpRequest();
     	req.setEndpoint('https://newsapi.org/v2/top-headlines/sources?category=health');
     	req.setMethod('GET');
        req.setHeader('X-Api-Key','87d4c3f3af0345c1a4d2dcffa707d3c0');
        Http http = new Http();
     	HTTPResponse res = http.send(req);
        if(res.getStatusCode() == 200){
           NewsWrapper newsWrapper = (NewsWrapper) JSON.deserialize(res.getBody(), NewsWrapper.class);
            // Extract the sources list
            List<NewsWrapper.Sources> newwrapperlist = newsWrapper.sources;
            System.debug('newwrapperlist>>>>>>' + newwrapperlist);
            for(NewsWrapper.Sources a1:newwrapperlist){
               system.debug('a1==========='+a1.name);
            }
            
        }
     
    }
    
   
           

}