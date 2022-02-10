public with sharing class Task2 {
    
    public class wrapAllGroupedData{
        
        @AuraEnabled public string ownerid {get;set;}
        @AuraEnabled public string OwnerName {get;set;}
        @AuraEnabled public string TotalLeads {get;set;}
        @AuraEnabled public string TotalOpps {get;set;}
        @AuraEnabled public string LastOpp {get;set;}
        @AuraEnabled public string TotalAmount {get;set;}
        //List<String> str = new List<String>();
        
        public wrapAllGroupedData(string getGroupedData)
        {
            System.debug('@@@getGroupedData' + getGroupedData);
            List<String> str = getGroupedData.split('@');
           
            System.debug('@@@str' + str);
            
            //for(integer i = 0 ; i < str.size();i++)
            //for(string s: str)
            {
                this.ownerid = str[0];
                this.OwnerName = str[1];
                this.TotalLeads = str[2];
                this.TotalOpps = str[3];
                this.LastOpp = str[4];
                this.TotalAmount = str[5];
            }
        }
        
    }
    
    @AuraEnabled(cacheable=true)
    public Static List<wrapAllGroupedData> getLeadAndOpportunityGroupedResults()
    {
        AggregateResult[] groupedLeadResults = [Select ownerid,owner.Name Owner,Count(id)TotalLeads from lead group by ownerid,Owner.name];
        map<id,String> mapGroupedLeadResult = new map<id,String>();
        map<id,String> mapGroupedOpportunityResult = new map<id,String>();
        List<String> groupedLeadAndOpportunity = new List<String>();
        List<AggregateResult> mergeLeadAndOpportunityGroupedResult = new List<AggregateResult>();
        Set<id> ownerIds = new Set<id>();
        integer i = 1;
        List<wrapAllGroupedData> wrapper = new List<wrapAllGroupedData>();
        for (AggregateResult ar : groupedLeadResults) {
            mapGroupedLeadResult.put((String) ar.get('ownerid'),(String) ar.get('ownerid') + '@' +(String)ar.get('Owner') + '@' + (Integer)ar.get('TotalLeads') );
            ownerIds.add((String) ar.get('ownerid'));
        }
        AggregateResult[] groupedOpportunityResult = [Select ownerid,count(id)TotalOpp, max(Createddate)LastOpp, Sum(amount)TotalAmount from Opportunity group by ownerid];
        for (AggregateResult ar : groupedOpportunityResult) {
            mapGroupedOpportunityResult.put((String)ar.get('ownerid'),(Integer)ar.get('TotalOpp') + '@' + (Decimal)ar.get('TotalAmount') + '@' + (DateTime)ar.get('LastOpp') );
        }
        
        for(String id : ownerIds)
        {
            groupedLeadAndOpportunity.add(mapGroupedLeadResult.get(id) + '@' + mapGroupedOpportunityResult.get(id));
            
        }
        System.debug('@@@TOtal Data' + groupedLeadAndOpportunity);
        i = 0;
        while(i < groupedLeadAndOpportunity.size())
        {
            wrapAllGroupedData obj = new wrapAllGroupedData(groupedLeadAndOpportunity.get(i));
            wrapper.add(obj);
            i++;
        }
        System.debug('@@@ wrapper' + wrapper);
        return wrapper;
        
        
    }
    
    
    //
    
}