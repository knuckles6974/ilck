package kr.co.ilck.vo;

public class WishVo {
    private int id,pid;
    private String userid,writeday,pimg;

    public String getPimg() {
        return pimg;
    }

    public void setPimg(String pimg) {
        this.pimg = pimg;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getWriteday() {
        return writeday;
    }

    public void setWriteday(String writeday) {
        this.writeday = writeday;
    }

    public String getCimg() {
        return cimg;
    }

    public void setCimg(String cimg) {
        this.cimg = cimg;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    private String cimg,title;
    private int price;

}
