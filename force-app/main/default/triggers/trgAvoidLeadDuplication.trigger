trigger trgAvoidLeadDuplication on Lead (before insert) {

    //Check this new lead/leads have an email address.
    //If there is an email address, compare this email address with contact email address.
    //if both email address matches then do not create this lead but prompt a message
    // Message could be like "A lead is already exist as customer"

    if (trigger.isInsert&&trigger.isBefore)
 {
     system.debug('if cheak is running');
     clsLeadDuplication  obj=new clsLeadDuplication ();
  obj.LeadDupplicationProcess(trigger.new);

 }  
}