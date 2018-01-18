@RestResource(urlMapping='/project/*')
global class ProjectRESTService {
    @HttpPost
    global static String postProjectData(String   ProjectRef,String  ProjectName,String  OpportunityId,Date  StartDate,Date EndDate,Double  Amount,String  Status){
    
        List<Opportunity> listOpp = [SELECT Id, DeliveryInstallationStatus__c,(SELECT Id FROM Projects__r WHERE ProjectRef__c =: ProjectRef) FROM Opportunity WHERE Id =: OpportunityId LIMIT 1]; 
        String errorMessage = 'OK';  
        if(listOpp!=null && listOpp.size()>0){
        Savepoint savePoint = Database.setSavepoint();  
            try {
               
                Project__c newProject = new Project__c(Opportunity__c=OpportunityId);
                
                if(listOpp[0].Projects__r.size() > 0){
                    newProject.Id=listOpp[0].Projects__r[0].Id;
                }  
                
                newProject.ProjectRef__c = ProjectRef;
                newProject.Name = ProjectName;    
                newProject.Start_Date__c = StartDate;
                newProject.End_Date__c = EndDate;
                newProject.Billable_Amount__c = Amount;
                newProject.Status__C = Status;
                upsert newProject; 
                                              
                listOpp[0].DeliveryInstallationStatus__c = 'In Progress';                           
                update listOpp;
                
            } catch (Exception ex) {
                
                Database.rollback(savePoint);
                errorMessage = ex.getMessage();
            }                                  
 
        } else {
            errorMessage = 'Opportunity not found';
        }
        return errorMessage;
    }
}