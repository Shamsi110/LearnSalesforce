@IsTest
public class TestVerifyDate {
    @isTest static void tstCheckDates1() {
        
        Date dt = VerifyDate.CheckDates(Date.today(), Date.today() + 5);
        System.assertEquals(Date.today(), dt);
    }
    
     @isTest static void tstCheckDates2() {
        
        Date dt = VerifyDate.CheckDates(Date.today(), Date.today() + 35);
        System.assertEquals(Date.today() + 25, dt);
    }
    
    @isTest static void tstCheckDates3() {
        
        Date dt = VerifyDate.CheckDates(Date.today(), Date.today() - 5);
        System.assertEquals(Date.today() + 25, dt);
    }

}