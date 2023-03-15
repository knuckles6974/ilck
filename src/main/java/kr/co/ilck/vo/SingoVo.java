package kr.co.ilck.vo;

public class SingoVo {

    private int id,state,pid;
    private String userid,title,content,writeday,singo_userid;

    // member 테이블에서 참고하기 위해 필요
    private int state2;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getWriteday() {
        return writeday;
    }

    public void setWriteday(String writeday) {
        this.writeday = writeday;
    }

    public String getSingo_userid() {
        return singo_userid;
    }

    public void setSingo_userid(String singo_userid) {
        this.singo_userid = singo_userid;
    }



    public int getState2() {
        return state2;
    }

    public void setState2(int state2) {
        this.state2 = state2;
    }
}
