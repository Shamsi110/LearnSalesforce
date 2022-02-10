Global class createContact
{

webservice static void createContactFromCustomButton(Id AccountID)
{
    Contact c = new Contact();
    c.FirstName = 'Virat';
    c.LastName = 'Kohli';
    c.accountid = AccountID;
    c.Email = 'BestBatsman@virat.com';
    c.Title = 'Respect from Pakistan for Virat';
    c.Phone = '91';
    insert c;
}
}