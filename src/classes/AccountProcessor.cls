public class AccountProcessor {
    
    @Future
    public static void countContacts(List<String> accIds){
        
		List<Account> accList=[select id,Number_of_Contacts__c, (select name from contacts) from account where Id In : accIds];
		for(Account acc : accList)
        {    
            acc.Number_of_Contacts__c=acc.Contacts.size();
        }
        update accList;
        
    }

}