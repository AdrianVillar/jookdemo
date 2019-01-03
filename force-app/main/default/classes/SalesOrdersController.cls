public with sharing class SalesOrdersController {

    @AuraEnabled
    public static String getSalesOrders(String id, String size){
        Account acc = AccountsSelector.selectById(id);

        Http h = new Http();
   		//HttpRequest request = new BuildWebServiceRequest().GetSapRequestByNamedCredential(acc.SAP_Account_ID__c, size);
        //HttpRequest request = new BuildWebServiceRequest().GetSapRequestByCustomSettings(acc.SAP_Account_ID__c, size);
        HttpRequest request = new BuildWebServiceRequest().GetSapRequestByCustomMetadata(acc.SAP_Account_ID__c, size);
        HttpResponse response = h.send(request);
       	system.debug('##getSalesOrders:' + response.getBody());
        return response.getBody();
	}

    public static void createSalesOrders(String id)
    {


    }

}
