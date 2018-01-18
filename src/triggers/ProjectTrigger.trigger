trigger ProjectTrigger on Project__c (after update) {
    If (Trigger.isAfter && Trigger.isUpdate){
        for(Project__c proj : Trigger.new){
            if(proj.Status__c.equals('Billable')){
                BillingCalloutService.callBillingService(proj.ProjectRef__c, proj.Billable_Amount__c);
            }
        }
    }

}