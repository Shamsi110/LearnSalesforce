public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer numberOfContacts, String LastName)
    {
        List<Contact> lstOfContacts = new List<Contact>();
        Integer count = 1;
        While(count <= numberOfContacts)
        {
            Contact c = new Contact();
            c.LastName = LastName + ' ' + count++;
            lstOfContacts.add(c);
        }
        
        return lstOfContacts;
    }

}