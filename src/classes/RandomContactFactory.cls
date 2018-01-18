public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer noOfContact,String conLastName){
        
        List<Contact> contactList=new  List<Contact>();
        for(Integer i=0;i<noOfContact;i++){
            
            Contact con=new Contact(firstName='Test '+i,lastName=conLastName);
            contactList.add(con);
        }
        return contactList;
    }

}