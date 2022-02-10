trigger autoLeadConversion on Lead (after insert) {
 
LeadStatus convertStatus = [Select MasterLabel from LeadStatus where IsConverted = true limit 1];
 
List<Database.LeadConvert> leadConverts = new List<Database.LeadConvert>();
for (Lead lead: Trigger.new) {
if (!lead.isConverted) {
Database.LeadConvert lc = new Database.LeadConvert();
String opportunityName = lead.Name;
 
lc.setLeadId(lead.Id);
//lc.setAccountId(AccountId); // you can set the AccountId instead of create a <span id="IL_AD2" class="IL_AD">new account</span> and contact is created the <span id="IL_AD6" class="IL_AD">mention</span> account
lc.setSendNotificationEmail(false);
lc.setdonotcreateOpportunity(True);
//lc.setDoNotCreateOpportunity(true); // <span id="IL_AD8" class="IL_AD">Optional</span> to create a Opportunity
lc.setConvertedStatus(convertStatus.MasterLabel);
leadConverts.add(lc);
}
}
if (!leadConverts.isEmpty()) {
List<Database.LeadConvertResult> lcr = Database.convertLead(leadConverts);

}
}