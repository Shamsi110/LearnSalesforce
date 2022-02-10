@isTest
private class TestRestrictContactByName {
    @isTest static void testRestrictedCOntact()
    {
         Contact c = new Contact();
    	 c.LastName='Test Contact';
    	 insert  c;
    
    	 c.LastName='INVALIDNAME';
    	 Update c;
    }
   
   
}