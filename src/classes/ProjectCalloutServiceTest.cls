@isTest
private class ProjectCalloutServiceTest {
@isTest(SeeAllData=true)
  public static void ProjectCalloutServiceTestMethod() {
         Account a = new Account(Name = 'Acme');
        insert a;
        Opportunity o = new Opportunity(Name='Test',Discount_Percent__c=6.0, StageName='Submitted Project', AccountId=a.Id, Amount=1000, CloseDate=Date.Today());
        insert o;
        
        List<Id> oppList = new List<Id>();
        oppList.add(o.Id);
  
        Test.setMock(HttpCalloutMock.class, new ProjectCalloutServiceMock());
        Test.startTest();
            ProjectCalloutService.postOpportunityToPMS(oppList);
        Test.stopTest();
        // runs callout and check results
        o = [select StageName from Opportunity where id =: o.Id];
        System.assertEquals('Submitted Project', o.StageName);
    }
    @isTest(SeeAllData=true)
      public static void ProjectCalloutServiceTestMethodFailure() {
         Account a = new Account(Name = 'Acme');
        insert a;
        Opportunity o = new Opportunity(Name='Test',Discount_Percent__c=6.0, StageName='Submitted Project', AccountId=a.Id, Amount=1000, CloseDate=Date.Today());
        insert o;
        
        List<Id> oppList = new List<Id>();
        oppList.add(o.Id);
  
        Test.setMock(HttpCalloutMock.class, new ProjectCalloutServiceMockFailure());
        Test.startTest();
            ProjectCalloutService.postOpportunityToPMS(oppList);
        Test.stopTest();
        // runs callout and check results
        o = [select StageName from Opportunity where id =: o.Id];
        System.assertEquals('Submitted Project', o.StageName);
    }
}