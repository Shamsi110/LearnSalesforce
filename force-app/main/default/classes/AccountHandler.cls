public class AccountHandler {
    public static Account insertNewAccount(String Name)
    {
        Account acc = new Account();
        try {
            
        	acc.Name= Name;
        	Insert acc;
            
        }
        catch(DmlException  ex)
        {
            System.debug('A DML exception has occurred: ' +
                ex.getMessage());
        }
        
      	if (!String.isBlank(acc.Name))
        {
            return acc;
        }
        else
            return null;
        
        
    }

}