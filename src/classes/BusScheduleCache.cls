public class BusScheduleCache{

    private Cache.OrgPartition orgPartition;
    String partitionName='local.BusSchedule';
    public BusScheduleCache(){

        if(partitionName!=null){

            Cache.OrgPartition orgPart=new Cache.OrgPartition(partitionName);
            if (orgPart!=null) {
                orgPartition = orgPart;
            }
        }
    }
    /**
     *
     *
     *
     * @param busName
     * @param timeList
     */
    public void setValues(String busName,Time[] timeList)
    {
        if (orgPartition!=null) {
                orgPartition.put(busName,timeList);
        }
    }
    public List<Time> getSchedule(String busLine)
    {

        Time[] schedule = new List<Time>();
        Object obj = orgPartition.get(busLine);

        if (obj != null) {
            List<Time> t2 = (List<Time>)obj;
            schedule.addAll(t2);
        }
        else
        {
            Time t3 = Time.newInstance(8,0,0,0);
            schedule.add(t3);
            schedule.add(Time.newInstance(12,0,0,0));
        }
        return schedule;
    }

}
