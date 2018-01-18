@IsTest
private class  DailyLeadProcessorTest {
	 public static String CRON_EXP = '0 0 0 15 3 ? 2022';

    @isTest static void testDailyLeadProcessor(){
        
        
        Test.startTest();
        String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new DailyLeadProcessor()); 
        
        Test.stopTest();

        
    }
    
     @testSetup
     static void setup(){
         List<Lead> leadList=new List<Lead>();
         for(Integer i=0;i<200;i++){
             
             Lead leadObj=new Lead(Company = 'comp'+i, LastName = 'lastName'+i,LeadSource = 'Dreamforce');
             leadList.add(leadObj);
         }   
         insert leadList;
     }
}