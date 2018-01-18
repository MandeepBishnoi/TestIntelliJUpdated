@IsTest
private class  LeadProcessorTest {
    
     @isTest static void tesLeadProcessor()
    {
			
         Test.startTest();
        LeadProcessor batch=new LeadProcessor();
        id batchId=database.executeBatch(batch);
        Test.stopTest();
        System.assertEquals(200, [select count() from Lead where LeadSource='Dreamforce']);
   

    }
     @testSetup
     static void setup(){
         List<Lead> leadList=new List<Lead>();
         for(Integer i=0;i<200;i++){
             
             Lead leadObj=new Lead(Company = 'comp'+i, LastName = 'lastName'+i);
             leadList.add(leadObj);
         }   
         insert leadList;
     }
}