trigger AccountAddressTrigger on Account (before insert, before update) {

    if (Trigger.isInsert) {
    
         for(Account a : Trigger.New) {
             if(a.Match_Billing_Address__c && a.BillingPostalCode!=null){
                 a.ShippingPostalCode= a.BillingPostalCode;
             
             }
         
         }
    
    }
    if (Trigger.isUpdate) {
        for(Account a : Trigger.New) {
             if(a.Match_Billing_Address__c && a.BillingPostalCode!=null){
                 a.ShippingPostalCode= a.BillingPostalCode;
             
             }
         
         }
    }
    

}