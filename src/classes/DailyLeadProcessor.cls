public class DailyLeadProcessor implements Schedulable {

    public void execute(SchedulableContext ctx) {
        List<Lead> leads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = 'Dreamforce' limit 200];
       
       
    }
    
}