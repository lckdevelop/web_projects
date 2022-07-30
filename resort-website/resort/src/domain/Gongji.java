package domain;

public class Gongji {
	private int id; // 게시판 레코드의 고유 키 값
	private String title; // 공지사항 제목
	private String date; // 공지사항 입력 일자
	private String content; // 내용
	private int rootid; // 원 글 번호
	private int relevel; // 댓글 번호
	private int recnt; // 댓글내 글 표시 순서
	private int viewcnt; // 조회수
	private int referenceid; // 참조 번호
	private String file; // 파일 이름
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRootid() {
		return rootid;
	}
	public void setRootid(int rootid) {
		this.rootid = rootid;
	}
	public int getRelevel() {
		return relevel;
	}
	public void setRelevel(int relevel) {
		this.relevel = relevel;
	}
	public int getRecnt() {
		return recnt;
	}
	public void setRecnt(int recnt) {
		this.recnt = recnt;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public int getReferenceid() {
		return referenceid;
	}
	public void setReferenceid(int referenceid) {
		this.referenceid = referenceid;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	
	
	
	
}
