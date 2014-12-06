package P2_route.model;

import java.util.List;

import javax.websocket.server.PathParam;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

@Path("/view")
public class viewnameService {

	private viewnameDAO_interface dao;

	public viewnameService() {
		dao = new viewnameDAO();
	}

//	public viewnameVO addViewname(String id, String pwd, Integer memclass, String name, String stop,String gender,java.sql.Date bdy,
//			String addr, java.sql.Date buildtime) {
//
//		viewnameVO vnVO = new viewnameVO();
//		memVO.setMember_loginID(id);
//		memVO.setMember_password(pwd);
//		memVO.setMember_class(memclass);
//		memVO.setMember_name(name);
//		memVO.setMember_stop(stop);
//		memVO.setMember_gender(gender);
//		memVO.setMember_birthday(bdy);
//		memVO.setMember_address(addr);
//		memVO.setMember_buildtime(buildtime);
//		
//		dao.insert(memVO);
//
//		return memVO;
//		return null;
//	}

//	public viewnameVO updateViewname(String id, String pwd, String name,java.sql.Date bdy,
//			String addr) {

//		viewnameVO nvVO = new viewnameVO();
//
//		memVO.setMember_loginID(id);
//		memVO.setMember_password(pwd);
//		memVO.setMember_name(name);
//		memVO.setMember_birthday(bdy);
//		memVO.setMember_address(addr);
//		
//		dao.update(memVO);
//
//		return dao.findByPrimaryKey(id);
//		return null;
//	}
	
//	//for Struts 2
//	public void addEmp(EmpVO empVO) {
//		dao.insert(empVO);
//	}
	
//	public MemVO updateMem(String member_loginID) {
//
//		return dao.findByPrimaryKey(member_loginID);
//	}
	
//	//for Struts 2
//	public void updateMem(MemVO memVO) {
//		dao.update(memVO);
//	}

//	public void deleteEmp(String member_loginID) {
//		dao.delete(member_loginID);
//	}
//
//	public MemVO getOneMem(String member_loginID) {
//		return dao.findByPrimaryKey(member_loginID);
//	}

	public List<viewnameVO> getAll() {
		return dao.getAll();
	}
	
	public String getAllJSON(String viewArea) {
		return dao.getAllJSON(viewArea);
	}
	
	@GET
	@Path("/viewTop6")
	@Produces("application/json; charset=UTF-8")
	public String getImgTop6() {
		return dao.getImgTop6();
	}
	
	public int getImgTop6Count(){
		return dao.getImgTop6Count();
	}
	
	@GET
	@Path("/latlng")
	@Produces("application/json; charset=UTF-8")
	public String getViewLatlng(@QueryParam("viewID") String viewID){
		return dao.getViewLatlng(viewID);
	}
	
	public Integer insertRouteByID(String memID, String routeName, java.sql.Date buildTime){
		return dao.insertRouteByID(memID, routeName, buildTime);
	}
	
	public String insertRouteViewByRouteID(Integer routeID, String routeResultView, Integer routeResultViewOrder){
		return dao.insertRouteViewByRouteID(routeID, routeResultView, routeResultViewOrder);
	}
	
	@GET
	@Path("/myRoute")
	@Produces("application/json; charset=UTF-8")
	public String getRouteByMemID(@QueryParam("memID") String memID){
		return dao.getRouteByMemID(memID);
	}
	
	@GET
	@Path("/routeOrder")
	@Produces("application/json; charset=UTF-8")
	public String getRouteOrderByRouteID(@QueryParam("routeID") Integer routeID){
		return dao.getRouteOrderByRouteID(routeID);
	}
	
	public String getRouteFisrtByRouteID(Integer routeID){
		return dao.getRouteFisrtByRouteID(routeID);
	}
	
	@DELETE
	@Produces("application/json; charset=UTF-8")
	public String deleteRouteByID(@QueryParam("routeID") Integer routeID){
		return dao.deleteRouteByID(routeID);
	}
	
	@GET
	@Path("/routeName")
	@Produces("application/json; charset=UTF-8")
	public String getRouteNameByRouteID(@QueryParam("routeID") Integer routeID){
		return dao.getRouteNameByRouteID(routeID);
	}
	
	public Integer increaseHitRate(String routeResultView, Integer hitRate){
		return dao.increaseHitRate(routeResultView, hitRate);
	}
	
	public Integer getHitRate(String routeResultView){
		return dao.getHitRate(routeResultView);
	}
	
	@GET
	@Path("/viewDetail")
	@Produces("application/json; charset=UTF-8")
	public String getViewDetailByViewID(@QueryParam("viewID") String viewID){
		return dao.getViewDetailByViewID(viewID);
	}
	
	public String getSearchImg(String imagesID){
		return dao.getAllSearchImg(imagesID);
	}
	
	public String getAllImg(){
		return dao.getAllImg();
	}
	
	public String getAllImgSec(){
		return dao.getAllImgSec();
	}
	
	public List<viewnameVO> getImgDescript(String imagesID){
		return dao.viewName_imgDescript(imagesID);
	}
	
	@GET
	@Path("/getIMG")
	@Produces("application/json; charset=UTF-8")
	public String getImgByID(@QueryParam("imgID") String imgID){
		return dao.getImgByID(imgID);
	}
	
	
	public String getAllImg2(){
		return dao.getAllImg2();
	}
}
