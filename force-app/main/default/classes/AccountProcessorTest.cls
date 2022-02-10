@isTest
public class AccountProcessorTest{
    public static testMethod void tstCoverageContactCount(){
        
        List<Id> lstOfAccount = new List<Id>();
        
        Account acc = new Account();
        acc.name = 'Test Hasan';
        insert acc;
        lstOfAccount.add(acc.Id);
        System.AssertEquals('Test Hasan',acc.Name);
        
        Contact c = new Contact();
        c.accountid = acc.Id;
        c.LastName = 'Hasan';
        Insert c;
        System.AssertEquals(acc.Id,c.accountid);
        
        acc.Number_of_Contacts__c = 1;
        Update acc;
        
        Test.startTest();
        AccountProcessor.countContacts(lstOfAccount);
        Test.stopTest();
        
        
    }

}