@isTest
private class TestRestrictContactByName {

    @isTest static void testContactTrigger(){
        
        Contact cont=new Contact();
        cont.LastName='INVALIDNAME';
        test.startTest();
         Database.insert(cont, false);
        test.stopTest();
        List<Contact> conList=new List<Contact>();
        conList=[select id from contact where LastName='INVALIDNAME'];
        system.assertEquals(0, conList.size(), 'Test Failed');
    }
}