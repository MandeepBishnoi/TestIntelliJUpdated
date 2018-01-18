public class LeadProcessor implements   Database.Batchable<sObject> {

    public Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        return Database.getQueryLocator('select id,LeadSource  from lead');

    }

    public void execute(Database.BatchableContext bc, List<Lead> records){
       
        for(Lead record : records)
        {
            record.LeadSource='Dreamforce';
        }
        update records;
    }    

    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }    

}