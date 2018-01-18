@isTest
private class TestVerifyDate {

    @isTest static void testCheckDates(){
        
        Date d1=system.today();
        Date d2=system.today().addDays(5);
        Date d3=VerifyDate.CheckDates(d1,d2);
		system.debug('d3'+d3);
        system.assertEquals(string.valueof(d3), string.valueof(d2), 'Failed');
        Date d5=VerifyDate.CheckDates(d2,d1);
        system.debug('d5 '+d5);
        system.debug('d1 '+d1);
        system.debug('d2 '+d2);
        system.assertEquals(string.valueof(d5), string.valueof(d2.addDays(6)), 'Failed');
    }
    
}