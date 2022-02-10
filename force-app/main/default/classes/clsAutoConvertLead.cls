public class clsAutoConvertLead {
    @InvocableMethod (label='Convert Lead') 
    public Static void convertLeads(List<Id> leadIds)
    {
        LeadStatus convertStatus = [Select MasterLabel from LeadStatus where IsConverted = true limit 1];
       // List<Lead> leads = new List<Lead>();
        List<Database.LeadConvert> leadConverts = new List<Database.LeadConvert>();
        for (Id Ids:leadIds) {
                Database.LeadConvert lc = new Database.LeadConvert();
                lc.setLeadId(Ids);
                lc.setSendNotificationEmail(false);
                lc.setdonotcreateOpportunity(True);
                lc.setConvertedStatus(convertStatus.MasterLabel);
                leadConverts.add(lc);
           
        }
        if (!leadConverts.isEmpty()) {
            List<Database.LeadConvertResult> lcr = Database.convertLead(leadConverts);
        }

       
    }
    
}