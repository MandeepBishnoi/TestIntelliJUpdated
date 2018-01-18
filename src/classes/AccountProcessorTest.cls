@IsTest
private class AccountProcessorTest {
    
    @isTest static void tesCountContacts()
    {
        List<String> ids=setup();
       Test.startTest();
       AccountProcessor.countContacts(ids);
      Test.stopTest();
        Account acc=[select id, Number_of_Contacts__c from Account where id =: Ids[0] Limit 1];
       
        System.assertEquals(0, acc.Number_of_Contacts__c);

    }
    static List<String> setup(){
        
        List<Account> accList=new List<Account>();
        Account accTest = new Account(
            
            Name='Test record'
            );
        Account accTest2 = new Account(
            
            Name='Test record2'
            );
        accList.add(accTest);
        accList.add(accTest2);
        insert accList;
        
         
        List<String> ids=new List<String>();
        ids.add(accList[0].id);
        ids.add(accList[1].id);
        
      
        return ids;
        
        
        
        
    }
}