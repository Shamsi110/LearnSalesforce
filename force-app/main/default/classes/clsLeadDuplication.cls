public  with sharing class clsLeadDuplication {
    public clsLeadDuplication() {

    }

    public void LeadDupplicationProcess(List<Lead> leads)
    {
        map<string,Contact>mapOfCont=new map<string,Contact>();
    list<Contact>lstOfCont=[SELECT id,Name,Email FROM Contact];
        for(Contact c:lstOfCont){
            mapOfCont.put(c.Email,c);
        }
        system.debug('@@@'+mapOfCont);
        for(Lead l:leads){
            if(l.Email<>null||string.isNotBlank(l.Email)){
                system.debug('@@class if chek is working');
                if(mapOfCont.containskey(l.Email)){
                    system.debug('map contain key is working');
                 l.Email.addError('Email already exists');
                    system.debug('finally all working');
                }
            }
        }
}
}