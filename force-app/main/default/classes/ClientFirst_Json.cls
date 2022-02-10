public class ClientFirst_Json {

    public list<cls_InformationLines> InformationLines ;
	public class cls_InformationLines {
		public String Company;	//  
		public String Subledger;	//     
		public String Partition;	//  
		public String Label;	//Connection Type - Windx                 
		public String Value;	//0                                       
		public String DateUsed;	//2020.01.16
	}
	public static ClientFirst_Json parse(String json){
		return (ClientFirst_Json) System.JSON.deserialize(json, ClientFirst_Json.class);
	}


	//static testMethod void testParse() {
		//String json=		'{"UpdateLines":[{"Date":"2016.03.07","Time":"13:27","Version":"12.5.2304","Type":"          ","Workstation":"T0","ComputerName":"JONAS2012APP                                 "},{"Date":"2017.01.05","Time":"08:40","Version":"12.6.1424","Type":"Upgrade   ","Workstation":"T0","ComputerName":"JONAS2012APP                                 "},{"Date":"2018.05.01","Time":"09:58","Version":"12.8.0588","Type":"Upgrade   ","Workstation":"T0","ComputerName":"JONAS2012APP                                 "},{"Date":"2018.12.14","Time":"09:05","Version":"12.8.0981","Type":"Upgrade   ","Workstation":"T0","ComputerName":"JONAS2012APP                                 "},{"Date":"2019.06.14","Time":"10:53","Version":"2018.1534","Type":"Upgrade   ","Workstation":"T0","ComputerName":"JONAS2012APP                                 "},{"Date":"2019.08.19","Time":"08:37","Version":"2018.1735","Type":"Upgrade   ","Workstation":"T0","ComputerName":"JONAS2012APP                                 "}]}';
		//ClientFirst_Json obj = parse(json);
		//System.assert(obj != null);
	//}
}