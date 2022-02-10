public class StringArrayTest {
    public static List<String> generateStringArray(integer stringCount)
    {
        List<String> lstOfString = new List<String>();
        Integer i=0;
        while(i<stringCount)
        {
            lstOfString.Add('Test' + ' ' + i++);
        }
        system.debug('aaaaaa' +lstOfString.Size());
        system.debug('bbbbbb' +lstOfString[2]);
        return lstOfString;
    }

}