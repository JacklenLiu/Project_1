package P2_route.model;

public class weatherThread  extends Thread{
	public void run() {
		String resource[] ={ "http://opendata.cwb.gov.tw/opendata/MFC/F-C0032-003.xml","http://opendata.cwb.gov.tw/opendata/MFC/F-C0032-005.xml"};
		//http://opendata.cwb.gov.tw/opendata/MFC/F-C0032-005.xml
		for (;;) {
			P2_route.controller.importWeatherResource gr = new P2_route.controller.importWeatherResource(resource[0],
					"C:\\Project\\Project_workspace\\Project_1\\WebContent\\P2_route\\xml");
			P2_route.controller.importWeatherResource gr1 = new P2_route.controller.importWeatherResource(resource[1],
					"C:\\Project\\Project_workspace\\Project_1\\WebContent\\P2_route\\xml");
			gr.doWork();
			gr1.doWork();
			try {
				Thread.sleep(86400000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			
			
		}
		
	}
}
