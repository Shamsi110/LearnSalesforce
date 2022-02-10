trigger trgCustomers on Customer__c (before insert) {
    
    for(Customer__c c : trigger.new) 
    {
   		c.phone__c = '021351242';
    }

}