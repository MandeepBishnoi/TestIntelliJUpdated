public class ParkLocator{
    public static List<String> Country(String con) {
        ParkService.ParksImplPort service= 
            new ParkService.ParksImplPort();
        return service.byCountry(con);
    }
}