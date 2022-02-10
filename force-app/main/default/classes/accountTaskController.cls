public class accountTaskController{

List<Task> lstOfTasks = new List<Task>();
public string accountname {get;set;}


public List<Task> getAccountTasks()
{
    return lstOfTasks;
}


public PageReference getListOfTasks()
{
    
   lstOfTasks = [SELECT id,createddate, subject FROM Task WHERE whatId = '0017F00000Ge0WD'];
   return null;
    

}




}