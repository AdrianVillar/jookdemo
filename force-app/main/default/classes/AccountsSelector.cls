global with sharing class AccountsSelector {

    public static Account selectById(String id){

		//TO-DO FLS
        return Database.query('SELECT Id, Name, SAP_Account_ID__c  FROM Account WHERE id=:id');
	}

}
