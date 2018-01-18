public class AddPrimaryContact implements Queueable {
    
    private Contact contacts;
    private String status;
    
    public AddPrimaryContact(Contact  records, String status) {
        this.contacts = records;
        this.status = status;
    }

    public void execute(QueueableContext context) {
       List<Account> accounts=[select id from Account  where BillingState  =: status Limit 200];
        List<Contact> contactList=new List<Contact>();
        for (Account account : accounts) {
            Contact clonedContact = contacts.clone(false, false, false, false);
            clonedContact.Account=account;
            contactList.add(clonedContact);
        }
        insert contactList;
    }
    
}