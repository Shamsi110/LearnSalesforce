public inherited sharing class clsGetCitiesData {
    @AuraEnabled(cacheable=true)    
    public static map<Id, Business__c> returnMapOfListValues() {
        map<String, list<String>> mapOfListValues = new map<String, list<String>>();
        map<Id, Business__c> mapOfListBusinessValues = new map<Id,Business__c>([select name from Business__c]);
        //mapOfListBusinessValues.put(String,new List<Business__c>([select Id,name,Sale__c,Operating_region__c from Business__c]);        
        //mapOfListValues.put('Delhi($300)', new list<String>{'Hyderabad', 'Delhi', 'Mumbaie'});
        //mapOfListValues.put('Mumbai($150)', new list<String>{'New York', 'Las Vegas', 'Miami'});
        //mapOfListValues.put('Delhi,Mumbai($300)', new list<String>{'Shenzhen', 'Guangzhou', 'Shanghai'});
        //List<Business__c> lstOfRecords = [select Id,name from Business__c];
        //mapOfListBusinessValues.putAll(lstOfRecords);
        return mapOfListBusinessValues;
    }
}