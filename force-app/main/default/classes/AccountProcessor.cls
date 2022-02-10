Public Class AccountProcessor{
  @future
  public static void countContacts(List<Id> accountIds) {
    
    FirstMethod(accountIds);
    SecondMethod(accountIds);
   
  
  
  
  }
  
  private static void SecondMethod(List<Id> accountIds){
      List<Account> accountsToUpdate= new List<Account>();
      for (AggregateResult ar : [SELECT AccountId AcctId, Count(id) ContactCount 
                               FROM Contact 
                               WHERE AccountId in: accountIds
                               GROUP BY AccountId]){
        Account a = new Account();
        a.Id = (Id) ar.get('AcctId'); //---> handy trick for updates, set the id and update
        a.Number_of_Contacts__c= (Integer) ar.get('ContactCount');
        accountsToUpdate.add(a);
    }
    
    update accountsToUpdate;
  
  }
  private static void FirstMethod(List<Id> accountIds)
  {
   List<Account> accountListToUpdate = new List<Account>();
   List<Account> accountList = new List<Account>([Select id ,Name, Number_of_Contacts__c, (Select id, Name From Contacts) from Account Where id in:accountIds]);
   
   for(Account a : accountList)
   {
       List<Contact> sizeOfContactList = a.Contacts;
       a.Number_of_Contacts__c = sizeOfContactList.size();
       accountListToUpdate.add(a);
   }
   
   if(!accountListToUpdate.isEmpty() && accountListToUpdate.size()>0){
       update accountListToUpdate ;
   
   }
  
  }


}