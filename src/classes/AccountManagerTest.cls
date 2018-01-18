@IsTest
private class AccountManagerTest {
    
      @isTest static void testGetAccountById() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri ='/services/apexrest/Accounts/'+recordId+'/contacts' ;

        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAcc = AccountManager.getAccount();
        // Verify results
        System.assert(thisAcc != null);
        System.assertEquals('Test record', thisAcc.Name);
    }
    
    static Id createTestRecord() {
        // Create test record
        Account accTest = new Account(
            
            Name='Test record'
            );
        insert accTest;
        Contact con=new Contact(Account=accTest,FirstName='dummy',LastName='Name');
        insert con;
        List<Account> accList=[select id, (select id,name from contacts) from account where id =: accTest.id];
        system.debug('accList '+accList[0]+' and '+accList[0].contacts.size());
        return accTest.Id;
    }      

}