package kr.co.ilck.vo;

public class PanmaeVo {
	private int id, price,levp,star, singo_state, pstate, readnum,sstate;
	private String userid;
	private String cimg;
	private String pimg;

	public String getTwoimgs() {
		return twoimgs;
	}

	public void setTwoimgs(String twoimgs) {
		this.twoimgs = twoimgs;
	}

	private String twoimgs;


	private String title;
	private String content;
	private String pcode;
	private String selltime;
	private String loca;
	private String writeday;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getLevp() {
		return levp;
	}

	public void setLevp(int levp) {
		this.levp = levp;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public int getSingo_state() {
		return singo_state;
	}

	public void setSingo_state(int singo_state) {
		this.singo_state = singo_state;
	}

	public int getPstate() {
		return pstate;
	}

	public void setPstate(int pstate) {
		this.pstate = pstate;
	}

	public int getReadnum() {
		return readnum;
	}

	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}

	public int getSstate() {
		return sstate;
	}

	public void setSstate(int sstate) {
		this.sstate = sstate;
	}


	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getCimg() {
		return cimg;
	}

	public void setCimg(String cimg) {
		this.cimg = cimg;
	}

	public String getPimg() {
		return pimg;
	}

	public void setPimg(String pimg) {
		this.pimg = pimg;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public String getSelltime() {
		return selltime;
	}

	public void setSelltime(String selltime) {
		this.selltime = selltime;
	}

	public String getLoca() {
		return loca;
	}

	public void setLoca(String loca) {
		this.loca = loca;
	}

	public String getWriteday() {
		return writeday;
	}

	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
}
