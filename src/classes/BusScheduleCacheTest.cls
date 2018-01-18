/**
 * Created by MandeepBishnoi on 1/18/2018.
 */
@isTest
private with sharing class BusScheduleCacheTest {

    @isTest static void testCacheMethod(){
        List<Time> times=new List<Time>();
        times.add(Time.newInstance(5,0,0,0));
        times.add(Time.newInstance(5,0,0,0));

        BusScheduleCache busScheduleCache=new BusScheduleCache();
        busScheduleCache.setValues('RedLine',times);
        List<Time> times2=busScheduleCache.getSchedule('RedLine');
        System.debug('size'+times2.size());
        System.assertEquals(2,times2.size(),'test failed');
    }
}