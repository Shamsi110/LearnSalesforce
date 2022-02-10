public class ContactSearch {
    public static List<Contact> searchForContacts(String LastName, String mailingPostalCode)
    {
        List<Contact> lstOfContact = [Select Id,Name from Contact where LastName =:LastName and MailingPostalCode =:mailingPostalCode];
    	If(lstOfContact.size()>0)
        {
            return lstOfContact;
        }
        
        else
            return null;
    }

}