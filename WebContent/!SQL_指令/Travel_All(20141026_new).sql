use project_1;
drop table helper;

drop table questions;
drop table myfootmark;
drop table knowledge;
/*drop table knowledge_type;*/
drop table news;
drop table TravelDiaryPic;
drop table TravelDiary;
drop table routeView;
drop table route;
drop table images;
/*drop table area;*/
drop table viewname;
drop table member_friend;
drop table messageboard;
drop table sysmember;
drop table persontype;

create table helper(
	helperNum           int IDENTITY (1,1)	not null,
	member_loginID		nvarchar(20)				,/*hidden*/
	e_mail				nvarchar(100)		not null,/*if has acconut = readonly*/
	name				nvarchar(20)		        ,
	title				varchar(50)			not null,
	content				nvarchar(200)		not null,
	CONSTRAINT helper_helperNum_PK PRIMARY KEY (helperNum)
);

insert into helper values( 'aa123','abcd@yahoo.com.tw','王小明','救我','無法註冊會員');
insert into helper values( 'aa123','abcd@yahoo.com.tw','','救我','無法註冊會員');
insert into helper values( '','home@gmail.com','陳小花','救你','無法註冊會員');


/*地區對照表*/
/*
 create table area (
 areaNO               int IDENTITY (1,1) not null,
 areaname             varchar(10) NOT NULL, 
 constraint area_primary_key primary key (areaNO)
 );
 

insert into area values ('北部');
insert into area values ('中部');
insert into area values ('南部');
insert into area values ('東部');
*/


/*風景照片中文名稱及排行榜*/


create table viewname(
	viewID			nvarchar(50) 		not null,
	viewname		nvarchar(50)	 	not null,
	viewarea		nvarchar(10)	 	not null,
	viewAddr		nvarchar(100)		not null,/*定位*/
	view_HitRate	int					not null,/*旁行榜*/
	viewLng			nvarchar(30)		not null,
	viewLat			nvarchar(30)		not null,

	constraint viewname_primary_key primary key(viewID)
);

--insert into viewname values ('Chingtienkang','擎天崗','北部','台北市',1,'','');
--insert into viewname values ('Maokong','貓空','北部','台北市',1,'','');
/* ================================================================================================================== */
/*北部*/
insert into viewname values ('Bali','八里左岸自行車道','北部','台北市北投區知行路462號',1,'25.1177511','121.4637232');
insert into viewname values ('Riverbank_Park','河濱公園自行車道','北部','台北市中正區水源快速道路',1,'25.0143241','121.5235801');
insert into viewname values ('Beitou','新北投溫泉公園','北部','台北市北投區溫泉路101-109號',1,'25.1363815','121.5119927');
insert into viewname values ('Yangmingshan','陽明山溫泉區','北部','台北市北投區陽明路一段23之5號',1,'25.1472889','121.549065');
insert into viewname values ('Xiangshan','象山','北部','台北市信義區信義路五段150巷411弄16號',1,'25.0239146','121.5706659');
insert into viewname values ('Tianmu','天母古道親山步道','北部','台北市士林區中山北路七段232號',1,'25.126878','121.534101');
insert into viewname values ('Hushan','虎山親山步道','北部','台北市信義區福德街221巷190號',1,'25.0329549','121.5877237');
insert into viewname values ('Jiantan','劍潭山親山步道','北部','台北市中山區北安路410號',1,'25.0791947','121.5425427');
insert into viewname values ('Guandu','關渡親山步道','北部','台北市北投區中央北路四段30巷156號',1,'25.1424091','121.4732789');
insert into viewname values ('Whitehead_Lake','白石湖吊橋','北部','台北市內湖區碧山路24號',1,'25.099171','121.587111');
insert into viewname values ('Bihu','碧湖步道','北部','台北市內湖區內湖路三段60巷',1,'25.087898','121.592187');
insert into viewname values ('Chingtienkang','擎天崗草原','北部','台北市士林區菁山路101巷246號',1,'25.167208','121.574226');
insert into viewname values ('Maokong','貓空纜車','北部','台北市文山區新光路二段10巷2號',1,'24.9960519','121.5766782');
insert into viewname values ('Daan','大安森林公園','北部','台北市大安區新生南路二段1號',1,'25.029655','121.5352191');
insert into viewname values ('Beitou_Park','北投公園','北部','臺北市北投區中山路2號',1,'25.1358578','121.4979173');
insert into viewname values ('Fisherman_Wharf','漁人碼頭','北部','新北市淡水區觀海路135號',1,'25.1830363','121.4108099');
insert into viewname values ('Pinghsi','平溪天燈','北部','新北市平溪區石底街70號',1,'25.0244468','121.7376417');
insert into viewname values ('Yehliu','野柳女王頭','北部','新北市207萬里區',1,'25.2087687','121.6197777');
insert into viewname values ('Fort_San_Domingo','淡水紅毛城','北部','新北市淡水區中正路28巷1號',1,'25.1753647','121.3590607');
insert into viewname values ('Bisha','碧砂漁港','北部','基隆市中正區北寧路211號',1,'25.145636','121.786017');
insert into viewname values ('Small_Wulai','小烏來','北部','桃園縣復興鄉興溪道路',1,'24.7937179','121.3018707');
insert into viewname values ('Toucheng','宜蘭頭城老街','北部','宜蘭縣頭城鎮和平街96號',1,'24.8569885','121.8241332');
insert into viewname values ('Yingge','鶯歌陶瓷博物館','北部','新北市鶯歌區文化路200號',1,'24.949537','121.352446');
insert into viewname values ('Leofoo','六福村','北部','新竹縣關西鎮仁安里拱子溝60號',1,'24.821673','121.181964');
insert into viewname values ('Keelung_Temple','基隆廟口','北部','基隆市仁愛區仁三路25-39號',1,'25.1286281','121.7428005');
insert into viewname values ('Chiaohsi','宜蘭礁溪溫泉公園','北部','宜蘭縣礁溪鄉公園路16-1號',1,'24.8310012','121.7757918');
insert into viewname values ('Tataocheng','大稻埕碼頭','北部','台北市大同區堤外道路',1,'25.0565319','121.5076715');
insert into viewname values ('Palace_Museum','故宮博物院','北部','台北市士林區至善路二段221號',1,'25.102355','121.548493');
insert into viewname values ('Grandee','士林官邸','北部','台北市士林區福林路60號',1,'25.094898','121.530152');
insert into viewname values ('Zoo','貓空','木柵動物園','台北市新光路二段30號',1,'24.9988348','121.5072487');
/* ================================================================================================================== */

/*中部*/
insert into viewname values ('Yizhong_St','一中街','中部','台中市北區一中街105號',1,'24.1505177','120.6855512');
insert into viewname values ('Fengjia_Night-Market','逢甲夜市','中部','台中市西屯區文華路101號',1,'24.1787886','120.6464729');
insert into viewname values ('Park_Lane_By_CMP','勤美誠品綠園道','中部','台中市西區公益路68號',1,'24.1508656','120.6638385');
insert into viewname values ('Jingming_1st_St','精明一街','中部','精明一街商圈大墩十九街',1,'24.156186','120.655806');
insert into viewname values ('Maple_Garden','秋紅谷廣場','中部','台中市西屯區台中港路二段127-16號',1,'24.1673911','120.6392907');
insert into viewname values ('Calligraphy_Greenway','草悟道','中部','台中市西區五權西三街1號',1,'24.1400131','120.6631115');
insert into viewname values ('Miyahara','宮原眼科','中部','台中市中區中山路20號',1,'24.137806','120.683394');
insert into viewname values ('Gaomei_Wetland','高美濕地','中部','436台中市清水區高美濕地 ',1,'24.3104863','120.5436976');
insert into viewname values ('Dajiamazu','大甲鎮瀾宮','中部','台中市大甲區順天路158號',1,'24.345252','120.623445');
insert into viewname values ('Lishan_Scenic_Area','梨山風景區','中部','台中市和平區福壽路',1,'24.2501542','121.1793697');
insert into viewname values ('National_Taiwan_Museum_of_Fine_Arts','國立台灣美術館','中部','台中市西區五權西路一段2號',1,'24.140532','120.663324');
insert into viewname values ('Oiwake_Station','追分火車站','中部','台中市大肚區追分街',1,'24.1206823','120.5700868');
insert into viewname values ('Big_Hole_Scenic',' 大坑風景區','中部','台中市北屯區東山路二段濁水巷9之1號',1,'24.18925','');
insert into viewname values ('Taichung_Park','臺中公園','中部','台中市北區精武路291-3號',1,'24.1457128','120.6850378');
insert into viewname values ('Shalu_District',' 沙鹿之翼','中部','台中市沙鹿區三民路2-2號',1,'24.2375687','120.5694413');
insert into viewname values ('Rainbow_Village',' 彩虹眷村','中部','台中市南屯區忠勇路19巷49號',1,'24.1336366','120.6103059');
insert into viewname values ('Dongfung_Bike_Corridor','東豐自行車綠廊','中部','台中市豐原區朴子街301巷62號',1,'24.2728105','120.7422603');
insert into viewname values ('Wuling-Farm','武陵農場','中部','台中市和平區武陵路3之1號',1,'24.3458055','121.3067828');
insert into viewname values ('Flowersea',' 新社花海','中部','台中市新社區協興街30號',1,'24.2039137','120.807299');
insert into viewname values ('National_Museum_of_Natural_Science','自然科學博物館','中部','台中市北區館前路1號',1,'24.156714','120.666364');
insert into viewname values ('Hightway_Rest_Area','清水服務區休息站','中部','台中市清水區服務區休息站',1,'24.2812754','120.6023753');
insert into viewname values ('Taichung_City_Seaport_Art_Center','臺中港區藝術中心','中部','台中市清水區忠貞路21號',1,'24.269565','120.557688');
insert into viewname values ('Lavender-Forest','薰衣草森林','中部','台中市新社區中興街20號',1,'24.128475','120.841317');
insert into viewname values ('Taiwan_Forest_Recreation','八仙山森林遊樂區','中部','台中市和平區東關路一段200之8號',1,'24.192249','121.01462');
insert into viewname values ('Tali_Street',' 大里老街','中部','台中市大里區大里街79號',1,'24.0973763','120.6773218');
insert into viewname values ('Yuemei_Tourism_Sugar_Factory',' 月眉觀光糖廠','中部','台中市后里區甲后路864號',1,'24.313718','120.694783');
insert into viewname values ('Guguan_Hot_Springs','谷關溫泉','中部','台中市和平區東關路一段溫泉巷',1,'24.2047348','121.0092839');
insert into viewname values ('7fy','七分窯','中部','台中市新社區崑山里崑南街七分小巷1號',1,'24.241511','120.78851');
insert into viewname values ('Mushrooms',' 菇類農村文物館','中部','台中市霧峰區四德路10號6樓',1,'24.06488','120.698061');
insert into viewname values ('flowerjs',' 中社觀光花市','中部','台中市后里區三豐路469之13號',1,'24.334392','120.730237');
/* ================================================================================================================== */

/*南部*/
/* ================================================================================================================== */
insert into viewname values ('Chung_Cheng_University','中正大學','南部','嘉義縣民雄鄉三興村7鄰大學路一段168號',1,'23.563376','120.472883');
insert into viewname values ('LanTan','蘭潭','南部','嘉義市東區小雅路307號',1,'23.4712863','120.4758495');
insert into viewname values ('ShootingTower','射日塔','南部','嘉義市東區公園街46號',1,'23.481334','120.468763');
insert into viewname values ('North_Gate_Station','北門驛','南部','嘉義市東區忠孝路',1,'23.488396','120.4535497');
insert into viewname values ('Central_Fountain','中央噴水池','南部','嘉義市中山路289號',1,'23.4802914','120.450543');
insert into viewname values ('Alishan','阿里山','南部','嘉義縣阿里山鄉阿里山公路',1,'23.509025','120.8020987');
insert into viewname values ('Fencihu','奮起湖','南部','嘉義縣竹崎鄉阿里山公路中和支線',1,'23.5060607','120.7002978');
insert into viewname values ('Tropic_of_Cancer','北回歸線','南部','嘉義縣水上鄉鴿溪寮21之25號',1,'23.453394','120.415949');
insert into viewname values ('Steller_Pi','虎頭埤','南部','台南市南168鄉道135號',1,'23.0267216','120.3401917');
insert into viewname values ('Chiku_Salt','七股鹽場','南部','台南市七股區鹽埕里66號',1,'23.154163','120.100298');
insert into viewname values ('Guanziling','關子嶺','南部','台南市白河區',1,'23.3349014','120.5002671');
insert into viewname values ('Koxinga_Shrine','延平郡王祠','南部','台南市中西區建業街16號',1,'22.9880516','120.2072403');
insert into viewname values ('Chikan_Towers','赤崁樓','南部','台南市中西區民族路二段212號',1,'22.997218','120.202424');
insert into viewname values ('Gold_Coast','黃金海岸','南部','台南市南區安平港聯外道路',1,'22.9518102','120.1726998');
insert into viewname values ('Tainan_Confucius_Temple','台南孔廟','南部','台南市中西區南門路51號',1,'22.9900789','120.2044141');
insert into viewname values ('Garden_Night_Market','花園夜市','南部','台南市北區和緯路与海安路交叉口',1,'23.010681','120.199623');
insert into viewname values ('Anping_Street','安平老街','南部','台南市安平區延平街50號',1,'23.000433','120.163607');
insert into viewname values ('Four_Grass_Bridge','四草大橋','南部','台南市安平區四草大橋',1,'22.9951592','120.1423611');
insert into viewname values ('Urban_Spotlight','城市光廊','南部','高雄市前金區中華三路6號',1,'22.622984','120.298941');
insert into viewname values ('Love_River','愛河','南部','高雄市河西路150號',1,'22.6257333','120.2882429');
insert into viewname values ('85_Building','85大樓','南部','高雄市苓雅區新光路126號',1,'22.6108947','120.3001618');
insert into viewname values ('Cijin','旗津','南部','高雄市旗津一路517號',1,'22.5611507','120.3048415');
insert into viewname values ('Stayed_Bridge','斜張橋','南部','高縣大樹鄉統領路72-50號',1,'22.767604','120.447094');
insert into viewname values ('Fo_Guang_Shan','佛光山','南部','高雄市大樹區統嶺路1號',1,'22.754973','120.447612');
insert into viewname values ('West_Bay','西子灣','南部','高雄市鼓山區中山大學',1,'22.629167','120.262778');
insert into viewname values ('Jialeshuei','佳樂水','南部','屏東縣滿州鄉茶山路244號',1,'21.9934955','120.860781');
insert into viewname values ('Kenting_Street','墾丁大街','南部','屏東縣恆春鎮墾丁路207號',1,'21.9453313','120.7979635');
insert into viewname values ('Kenting_National_Park','墾丁國家公園','南部','屏東縣恆春鎮屏鵝公路',1,'21.9484123','120.77931');
insert into viewname values ('South_Bay','南灣','南部','屏東縣恆春鎮南灣路223號',1,'21.959931','120.763096');
insert into viewname values ('Maobitou','貓鼻頭','南部','屏東縣恆春鎮下泉路100號',1,'21.9222247','120.7374355');
insert into viewname values ('Tung_Lung_Palace','東隆宮','南部','屏東縣東港鎮東隆街21之1號',1,'22.463076','120.448766');
/* ================================================================================================================== */

/*東部*/
/* ================================================================================================================== */
insert into viewname values ('Fanshuliao','蕃薯寮','東部','花蓮縣壽豐鄉花東海岸公路',1,'23.7459825','121.5548941');
insert into viewname values ('Shuilian_and_Niushan','水璉、牛山海岸','東部','花蓮縣壽豐鄉牛山',1,'23.7643896','121.5694013');
insert into viewname values ('Changhong_Bridge','長虹橋','東部','花蓮縣豐濱鄉瑞港產業道路',1,'23.4690987','121.4873261');
insert into viewname values ('Xiuguluan_River','秀姑巒溪','東部','花蓮縣玉里鎮花東縱谷公路',1,'23.3221239','121.3269997');
insert into viewname values ('Shitiping','石梯坪','東部','花蓮縣花東海岸公路28號',1,'23.4829365','121.5086739');
insert into viewname values ('Baxian_Cave','八仙洞','東部','台東縣花東海岸公路6號',1,'23.3959179','121.4769922');
insert into viewname values ('Water_Running_Upward','水往上流','東部','台東縣東河鄉五線產業道路',1,'22.8684267','121.2181013');
insert into viewname values ('Xiaoyeliu','小野柳','東部','台東縣台東市松江路一段500號',1,'22.8683042','121.1444647');
insert into viewname values ('Taroko','太魯閣','東部','花蓮縣秀林鄉291號',1,'24.2002232','121.4526845');
insert into viewname values ('Liyu_Lake','鯉魚潭','東部','花蓮縣壽豐鄉環潭北路100號',1,'23.9349091','121.5023948');
insert into viewname values ('Fugang_Fish_Port','富岡漁港','東部','台東縣富岡街123號',1,'22.7917796','121.1923837');
insert into viewname values ('Sanxiantai','三仙台','東部','成功鎮台東縣961',1,'23.125246','121.4166184');
insert into viewname values ('Henan_Temple','和南寺','東部','花蓮縣花東海岸公路19號',1,'23.8757823','121.5996468');
insert into viewname values ('Shanyuan','杉原-富山復魚區','東部','台東縣卑南鄉富山村杉原24號',1,'22.8352135','121.1864165');
insert into viewname values ('Donghe_Bridge','東河橋','東部','台東縣花東海岸公路',1,'22.9750797','121.3071565');
insert into viewname values ('Amis_Folk_Center','阿美族民俗中心','東部','台東縣成功鎮新村路25號',1,'23.018579','121.326759');
insert into viewname values ('Chenggong','成功','東部','台東縣成功鎮白蓮路141號',1,'23.129003','121.3999673');
insert into viewname values ('Dabaisha','大白沙','東部','台東縣綠島鄉環島公路',1,'22.6400148','121.4922562');
insert into viewname values ('Zhaori_Hot_Spring','朝日溫泉','東部','台東縣綠島鄉溫泉路167號',1,'22.6401','121.4179928');
insert into viewname values ('Zhiben','知本國家森林公園','東部','台東縣卑南鄉龍泉路290號',1,'22.6873002','120.9912858');
insert into viewname values ('Rueisuei_Township','瑞穗鄉','東部','花蓮縣瑞穗鄉成功南路17號',1,'23.4966412','121.3761888');
insert into viewname values ('Across_Mountain_Ancient_Trail','過山古道','東部','台東縣綠島鄉環島公路',1,'22.6444413','121.4952786');
insert into viewname values ('Jialulan','加路蘭','東部','台東縣台東市松江路二段',1,'22.8068184','121.196625');
insert into viewname values ('Jiqi_Beach_Recreation_Area','磯崎海濱遊憩區','東部','花蓮縣豐濱鄉花東海岸公路',1,'23.6988054','121.5507968');
insert into viewname values ('Farglory_Ocean_Park','遠雄海洋公園','東部','花蓮縣壽豐鄉',1,'23.9001676','121.6009733');
insert into viewname values ('Chike_Mountain','赤柯山','東部','花蓮縣玉里鎮赤科山產業道路',1,'23.3907455','121.3728496');
insert into viewname values ('Fuyuan_Butterfly_Valley','富源蝴蝶谷','東部','花蓮縣萬榮鄉廣東路161號',1,'23.588759','121.354797');
insert into viewname values ('Nanan_Waterfall','南安瀑布','東部','花蓮縣卓溪鄉八通關古道',1,'23.3116128','121.2483078');
insert into viewname values ('Antong_Hot_Springs','安通溫泉','東部','花蓮縣玉長公路41號',1,'23.2804707','121.3422763');
insert into viewname values ('Ruisui_Pasture','瑞穗牧場','東部','花蓮縣瑞穗鄉舞鶴157號',1,'23.479955','121.345279');
/* ================================================================================================================== */



/*圖片管理*/
CREATE TABLE images ( 
 imagesID            	nVARCHAR(50) NOT NULL,
 imagesName				nvarchar(50) not null,
 imgDescript            nVARCHAR(400)		 ,
 imgSrc                 image		 ,
 images_format			varchar(20)	 ,
 CONSTRAINT images_imagesname_FK FOREIGN KEY (imagesname) REFERENCES viewname (viewid),
 CONSTRAINT images_imagesid_PK PRIMARY KEY (imagesid)
 );


--insert into images values ('N_Chingtienkang_01','Chingtienkang','擎天崗草原好玩唷!','','');
--insert into images values ('N_Chingtienkang_02','Chingtienkang','擎天崗草原好多草!','','');
--insert into images values ('N_Maokong_01','Maokong','貓空好多貓!','','');

/* ================================================================================================================== */
/*北部*/
insert into images values ('N_Bali_01','Bali','基隆河匯入淡水河之前，繞著社子島轉出一個美麗的弧彎，在其北岸與磺港溪以西地帶，保留了都會臺北極其珍貴的稻香田園。','','');
insert into images values ('N_Bali_02','Bali','穿越關渡平原的自行車道，是全線非封閉性的路徑，西側端點為關渡宮，往東沿著關渡防潮堤至八仙福德祠，轉90度往北穿越關渡平原，直到北投中央北路捷運軌道南側，穿出去便是政戰學校西邊的稻香路。','','');
insert into images values ('N_Bali_03','Bali','關渡宮沿河堤段原有的攤販已完全撤離，改成好走的人行步道，跨越中港河小橋旁停泊的漁船也外移至淡水河邊，雖然少了扁舟停泊的漁港懷舊味，水域卻也另有清爽的風貌。 ','','');
insert into images values ('N_Riverbank_Park_01','Riverbank_Park','一路環遊淡水河、基隆河、新店溪、景美溪，共111公里水岸的自然與人文風光，河川沿線有豐富的自然、古蹟等美麗景觀，除了提供市民休閒時的最佳去處，也能看到一個城市發展的軌跡。','','');
insert into images values ('N_Riverbank_Park_02','Riverbank_Park','整治後樣貌截然不同，騰出了寬敞的行水區，成為基隆河最美的一段，也保留城市呼吸的空間。','','');
insert into images values ('N_Riverbank_Park_03','Riverbank_Park','若從大稻埕疏散門(淡5號)進入大稻埕至淡水河，則能一路欣賞淡水河兩岸燈火搖曳的臺北夜景，十足浪漫迷人。','','');
insert into images values ('N_Beitou_01','Beitou','北投溫泉從日據時代便有盛名，瀧乃湯、星乃湯、鐵乃湯就是日本人依照溫泉的特性與療效給予的名稱，據說對皮膚病、神經過敏、氣喘、風濕等具有很好的療效，也因此成為了北部最著名的泡湯景點之一。','','');
insert into images values ('N_Beitou_02','Beitou','新北投溫泉的泉源為大磺嘴溫泉，泉質屬硫酸鹽泉，PH值約為3~4之間，水質呈黃白色半透明，泉水溫度約為50-90℃，帶有些許的硫磺味 。','','');
insert into images values ('N_Beitou_03','Beitou','目前北投的溫泉旅館、飯店、會館大部分集中於中山路、光明路沿線以及北投公園地熱谷附近，總計約有44家。','','');
insert into images values ('N_Yangmingshan_01','Yangmingshan','陽明山舊稱草山，因紀念明朝學者王陽明而改名為陽明山，它是臺北的都市後花園，位居近郊，是大家很方便就可以遠離塵囂，休閒的好去處。','','');
insert into images values ('N_Yangmingshan_02','Yangmingshan','陽明山溫泉大致可分為4個區域：陽明山國家公園周邊、冷水坑、馬槽及火庚子坪。','','');
insert into images values ('N_Yangmingshan_03','Yangmingshan','溫泉在陽明山風景區內，分前山溫泉和後山溫泉兩塊，有很多溫泉旅館，加上山上眾多風景區和美食，很適合兩天一夜的登山遊園泡湯之旅。','','');
insert into images values ('N_Xiangshan_01','Xiangshan','象山因外形似象頭而得名，位於臺北盆地東南方的信義區，與虎山地質相同主要由砂岩組成','','');
insert into images values ('N_Xiangshan_02','Xiangshan','區內各種稜線、岩壁、山坡等不同環境，孕育出多種蕨類植物處處可見，其中又以金狗毛蕨與筆筒樹古老蕨類族群最大，數量居臺北市之冠。','','');
insert into images values ('N_Xiangshan_03','Xiangshan','登上象山之後，如果你的體力充沛，或是想伸展筋骨，步道兩旁還有許多強體力及肺活量的體能設施，只見大夥在山頂的逸賢亭打個尖、做個操，還有精力無窮的小朋友穿梭其間，運動休閒一兼二顧，很適合全家來活動。','','');
insert into images values ('N_Tianmu_01','Tianmu','天母古道親山步道穿越士林華岡地區的西北山坡，涵蓋華岡至天母間的數條步道。','','');
insert into images values ('N_Tianmu_02','Tianmu','說是有一千多個階梯，就當作是進入山林前的「暖身」。首先映入眼簾是龍眼樹林，石階兩旁高大的龍眼樹，有的樹腰粗到要兩人合抱。','','');
insert into images values ('N_Tianmu_03','Tianmu','沿途林木蔽日，夏日走在如履平地的山路上倍覺舒適涼爽；冬季只聽見北風在溪谷中呼嘯，但不覺有刺骨寒風。','','');
insert into images values ('N_Hushan_01','Hushan','虎山為四獸山市民森林區內之淺山之一，連接區後南港山系構成臺北市東南側的屏障，海拔140公尺。','','');
insert into images values ('N_Hushan_02','Hushan','這條路線景觀多元饒富趣味，植物種類繁多，步道沿途設有解說牌，拾級而上之際就可輕鬆展開自導式生態之旅。','','');
insert into images values ('N_Hushan_03','Hushan','虎山溪本是原始的自然野溪，再加上水土保持不良，使得溪底沖蝕淤積現象日益嚴重，現已改善。','','');
insert into images values ('N_Jiantan_01','Jiantan','劍潭山海拔153公尺，位於臺北市士林區圓山風景區，是圓山飯店後山的北稜。','','');
insert into images values ('N_Jiantan_02','Jiantan','劍潭山親山步道夜景的人氣指數向來高居不下，於制高點欣賞繁華的市景燈火夜色，不時還有飛機低空略過星空。','','');
insert into images values ('N_Jiantan_03','Jiantan','這一帶以前是軍事管制區和保安林地，所以自然林相得以保持，密林遍佈整個步道。','','');
insert into images values ('N_Guandu_01','Guandu','成群候鳥飛越關渡綠色平原的姿態真是好看，從山坡上俯視這景象，不失為另一種幸福。','','');
insert into images values ('N_Guandu_02','Guandu','飽覽山色美景之後，由登山口進入天際線，原本開闊的視野突然轉為林蔭山徑，彷彿踏入另一個與世隔絕的世界。','','');
insert into images values ('N_Guandu_03','Guandu','向右走呢，沿著涼亭旁的步徑到行天宮的「後花園」逛逛，走在林蔭扶疏的小徑最是涼爽。','','');
insert into images values ('N_Whitehead_Lake_01','Whitehead_Lake','白石湖吊橋位於內湖白石湖休閒農業區內，吊橋入口位於碧山巖開漳聖王廟的停車場旁，全長116公尺','','');
insert into images values ('N_Whitehead_Lake_02','Whitehead_Lake','有別於一般吊橋的高聳橋台設計，特別採直路式設計，打造成一座無懸吊纜繩的隱形吊橋，融入當地的田園美景。','','');
insert into images values ('N_Whitehead_Lake_03','Whitehead_Lake','通果吊橋後為白石湖社區，百公尺長的春秋步道，可見精心開闢的花卉專業種植區，及當地豐富的農村特色、景觀生態等資源。','','');
insert into images values ('N_Bihu_01','Bihu','碧湖步道連結內湖路三段60巷12弄與大湖街131巷間，總長1,327公尺。','','');
insert into images values ('N_Bihu_02','Bihu','因省轄時期，當地煤礦業興盛，林區特於1k+000處規劃一處復舊礦坑意象景點，包括礦坑隧道、軌道、及裝滿煤渣的礦車等，題名為「新福本坑」。','','');
insert into images values ('N_Bihu_03','Bihu','周邊鄰近忠勇山、鯉魚山、圓覺寺登山步道、圓覺瀑布、大湖公園等熱門景點，是民眾早晚健行、週末休閒的好處。','','');
insert into images values ('N_Chingtienkang_01','Chingtienkang','擎天崗草原又稱太陽谷，其位於大屯山群彙的中央，及竹子山、七股山與頂山，磺嘴山之中間按部。','','');
insert into images values ('N_Chingtienkang_02','Chingtienkang','台灣光復後政府依據原大嶺峙牧場中擎天崗、冷水坑一帶的規劃設置了陽明山牧場。','','');
insert into images values ('N_Chingtienkang_03','Chingtienkang','擎天崗地勢平坦，又有連綿的草原，綠草如茵，是觀察草原景觀最佳的自然教室。','','');
insert into images values ('N_Maokong_01','Maokong','貓空為火成岩地質，在木柵茶區東側的小溪谷裡，因為當地地質較軟硬不同，許多河床上石頭上形成了壺穴般的鑽蝕坑洞，而因為形狀相似貓爪留下的孔洞，所以稱為貓空。','','');
insert into images values ('N_Maokong_02','Maokong','每年農曆春節後，2,000餘株紅、白、粉紅色的杏花陸續爭相吐豔，一直持續至3月中旬以後。','','');
insert into images values ('N_Maokong_03','Maokong','貓空老泉里、萬興、博嘉的山區及鄰近景美溪河岸一帶，盛產綠竹筍，年產量達667萬公斤，不僅鮮嫩且帶有獨特的香氣。','','');
insert into images values ('N_Daan_01','Daan','大安森林公園佔地約26公頃，於民國八十三年三月二十九日啟園。雖位於台北市區中心，但卻是一個草木濃密的生態公園。','','');
insert into images values ('N_Daan_02','Daan','公園內除有綠樹成蔭之外，更有花壇處處，每逢花開時節色彩繽紛，令人賞心悅目。','','');
insert into images values ('N_Daan_03','Daan','各種休憩設施如行人座椅、涼亭、音樂舞台、慢跑道……等各種設施相當完善，公園下方並設置有地下停車場以方便開車前來的民眾，已成為台北市民休閒最佳場所之一。','','');
insert into images values ('N_Beitou_Park_01','Beitou_Park','「北投」總是給人說不完的人文、傳說及故事，下了新北投捷運站，跟著裊裊的溫泉煙霧前行，前方滿是綠意的溫泉鄉美景，就是北投公園。','','');
insert into images values ('N_Beitou_Park_02','Beitou_Park','北投公園面積達6萬1,129平方公尺。首先映入眼簾的，是98年度完工的入口跳泉，有著燈光及水泉飛舞，為北投這個具有豐富文化的老台北地區。','','');
insert into images values ('N_Beitou_Park_03','Beitou_Park','還有聞名的溫泉博物館，似乎還瀰漫著濃濃硫磺的特有香味，感受日據時代建築之美感，置身其中，像是回到舊時的悠悠時光裡。','','');
insert into images values ('N_Fisherman_Wharf_01','Fisherman_Wharf','淡水漁人碼頭木棧道，為淡水新興的觀光景點，每於假日遊人如織。','','');
insert into images values ('N_Fisherman_Wharf_02','Fisherman_Wharf','有設觀光遊艇，假日固定航次遊淡水河以及夏季出航從事以港對港的藍色公路之旅(淡水-富基漁港-野柳)，沿途可在海上欣賞淡水河海交匯及北海岸風光。','','');
insert into images values ('N_Fisherman_Wharf_03','Fisherman_Wharf','跨港橋，長164.9米，平均寬約5公尺，最高處約12米，以人字形單面斜張橋為橋型，流線之彎曲造型與帆船之風帆意象相互呼應。','','');
insert into images values ('N_Pinghsi_01','Pinghsi','「北天燈　南烽炮」流傳已久，平溪天燈又稱孔明燈，傳說最初是諸葛亮因軍事所需而發明，也有傳聞因其造型如諸葛亮的帽子而得名。','','');
insert into images values ('N_Pinghsi_02','Pinghsi','久而久之，放天燈便成為了每年元宵節十分地區的特殊民俗，在一個寧靜的山城小村（十分寮）承襲了此一民俗文化的衣缽，綿延一兩百年之久，是台灣北部最具有民俗色彩之文化活動。','','');
insert into images values ('N_Pinghsi_03','Pinghsi','多位師傅的共同努力下製作的18.98公尺（53呎）巨型天燈，更在金氏世界紀錄中寫下歷史性的一刻，由此可見其空前盛況。 ','','');
insert into images values ('N_Yehliu_01','Yehliu','「野柳」為大屯山餘脈伸出海中的岬角，從金山遠眺，猶如潛入海中的巨龜，故又名為「野柳龜」。','','');
insert into images values ('N_Yehliu_02','Yehliu','其因波浪侵蝕、岩石風化及地殼運動等作用，造就了海蝕洞溝、燭狀石、蕈狀岩、豆腐石、蜂窩石、壺穴、溶蝕盤等各種奇特景觀。','','');
insert into images values ('N_Yehliu_03','Yehliu','燭台石的「燭火」其實是岩層裡堅硬的球形結核，因較能抵抗海蝕，而露出錐形頂部，海水沿其邊緣迴流激盪，產生環狀溝槽，由於結核外圍有一帶堅硬的環圈。','','');
insert into images values ('N_Fort_San_Domingo_01','Fort_San_Domingo','紅毛城原名「聖多明哥城」，為西班牙人17世紀建造，後來荷蘭人打敗西班牙人而佔領此城，由於荷蘭人在當時有「紅毛」之稱，因而稱此城為「紅毛城」。','','');
insert into images values ('N_Fort_San_Domingo_02','Fort_San_Domingo','城堡旁的英國領事住宅（西元1891年建），為兩層式洋樓，是典型殖民地建築。','','');
insert into images values ('N_Fort_San_Domingo_03','Fort_San_Domingo','開放供國人參觀，全區分為紅毛城及英國領事住宅兩部分，由此眺望落日，即昔日淡水八景之一的「戌台夕陽」。 ','','');
insert into images values ('N_Bisha_01','Bisha','碧砂漁港為一著名的觀光漁市，兩棟主要長形建築物，分別是「漁市場」和「飲食街」。','','');
insert into images values ('N_Bisha_02','Bisha','遠洋、近海、沿岸、養殖應有盡有。旁邊的飲食街除可在店內點菜外，也可將選購之海產交給店家代為料理。','','');
insert into images values ('N_Bisha_03','Bisha','碧砂漁港為基隆新興的漁港，發展方向以休閒觀光為主，是目前政府極力發展海上觀光業的一處主力港口。','','');
insert into images values ('N_Small_Wulai_01','Small_Wulai','小烏來風景區地處桃園縣復興鄉，以清新秀麗的瀑布和峽谷風光見長。','','');
insert into images values ('N_Small_Wulai_02','Small_Wulai','區內以小烏來瀑布，龍鳳谷瀑布及風動石出名。','','');
insert into images values ('N_Small_Wulai_03','Small_Wulai','每年五，六月，及十一月至隔年二月是賞鳥季節，因此在這裏不但可以享受森林浴，也可觀看瀑布及賞鳥，是遊憩的好地點。','','');
insert into images values ('N_Toucheng_01','Toucheng','頭城是開蘭第一城，而和平街則是頭城最古老的街道， 在清代一度成為蘭陽平原最重要的經濟中心， 於今卻是宜蘭地區碩果僅存的老街。','','');
insert into images values ('N_Toucheng_02','Toucheng','和平街北段頂端的北門福德祠， 是老街的守護神；往南的長排平房， 便是清代船頭行的遺址十三行； 再往南則有混合各種建築風格的「139號」盧宅。','','');
insert into images values ('N_Toucheng_03','Toucheng','北通烏石港， 南出打馬煙，帆檣林立，盛極一時， 當地居民在老街南北兩端， 各蓋了一間面向街心的福德祠， 以堵住財氣。','','');
insert into images values ('N_Yingge_01','Yingge','鶯歌陶瓷博物館為全國首座陶瓷專業博物館，歷經3位縣長，耗時12年籌建，最後終於在2000年11月26日開館。','','');
insert into images values ('N_Yingge_02','Yingge','同時更以教育服務為導向，結合資訊科技，塑造各種情境；讓陶博館成為知性、感性、可親、可遊的博物館。','','');
insert into images values ('N_Yingge_03','Yingge','傳統技藝廳說明陶瓷製作過程，並呈現早期製陶之輔助工具；2樓說明台灣各地陶瓷發展的歷程及其特色，以及介紹台灣陶瓷產品，具體呈現展出品的特色、類型及用途等，充分說明產品和生活之間的關係。','','');
insert into images values ('N_Leofoo_01','Leofoo','充滿牛仔風格狂野標悍的「美國大西部」、熱帶島嶼風情的「南太平洋」、魔幻神奇的「阿拉伯皇宮」以及六福村最引以為傲，讓您可近距離觀察原始動物生態的「非洲部落」。','','');
insert into images values ('N_Leofoo_02','Leofoo','園區內魔術噴泉廣場，更有精采的音樂水舞表演。','','');
insert into images values ('N_Leofoo_03','Leofoo','想體驗真實與夢幻交織的歡樂與驚奇嗎？六福村主題遊樂園，不怕你不玩，怕你玩不完！！','','');
insert into images values ('N_Keelung_Temple_01','Keelung_Temple','聞名全台的基隆市廟口小吃已有3、40年的歷史了。','','');
insert into images values ('N_Keelung_Temple_02','Keelung_Temple','小吃種類眾多，短短3、400公尺，卻聚集了有近200個攤位，走在其間，嘴巴沒有一刻停閒。','','');
insert into images values ('N_Keelung_Temple_03','Keelung_Temple','夜市中每位經營的老闆都巧心創作口味和料理，用料實在而且價錢公道、色香味俱全；也難怪每天這兒都相當的熱鬧。','','');
insert into images values ('N_Chiaohsi_01','Chiaohsi','礁溪鄉以溫泉聞名，位於宜蘭縣東北角，四百多年前這兒住著噶瑪蘭人和泰雅族人，到了清嘉慶元年（1796年），福建人吳沙帶領移民進入，並慢慢開墾此地，終於使礁溪逐漸成為宜蘭北部重鎮。','','');
insert into images values ('N_Chiaohsi_02','Chiaohsi','又稱圓山公園，在火車站北方約 500公尺處，園內林蔭夾道，為民眾休閒之處，並設有宜蘭縣旅遊資訊中心，提供旅客觀光資訊、食、宿、交通等諮詢服務。','','');
insert into images values ('N_Chiaohsi_03','Chiaohsi','此泉色清無臭，湧到地表時約為58度 C，洗後光滑柔細不黏膩，由於富含礦物質，因此不論是浸泡、沐浴，都對身體健康極有幫助。','','');
insert into images values ('N_Tataocheng_01','Tataocheng','大稻埕原是平埔族的居住地，因萬華（艋舺）同安人發生激烈的械鬥，造成族人移至大稻埕定居，開始大稻埕淡水河旁商店和房屋的興建。','','');
insert into images values ('N_Tataocheng_02','Tataocheng','大稻埕在劉銘傳的治理下成為臺北城最繁華的物資集散中心，當中以茶葉、布料為主要貿易交易。','','');
insert into images values ('N_Tataocheng_03','Tataocheng','當時的延平北路及貴德街一帶便是商業活動的重心，也讓大稻埕早年的歷史多采多姿、令人回味。','','');
insert into images values ('N_Palace_Museum_01','Palace_Museum','國立故宮博物院於1965年在外雙溪落成，中國宮殿式的建築。','','');
insert into images values ('N_Palace_Museum_02','Palace_Museum','收藏品主要承襲自宋、元、明、清四朝，幾乎涵蓋了整部五千年的中國歷史，數量達65萬多件，國立故宮博物院擁有「中華文化寶庫」的美名。','','');
insert into images values ('N_Palace_Museum_03','Palace_Museum','為世界的文化寶地，國立故宮博物院是來臺灣旅遊的必訪之地。','','');
insert into images values ('N_Grandee_01','Grandee','士林官邸有精緻的庭園造景設計，蟲鳴鳥叫、 景色秀麗，是休閒遊憩的絕佳場所。','','');
insert into images values ('N_Grandee_02','Grandee','當年因為緊鄰著中山北路，佔據極佳的地理位置，可快速直達總統府，加上後有福山做為倚靠，優越的地勢，所以成為蔣故總統官邸。','','');
insert into images values ('N_Grandee_03','Grandee','後來增設的露天音樂台，經常舉辦各種藝文及音樂相關活動，已經成為市民休閒的新去處。','','');
insert into images values ('N_Zoo_01','Zoo','臺北市立動物園是世界前十大都市型的動物園之一，搭捷運木柵線到最後一站就可以抵達。','','');
insert into images values ('N_Zoo_02','Zoo','除了室內展示館，還有8個戶外展示區，戶外展示區依地理環境做劃分，兼具物種展示及生態環境教育的功能，其中「兒童動物園」、「臺灣鄉土動物區」和「非洲動物區」是動物園線上票選最受歡迎的展示區。','','');
insert into images values ('N_Zoo_03','Zoo','「臺灣鄉土動物區」展出梅花鹿、臺灣黑熊、台灣獼猴和藍腹鷳等台灣特有種，這些可都是台灣限定，千萬不可以錯過喔！','','');
/* ================================================================================================================== */

/*中部*/
insert into images values ('C_Yizhong_St_01','Yizhong_St','位於中友百貨附近，與三民商圈連成一氣，附近有臺中科技大學、臺中一中、台灣體育運動大學等學校，學生人口眾多，小吃攤、飲食店林立，各種新潮流行資訊在這隨處可見、隨手可得。','','');
insert into images values ('C_Yizhong_St_02','Yizhong_St','臺中一中街商圈雖沒有逢甲夜市歷史悠久，但也有著許多家二十年以上的歷史老店，例如到一中街裡很多人都知道的一中豐仁冰、上和園滷味(東海蓮心冰的直營店)、日日利海盜飯糰、喜事連連煎餃等，賣得都是過去一中人才吃得到的好味道。','','');
insert into images values ('C_Yizhong_St_03','Yizhong_St','每到假日，人潮眾多，十分熱鬧！育才街上多是小吃攤，而服飾店多在小巷子中。各式新潮前衛的玩意都會在此先出現，若你是流行的追求者，一中夜市絕對不能錯過。','','');
insert into images values ('C_Fengjia_Night-Market_01','Fengjia_Night-Market','逢甲文華夜市位於逢甲大學側門，從文華路一直延伸到福星路，消費族群以二、三十歲的年輕人為主。因其有著位於學區和接近市區的地緣關係，逐漸成為臺中市夜市集團的龍頭。','','');
insert into images values ('C_Fengjia_Night-Market_02','Fengjia_Night-Market','近年來，市政府重新規劃商圈風貌，整修路面，街道造景，並規劃停車空間，努力解決停車的問題。現今逢甲文華夜市嶄新面貌更吸引了不少消費族群，商圈更有逐漸擴大的現象，並成為民眾心目中票選「臺中市十大觀光景點」之一。','','');
insert into images values ('C_Fengjia_Night-Market_03','Fengjia_Night-Market','逢甲文華夜市與其它臺中市夜市最大不同之處，在於其不單是以飲食著稱，也包含了各式各樣的商店，營業時間亦較長。','','');
insert into images values ('C_Park_Lane_By_CMP_01','Park_Lane_By_CMP','勤美誠品綠園道（Park Lane By CMP），位在臺灣臺中市西區公益路與經國園道旁的購物中心。由勤美集團與誠品集團共同招商，鄰近國立自然科學博物館、國立台灣美術館、台中金典酒店、全國大飯店、亞緻大飯店等。','','');
insert into images values ('C_Park_Lane_By_CMP_02','Park_Lane_By_CMP','由知名建築師陳瑞憲與郭旭原將大樓重新改裝設計。室內植生牆共13,200株植栽，由地下2樓延伸至地上3樓（高達20公尺）；室外植生牆共118,300株，當時為亞洲最大的植生牆。','','');
insert into images values ('C_Park_Lane_By_CMP_03','Park_Lane_By_CMP','植生牆配備了完整的澆灌系統，用超過6千支隻滴管、3公里長的水路管線與數百個噴頭，讓植栽可以循環自生、無須更換，還成為許多花鳥蝴蝶的家，終於完成這個垂直生態花園的夢想。','','');
insert into images values ('C_Jingming_1st_St_01','Jingming_1st_St','精明一街位於台中市西區五期重劃區內，集大墩19街與大隆路間的一條內街，屬於辦公區與商店街的混合區，這條街正確的名稱應該稱為「台中商務中心行人徒步區」。街前有一個小小的「精明一街」牌樓，是這條洋味十足街道中唯一有古味的建築。','','');
insert into images values ('C_Jingming_1st_St_02','Jingming_1st_St','精明一街為夾雜在都市叢林中的藝術街道，享受一下坐在露天咖啡座中，品嚐著一杯香濃的咖啡，看著熙來攘往的人群，別有一種生活情趣，一朵朵不同色彩的洋傘，搭配上各式的桌子，彷彿有種置身於巴黎香榭大道的感覺。','','');
insert into images values ('C_Jingming_1st_St_03','Jingming_1st_St','精明一街為台中商務中心行人徒步區，街道兩旁林立各式精品店、異國風味餐廳及咖啡館，個性商店等。各類過季名牌服飾、皮件、飾品物超所值，是喜愛精品商品的最佳去處。精明一街是一條兼具購物、休閒與藝術的街道。','','');
insert into images values ('C_Maple_Garden_01','Maple_Garden','位於市政北七路與河南路口的秋紅谷，兼具綠色生態水池、景觀、滯洪、排水與調節空氣品質功能，可容納20萬立方公尺的滯洪量，將成為大台中特殊下凹式景觀公園新景點，更能營造一處讓市民更感輕鬆、從容的休閒好去處。','','');
insert into images values ('C_Maple_Garden_02','Maple_Garden','建築師還去歐洲，考察規劃人工湖泊，未來會呈現藍水、綠地與紅樹，大池塘具有景觀、生態與滯洪功能，沿著斜坡到池塘都有步道，營造山谷的感覺，周邊遍植林木，可增加2.8萬平方公尺綠地。','','');
insert into images values ('C_Maple_Garden_03','Maple_Garden','水坑深達20公尺，沿著邊坡回填土石，維持地勢穩定，湖泊面積約1公頃，環湖與湖面上都有步道，總長度約400公尺，湖面上還有透明步道，感受行在水面上的感覺。','','');
insert into images values ('C_Calligraphy_Greenway_01','Calligraphy_Greenway','草悟道（Calligraphy Greenway）是臺中市中心一整段大範圍的綠園道。帶狀的都市綠園道，範圍：國立自然科學博物館前經國園道（含市民廣場）、國立台灣美術館到美術園道之間綠帶，全長3.6公里。','','');
insert into images values ('C_Calligraphy_Greenway_02','Calligraphy_Greenway','草悟道計畫為省轄時期的臺中市政府都市發展處、建設處、交通處承辦的綠園道帶狀的都市空間架構之景觀設計案，因設計上有「行草悟道」的概念，故另有「草悟道」別稱。','','');
insert into images values ('C_Calligraphy_Greenway_03','Calligraphy_Greenway','如行草般的行雲流水，發現生活感動；從藝文空間、國立臺灣美術館，到特色美食，如悟道般的樂活心靈，體會都市脈動；在草悟道，悠遊於綠藝之間，看見一座城市的兩種態度。','','');
insert into images values ('C_Miyahara_01','Miyahara','靠近臺中火車站的綠川旁，一棟由紅磚瓦構成的建築，是臺中以土鳳梨酥一戰成名的「日出」蛋糕團隊買下了宮原眼科的舊址。宮原眼科外部的紅磚牆、舊牌樓被完整保留下來，打造成富有懷舊風情的紅磚木頂式騎樓。','','');
insert into images values ('C_Miyahara_02','Miyahara','古挑高圖書館的裝飾，創造出新舊時代的魔幻空間，店中央一座無法被使用的古井，則被重新打造成現代風的圓型玻璃募款箱，可見設計之巧思。','','');
insert into images values ('C_Miyahara_03','Miyahara','復古包裝的糕點是最受大家歡迎的伴手禮，有著精緻包裝又美味可口的點心，送禮自用兩相宜唷！來到宮原眼科，千萬不可錯過這裡招牌的冰淇淋，多種口味都是獨家特製配方。','','');
insert into images values ('C_Gaomei_Wetland_01','Gaomei_Wetland','位於台中縣清水鎮大甲溪南岸的高美濕地，每年秋冬之際都會有大批的候鳥抵達，無論是短暫的過境或一季的渡冬，總是為這一塊人們以為無用的寶地，憑聽無數的生趣。','','');
insert into images values ('C_Gaomei_Wetland_02','Gaomei_Wetland','日據時期的高美，日人除了設立學校也開闢高美海水浴場，當時昭和巴士早已在清水的高美路上來回馳騁，民國56年高美燈塔的建立，增添一處地標景觀，使高美海水浴場的遊客熱潮，達到巔峰。','','');
insert into images values ('C_Gaomei_Wetland_03','Gaomei_Wetland','依野生動物保育法規定，進行相關的經營管理與保育研究等計劃，期待可為高美地區帶來無限的生態旅遊與觀光產業之商機。','','');
insert into images values ('C_Dajiamazu_01','Dajiamazu','大甲鎮瀾宮位於台中市大甲區順天路，香火鼎盛，信徒絡繹不絕，也是外地民眾到大甲旅遊時，必定的遊覽之處。','','');
insert into images values ('C_Dajiamazu_02','Dajiamazu','大甲鎮瀾宮創建於清乾隆三十五年(西元1770年)，至今已有兩百多年歷史，是大甲鎮最具規模的寺廟，香火鼎盛。','','');
insert into images values ('C_Dajiamazu_03','Dajiamazu','大甲旅遊吸引人之處，就是在每年農曆3月初一，各地信徒組成浩大的進香團，追隨大甲鎮瀾宮的媽祖到嘉義新港奉天宮遶境進香，進行8天7夜的徒步參拜，這就是著名的大甲媽祖繞境。','','');
insert into images values ('C_Lishan_Scenic_Area_01','Lishan_Scenic_Area','梨山是中部橫貫公路開發最早、最熱鬧的風景區，位於海拔１６７０公尺的和平區，為泰雅族原住民重要聚落區，民國四十九年中部橫貫公通車後，不僅成為國內外馳名的觀光區，也是中橫旅遊路線的轉運中心。','','');
insert into images values ('C_Lishan_Scenic_Area_02','Lishan_Scenic_Area','梨山風景區附近主要有梨山文物陳列館以及觀光果園，梨山文物陳列館陳列了山地文物梨山開拓史，以及中橫開發的工程資料，而附近的觀光果園則因時節的不同而有所不同，當均的有名特產是蘋果、水蜜桃及水梨。','','');
insert into images values ('C_Lishan_Scenic_Area_03','Lishan_Scenic_Area','梨山不僅具有豐富的自景觀資源，同時也是台中山區重要的溫帶水果產地，盛產水蜜桃以及蘋果，主要觀光設施有梨山賓館，山地文物陳列館、觀光果園以及水果市場。另外每年的一月到四月為本地的主要賞花季節，更是前往梨山觀光的最佳時間。','','');
insert into images values ('C_National_Taiwan_Museum_of_Fine_Arts_01','National_Taiwan_Museum_of_Fine_Arts','民國77年(1988年)開館的國立台灣美術館位於台中市西區，毗鄰台中市立文化局與國立自然科學博物館，展館面積包含地下一層、地上三層與戶外雕塑公園，是目前亞洲最大的美術館。','','');
insert into images values ('C_National_Taiwan_Museum_of_Fine_Arts_02','National_Taiwan_Museum_of_Fine_Arts','國美館的外觀，以整片天然石片鋪上，館外草坪放置巨型雕塑，大片的綠地往往吸引許多民眾此席地而坐，愉悅地聊天、曬太陽，構成一幅悠閒自在的畫面。','','');
insert into images values ('C_National_Taiwan_Museum_of_Fine_Arts_03','National_Taiwan_Museum_of_Fine_Arts','設兒童繪本區、兒童遊戲室、影音藝術廳、影音平台、教師資源室、文物供應部、咖啡座及各項學習空間。館內收藏與研究台灣現代美術品與發展特色，並長期與國外美術館交流，無疑為台中旅遊知名台中景點。','','');
insert into images values ('C_Oiwake_Station_01','Oiwake_Station','追分火車站位於台中市的大肚區，建於日治時期西元1922年，火車站站房的結構主要以檜木木材搭建而成，至今已將近90年的歷史。','','');
insert into images values ('C_Oiwake_Station_02','Oiwake_Station','追分火車站是台鐵海線的終點站，是少數未經過改建的海線車站之一。追分原為日文的(おいわけ)oiwake，是分岐路的意思。由於台灣曾經受日本人統治長達50年之久，因此台灣多處地名大多由日語漢字命名而成。','','');
insert into images values ('C_Oiwake_Station_03','Oiwake_Station','因為如此吉利又特別的地名，更受許多學生族群或遊客們所吸引，尤其每到考季來臨，「追分－成功」的紀念車票變成為最為熱門的銷售車票，許多學生們便藉由此種方式討吉利，並祈求考試順利、金榜題名。','','');
insert into images values ('C_Big_Hole_Scenic_01','Big_Hole_Scenic','大坑風景區位於台中市北屯區，素有『台中陽明山』之稱。民國65年，大坑風景區經台中市政府開發成立，面積3300公頃，海拔112公尺至860公尺，堪為台中的後花園。','','');
insert into images values ('C_Big_Hole_Scenic_02','Big_Hole_Scenic','921大地震後，車籠埔斷層穿越大坑，地層劇烈變動後，許多專家發現了這裡的溫泉資源，因而開了新的觀光型態。大坑風景區擁有自然生態、溫泉泡湯與便捷的交通，曾獲選台中前十大熱門旅遊景點，遊客千萬不要錯過！','','');
insert into images values ('C_Big_Hole_Scenic_03','Big_Hole_Scenic','大坑風景區夏天盛產荔枝，秋天盛產柑橘，秋冬可以賞楓溫泉，不論什麼時候都可以在此找得到新鮮感。大坑風景區擁有8條登山步道，一號至五號步道，全長11870公尺，連接大坑連坑巷以東至縣市界區。','','');
insert into images values ('C_Taichung_Park_01','Taichung_Park','台中公園位於台中市公園路及自由路二段之間，佔地大約32,889坪，是台灣少數日據時代就保留至今的公園，也是台中面積最大的城市綠地。','','');
insert into images values ('C_Taichung_Park_02','Taichung_Park','公園裡日月湖中的湖心亭，是雙併式頂的涼亭，該亭建於清光緒34年，與中山橋同列為台中市定古蹟，而園內的砲台山古稱為”大墩”，則是台中市市中心的起源。','','');
insert into images values ('C_Taichung_Park_03','Taichung_Park','創立於1903年10月28日，園內綠草如茵、古樹林立、景色宜人，其中的人工湖更提供小船出租，而湖中的橋樑亦是欣賞公園美景的最佳之處。在市中心有如此舒適的公園環境，黃昏時分經常有不少朋友、家人、情侶在此漫步，假日更是踏青的好去處。','','');
insert into images values ('C_Shalu_District_01','Shalu_District','沙鹿區位於台中市西部海岸平原的中心位置，為台中港特定區之重要工商經濟腹地，由於台中港區聯外道路的開闢與第二高速公路的興建以及中部國際機場之啟用，使沙鹿區不僅為臺中市與台中港區之間的交通樞紐，亦逐漸成為中台灣與國際接軌之重鎮。','','');
insert into images values ('C_Shalu_District_02','Shalu_District','為尋求與當地都市地景取得和諧，於三民公園設置中央橋塔，雙塔式雙跨斜張橋，橋塔以輕巧之三根圓型鋼管組成，主梁以簡潔箱梁搭配造型助鈑及欄杆，表現出輕盈富變化的感覺，不僅外觀顯得輕巧，幾何造型亦較富於變化，且不致遮蔽視野。','','');
insert into images values ('C_Shalu_District_03','Shalu_District','新的陸橋命名為『沙鹿之翼』，是經過網路票選的結果，意思是希望沙鹿未來更有朝氣、有活力，完工後學生及行人過馬路也不必與車爭道，行的安全更有保障。','','');
insert into images values ('C_Rainbow_Village_01','Rainbow_Village','台中旅遊傳奇景點「彩虹眷村」，起源於住在台中市南屯區嶺東科技大學附近有一處舊眷村的八十七歲老榮民黃永阜，因為「無聊」而拿起畫筆彩將眷村內的巷弄街道當成了天然的畫布。','','');
insert into images values ('C_Rainbow_Village_02','Rainbow_Village','彩繪了各式美麗的彩虹線條與可愛動物，不僅染亮了小村，在網路上引起熱烈討論，更形成一股參訪風潮。因他的用色大膽，構圖可愛並充滿童趣，讓到訪者有如置身彩虹世界，故網友稱此處為「彩虹眷村」。','','');
insert into images values ('C_Rainbow_Village_03','Rainbow_Village','「彩虹眷村」因曾被規劃為住宅與道路用地，故一度面臨拆除的命運，但一群支持者透過網路發起搶救行動，希望能將這保留這塊美麗之地。終於，在民國99年9月12日由市長胡志強表示，將透過重劃方式把此處納入公園範圍，保存這處別具特色的文化資產。','','');
insert into images values ('C_Dongfung_Bike_Corridor_01','Dongfung_Bike_Corridor','東豐自行車綠廊原為臺鐵縱貫東勢支線，從豐原到東勢鐵路支線，經東勢區、石岡區、豐原區，為民國80年9月鐵路停駛後再經多方努力下轉型為自行車專用道，並且改名為「東豐自行車綠廊」。','','');
insert into images values ('C_Dongfung_Bike_Corridor_02','Dongfung_Bike_Corridor','東豐自行車綠廊雖是屬於單線進出的廊道，而沿著地形的平緩，人文的改變，這樣自然景觀的多樣變化，不僅擁有豐富的客家族群文化及山水，那兒的農田更是阡陌相連，翠綠無垠。','','');
insert into images values ('C_Dongfung_Bike_Corridor_03','Dongfung_Bike_Corridor','自開放以來，為了使旅客擁有更完美的旅遊資訊，則在綠廊石岡段設立旅客服務中心，於92年正式啟用。而與鄰近的藍色大甲溪相互照映，是提供假日休閒育樂的好地方。尤其於92年10月份全路段增設夜間照明設施， 夜間也可悠遊綠廊， 是為全臺首座夜間自行車道。','','');
insert into images values ('C_Wuling-Farm_01','Wuling-Farm','早在中橫公路尚未通車之前，大甲溪上游是台灣原住民泰雅族的原鄉，台中市和平區的環山、松茂、梨山、佳陽等部落的居民都過著自耕農自給自足的生活型態。中橫公路支線在民國四十七年通車後，陸續有人移居到武陵地區從事森林作業與農墾活動，名為「台灣榮民農墾服務所」的墾荒隊伍，即開始在這個地區設立「武陵農墾區」。','','');
insert into images values ('C_Wuling-Farm_02','Wuling-Farm','農場成立初期以安置國軍退除役官兵從事農業生產為主，開發東西橫貫公路沿線之山地農業資源，並成為輔導會所屬山地農場之一。近年來為因應時代潮流與任務， 及配合政府推動發展觀光產業、國土保育政策。','','');
insert into images values ('C_Wuling-Farm_03','Wuling-Farm','武陵的春天，漫山遍野的桃花、李花、蘋果花，散發淡淡的幽香；夏季，初熟的水果（每年七至十月為水果的季節），在枝頭嬌豔欲滴；深秋，鑲嵌在山林中火紅的楓葉，款款舞動；初冬，靄靄白雪，鋪滿山頭，展露北國風情。這樣多變的景緻，一向吸引著遊客流連忘返，捨不得踏上歸途。','','');
insert into images values ('C_Flowersea_01','Flowersea','新社花海活動花海區花卉規劃種植33公頃，共分為撒播景觀綠肥區與精緻草花區兩大區塊。','','');
insert into images values ('C_Flowersea_02','Flowersea','撒播景觀綠肥區面積為30公頃，遊客進入花海區後能被大面積向日葵、波斯菊及太陽麻整區塊艷麗景緻圍繞，並增加高粱及小麥作物，讓參訪民眾認識糧食作物生態，瞭解農委會活化休耕農地之政策，兼具農田土地有效利用及生態環境改善之目的。','','');
insert into images values ('C_Flowersea_03','Flowersea','將觀光農村的概念落實於整個中部地區，讓民眾了解環保的重要以及農村清新悠閒的氣息，在觀光之餘看見大自然的美，在遊玩之餘體會社區滿滿的熱情，全家大小享受一個悠哉的時光，無憂無慮的在花海中漫步。','','');
insert into images values ('C_National_Museum_of_Natural_Science_01','National_Museum_of_Natural_Science','本館是行政院於民國69年公布的國家12項建設文化建設計畫中三座科學博物館最先實現的一座。籌備處於民國70年成立，行政院聘國立中興大學理工學院院長漢寶德先生主持。','','');
insert into images values ('C_National_Museum_of_Natural_Science_02','National_Museum_of_Natural_Science','本館以科際整合、生活化、藝術化及以人為中心之主題展示，分四期建設完成。各期設施及展示主題分別為第一期：太空劇場、科學中心，第二期：生命科學廳，第三期：人類文化廳（原中國科學廳），第四期：地球環境廳。','','');
insert into images values ('C_National_Museum_of_Natural_Science_03','National_Museum_of_Natural_Science','全館佔地87,276平方公尺開放後，每年參觀人數近三百萬人。臺中市政府為促進地方繁榮，提升城市景觀，並借重本館之專業能力及教育理念，進而將五十四號公園預定地面積44,856平方公尺，委交本館規劃建設為植物園，於民國88年7月23日開放啟用。','','');
insert into images values ('C_Hightway_Rest_Area_01','Hightway_Rest_Area','國道三號上的清水服務區，被許多遊客喻為高速公路上最美的休憩站點，地處於中心的位置，提供給往來南北的旅客不只是休憩，還富有休閒的感受。','','');
insert into images values ('C_Hightway_Rest_Area_02','Hightway_Rest_Area','白天到黑夜，南來北往的旅客往返國道之間，清水服務區以遊輪意象為設計，如同揚起了風帆，加上頂層大型船桅裝置，像是徜徉在無限天際裡，航向遠方台中港的方向。','','');
insert into images values ('C_Hightway_Rest_Area_03','Hightway_Rest_Area','服務區內的意象設計「清水夜明珠」，燈塔意象的精神地標，延伸出「清水光點、台灣飛帆」的主題概念，引領方向。服務區二樓則是絕佳的觀景平台，從日落到日出想像乘坐遊輪之中，遠瞭台中日夜風情。','','');
insert into images values ('C_Taichung_City_Seaport_Art_Center_01','Taichung_City_Seaport_Art_Center','臺中市地形東西狹長，地方文化資源分配不易，為使藝文推廣能達全面之效，自民國82年起興建臺中市港區藝術中心，並於89年3月正式營運。','','');
insert into images values ('C_Taichung_City_Seaport_Art_Center_02','Taichung_City_Seaport_Art_Center','中心座落於文風鼎盛的清水區，東靠鰲峰山、西臨台中港、北傍大甲溪，建於高低起伏的人工矮丘與平地之間，以「院落空間」作為整體空間之詮釋，建築仿閩南合院風格設計，並帶有傳統書院格調，古樸典雅，具鄉土傳統素質。','','');
insert into images values ('C_Taichung_City_Seaport_Art_Center_03','Taichung_City_Seaport_Art_Center','本中心是一處多功能複合式的藝術展演場所，總面積約3公頃，主要區分為展覽廳、演藝廳、美術家資料館、演講會議廳、戶外劇場休閒區、研習教室區和行政區等，設施功能完善。除提供 人文藝術演出的舞台及民眾文化 休閒的集散地，亦積極化邊陲地緣位置的先天不足，已成為全國藝術展演的核心與場所。','','');
insert into images values ('C_Lavender-Forest_01','Lavender-Forest','「薰衣草森林」的聯外道路不大, 就像一座世外桃源，五色鳥、啄木鳥、貓頭鷹、螢火蟲全部都來作客，清澈的溪水裡看得到苦花魚。','','');
insert into images values ('C_Lavender-Forest_02','Lavender-Forest','取名「薰衣草森林」薰衣草自然是主角. 薰衣草森林目前分為三個部份：王媽媽香草園﹑葛雷斯花園及咖啡館。王媽媽香草園種植六十幾種香草植物﹐供應咖啡館所需及香草導覽之用。','','');
insert into images values ('C_Lavender-Forest_03','Lavender-Forest','葛雷斯花園為融合熱帶植物及台灣原生植物的英國式花園。圍繞著咖啡館的是梅花樹﹑櫻花樹﹑油桐及杉樹林和樹上的各式鳥屋。咖啡館提供新鮮香草入味的風味餐﹑花草茶與手製點心以及各式的香草製品。','','');
insert into images values ('C_Taiwan_Forest_Recreation_01','Taiwan_Forest_Recreation','八仙山森林遊樂區位於台中市和平區，主峰海拔2366公尺，約為八千台尺，因而得名「八仙」，區內森林蒼翠，氣候清爽宜人，十文溪與佳保溪匯流其間，溪水源自深山森林，水質清澈，溪中大小岩石遍佈，處處潺流。','','');
insert into images values ('C_Taiwan_Forest_Recreation_02','Taiwan_Forest_Recreation','自然生態資源豐富且本區於日治時期為台灣三大林場之一，擁有濃郁的林業人文風情，是您假日休閒體驗大自然最佳的去處！','','');
insert into images values ('C_Taiwan_Forest_Recreation_03','Taiwan_Forest_Recreation','遊樂區內規劃有三條森林浴步道，以八仙山莊停車場為起點，一為沿十文溪畔至上游，一是循下坡階梯至水壩區，第三條則穿越林間小徑及竹林通往日式神社及國小遺址，不論那一條，都可以下溪戲水，觀察植物、賞鳥、森林浴，若是體力足夠，還可攀登八仙山或新山。','','');
insert into images values ('C_Tali_Street_01','Tali_Street','清領時期，台灣中部最著名的商店街就是現在的大里老街，全長約兩百公尺的街道，直通大里溪畔的船運碼頭，是當時大陸與台灣貿易鼎盛時期，中部地區的重要轉運點，主掌著台中地區與南投內陸的貨物往來，是當時台灣的第六大商埠，當時繁華的盛況更是今日難以想像。','','');
insert into images values ('C_Tali_Street_02','Tali_Street','目前的老街僅存百餘公尺，以紅磚及木材建造的街屋仍是充滿濃濃的古早風情，慶源堂、秋櫃長等建築都是必去的重要景點！','','');
insert into images values ('C_Tali_Street_03','Tali_Street','這裡的店面都是狹窄而細長，其實主要原因是因為當時的店面寸土寸金，租金十分昂貴，店家只好以縮短店面寬度降低租金成本。另外深具特色的部分，就是騎樓與房屋的屋簷分開的「亭仔腳」建築，也是十分特別的呢！','','');
insert into images values ('C_Yuemei_Tourism_Sugar_Factory_01','Yuemei_Tourism_Sugar_Factory','月眉糖廠位於台中市后里區創立於西元(1909)年(日治時期)由日本人小松楠彌氏創廠並取名『大甲製糖所』，屬日糖興業株式會社，台灣光復後由台灣糖業股份公司月眉糖廠接收生產，西元1999年因環境變遷停止壓榨並轉型為觀光糖廠。','','');
insert into images values ('C_Yuemei_Tourism_Sugar_Factory_02','Yuemei_Tourism_Sugar_Factory','月眉觀光糖廠雖已停止壓榨製糖，但龐大的機組、饒富特色的建築結構及全國唯一的囪底隧道，仍然吸引人們來探訪。','','');
insert into images values ('C_Yuemei_Tourism_Sugar_Factory_03','Yuemei_Tourism_Sugar_Factory','整個園區，除了古蹟處處，由於活用歷史空 間，大跨距純檜木樑架無任何柱子建構之倉庫，已改設成賣場，除了販賣台糖產品外，並有各地的小吃特產。園區還有可愛小型動物區以及親水步道之錦鯉魚池。','','');
insert into images values ('C_Guguan_Hot_Springs_01','Guguan_Hot_Springs','「谷關水岸」背倚八仙山，前臨大甲溪，佔地約300坪，園區共規劃為原湯區、五行湯、豪華湯屋區、水療區、露天咖啡座、吧台區、更衣室等區域。','','');
insert into images values ('C_Guguan_Hot_Springs_02','Guguan_Hot_Springs','「谷關水岸」共設置了4處的觀景區，讓前來泡湯的民眾，不但能泡到不同溫泉配方的湯泉外，在放鬆之際來杯由溫泉水泡的飲品，並同時欣賞溫泉的山溪風景，享受大自然的山水之美。','','');
insert into images values ('C_Guguan_Hot_Springs_03','Guguan_Hot_Springs',' 谷關地勢險要，山岩崢嶸矗立谷關溫泉則自山麓湧出穿梭在山岩間流著，水量終年不竭，谷關溫泉泉質乃屬碳酸泉，含有硫化物及鹽分，因含大量硫化物，所以在靠近時可聞到硫化物特有的刺鼻味。','','');
insert into images values ('C_7fy_01','7fy','七分窯位在新社的小山上，成立於民國82年，無疑是新社老字號的景點之一。山不在高，有仙則名。正是七分窯的最好寫照。','','');
insert into images values ('C_7fy_02','7fy','七分窯是個大型窯廠，經營項目有胚體製作、釉料、燒窯、教學活動等，而陶刻是它的主力創作。','','');
insert into images values ('C_7fy_03','7fy','來到七分窯，你可以賞陶，也可以玩陶，兩百多坪的陶藝創作展覽區和四百多坪的玩陶教室活動區，以及上千坪的休閒活動區，寬廣的場地讓人遠離煩擾，心情自然舒朗。','','');
insert into images values ('C_Mushrooms_01','Mushrooms','霧峰區是台灣菇類的最大生產地，這裡四季盛產各種食用菇類，尤其金菇不僅品質達國際水準之上。而且有世界最大規模的生產場，所以霧峰區是台灣菇類的最大生產地，這裡四季盛產各種食用菇類。','','');
insert into images values ('C_Mushrooms_02','Mushrooms','走進菇類文化館大門，映入眼簾的是比人還高的菇類模型，令人有如走入菇類的奇幻世界。還有野生菇和毒菇的認識、菇類的烹煮如何兼顧美味與養生等。','','');
insert into images values ('C_Mushrooms_03','Mushrooms','全世界大規模且品質卓越的生產農場就在霧峰鄉，佔全國總產量一半以上。 有鑑於霧峰鄉與台灣菇業密不可分的關係，基於回饋感恩心情，及積極紮根菇蕈文化饗宴的理念，特別精心規劃『台灣菇類文化館』。','','');
insert into images values ('C_flowerjs_01','flowerjs','中社觀光花市，位於台中縣后里鄉境內，北面臨火炎山，南接泰安舊火車站、泰安鐵道文化館、后里馬場及昆盧寺，讓您的行程豐富多元，文化、自然景觀盡收眼底。','','');
insert into images values ('C_flowerjs_02','flowerjs','在中社觀光花市裡，更有佔地極廣的花卉可供欣賞，讓您遊玩一整天，快樂一整天。園區內每種花卉植物，皆有解說標示，賞花、認識花卉一舉兩得。','','');
insert into images values ('C_flowerjs_03','flowerjs','園區歐式庭院風格一年四季譜出豐富的色彩，更是許多婚紗業者的熱愛的場景選擇，迎著四月的到來，正是百合花盛開的時間，園區的『百合花』與『七彩花田』綻放光芒。','','');
/* ================================================================================================================== */

/*南部*/
insert into images values ('S_Chung_Cheng_University_01','Chung_Cheng_University','位於嘉義縣民雄鄉三興村，佔地廣達132公頃，校園建築古樸典雅，園內花木扶疏，是一處極清靜優美的校園區。從大學路進入校區，沿著寬敞筆直的中正大道緩步慢行，所見盡是禮化氣息濃厚的區式校舍建築。','','');
insert into images values ('S_Chung_Cheng_University_02','Chung_Cheng_University','校園內數幢學院分別出自國內5位建築名家，在共同耐震結構和建築式下，營建出具風格特色的形貌。','','');
insert into images values ('S_Chung_Cheng_University_03','Chung_Cheng_University','致遠褸旁有一處寧靜湖，是當地民眾及學生，休閒的最佳去處。湖面上有天鵝、綠頭鴨優游其中，值得一提的是這些動物都是師生自行繁殖的心血結晶；校園內又以杜鵑花著稱，暮春時節在花海簇擁下，最是風雅愜意。','','');
insert into images values ('S_LanTan_01','LanTan','蘭潭又名南潭，位於嘉義市東北郊仔頂附近，相傳西元1620年荷據時代荷蘭人在八掌溪的支流鹿寮溪築壩，到了日據時代，日本人又築壩把蘭潭作為自來水廠的儲水池，直到現在蘭潭依然是嘉義自來水廠的蓄水庫，提供嘉義市的飲水灌溉。','','');
insert into images values ('S_LanTan_02','LanTan','蘭潭潭水清澈見底，四面岡陵起伏，山光水色，潭水若遇月夜朦朧，如詩如畫，故「蘭潭泛月」列為嘉義八景之一。','','');
insert into images values ('S_LanTan_03','LanTan','蘭潭周圍丘陵起伏，林樹參天，梅樹成林，西南高處有三信亭，供遊人歇息之用，俯瞰全市風景盡收眼底，且潭畔休憩設備完善，是假日休閒理想去處。','','');
insert into images values ('S_ShootingTower_01','ShootingTower','嘉義「射日塔」的建築外觀構想是取自於"阿里山神木"，塔身顏色也與神木的外皮相像，塔的中間還留下高40公尺的一線天，就像是劈開的神木一樣，造型相當特殊。','','');
insert into images values ('S_ShootingTower_02','ShootingTower','在「射日塔」入口處有象徵台灣守護神的雲豹銅雕一對，塔的底層為『忠烈祠』，頂層為咖啡餐廳兼瞭望塔，塔頂斜面設有－巨型市花－艷紫荊，美麗搶眼。','','');
insert into images values ('S_ShootingTower_03','ShootingTower','射日塔」。射日塔內部不定期會舉辦藝文展覽，供民眾導覽，而11樓有景觀咖啡廳，可以一邊品嘗咖啡，一邊悠閒的眺望嘉義美景，且位於12樓的"空中花園"視野涵蓋整個嘉義市區，可輕鬆的將整個山城美景盡收於眼底。','','');
insert into images values ('S_North_Gate_Station_01','North_Gate_Station','北門驛是阿里山鐵路的起點車站，車站建築全部使用阿里山的高級紅檜建材所造，因此，造型相當典雅。','','');
insert into images values ('S_North_Gate_Station_02','North_Gate_Station','北門驛也因林務管理、鐵路機械維修以及製材之需求，在此設立了營林所、北門修理工廠、嘉義製材場..等。林業與鐵道繁榮了嘉義，而北門驛一帶更曾是全台灣最大的木材交易市場。','','');
insert into images values ('S_North_Gate_Station_03','North_Gate_Station','在阿里山森林資源停止開採後，阿里山鐵路的主要用途逐漸轉為觀光客運使用。','','');
insert into images values ('S_Central_Fountain_01','Central_Fountain','中央噴水池在民國59年被興建，所在地正好處在嘉義的末端，又因嘉義在清代時因形狀似桃子，故「桃仔尾」之稱，池中恭鑄了國父孫中山先生的銅像，是嘉義市的重要精神地標。','','');
insert into images values ('S_Central_Fountain_02','Central_Fountain','池內的噴泉蘊含了十四種變化，以十五分鐘為一個輪迴，噴泉的水高可及二十公尺，尤其在夜間噴水時，搭配上五彩繽紛的燈光，讓這個水池成為眾人矚目焦點，美不勝收。','','');
insert into images values ('S_Central_Fountain_03','Central_Fountain','中央噴水池與眾不同的特色在每逢選舉之前一日，成為各候選人造勢較勁的地方。周圍的著名景點相當多，由外地來此可以利用便捷的大眾工具，來體驗這個古色古香的城市，順便嚐嚐嘉義有名的火雞肉飯吧！','','');
insert into images values ('S_Alishan_01','Alishan','相傳於 250年以前，有一位名為阿巴里的鄒族酋長曾隻身來此打獵，滿載而歸後，常帶族人來此，族人為感念他，便以其名為此命名。','','');
insert into images values ('S_Alishan_02','Alishan','阿里山森林遊樂區海拔高度 2,216公尺，四周高山環列，氣候涼爽，以日出、雲海、晚霞、森林、登山森林鐵路並列為阿里山五奇，聞名國際。 而鄒族原住民人文資源更增其觀光魅力。','','');
insert into images values ('S_Alishan_03','Alishan','阿里山地區橫跨臺灣森林垂直分佈之熱、暖、溫三帶，蘊藏豐富的森林資源，尤以檜木名聞國際，漫步林間隨處可見。紅檜、台灣扁柏、臺灣杉、鐵杉及華山松稱為阿里山五木，柳杉為本區人工造林最成功的外來樹種，沿森林鐵路漫山遍谷林木鬱成奇觀勝景。','','');
insert into images values ('S_Fencihu_01','Fencihu','位於海拔一千四百公尺的奮起湖老街，是台灣的十大老街代表之一，俗稱「老鼠巷」的奮起湖老街，曾是阿里山森林鐵路極盛時期鐵路中繼站的最大聚落。','','');
insert into images values ('S_Fencihu_02','Fencihu','在阿里山鐵路尚未開通時期，奮起湖的旅客絡繹不絕，但隨著鐵路沒落，奮起湖的繁華光景也不復以往，火車便當更是沉寂了好長一段時間。直到後續逐漸發展出觀光與休閒旅遊，奮起湖才又重新崛起。','','');
insert into images values ('S_Fencihu_03','Fencihu','除了鐵路便當之外，這裡還有充滿復古風情的街屋、雜貨店和傳統餅店，好喝又健康的野生愛玉和美味可口的春捲更是當地有名的好滋味！長長的奮起湖老街巷弄中，更是藏了許多復古的店鋪與好客的店家。','','');
insert into images values ('S_Tropic_of_Cancer_01','Tropic_of_Cancer','「北回歸線太陽館」位於嘉義縣水上鄉，樓高十層的"太陽館"有著『飛碟』『幽浮』般的外型，是嘉義縣相當重要的北迴歸線地標。','','');
insert into images values ('S_Tropic_of_Cancer_02','Tropic_of_Cancer','目前的「北回歸線太陽館」是第六代的地標，整個建築是圓型、中間簍空，讓你站在建築物底下，就能感覺出太陽方位的變化。在奇特的太空船飛碟造型下就是天文主題館，整個主題館免費提供給遊客參觀。','','');
insert into images values ('S_Tropic_of_Cancer_03','Tropic_of_Cancer','「北回歸線太陽館」除了太陽館主建築引人注意外，園區內還有『九大行星戲水區』，這裡的行星不是教科書上的平面，在這裡還能感受出行星的排列狀況與大小，頗有現實感。','','');
insert into images values ('S_Steller_Pi_01','Steller_Pi','虎頭埤位於新化區東郊的虎頭山麓，因山勢狀如猙獰虎頭而得名，虎頭埤湖面廣闊，環湖步貫全區，沿途樟樹、相思樹密樹成林，四周青山環繞，一片青翠盎然。','','');
insert into images values ('S_Steller_Pi_02','Steller_Pi','虎月亭矗立於湖小島，並以虎月吊橋橫跨兩岸，吊橋細緻悠長，晨昏時，立於橋上，俯看湖心，碧波粼粼，泛著橙黃光彩，最是動人，「水橋虹影」為著名美景。','','');
insert into images values ('S_Steller_Pi_03','Steller_Pi','虎頭埤湖面二七公頃的水域是最天然的的水上遊憩區，目前有手划船及遊湖快艇，供遊客泛舟遊湖，盡覽環湖風光。','','');
insert into images values ('S_Chiku_Salt_01','Chiku_Salt','七股鹽場，西臨台灣海峽，南邊隔著曾文溪與安南區對望。七股鹽場在歷經日本人與國民政府的開發與經營，是台灣規模最龐大佔地面積最大的曬鹽場，但因為目前鹽業日趨沒落，台鹽利用七股鹽地週遭的土地開發成旅遊休憩的園區。','','');
insert into images values ('S_Chiku_Salt_02','Chiku_Salt','七股鹽場中有兩座規模龐大的鹽山，高度約20公尺的「主峰」，與來自西澳洲的「北峰」，其中「北峰」的鹽，質地較為雪白，並且目前仍是碎鹽工廠之原料鹽，山的形狀與高度隨著使用的狀況不斷的變化。','','');
insert into images values ('S_Chiku_Salt_03','Chiku_Salt','來到七股鹽場內除了鹽山，園區內「傳統土、瓦盤鹽田」、「扇形曬鹽廣場」、「鹽屋、鹽雕」以及各種利用「鹽素」所規劃的設施可以參觀。','','');
insert into images values ('S_Guanziling_01','Guanziling','關子嶺風景區以溫泉、水火同源、紅葉公園、大仙寺、碧雲寺、仙公廟等為最著名，溫泉區皆位於半山腰，山下到泉區沿路皆是溫泉旅館、餐廳及純泡湯的場所。','','');
insert into images values ('S_Guanziling_02','Guanziling','關仔嶺溫泉位於台南市白河區，是台灣八景之一，和北投、陽明山、四重溪並稱為台灣四大溫泉。本區溫泉由地層的石縫中流出，泉質屬鹼性泉，味帶澀苦，呈灰黑色而有微小泥粒，水質滑膩帶有濃厚硫磺味，為全臺少見的泥質溫泉，因而有「黑色溫泉」之稱。','','');
insert into images values ('S_Guanziling_03','Guanziling','溫泉泉源發自枕頭山、虎頭山、鷲鳳山環抱的滾水溪左側，據說是被當時駐紮於台的日本軍隊所發現，由於泥漿溫泉特殊並珍貴，溫泉之名不逕而走，成為了全台最特別的溫泉。','','');
insert into images values ('S_Koxinga_Shrine_01','Koxinga_Shrine','「延平郡王祠」佔地相當廣闊，裡頭主要奉祀台灣開山始祖"鄭成功"及其部將，整個廟宇的建築風格相當莊嚴典雅，是台灣少見的『福州式』廟宇建築。','','');
insert into images values ('S_Koxinga_Shrine_02','Koxinga_Shrine','鄭成功西元1661年，帶兵在鹿耳門登陸，不但趕走了荷蘭人，並同時積極建設台灣。經略台灣的過程除了設立官署，還下令屯田，允許官兵圈地成家，並招募大陸沿海居民來台開墾。後人為了感懷他的豐功偉績，立廟奉祀，尊稱他為"開台聖王"和"開山王"。','','');
insert into images values ('S_Koxinga_Shrine_03','Koxinga_Shrine','「延平郡王祠」中裡頭珍貴的文物相當豐富，尤其為數眾多的清代楹聯，裡頭包含沈葆楨手書，筆力雄渾、意義雋永，仍極具歷史價值。其中在一樓的建築中主要陳列史前文物，說明台灣與大陸的地緣關係，及先民生活的演進過程；二樓則展示的多為台南歷史文物。','','');
insert into images values ('S_Chikan_Towers_01','Chikan_Towers','赤崁樓乃荷蘭人於西元1653年創建，原稱普羅民遮城(Provintia荷文為永恆之意)，漢人則稱之為「赤崁樓」、「番仔樓」或「紅毛樓」。','','');
insert into images values ('S_Chikan_Towers_02','Chikan_Towers','荷據時期的荷蘭人在赤嵌地方建了一座具有防衛功能的普羅民遮城。到了明鄭時期鄭成功登台趕走荷蘭人，進駐普羅民遮城，並改普羅民遮城為承天府治。後因鄭成功遷移至安平熱蘭遮城，普羅民遮城被當成放置軍火庫使用。','','');
insert into images values ('S_Chikan_Towers_03','Chikan_Towers','日軍進駐台灣後，將赤嵌樓改為陸軍衛戍醫院，也陸續展開修建及整修。到了1935年，赤嵌樓被指定為重要史蹟。光復後，幾經整修，將原有的木造結構，改為鋼筋混泥土，將主要入口由西改為南向，而成為今日赤崁樓的模樣。','','');
insert into images values ('S_Gold_Coast_01','Gold_Coast','夕陽西下，染紅的海岸線總是美得讓人移不開視線。位於台南市南區的黃金海岸，是台南市最美麗的海岸，也是南部地區著名的旅遊消暑聖地。','','');
insert into images values ('S_Gold_Coast_02','Gold_Coast','黃金海岸周邊景致優美，打著赤腳漫步在細緻柔軟的沙灘上，眺望寬廣無際的海岸線，和著陣陣海浪拍打聲，是如此舒服自在。漫步於此，還能看到各種豐富生動的自然生態，像是如沙馬螃蟹、寄居蟹等。','','');
insert into images values ('S_Gold_Coast_03','Gold_Coast','美麗的海岸在閃爍夜燈的點綴陪襯下，充滿著寧靜浪漫的情調，非常適合情侶間相約到此遊遊走走。','','');
insert into images values ('S_Tainan_Confucius_Temple_01','Tainan_Confucius_Temple','台南孔廟是全國最早的文廟，建於明永曆19年(1665)，是目前台灣歷史最悠久，建築群最壯觀的孔廟，莊嚴宏偉，格局完整，列屬國家一級古蹟，更是是台灣第一次舉行祭孔典禮的地方。','','');
insert into images values ('S_Tainan_Confucius_Temple_02','Tainan_Confucius_Temple','雖然各地的孔廟每年亦有舉行祭孔典禮，但卻比不上台南孔廟祭典的歷史意義。台南孔廟目前還大致保持「左學右廟」的傳統規模，左學是以明倫堂為主的建築群，右廟則以大成殿為中心。','','');
insert into images values ('S_Tainan_Confucius_Temple_03','Tainan_Confucius_Temple','孔廟最令人稱奇的是中心的大成殿，因殿中沒有柱子和迴廊，只以厚牆外的排樑支撐著，結構特殊堪稱中國古建築的另一代表。廟中主祀孔子神位，東西廡則祭祀其他古聖先賢。','','');
insert into images values ('S_Garden_Night_Market_01','Garden_Night_Market','花園夜市位在台南市北區的「鄭仔寮重劃區」內，夜市由原本的育德路上遷移至此，將原本伸手不見五指的重劃區，重新規劃與投資，轉變成今日熱鬧非凡的「花園夜市」。','','');
insert into images values ('S_Garden_Night_Market_02','Garden_Night_Market','從夜市的外圍看過去，一大片廣場塞滿了攤販，因為各家攤販競爭激烈，都把自己的廣告旗幟升到最高，以求能進入遊客的眼裡，無數隻長旗在空中飄揚，就像古時戰爭一樣，這也是花園夜市的特色之一。','','');
insert into images values ('S_Garden_Night_Market_03','Garden_Night_Market','攤位的規劃成呈橫條狀排列，分為流行服飾、美味小吃、休閒娛樂、精品百貨四大區域，每個攤位也因店家競爭價格便宜又實惠，若想逛完整個「花園夜市」至少得花費兩個小時以上的時間，是來到台南市夜晚消磨時間的休閒好去處。','','');
insert into images values ('S_Anping_Street_01','Anping_Street','位於安平古堡旁邊的『延平街』又稱為「安平老街」，為三百多年前荷蘭人在安平修建的第一條路，又有『台灣第一街』之稱，街道兩旁聚集了許多特色店家，柑仔店、古早味童玩小吃店還有百年的蜜餞店鹹酸甜。','','');
insert into images values ('S_Anping_Street_02','Anping_Street','「安平老街」是到台南必去的景點之一，除了古堡本身具有特殊的歷史意義，旁邊的"安平老街"更是遊客們非逛不可的地方。','','');
insert into images values ('S_Anping_Street_03','Anping_Street','除了欣賞街道旁極具特色的舊式建築，還能逛逛老街上的店家，有百年老店鹹酸甜，也有古早味的柑仔店，賣的都是現在找不到的零食與小玩具，是非常值得一去的景點。','','');
insert into images values ('S_Four_Grass_Bridge_01','Four_Grass_Bridge','「四草大橋」橫跨在安平舊港之上，底下所跨越的是台南縣的鹽水溪與嘉南大圳所匯合而成的溪流，同時「四草大橋」也是四草地區通往安平的交通要道，是台南市、安平對四草、七股的重要道路，許多人會在此停留欣賞美景。','','');
insert into images values ('S_Four_Grass_Bridge_02','Four_Grass_Bridge','「四草大橋」不但有著重要的地理位置，站在橋上遙望著台灣海峽，一望無際、浪濤滾滾，就像是一幅美景映入眼簾，此般美景，令人留戀，尤其是在夕陽西下落日餘暉的時候，有如金黃色的染料揮灑在大海上所染成黃橙橙的畫布。','','');
insert into images values ('S_Four_Grass_Bridge_03','Four_Grass_Bridge','在這裡除了夕陽西下的時候會吸引眾多年輕男女在此約會，自早到晚也都會有魚友在此垂釣，同時還會有許多行動咖啡車，讓您在一邊看海的同時，可以一邊享受香醇的咖啡，到重要節日的時候，這裡也是絕佳的煙火欣賞位置。','','');
insert into images values ('S_Urban_Spotlight_01','Urban_Spotlight','在中山路和中華路之間的五福路，從前到了夜晚就顯得漆黑黝暗的路段，現在則是充滿藝術氣息的氛圍;白天明亮閒適，夜晚嫵媚繽紛。','','');
insert into images values ('S_Urban_Spotlight_02','Urban_Spotlight','九位藝術家的原創作品再加上「SMILE—2001希望之牆」，讓大家行走光廊中，充分感受藝術與生活的完美融合。','','');
insert into images values ('S_Urban_Spotlight_03','Urban_Spotlight','走入城市光廊，伴隨著悅耳的爵士樂，漫步在迷炫的燈光下，隔絕了一切的繁雜喧囂，感受著徐徐微風;城市光廊，正在期待著您來親身體驗 。','','');
insert into images values ('S_Love_River_01','Love_River','愛河發源於高雄縣仁武鄉，流經高雄市區，為高雄主要河川之一，最早稱為打狗川，後被日本人改名為高雄川，1948年中正橋附近由民間經營划船所，名為愛河游船所，豎立招牌在橋畔營業，某日颱風過境將招牌中游船所三字吹落，只剩愛河兩字，又巧遇情人於此殉情，所以才有現在的名稱。','','');
insert into images values ('S_Love_River_02','Love_River','愛河全長約16.4公里，猶如城市的母親之河，下游河岸整治而成河濱公園，是市區內散步休憩的好去處，也是端午節划龍舟與元宵節燈會的舞台。','','');
insert into images values ('S_Love_River_03','Love_River','愛河入夜以後沿著水面點點霓虹彩光，東西兩岸各具不同情調的"愛河曼波"與"黃金愛河"咖啡藝文廣場，散發迷人的咖啡香及快慢交替的美妙樂音，令人不得放慢腳步而融入其中，讓港灣城市的水岸休閒風情，為身心靈作徹底的放鬆，利用「愛河行船」的浪漫風情，使鹽埕水岸風華再現。','','');
insert into images values ('S_85_Building_01','85_Building','台北有101大樓，高雄則有全台第二高的85大樓，身為南台灣最高的觀景台，地處高雄港灣之側，也是高雄市的地標景觀之一。高度約300公尺，擁有獨特的星光高速電梯，當電梯爬升至120公尺時，燈光即開始變暗，滿天星斗瞬間盡收眼底，彷彿進入了時光隧道般的夢幻。','','');
insert into images values ('S_85_Building_02','85_Building','在這裡您可以遙望唯美的西子灣、遠眺磅礡氣勢的高雄港，更可俯瞰高雄獨特的井字街容。每逢夕陽西下時的絢麗暮色渲染了整片天空，瑰麗的日空下是波光粼粼閃爍著金黃色光芒的大海。','','');
insert into images values ('S_85_Building_03','85_Building','當夜幕降臨時，城市就像是打翻了珠寶盒般，點點燈光如同寶石閃耀著光芒，美不勝收的夜景讓人嘆為觀止，身處85觀景台，您將發現最美的港都。','','');
insert into images values ('S_Cijin_01','Cijin','「旗津」位於高雄市西南端，是一處東南走向的狹長小島。「旗津」，早期稱為「旗後」，指位居旗山之後的部落。高雄旗津因所在的地理位置優勢之故，於清朝時期已是通商交易頻繁的岸口，也是高雄地區最早開發的區域。','','');
insert into images values ('S_Cijin_02','Cijin','發展歷史已達百年以上之久的高雄旗津，至今仍然有著許多古色古香的古蹟建築及純樸自然的風俗民情。也因為它的獨特之處所在，每年總是吸引許多遊客們慕名蒞臨造訪，而成為高雄地區最為熱門的觀光區。','','');
insert into images values ('S_Cijin_03','Cijin','可到此嚐嚐當地新鮮便宜的海鮮大餐，或是搭乘趣味十足的三輪車，遊遍當地的歷史古蹟、觀光廟宇，又或是到海水浴場戲水消暑，讓身心徹底地放鬆一下，皆是最佳的休閒選擇。相信在這趟旅程中，會帶給您印象深刻的心得感想。','','');
insert into images values ('S_Stayed_Bridge_01','Stayed_Bridge','跨越高屏溪的斜張橋是國道三號(第二高速公路)上最美麗的一座橋樑，這座橋是國內首座複合式斜張橋。','','');
insert into images values ('S_Stayed_Bridge_02','Stayed_Bridge','所謂斜張橋，指的是由一個或多個主塔與鋼纜組成來支撐橋面的橋樑，全長510公尺與183.5公尺的塔高(相當於六十層樓高)，若以單塔斜張橋而論，其橫跨的長度可是排名世界第二呢！(僅次於德國跨萊茵河的鐵橋)。','','');
insert into images values ('S_Stayed_Bridge_03','Stayed_Bridge','到了夜晚，特殊造型的斜張橋，在燈光的投射下更襯托出斜張橋的美。如此的美景若只是開車經過那一瞬間看到就太可惜了，其實橋下還有不少咖啡座供您好好仔細欣賞，您更可以擺設腳架拍下這座在夜裡燦爛耀眼的建築物。','','');
insert into images values ('S_Fo_Guang_Shan_01','Fo_Guang_Shan','「佛光山」位於高雄市大樹區，是台灣最大的佛教道場，創辦人為星雲法師，他為提倡『人間佛教』之道，於民國56年帶領弟子披荊斬棘，一磚一瓦建立起「佛光山」，成為台灣信眾最多、最負盛名的聖地。','','');
insert into images values ('S_Fo_Guang_Shan_02','Fo_Guang_Shan','除了最主要寺院建築外，最具特色的是大佛城，為「佛光山」的地標，四周皆有 480尊小型金身阿隬陀佛塑像圍繞，景象莊嚴。此外，佛教文物陳列館珍藏古今各國文物多達數千件，有機會上山值得一觀。','','');
insert into images values ('S_Fo_Guang_Shan_03','Fo_Guang_Shan','農曆春節到元宵期間，為「佛光山」最熱鬧的季節，滿山掛滿花燈，入夜後一片燈海，好不熱鬧，民眾可把握此機會，上山賞燈參訪。','','');
insert into images values ('S_West_Bay_01','West_Bay','西子灣位於高雄市西側，北臨萬壽山，南瀕旗津半島，是一處以天然礁石及夕陽美景聞名的港灣，西子灣的美景是高雄八景之一，尤其黃昏時分，海天一色，美不勝收。','','');
insert into images values ('S_West_Bay_02','West_Bay','當夜幕低垂時，黃澄的夕陽總是將大海點綴的繽紛絢爛，閃爍著點點漁火，如此美景總讓西子灣在夕陽西下時，吸引著一批又一批慕名而來的遊客，更常見一對對愛戀的情人在此互訴情衷，攜手看著落日美景。','','');
insert into images values ('S_West_Bay_03','West_Bay','西子灣風景區中有一常與美景相伴的中山大學，後倚壽山，前眺西子灣，校園內草木翠綠、花團錦簇，校舍更是美輪美奐，堪稱全台最美的大學。而西子灣海水浴場的入口處即位於中山大學左方的旅客服務中心，每到夏日總是充滿著成群結隊的遊客到此戲水消暑，讓西子灣充滿歡笑與活力。','','');
insert into images values ('S_Jialeshuei_01','Jialeshuei','佳樂水位在恆春半島東側的滿洲鄉，背山面海，濱臨太平洋，素有『海神樂園』之稱。原名佳落水，為瀑布之意。民國64年（1975年）蔣故總統經國先生蒞臨巡視，取安和樂利之意而賜名「佳樂水」，並將無名瀑布取名「山海瀑布」。','','');
insert into images values ('S_Jialeshuei_02','Jialeshuei','綿延二公里半，濱臨太平洋，砂岩和珊瑚礁久經強風和海浪的侵蝕，雕琢出各種形狀的奇岩怪石，例如兔石、球石、海蛙石、方格石、蜂窩岩等，因此沿岸佈滿各種奇特巨石，有些因節理形似方格狀，形成棋盤石景觀；蜂窩岩滿佈坑洞的外形，主要是結合面的生物碎屑，經海蝕或風蝕擴大而成。','','');
insert into images values ('S_Jialeshuei_03','Jialeshuei','本區動物景觀資源豐富，海洋生物數量亦極可觀。由於沿岸為黑潮流經，水急浪高，大型洄游性魚類多，為海釣的最佳去處。','','');
insert into images values ('S_Kenting_Street_01','Kenting_Street','傳說中的「墾丁大街」，是由"墾丁國家公園牌樓"到"墾丁凱撒大飯店"之間的「墾丁路」。這段短短不到兩公里的「墾丁路」每到夜晚就會搖身一轉變成為熱鬧繁華的「墾丁大街」，同時也把墾丁的夜晚點綴成一片繽紛，目前已是來墾丁遊玩的遊客傍晚必逛的景點。','','');
insert into images values ('S_Kenting_Street_02','Kenting_Street','「墾丁大街」沿途也有許多充滿海洋風味的個性商店，從花色繁多的海灘鞋、款式玲瑯滿目的海灘短褲、各式各樣的海風T恤、洋裝、飾品等等..應有盡有。','','');
insert into images values ('S_Kenting_Street_03','Kenting_Street','平時就充滿熱帶風情的「墾丁大街」，到了夜晚就成了全墾丁人潮最多的地方，各式各樣吸引人潮的要素，讓整條大街充滿著南洋熱情的愉快氣氛。來到墾丁遊玩，千萬別錯過這個獨一無二的墾丁夜生活!!','','');
insert into images values ('S_Kenting_National_Park_01','Kenting_National_Park','墾丁國家公園位於南台灣屏東縣的恆春地區，所在的地理位置極佳，擁有美麗的海洋地質景觀及豐富的人文生態，因而吸引許多遊客們遠道慕名而來，只為一探那如詩如畫般的美麗景致。','','');
insert into images values ('S_Kenting_National_Park_02','Kenting_National_Park','於墾丁國家公園管理處所設立的遊客中心，主要是提供墾丁國家公園內所有相關風景據點的資訊，介紹給到此參訪的遊客們了解。在遊客中心內所設置的資源展示廳裡，可看見透過幻燈片所呈現出立體造型的化石、及其他栩栩如生的動、植物標本。','','');
insert into images values ('S_Kenting_National_Park_03','Kenting_National_Park','您不妨利用休閒時間來此處觀遊一趟，尤其當您步入遊客中心內所設置的觀景台時，可從此處眺望到整片墾丁美麗的海景，如此遼闊的視野景緻令人內心也變的更加寬闊、放鬆。','','');
insert into images values ('S_South_Bay_01','South_Bay','南灣古稱金沙灣，因為其海灘上佈滿了白沙，遠處望去太陽照射之下有如金沙閃閃，又稱為金沙灣。 其海灣海浪一波波湧起，有如藍浪入侵，亦又稱為藍灣。','','');
insert into images values ('S_South_Bay_02','South_Bay','南灣海岸線長達600公尺，沙質柔軟、沙粒潔淨，海水碧藍，是吸引游客逐波踏浪戲水的最佳地點。而且因為海底地形多變，水質清澈，能見度佳，所以非常適合衝浪、浮潛等海上活動。','','');
insert into images values ('S_South_Bay_03','South_Bay','除了海底的美景，每年10月至隔年的3月可見「空飄塑膠袋」奇景，這是台灣漁民為了捕釣鶴鱵魚的奇招。','','');
insert into images values ('S_Maobitou_01','Maobitou','貓鼻頭位於恆春半島的東南岬，介於台灣海峽和巴士海峽的交界處，距白沙約3.5公里，為典型的珊瑚礁海岸侵蝕地形，鳥瞰似女孩的百摺裙，故有裙礁海岸之稱，並與鵝鑾鼻形成台灣最南之兩端。','','');
insert into images values ('S_Maobitou_02','Maobitou','受到長時間的波浪侵蝕，反覆乾濕，長期鹽粒結晶，砂粒鑽蝕及溶蝕等作用，因而產生崩崖，壺穴，礁柱，層間洞穴等奇特景觀，極具地形教學及研究價值。貓鼻頭名稱的由來，則因岩岸旁一塊突出的珊瑚礁岩，其外型像蹲坐的貓而得名。','','');
insert into images values ('S_Maobitou_03','Maobitou','海水蔚藍清澈，海面下處處是瑰麗的美景，各種不同的石珊瑚、軟珊瑚覆蓋海底，各式熱帶魚、海鰻、蝦、貝類、海藻等海洋生物種類繁多，可說是臺灣沿海之冠，在世界上的其它地區亦不多見。','','');
insert into images values ('S_Tung_Lung_Palace_01','Tung_Lung_Palace','東港東隆宮是南台灣著名的王爺廟，主祀溫府千歲。溫王是唐朝進士當時在奉旨巡行天下時，遇難而亡，成神之後，常巡行閩、浙沿海，護佑往來船隻，所以漳、泉二州人民對溫王崇禮有加。','','');
insert into images values ('S_Tung_Lung_Palace_02','Tung_Lung_Palace','三年一科的東港東隆宮迎王祭典為南台灣的宗教界盛事，其盛況規模為全省之最，故在學術界有「北西港，南東港」之稱，整個祭典從「請王」儀式揭開序幕，隨即展開連續4天的分區遶境活動。','','');
insert into images values ('S_Tung_Lung_Palace_03','Tung_Lung_Palace','各地陣頭逢廟參拜，使出混身解數將平常所訓練的招式一一呈現出來，相當熱鬧，遶境隊伍和隨香民眾綿延好幾公里長，沿途家家戶戶施放煙火和準備香案迎接，炮聲連天，全鎮熱鬧滾滾。活動一直持續到最後的送王儀式，也就是活動最高潮的燒王船。','','');
/* ================================================================================================================== */

/*東部*/
insert into images values ('E_Fanshuliao_01','Fanshuliao','蕃薯寮位於海岸公路18號橋旁，是東海岸最為獨特的峽谷景觀，在此可以觀賞到公路兩側，因不同地質在溪流的堆積及切割作用下，形成對比明顯的地形景觀。','','');
insert into images values ('E_Fanshuliao_02','Fanshuliao','海岸闊葉林，主要有血桐、野桐群；18號橋東側岩壁上生長著珍貴的台灣海棗、台灣蘆竹、金花石蒜和台灣原生種百合，春天岩壁上看到的白色的花，就是野白合。每年10月，金花石蒜開金黃色的花；台11線山壁，以台灣野芙蓉、野牡丹為大宗，11～12月，野牡丹盛開，一片奼紫嫣紅的景象，甚是美麗。動物方面，則以台灣彌猴最常出沒。 ','','');
insert into images values ('E_Fanshuliao_03','Fanshuliao','蕃薯寮18號橋西側是溪谷盆地，東側是陡峭峽谷，造成此現象的主要原因是東西兩側不同的岩性。橋西側分布的是蕃薯寮層與八里灣層，由泥岩與砂頁岩互層所組成，岩質軟弱；而橋的東側分佈的是都巒山層火山集塊岩，堅硬緻密。','','');
insert into images values ('E_Shuilian_and_Niushan_01','Shuilian_and_Niushan','水璉位在花蓮縣壽豐鄉海濱，蒼翠的山丘環抱著寬廣的河谷盆地，水璉溪蜿蜒而過，是多種族群融合的社區，區內擁有豐富的自然資源及特殊的地質景觀，以及動植物生態和原住民文化等珍貴的觀光資產。','','');
insert into images values ('E_Shuilian_and_Niushan_02','Shuilian_and_Niushan','早在3500年前，即有紋繩陶文化之先民居住於此；現今部落的阿美族人則約於80～90年前(光緒初年左右)逐次移民來，以漁撈、狩獵以及旱田耕作為生。','','');
insert into images values ('E_Shuilian_and_Niushan_03','Shuilian_and_Niushan','健行、漫步、賞鳥、觀蝶都是很棒的選擇，徜徉在廣闊的海岸草坪上感受藍天，白雲和陽光，時間彷彿定格。','','');
insert into images values ('E_Changhong_Bridge_01','Changhong_Bridge','長虹橋橫跨秀姑巒溪，連接靜浦與港口兩聚落，為秀姑巒溪泛舟的終點站。命名為『新長虹橋』，有新舊傳承之意，且已成為東海岸新地標及花蓮縣的的觀光景點。','','');
insert into images values ('E_Changhong_Bridge_02','Changhong_Bridge','港口部落位在秀姑巒溪北岸，90％以上是阿美族。一百多年前，部落族人因反抗滿清政府統治而與清軍作戰，戰敗後大多數的男子慘遭屠殺，婦孺們逃亡至外地，多年後才又搬回部落定居。','','');
insert into images values ('E_Changhong_Bridge_03','Changhong_Bridge','長虹橋南岸下到秀姑巒溪，河岸兩側岩壁都是由巨大的火山角礫岩塊構成的火山集塊岩。秀姑巒溪中堆積許多巨大的石灰岩岩塊，是來自長虹橋兩側山麓上出露的港口石灰岩。','','');
insert into images values ('E_Xiuguluan_River_01','Xiuguluan_River','秀姑巒溪發源於中央山脈的秀姑巒山，源於高3200公尺的秀姑巒溪上游，沿花東縱谷北流，於瑞穗鄉東折，橫切海岸山脈，而於大港口注入太平洋，全長約104公里，為台灣東部最大的河川，也是台灣唯一切穿海岸山脈的河川。','','');
insert into images values ('E_Xiuguluan_River_02','Xiuguluan_River','溪裏孕育有30多種淡水魚類，其中以名列保育動物的高身鏟頷魚（高身鯝魚）最為珍貴；下流溪谷兩岸尚留存不少熱帶雨林，哺乳動物中，台灣獼猴是最容易看到的，其間曾發現的鳥類約100多種，自然生態相當豐富。 ','','');
insert into images values ('E_Xiuguluan_River_03','Xiuguluan_River','感受秀姑巒溪最棒的方式當然就是泛舟！自瑞穗出發一路順流而下經過奇美，最後抵達秀姑巒溪出海口的長虹橋下，沿途兩岸秀麗的風景盡收眼底，還要小心划船避開隱藏的漩渦和突如其來的急流，體驗全身溼透的溪流冒險，刺激百分百！ ','','');
insert into images values ('E_Shitiping_01','Shitiping','石梯坪位在花蓮縣豐濱鄉石梯灣的南側尾端，整個區域是一個面積極大的海岸階地，海蝕地形十分發達，海蝕平台、隆起珊瑚礁、海蝕溝、海蝕崖等舉目皆是，尤其是壺穴景觀堪稱台灣第一。','','');
insert into images values ('E_Shitiping_02','Shitiping','遊客可沿著風景區的環狀步道實地觀察，或是登上17公尺高的單面山，不僅可飽覽石梯坪的地質景觀，太平洋的壯闊浩瀚景象也能盡入眼底。','','');
insert into images values ('E_Shitiping_03','Shitiping','擁有經風力和海水雕刻而成的特殊岩岸風景，潮間帶上豐富的自然生態資源：螃蟹、海星、海參、寄居蟹、色彩斑斕的魚群，等待觀察力敏銳的人來一探奧秘。','','');
insert into images values ('E_Baxian_Cave_01','Baxian_Cave','兼具地質景觀與史前遺址的八仙洞，位在台東縣長濱鄉三間村一座面海的峭壁上，有自然形成的十數個海蝕洞穴。這些洞穴原在海面，現在卻散布於150公尺高的山壁上，這是因為在東海岸地殼陸升的過程中，海浪沖蝕岩壁較鬆軟的部份而成。','','');
insert into images values ('E_Baxian_Cave_02','Baxian_Cave','台灣東海岸旅遊的一個必去的景點之一！這裡有數十個天然的海蝕洞奇景可供遊客參觀，每個海蝕洞形狀隨著地質軟硬不均而有不同，每個海蝕洞高度都大於十公尺，近看更顯壯觀；其中有部分的海蝕洞早期開闢成神壇，具有濃厚的宗教氣息。','','');
insert into images values ('E_Baxian_Cave_03','Baxian_Cave','八仙洞的各洞穴都是都巒山層的火山集塊岩，岩性堅硬；這些集塊岩為大約數百萬年前海底火山爆發時所形成。','','');
insert into images values ('E_Water_Running_Upward_01','Water_Running_Upward','一到此地即可聽到驚呼聲四起的地理奇觀－水往上流。我們常說：「人往高處爬，水往低處流」，但距離都蘭僅1.8公里的一條農田灌溉溝渠，竟然違反地心引力，流水順著溝渠緩緩往高處流，溝渠旁邊並有塊刻著「奇觀」的石碑。','','');
insert into images values ('E_Water_Running_Upward_02','Water_Running_Upward','來此參觀的遊客，無不對「水往上流」奇觀感到好奇，水真的往上流嗎？眼見為憑，親身體驗感受絕對不同凡響。','','');
insert into images values ('E_Water_Running_Upward_03','Water_Running_Upward','其實原理很簡單：水溝旁的道路是條下坡路，但是水溝卻並非是下坡，反而是坡度很小的上坡，所以當遊客們站在低處，並連著道路一塊看時，就像是水往上流一般，是個相當神奇的地理景觀！ ','','');
insert into images values ('E_Xiaoyeliu_01','Xiaoyeliu','小野柳位於富岡漁港北方的海域，是東部海岸最南端的風景據點，因為地形和岩石在種類上，與北關的野柳外貌相似，因此被稱為「小野柳」。 ','','');
insert into images values ('E_Xiaoyeliu_02','Xiaoyeliu','此地巨大的珊瑚礁群曲折迷離，岩上並有蔓榕生長，景觀十分特殊。天氣晴朗時，從小野柳向東望去，可以清楚地看見約33公里外的綠島，以及由富岡漁港出航前往綠島、蘭嶼的交通船！','','');
insert into images values ('E_Xiaoyeliu_03','Xiaoyeliu','遊憩區內設有遊客中心、賣店、露營區與海邊步道等，遊客來此除可欣賞不同類型的奇岩怪石外，亦可選擇以露營方式體驗在夜色下聽著海聲入眠的新奇感受，近年來東管處於5-10月推出「夜訪小野柳」導覽活動，透過解說志工精采的導覽，帶遊客去認識小野柳的夜間生態環境，帶遊客去發掘入夜後小野柳另一面風貌。 ','','');
insert into images values ('E_Taroko_01','Taroko','根據文獻記載，太魯閣的山林交織著猶如蛛網般的古今道路系統，有原住民的獵徑、清領時期的北路、日治時代的合歡越嶺古道及臨海道、戰後的蘇花公路、中橫公路、台電施工道，以及國家公園的健行步道等，其中，有的路早已隨著時空的流轉而隱沒於今日的地圖上。','','');
insert into images values ('E_Taroko_02','Taroko','「太魯閣」是漢人對居住在三棧溪至大濁水溪南岸的一群原住民的稱謂。從文獻出現的大魯閣、大鹵閣、太魯閣到德魯固，百年間，對這群原住民稱謂的變化，透露出太魯閣地區，在不同時期，有不同的外來族群入侵。','','');
insert into images values ('E_Taroko_03','Taroko','這些百年前原是原住民部落的獵徑，後來成為日治時期的軍用道路、理蕃道路，一段原住民反抗統治者的血淚史，捍衛自己生存方式與文化的辛酸悲劇，轟轟烈烈寫在先民留下的足跡上。後來部落獵徑也曾是日人設置國立公園風景探勝的道路，更是台灣的產金道路與發電道路！','','');
insert into images values ('E_Liyu_Lake_01','Liyu_Lake','鯉魚潭位於花蓮縣壽豐鄉池南村鯉魚山下，是花、東、宜三縣境內最大的內陸湖泊，距花蓮市約18公里，為花蓮縣觀光地標之一，老一輩人稱為『大陂』，阿美族人則稱為巴鬧。','','');
insert into images values ('E_Liyu_Lake_02','Liyu_Lake','在數世紀前的一次大颱風，發生山崩迫使荖溪從今日的池南森林遊樂區改道向南流，而潭北的文蘭溪洪水帶來的砂石也阻擋了鯉魚潭的東北出口，形成今之鯉魚潭。','','');
insert into images values ('E_Liyu_Lake_03','Liyu_Lake','鯉魚潭的南端有池南森林遊樂區及露營區，西側山麓為玉山神學院，湖畔有東山魚類繁殖場，東邊為鯉魚山，為花蓮頗具規模的飛行傘活動場，鯉魚潭的名稱因此而來；在鯉魚潭周圍有 4公里長環潭道路，而野餐區沿潭而建，潭畔有出租船隻供人遊湖，設備齊全方便，民眾也可以租乘船艇分快艇、小船和腳踏船體驗不同的樂趣。','','');
insert into images values ('E_Fugang_Fish_Port_01','Fugang_Fish_Port','富岡舊名為「猴子」，是早期東海岸原住民由綠島登島的第一站，再由此處向海岸線遷居，地緣附近仍留下部份遺址。','','');
insert into images values ('E_Fugang_Fish_Port_02','Fugang_Fish_Port','漁港位於縱谷平原區出海口及台東三角洲邊緣地帶，是屬於海岸地形；附近海域為親潮、黑潮交會處，因此擁有豐富的漁場、海釣場，以及珊瑚資源，使得此區活動種類多樣且頻繁。','','');
insert into images values ('E_Fugang_Fish_Port_03','Fugang_Fish_Port','由於富岡漁港是強勢開挖海岸兩成，故其港區高程與西側台地相差約十二公尺，因此漁港與自然地形地貌產生強烈對比。 ','','');
insert into images values ('E_Sanxiantai_01','Sanxiantai','位於台東縣成功鎮東北方的三仙台，是由離岸小島和珊瑚礁海岸所構成，島上奇石分布，其中有三塊巨大的岩石，傳說呂洞賓、李鐵拐、何仙姑曾登臨此島，因而得名。','','');
insert into images values ('E_Sanxiantai_02','Sanxiantai','三仙台島的地質屬於都巒山集塊岩，原來是一處岬角，因海水侵蝕逐漸斷了岬角頸部，而成了離岸島。過去想參訪三仙台的遊客只能利用退潮時，涉水而過，1987年完成了八拱跨海步橋，它的波浪造型，宛如一條巨龍伏臥海上，銜接三仙台和本島，已成為東海岸極為著名的地標。','','');
insert into images values ('E_Sanxiantai_03','Sanxiantai','而它最特別的莫過於那八個拱橋連接而成的跨海拱橋，長約四百公尺，有如巨龍橫臥於陸地與岬角海灣之間，而來此觀賞日出更是一大享受，金黃色的曙光灑在跨海大橋以及太平洋，配上變化萬千的雲彩，堪稱世界級的美景！而美麗的三仙台燈塔也不容錯過，建造於日治時期，是東海岸的第一座燈塔；造訪燈塔一路可看見台灣最美的海蝕地形，石門、壺穴、海蝕平台讓你對於自然的鬼斧神工一覽無遺！ ','','');
insert into images values ('E_Henan_Temple_01','Henan_Temple','和南寺位在鹽寮村海岸公路旁，是傳慶老和尚於民國56年翻山越嶺到此修行時所創建，不但是東部著名的佛門道場，更是佛教藝術的殿堂。','','');
insert into images values ('E_Henan_Temple_02','Henan_Temple','佛寺背倚青山，前臨浩瀚的太平洋，樸實無華的建築風格，加上不時傳來悠揚的梵音，讓人頓時進入祥和清幽的境界；寺後蒼翠的山巒上聳立一尊鵝黃色的觀音塑像，是名雕塑家楊英風的作品，其雍容莊嚴的法相，早已成為和南寺的地墂。','','');
insert into images values ('E_Henan_Temple_03','Henan_Temple','沒有華麗的建築或金碧輝煌，簡簡單單的主體建築物座落在海岸山脈邊上。和南寺一向致力推廣宗教藝術文化，寺內不定期會有藝文展覽與表演活動。寺院周圍景觀也十分優美，沿著後山的步道緩行，草木扶疏，花影搖曳。最頂端造福觀音像前的平台是一覽景致的最佳地點，太平洋的水色就在眼前無限的延展開來，在樹蔭下沏一壺茶，離塵而靜心。','','');
insert into images values ('E_Shanyuan_01','Shanyuan','富山復漁區於台東縣卑南鄉杉原海邊，在都蘭灣的南端，是台東縣唯一的海水浴場，這裡早期叫做「杉原海水浴場」；富山海域早期漁類資源很豐富，十餘年前因過度漁撈，海域生態破壞殆盡，不僅漁民無法生存，遊樂價值也降低。','','');
insert into images values ('E_Shanyuan_02','Shanyuan','2005年公告為禁漁區之後，成為東海岸潮間帶生態豐富的海岸景點，不管是魚群或是珊瑚礁岩都保存得非常完整；禁漁區剛成立初期，曾經一時造成漁民的生活不便，但隨著魚類棲息地的保護，禁漁區外魚群資源也越來越多，魚獲也逐漸穩定增加。','','');
insert into images values ('E_Shanyuan_03','Shanyuan','珊瑚群礁帶潮池、潮溝裡，潮間帶、群礁間和沙灘上，孕育種類豐富的生態生物，如：豆仔魚、烏仔魚、司目魚、水母、寶螺、馬鞍藤、蝦姑、白紋方蟹、麵包蟹、海葵、海膽、鐘螺、夜光螺、櫻花蝦、陽燧足、海參吉……等五花八門的海洋生態；以及多元生態體驗，如：潮間帶解說體驗、釣蟻蝨及挖沙蟹體驗、推魚苗體驗。 ','','');
insert into images values ('E_Donghe_Bridge_01','Donghe_Bridge','東河橋位處連接成功鎮與東河鄉的馬武窟溪出海口，東河新、舊兩條橋樑橫跨其上，造型各具特色，展現建築藝術之美，在藍天和碧綠的泰源幽谷映襯下，有如絕美的山水畫。','','');
insert into images values ('E_Donghe_Bridge_02','Donghe_Bridge','在東河橋下的馬武窟溪可體驗傳統竹筏的生態之旅，這種竹筏是此地阿美族原住民的傳統工藝，以竹、木、藤製造傳統竹筏，捨棄橡膠製品，相當具有環保及生態概念。','','');
insert into images values ('E_Donghe_Bridge_03','Donghe_Bridge','操縱划槳行至白色的帝王石旁，河域的寧靜，讓人感覺置身於圖畫中，這樣的體驗，大概也只有東河部落才有。','','');
insert into images values ('E_Amis_Folk_Center_01','Amis_Folk_Center','阿美族民俗中心位於東管處都歷處本部旁，佔地約2公頃，包括戶外表演廣場和可供2千人觀賞的戶外看台，是體驗阿美族傳統文化的好去處。','','');
insert into images values ('E_Amis_Folk_Center_02','Amis_Folk_Center','中心於1995年11月興建完成，主要建築之祭屋及家屋，是依據日本民族學家千千岩助太郎在1943年於花蓮縣光復鄉調查的手繪圖，仿花蓮縣太巴塱社的祭司住家搭建，走訪這裡，可看出阿美族特有的居住文化。 ','','');
insert into images values ('E_Amis_Folk_Center_03','Amis_Folk_Center','阿美族分布於立霧溪以南的花東縱谷和東海岸地區，人口約有14萬人，是台灣原住民族群中人口最多的一族。阿美族仍保留豐富的傳統文化，其中豐年祭是最具代表性的傳統祭典，在每年夏季舉行，歡慶小米豐收、祭祀祖先和神靈，儀式充滿祈福感恩氛圍，並強調慎終追遠、團結和諧的倫理觀念。 ','','');
insert into images values ('E_Chenggong_01','Chenggong','成功鎮以前為「麻荖漏社」，1921年日人改為「新港」，戰後改為「成功」。有關麻荖漏名稱的起源說法不一，但直到清領末期此地仍為阿美族人聚落與耕作的所在。距今3,500年前之麒麟文化，以成功鎮之出土文物為最，像是石壁、岩棺、石斧、茅等，可知此地起源甚早。','','');
insert into images values ('E_Chenggong_02','Chenggong','成廣澳天后宮是最早進駐後山的媽祖廟，建於清同治時期，成廣澳為東部海岸最大的天然港澳，福建籍劉進來由鹿港派到東部後山，臨行請鹿港天後宮的「媽祖」隨行護身，沿八通關古到由埔里到玉里，出安通再越過海岸山脈。','','');
insert into images values ('E_Chenggong_03','Chenggong','西元１９４９年，成廣澳發生大火，延燒到天后宮，將茅草屋燒掉，信徒發願重修天后宮，翌年修建成朱瓦燕尾的水泥廟宇，屋頂斗拱的樑柱也為水泥取代，樑上圖案因請不到西部師傅，因此雇用成功鎮基翬一帶８名平埔族原住民彩繪施工，創下原住民參與廟宇建築的創舉。 ','','');
insert into images values ('E_Dabaisha_01','Dabaisha','大白沙沙灘位於綠島南端突出的西南角，是綠島最大也最美麗的沙岸，美麗的白沙是由珊瑚顆礫及貝殼碎屑所組成的，綿延海岸線數百公尺長，有熱帶南方小島的風情。','','');
insert into images values ('E_Dabaisha_02','Dabaisha','大白沙同時也是個潛水區，適合中級或高級的水肺潛水；而此處地形變化多，潮間帶生物種類豐富，又為非熱門路線，遊客稀少，適合雅好寧靜的旅者。','','');
insert into images values ('E_Dabaisha_03','Dabaisha','珊瑚與貝殼碎屑堆積成的白色沙灘，是以礁岩岸為主的綠島，最大的一片沙灘，白沙、紫花、黑岩、綠水、藍天，交織出動人的景緻；沙灘周遭圍繞著由珊瑚、貝殼碎片岩化而成之礫岩，名日「灘岩」，潮間帶生物種類豐富。','','');
insert into images values ('E_Zhaori_Hot_Spring_01','Zhaori_Hot_Spring','朝日溫泉位於綠島東南海岸礁岩潮間帶，屬於依山面海的地形，日據時代稱為「旭溫泉」。泉質澄澈透明，溫度約在攝氏60-70度，屬略呈酸性的硫酸鹽氯化物泉，但無濃烈硫磺味，帶有海水的鹹味，對人類皮膚無刺激性洗後並不黏澀，為罕見的鹹水溫泉。','','');
insert into images values ('E_Zhaori_Hot_Spring_02','Zhaori_Hot_Spring','溫泉區的潮間帶遍佈著許多垂直向海的海蝕溝，也有許多大礁石片佈在沙底上，海床緩慢下降；礁石上覆蓋的以石珊瑚為主，軟珊瑚較少，適合初、中級水肺潛水。 ','','');
insert into images values ('E_Zhaori_Hot_Spring_03','Zhaori_Hot_Spring','海底溫泉的形成可能是由於海水在附近斷層下滲至地底深處受地熱加溫成熱水後壓力增加，而又從地層縫隙中湧出地表而成溫泉，溫泉出露在潮間帶的礁岩間形成潮池，漲潮時隱入海中，退潮時露出海面，隨時為溫泉替換水質，冷熱交替，極富趣味。 ','','');
insert into images values ('E_Zhiben_01','Zhiben','遊樂區海拔高度110~650公尺，全年氣候溫暖濕潤。區內動植物種類繁多。','','');
insert into images values ('E_Zhiben_02','Zhiben','主要景觀有常綠闊葉樹次生林、百年大白榕、臺灣蝴蝶蘭、百年酸藤、知本溪流、瀑布、藥用植物園區、吊橋等。','','');
insert into images values ('E_Zhiben_03','Zhiben','遊樂區三面環山，以知本溪流域與熙攘的溫泉飯店區相隔，是提供登山、健行、賞鳥、賞蝶、學術研究、遊憩及森林浴的最佳場所，亦為台東市郊假日郊遊的好去處。','','');
insert into images values ('E_Rueisuei_Township_01','Rueisuei_Township','瑞穗鄉的主力農特產品為天鶴茶和文旦，遠近馳名。紅葉溫泉、瑞穗溫泉皆位於萬榮鄉轄區，但距離瑞穗鄉界甚近，皆為備受民眾喜愛之溫泉勝地。瑞穗鄉同時擁有泛舟、溫泉、銘茶等優良條件，已成為花蓮縣農業與觀光結合的知名去處。','','');
insert into images values ('E_Rueisuei_Township_02','Rueisuei_Township','瑞穗鄉舊稱「水尾」，意思是秀姑巒溪之尾，後日本人因水尾的日文發音Mizuo，改為音近之「瑞穗」（Mizuho）。全鄉面積約有135平方公里，人口約1萬4千餘人，以秀姑巒溪激流泛舟而聞名全台。','','');
insert into images values ('E_Rueisuei_Township_03','Rueisuei_Township','瑞穗鄉位於台灣花蓮縣中部偏南，北鄰光復鄉，西鄰萬榮鄉、卓溪鄉，東鄰豐濱鄉，南接玉里鎮，有北回歸線經過鄉境。鄉內居民以閩南人、客家人及原住民為主，而原住民又以阿美族為最多。','','');
insert into images values ('E_Across_Mountain_Ancient_Trail_01','Across_Mountain_Ancient_Trail','過山古道過去是連接綠島公館村與溫泉村二側的交通要道，今日的過山古道是一條生態景觀豐富的森林步道，是體驗綠島山林景致的最佳路線！過山古道總長1.85公里，來回步行約需要90-100分鐘，從綠島機場旁的「登山步道」往上走，中途可看見「過山古道」入口，可走到另一邊的出口-公館溫泉村，沿途為山路，沿著石階步行，需要較好的體力。','','');
insert into images values ('E_Across_Mountain_Ancient_Trail_02','Across_Mountain_Ancient_Trail','古道沿線可觀察到樹杞、蘭嶼土沉香、野牡丹、桃金娘等各種綠島典型的植物，人面蜘蛛、攀木蜥蝪更是處處可見，傍晚時分，甚至可以看到螢火蟲在林間穿梭飛舞，運氣好的話還能遇上野生梅花鹿，是一條生態景觀豐富的森林步道，建議到訪遊客漫步悠遊、細心觀察。','','');
insert into images values ('E_Across_Mountain_Ancient_Trail_03','Across_Mountain_Ancient_Trail','綠島有兩條過山步道，一條是過山步道、一條是過山古道。古道是早期還沒有環島公路時南寮到溫泉區的唯一交通道路，而步道則是為健行而開闢專用的道路。這兩條路一側出入口同樣位於通往中山科學研究院中途的路旁；另一側，古道東邊出入口位於溫泉村旁，而步道的東邊出入口則是在朝日旅遊服務中心旁。','','');
insert into images values ('E_Jialulan_01','Jialulan','加路蘭有一大片寬廣的草坪、休憩涼亭、解說站以及觀景台，不但提供了東海岸旅行的最佳休息站，也是個很適合的拍照景點，遊客們可在海邊聽海浪、吹海風，一邊迎著和煦陽光渡過悠閒時光。','','');
insert into images values ('E_Jialulan_02','Jialulan','除了欣賞自然美景之外，區內也有不少由漂流木所組成的裝置藝術作品，其中有兩條魚矗立在海邊，取名為「我的好朋友」的裝置藝術作品，上面寫道：「歡迎過路的旅者，有一個輕鬆愉快的旅程！」其他還有「類窗櫺」、「日昇之舞」「風車組」、「哭泣的露珠」等，連休憩涼亭中的裝飾也可見漂流木的蹤影喔！','','');
insert into images values ('E_Jialulan_03','Jialulan','因加路蘭休憩區鄰近小野柳風景區，因此延續著綺麗的風化、海蝕景觀，奇形礁岩星羅分佈，海岸線條紋路特殊，加上遊憩區腹地相當廣大，無視覺障礙，草地柔軟，如今已成為東海岸必遊之地。','','');
insert into images values ('E_Jiqi_Beach_Recreation_Area_01','Jiqi_Beach_Recreation_Area','磯崎海灘擁有長達3公里長的細柔沙灘，冬季漲潮時海底沙石湧上呈黑色，待夏季潮退即呈現出一片金色沙灘，是一處適合水上遊憩活動的地方，目前已開發為海濱遊憩區。','','');
insert into images values ('E_Jiqi_Beach_Recreation_Area_02','Jiqi_Beach_Recreation_Area','位於豐濱鄉的磯崎灣，距花蓮市約40公里，海灣群山環繞，南端並點綴了一座小山頭，景緻極為優美。','','');
insert into images values ('E_Jiqi_Beach_Recreation_Area_03','Jiqi_Beach_Recreation_Area','磯崎海岸是東海岸少見的沙岸地形，也是十分可親的一片海灘，和其他地方海水浴場不同的是，磯崎坐落在大山大海的交界處，像險峻的東部海岸線上一朵柔軟的雲。各式各樣刺激的活動像香蕉船、衝浪以及沙灘排球讓磯崎海灘總是充滿笑聲與活力。','','');
insert into images values ('E_Farglory_Ocean_Park_01','Farglory_Ocean_Park','遠雄海洋公園緊臨東管處花蓮遊客服務中心，依著山勢設有「主題樂園區」、「自然景觀公園區」，以及擁有391間客房的「休閒飯店區(即遠雄悅來大飯店)」。主題園區以19世紀英國碼頭及海岸嘉年華風格為主。','','');
insert into images values ('E_Farglory_Ocean_Park_02','Farglory_Ocean_Park','海洋公園所在的鹽寮村，是花東海岸線最北端的一個村落，以前花蓮的食鹽就是在這裡烹煮製成，因此日本人稱此地為「鹽寮港」。日治時期，山坡種植了整片的香茅草，村民煉製香茅油外銷東南亞，二次世界大戰，香茅油價格大漲，甚至還曾銷售到歐洲。早期，每年春天，海岸山脈的野百合盛開，因此現在的海洋公園一帶，曾有「百合谷」的美稱。','','');
insert into images values ('E_Farglory_Ocean_Park_03','Farglory_Ocean_Park','海洋公園裡有許多有趣的海洋主題遊樂設施以及難得一見的鯨豚表演，園區內的纜車和摩天輪更是觀賞海景的絕佳地點，對於海洋生態有興趣的人，也可以在展示館中窺探海洋的秘密。','','');
insert into images values ('E_Chike_Mountain_01','Chike_Mountain','早在日據時期，赤柯山就以盛產赤柯樹聞名，日本人將堅硬的赤柯木材砍下運往日本，做為製作槍托的材料。光復後，陸續有來自西部的漢人移入開墾，先是種玉米、花生、地瓜等雜糧，後來才改種金針。經過4、50年的辛勤開墾，赤柯山已從一片荒蕪的山頭轉變成以金針花海聞名的觀光勝地。 ','','');
insert into images values ('E_Chike_Mountain_02','Chike_Mountain','金針的品種很多，但以高山地區種植的品質較優。海拔約900公尺的赤柯山由於溫度低，金針生長速度較慢，加上雲霧帶來充沛的水氣，以及適合金針生長的紅壤土，因此出產的金針口感與風味較佳。','','');
insert into images values ('E_Chike_Mountain_03','Chike_Mountain','數年前，赤柯山萬花齊開的壯觀景致逐漸為外人所知，聞名而來的觀光人潮絡繹不絕。其實，除了黃澄澄的金針花海，來到赤柯山還可走訪著名的「赤柯三景」，也就是座落在金針田中的3顆黑色火成岩、造型奇特的千噸石龜這兩處天然地景，以及已有40多年歷史的汪家古厝。','','');
insert into images values ('E_Fuyuan_Butterfly_Valley_01','Fuyuan_Butterfly_Valley','富源蝴蝶谷位於花蓮縣瑞穗鄉富源村，是一座以樟樹林為主要樹種的森林遊樂區。數條林間步道沿著富源溪溯源而上，溪谷兩側全是茂密的樟樹造林及低海拔闊葉林，濃密參天的樟樹是富源蝴蝶谷的一大特色，林間有著淡淡的芬多精與樟樹芳香氣息，是進行森林浴的好地方。 ','','');
insert into images values ('E_Fuyuan_Butterfly_Valley_02','Fuyuan_Butterfly_Valley','由於環境原始自然，這兒提供了蝴蝶棲息繁殖的優質環境，每年3月至8月是最佳的賞蝶季節，包括青帶鳳蝶、端紅蝶、大紅紋鳳蝶、石牆蝶、蛇目蝶及台灣蚊白蝶等30餘種蝴蝶在林間翩然起舞，形成一幅繽紛美麗的畫面。','','');
insert into images values ('E_Fuyuan_Butterfly_Valley_03','Fuyuan_Butterfly_Valley','此外，3月到5月及9月到11月間，則分別是欣賞黑翅螢與台灣山窗螢的季節，每當夜幕低垂時分，可見到成千上萬閃閃發亮的螢火蟲，猶如一條會移動的光帶在草地林間閃爍飛舞，令人嘆為觀止！ ','','');
insert into images values ('E_Nanan_Waterfall_01','Nanan_Waterfall','從玉里鎮接上台30號(原18號)公路往西走，大約10公里左右就來到了玉山國家公園南安遊客中心，再前行2公里，就可以看到約50公尺高的南安瀑布，垂掛在路旁的山壁上。 ','','');
insert into images values ('E_Nanan_Waterfall_02','Nanan_Waterfall','南安瀑布的上游發源於花蓮縣卓溪鄉的大裡仙山，由於這片山區林相保存良好，孕涵著豐沛的水源，加上山勢陡峭，才造就了從懸崖上直泄而下、氣勢驚人的南安瀑布。 ','','');
insert into images values ('E_Nanan_Waterfall_03','Nanan_Waterfall','南安瀑布下有好幾處深淺不一的水潭，在炎炎夏日裡，往往被遊客當成消暑戲水的天然游泳池。當陽光照映著飛瀑布濺起的水氣時，常在瀑布周邊形成豔麗迷人的虹彩，搭配著長滿青苔蕨類的濕滑岩壁，形成一幅令人目眩神迷的畫面。 ','','');
insert into images values ('E_Antong_Hot_Springs_01','Antong_Hot_Springs','安通溫泉位於玉里鎮與富里鄉交界處的安通溪北岸，幽谷山林，景色十分優美，早年即以「安通濯暖」名列花蓮八景之一。','','');
insert into images values ('E_Antong_Hot_Springs_02','Antong_Hot_Springs','1904年時，一位上山採樟腦的日本人在安通溪畔發現溫泉露頭，到了1930年，日本人在這兒興建警察招待所，並設置公共浴場，逐漸發展成為溫泉勝地。光復後，民間業者於民國63年買下經營，改為安通溫泉大旅社。','','');
insert into images values ('E_Antong_Hot_Springs_03','Antong_Hot_Springs','安通溫泉附近還有一條開闢於清代的安通越嶺古道（日據時期一度改稱紅莝越嶺道），從台東縣長濱鄉竹湖村石門溪起，經烏帽子山南側鞍部越過海岸山脈，沿安通溪通往玉里鎮樂合里，全程約13公里。','','');
insert into images values ('E_Ruisui_Pasture_01','Ruisui_Pasture','民國70年代，瑞穗牧場現址原是一大片的木瓜田，每當颱風過後，辛苦種植的木瓜常落得全數泡湯的下場。當年的地主想到常在電影裡看到美國西部牛仔騎著馬、趕著牛，奔馳在草原上的神氣與威風，於是跟友人開玩笑地說：「來養牛好了，從來沒看過牧草被颱風吹倒的，飼乳牛免驚風颱啦！」沒想到，這句玩笑話竟開啟了瑞穗的酪農事業。 ','','');
insert into images values ('E_Ruisui_Pasture_02','Ruisui_Pasture','靠著源自中央山脈的潔淨水源灌溉，瑞穗牧場種植出一片油亮碧綠的鮮美牧草，飼養著300多頭壯碩健康的荷蘭品種乳牛。由於這無與倫比的好空氣與好水草，每一頭瑞穗牧場裡的乳牛，平均每天可生產20多公斤的鮮乳量。','','');
insert into images values ('E_Ruisui_Pasture_03','Ruisui_Pasture','除了每天現擠、現煮的濃醇鮮奶，來到瑞穗牧場還可以吃到香噴噴、熱呼呼的鮮奶饅頭；雖然個頭不大，但一口咬下，滿嘴全是濃濃的奶香。另外還有乳酪蛋糕、鮮奶酪、牛軋糖與乳製冰品等多種甜點，深受遊客的喜愛。','','');
/* ================================================================================================================== */


/*心理測驗對應類型*/
create table persontype (
 typeID              	char(2)				NOT NULL,
 typeName				nvarchar(50)		not null,
 typeDetail				varchar(300)		NOT NULL,     
 constraint types_primary_key primary key (typeID )
 );

   insert into persontype values ('A','五光十色大都會之旅','有時候，生活在都市的大染缸太久了，心也容易關了起來、與他人相處也處處提防，習慣都會的節奏與便利的你，大城市的旅行最為適合，建議你前往別的國家的大都會旅行，你會發現，不是每個大城市的人都龍蛇混雜、不懷好意的，當你在異鄉的繁忙街頭迷了路，遇到不求回報的好心人，這樣的真誠一定能讓你的心溫暖起來。');
   insert into persontype values ('B','自然奇景心靈沉澱之旅','個性直率、有話直說的你，最討厭看到不公不義的事情，有時候這樣的個性也為你帶來不少阻礙，建議你選擇能暫時讓心靈沉靜下來的地方，世界遺產或奇觀或許是不錯的選擇，除了能看到各種大自然的鬼斧神工之外，站在壯闊的風景之下，也許能夠為你帶來更多領悟與體會。');
   insert into persontype values ('C','節慶活動狂歡旅行 ','該說你內向還是古意，你的個性溫和，從不與人發生爭執，做事總是埋頭苦幹，這樣的性格讓你吃虧不少，要知道，現在已經不是「曖曖內含光」的時代了，建議你不妨選擇參加其他國家的節慶或盛事，在一群人尖叫吶喊的過程中釋放壓力，也能讓自己不要這麼壓抑。');
  
/*
	select member_loginID,typename 
	from persontype join sysmember
	on sysmember.member_type = persontype.typeID;
*/


/*會員管理*/
CREATE TABLE sysmember(
	member_loginID		nvarchar(20)	NOT NULL,
	member_password		nvarchar(20)	NOT NULL,
	member_email		nvarchar(100)	NOT NULL,
	member_class		int				NOT NULL,
	member_name			NVARCHAR(20)	NOT NULL,
	member_stop			char(10)		NOT NULL,		
	member_gender		nvarchar(5)		NOT NULL,
	member_birthday		date			NOT NULL,
	member_address		nvarchar(50) ,
	member_buildtime	datetime		NOT NULL,
	member_type         char(2)			not null,				
	CONSTRAINT sysmember_member_type_FK		FOREIGN KEY (member_type)	REFERENCES persontype (typeID),
	CONSTRAINT sysmember_member_loginID_PK	PRIMARY KEY (member_loginID)
);

insert into sysmember values ('aa123','bb123','aa123@gmail.com',1,'宋楚魚','N','男','2014-01-01','台北市大安區','2014-02-02','A');
insert into sysmember values ('bb123','cc123','bb123@gmail.com',2,'陳水貶','N','男','2013-10-05','台北市信義區','2014-01-06','B');
insert into sysmember values ('cc123','dd123','cc123@yahoo.com.tw',3,'王今平','N','男','2012-08-11','台北市內湖區','2013-10-02','C');
insert into sysmember values ('dd123','ee123','dd123@gmail.com',4,'馬因九','N','男','2011-07-01','台北市木柵區','2012-08-07','A');
insert into sysmember values ('ee123','aa123','ee123@yahoo.com.tw',5,'連剩文','N','男','2010-11-21','台北市文山區','2011-06-18','C');

/*
SELECT *
FROM messageboard
FULL OUTER JOIN sysmember
ON messageboard.member_loginID=sysmember.member_loginID
where sysmember.member_loginID  is null
ORDER BY messageboard.member_loginID
*/

create table messageboard(
	messageNum      int IDENTITY (1,1)	 not null,
	member_loginID  nvarchar(20)		 not null,
	title			nvarchar(100)		 not null,
	content			nvarchar(max)		 not null,
	build_time		date				 not null,
	message_stop	char(2)				 not null,
	replyfrom		int					 not null,
	CONSTRAINT messageboard_member_loginID_FK			FOREIGN KEY (member_loginID)	REFERENCES sysmember (member_loginID),
 	CONSTRAINT messageboard_messageNum_PK				PRIMARY KEY (messageNum)
);

insert into messageboard values('aa123','台北一日遊','貓空好多貓','2014-10-10','n',0);
insert into messageboard values('bb123','一日遊','陽明山好多花','2014-10-10','n',0);
insert into messageboard values('cc123','台北遊','動物園','2014-10-10','n',0);

/*好友管理*/
create table member_friend (
	friendNum      int IDENTITY (1,1)	 not null,
	member_loginID nvarchar(20)			 not null,
	friend_loginID nvarchar(20)					 ,
	
	
	CONSTRAINT friend_member_loginID_fK  FOREIGN KEY (member_loginID) REFERENCES sysmember (member_loginID),
	CONSTRAINT friend_friendNum_PK		 PRIMARY KEY (friendNum)
	
);

insert into member_friend values ('aa123','bb123');
insert into member_friend values ('aa123','cc123');
insert into member_friend values ('aa123','dd123');
insert into member_friend values ('dd123','bb123');
insert into member_friend values ('ee123','bb123');


/*路徑規劃*/
create table route
(
  routeID			int IDENTITY(1,1)   not null,
  routeName			nvarchar(20)        not null,
  buildTime			datetime	        not null, 
  member_loginID	nvarchar(20)		not null ,

  CONSTRAINT route_member_loginID_fK	FOREIGN KEY (member_loginID) REFERENCES sysmember (member_loginID),
  CONSTRAINT route_routeID_PK			PRIMARY KEY (routeID)
);

insert into route values ('北區鶯歌淡水一日遊', '2014-10-06','aa123');
insert into route values ('北區擎天崗貓空淡水三日遊','2014-10-06', 'bb123');


/*路徑規劃的圖片及安排路徑順序*/
create table RouteView
(
  routeID         int                 not null ,
  viewID          nvarchar(50) 	      not null ,
  RouteViewOrder  int	              not null ,

  CONSTRAINT RouteView_routeID_fK	FOREIGN KEY (routeID)	REFERENCES route (routeID),
  CONSTRAINT RouteView_viewID_fK	FOREIGN KEY (viewID)	REFERENCES viewname (viewID),
  CONSTRAINT pk_RouteView			PRIMARY KEY (routeID, viewID)
)

insert into RouteView values ('1','Chingtienkang', 1);
insert into RouteView values ('1','Maokong', 2);



/* insert into RouteView values ('1','Danshuei', 3);
insert into RouteView values ('2','Yingge', 1);

insert into RouteView values ('2','Danshuei', 2);*/


/*會員心情札記*/
CREATE TABLE TravelDiary(
  TravelDiary_ID		int IDENTITY(1,1)   not null,
  TravelDiary_Name		nvarchar(60)        not null,
  publish_date			datetime			not null,
  TravelDiary_Content	nvarchar(max)				,
  member_loginID		nvarchar(20)		not null,
  diary_class			int							,/*0 or 1 → 開放or隱私*/

  CONSTRAINT TravelDiary_member_loginID_fK  FOREIGN KEY (member_loginID) REFERENCES sysmember (member_loginID),
  CONSTRAINT TravelDiary_TravelDiary_ID_PK PRIMARY KEY (TravelDiary_ID)
)

insert into TravelDiary values ('擎天崗一日遊超好玩','2014-10-05','我在擎天崗遇到超多牛和牛屎~','aa123',0);
insert into TravelDiary values ('淡水一日遊超好玩','2014-10-05','我在淡水老街漁人碼頭夜景好美~','bb123',1);


/*會員心情札記圖片*/
CREATE TABLE TravelDiaryPic(
  PicID				   int                  not null,
  TravelDiary_ID       int                  not null,
  PicName              nvarchar(40)         not null,
  PicImage             image                not null,

  CONSTRAINT TravelDiaryPic_TravelDiary_ID_fK	FOREIGN KEY (TravelDiary_ID) REFERENCES TravelDiary (TravelDiary_ID),
  CONSTRAINT pk_TravelDiaryPic					PRIMARY KEY (TravelDiary_ID, PicID)
)

insert into TravelDiaryPic values (1, 1,'牛','c:\pic\cow.gif');
insert into TravelDiaryPic values (2, 1,'牛屎','c:\pic\cow_shit.gif');
insert into TravelDiaryPic values (1, 2,'漁人碼頭','c:\pic\ship.gif');
insert into TravelDiaryPic values (2, 2,'淡水渡船頭','c:\pic\night.gif');


/*************旅遊小知識table**************/
/*
CREATE TABLE knowledge_type ( 
 travel_match_no         int identity(1,1)			 ,
 news_title				 nvarchar(50)		 not null,

 CONSTRAINT travel_match_travel_match_no PRIMARY KEY (travel_match_no),
 );

insert into knowledge_type values ('食');
insert into knowledge_type values ('衣');
insert into knowledge_type values ('住');
insert into knowledge_type values ('行');
insert into knowledge_type values ('育');
insert into knowledge_type values ('樂');
*/

/*首頁小知識*/

CREATE TABLE knowledge ( 

 knowledge_idenity          int identity(1,1)	not null,
 knowledge_type             nvarchar(10)	    not null,
 knowledge_title			nvarchar(50)		not null,
 knowledge_content			nvarchar(50)		not null,
 knowledge_img				image						,
 
  CONSTRAINT pk_knowledge	PRIMARY KEY (knowledge_idenity)
 );

insert into knowledge values ('食','title1','文章內文1','z:\\');
insert into knowledge values ('衣','title2','文章內文2','z:\\');
insert into knowledge values ('住','title3','文章內文3','z:\\');




/*************最新消息table*******************/


/*首頁最新消息*/
 CREATE TABLE news ( 
 news_idenity            int identity(1,1),
 news_date				 date					not null,
 news_title				 nvarchar(50)			not null,
 news_image				 nvarchar(50)			not null, 
 news_Content            nvarchar(200)			not null,
 
CONSTRAINT news_news_image_fK		FOREIGN KEY (news_image)	REFERENCES viewname (viewid),
CONSTRAINT news_news_idenity_fK		PRIMARY KEY (news_idenity)
 );

insert into news values ('2014-09-25','title1','Chingtienkang','文章內文1');
insert into news values ('2014-09-25','title2','Chingtienkang','文章內文2');
insert into news values ('2014-09-25','title3','Maokong','文章內文3');



/* 1. 管理我的足跡 */
create table myfootmark(
	footmarkid		int identity(1,1)				,
	member_loginID	nvarchar(20)			not null,
	imagesName		nvarchar(50)			not null,
	visitDate		date					not null,
	foot_class		int						not null,
	CONSTRAINT myfootmark_member_loginID_fK  FOREIGN KEY (member_loginID)	REFERENCES sysmember (member_loginID),
	CONSTRAINT myfootmark_imagesName_fK		 FOREIGN KEY (imagesName)		REFERENCES viewname (viewID),
	CONSTRAINT myfootmark_footmarkid_PK		 PRIMARY KEY (footmarkid)
);
						
INSERT  INTO  myfootmark  VALUES  ('aa123', 'Chingtienkang', '2014-09-25',1 );
INSERT  INTO  myfootmark  VALUES  ('aa123', 'Maokong', '2014-10-01',1);
INSERT  INTO  myfootmark  VALUES  ('bb123', 'Chingtienkang', '2014-10-04',1);
INSERT  INTO  myfootmark  VALUES  ('cc123', 'Maokong', '2014-10-04',0);


/*心理測驗*/
 create table questions (
 questionNO              int IDENTITY (1,1) not null,
 questionDetail          varchar(250)		NOT NULL,    
 ans1                    varchar(250)		NOT NULL,     
 ans2                    varchar(250)		NOT NULL,  
 constraint questions_primary_key primary key (questionNO )
 );

insert into questions values ('已經看過原著的小說改編成電影，你還會去電影院看嗎？','一定要看視覺化之後的呈現','都知道會演什麼了，不會去');
insert into questions values ('你比較喜歡看下面哪種小說？','純文學','科幻推理');
insert into questions values ('當你獨自生活時，會經常自己開伙嗎？','自己煮多麻煩，外食多自在','想吃什麼就煮甚麼，好方便的嘛');
insert into questions values ('同事或朋友經常邀約你參加聚會嗎？','應接不暇','偶爾被約');
insert into questions values ('你覺得路上的街友行乞都是騙人的嗎？','是耶','不是啦');




 alter table [dbo].[messageboard] with check add constraint
 [FK_messageboard_sysmember]foreign key ([member_loginID])
 references sysmember([member_loginID])
 ON delete cascade;


 alter table [dbo].[member_friend] with check add constraint
 [FK_member_friend_sysmember]foreign key ([member_loginID])
 references sysmember([member_loginID])
 ON delete cascade;


 alter table [dbo].[route] with check add constraint
 [FK_route_sysmember]foreign key ([member_loginID])
 references sysmember([member_loginID])
 ON delete cascade;


 alter table [dbo].[RouteView] with check add constraint
 [FK_RouteView_route]foreign key ([routeID])
 references route([routeID])
 ON delete cascade;


 alter table [dbo].[TravelDiary] with check add constraint
 [FK_TravelDiary_sysmember]foreign key ([member_loginID])
 references sysmember([member_loginID])
 ON delete cascade;


 alter table [dbo].[TravelDiaryPic] with check add constraint
 [FK_TravelDiaryPic_TravelDiary]foreign key ([TravelDiary_ID])
 references TravelDiary([TravelDiary_ID])
 ON delete cascade;


 alter table [dbo].[myfootmark] with check add constraint
 [FK_myfootmark_sysmember]foreign key ([member_loginID])
 references sysmember([member_loginID])
 ON delete cascade;
