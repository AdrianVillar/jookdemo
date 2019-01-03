public with sharing class BuildWebServiceRequest {

    /*
    public HttpRequest GetBuildWebServiceRequest(String url,String access_token){

        //OAuth2Wrapper objAuthenticationInfo = new CECC_RESTApiConnection().getAccessToken();
        //Build HTTP Request object
        HttpRequest request = new HttpRequest();
        if(access_token!=''){
            //request.setHeader('Authorization','Bearer '+objAuthenticationInfo.access_token);
            request.setHeader('Authorization','Bearer '+ access_token);
            request.setHeader('Content-Type','application/json');
            request.setHeader('accept','application/json');
            request.setMethod('GET');
            request.setEndpoint(url);
        }

        return request;
    }

    public HttpRequest GetSapRequestByNamedCredential(String sapAccountId, String size){
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('callout:SAP_Sales_Orders?$top='+ size + '&$filter=CreatedByUser eq \'' + sapAccountId + '\'');
        req.setHeader('APIKEY', '{!$Credential.Password}');
        req.setHeader('Accept','application/json');
        System.debug(req.getBody());

        return req;
    }

    public HttpRequest GetSapRequestByCustomSettings(String sapAccountId, String size){
        REST_API_Settings__c settings = REST_API_Settings__c.getInstance('SAP Sales Orders');
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint(settings.url__c+'?$top='+size);
        req.setHeader('APIKEY', settings.APIKey__c);
        req.setHeader('Accept','application/json');
        System.debug(req.getBody());

        return req;
    }
    */
    public HttpRequest GetSapRequestByCustomMetadata(String sapAccountId, String size){

        REST_API_Settings_Metadata__mdt settings = [SELECT Url__c, API_Key__c FROM REST_API_Settings_Metadata__mdt WHERE MasterLabel = 'SAP Sales Orders'];

        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint(settings.Url__c+'?$top=' + size + '&$filter=CreatedByUser eq \'' + sapAccountId + '\'&$orderby=TotalNetAmount desc');
        req.setHeader('APIKEY', settings.API_Key__c);
        req.setHeader('Accept','application/json');
        System.debug(req.getBody());

        return req;

    }
}
