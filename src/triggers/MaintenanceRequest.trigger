trigger MaintenanceRequest on Case (before update, after update) {
    if(Trigger.isAfter && Trigger.isUpdate){
        MaintenanceRequestHelper.updateAfterUpdateActivity(Trigger.new, Trigger.oldMap);
            
    }
    
}