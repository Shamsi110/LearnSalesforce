public class ContactAndLeadSearch {
    public static List<List< SObject>> searchContactsAndLeads(String Keyword)
    {
        List<List<sObject>> searchList = [FIND :keyword IN ALL FIELDS 
                   RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];
        return searchList;
    }

}