@IsTest
private class  AddPrimaryContactTest {
    private static Contact con;
    @isTest static void testPrimaryContact(){
       
         con=new Contact(firstName='fName',LastName='lName');
          insert con;
        AddPrimaryContact obj=new AddPrimaryContact(con,'CA');
        Test.startTest(); 
        System.enqueueJob(obj);
        Test.stopTest();
         System.assertEquals(50, [select count() from account where BillingState = :'CA']);


    }
	@testSetup
     static void setup(){
      	List<Account> accList=new List<Account>();
         for(Integer i=0;i<100;i++)
         {
             Account accTest;
            if(i<50)  
            { accTest = new Account( Name='Test record'+i,BillingState='NY');
            }else{
              accTest = new Account( Name='Test record'+i,BillingState='CA');   
            }accList.add(accTest);
         }
         insert accList;
        
       

     }
    	
}