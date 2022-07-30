<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="service.ReviewService"%>
<%@page import="domain.Review"%>
<%@page import="java.util.Date"%>
<%@page import="domain.Gongji"%>
<%@page import="service.GongjiService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
	<head>
		<script LANGUAGE=JavaScript>
		function showAlert() {
			alert("이용후기 작성 완료\n\n이용해주셔서 감사합니다~");
			location.href="e_02.jsp";	
		}

		function updateAlert() {
			alert("수정을 완료하였습니다\n\n감사합니다~");
			location.href="e_02.jsp";	
		}

		function reAlert() {
			alert("답변 작성을 완료하였습니다\n\n감사합니다~");
			location.href="e_02.jsp";	
		}
		</script>
	</head>
	<body>
		<% 
	request.setCharacterEncoding("utf-8");
		Date today = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

		Review gongji = new Review();
		List<Review> recntList = new ArrayList<>();

	if (request.getParameter("key").equals("insert")) {
		/* new 쓰기 부분 */
		/* new 쓰기 부분 */
					
		// 파일 조작을 위한 초기 단계 설정
		MultipartRequest multi = new MultipartRequest(request, "C:/Users/kopo/Downloads", 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		
		// 폼 페이지에서 전송된 요청 파라미터를 받도로고 객체 타입의 메소드 작성

		Enumeration files = multi.getFileNames();

	// 폼 페이지에서 전송된 요청중 파일 파라미터의 값을 얻어오도록 메소드 작성
		String name = (String) files.nextElement();
		// 37행의 name으로 메소드를 작성
		String filename = multi.getFilesystemName(name);
					
		gongji.setTitle(multi.getParameter("title"));
		gongji.setDate(sf.format(today));
		gongji.setContent(multi.getParameter("content"));
		gongji.setFile(filename);
      	 	
		ReviewService gongjiService = new ReviewService();
		
		gongjiService.newWrite(gongji);
		
	%>
		<script>showAlert();</script>
	<% 
	} else if (request.getParameter("key").equals("update")) {
		/* 업데이트 쓰기 부분 */
		// 파일 조작을 위한 초기 단계 설정
		MultipartRequest multi = new MultipartRequest(request, "C:/Users/leechaekyeong/Downloads", 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
		// 폼 페이지에서 전송된 요청 파라미터를 받도로고 객체 타입의 메소드 작성
		Enumeration files = multi.getFileNames();
		
		// 폼 페이지에서 전송된 요청중 파일 파라미터의 값을 얻어오도록 메소드 작성
		String name = (String) files.nextElement();
		// 37행의 name으로 메소드를 작성
		String filename = multi.getFilesystemName(name);
		
		gongji.setId(Integer.parseInt(multi.getParameter("id")));
		gongji.setTitle(multi.getParameter("title"));
		gongji.setDate(sf.format(today));
		gongji.setContent(multi.getParameter("content"));
		gongji.setFile(filename);
		
		ReviewService gongjiService = new ReviewService();
		
		gongjiService.update(gongji);
	
	%>
		<script>updateAlert();</script>
	<%
		} else if (request.getParameter("key").equals("reinsert")) {
			/* 댓글 쓰기 부분 */					
			request.setCharacterEncoding("utf-8");
	
			int momid = Integer.parseInt(request.getParameter("momid"));// 부모 id 
			int	momRootid = Integer.parseInt(request.getParameter("rootid")); // 원글 id
			int	momRecnt = Integer.parseInt(request.getParameter("recnt")); // 부모 id
			int	momRelevel = Integer.parseInt(request.getParameter("relevel")); // 부모 id
			int originRecnt = 1; // 부모 바로 다음에있는 게시글 recnt	
			
			ReviewService reviewService = new ReviewService();
			
			Review originRe = new Review();
			Review newRe = new Review();
			
			List<Review> originList = new ArrayList<Review>();
			List<Review> newList = new ArrayList<Review>(); //현재 필요없음
			
			int maxRecnt = reviewService.maxRecnt();
			
			// rootid 같은 게시글 불러오기
			try {
				originList = reviewService.selectRootId(momRootid, momRecnt);
				
				// 원글의 댓글인 경우
				if (momRelevel == 0) {
					originRecnt = maxRecnt + 1;
				// 바로뒤의것을 바라볼 수 없는 경우 부모 recnt + 1을 해준다.
				} else if (originList.size() == 0) {
					originRecnt = momRecnt + 1;
				// 바로뒤의 recnt값을 가져오는 경우
				} else if (originList.size() != 0){
					originRecnt = originList.get(0).getRecnt();
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

			// 새로운 댓글 객체 생성
			newRe.setTitle(request.getParameter("title"));
			newRe.setDate(sf.format(today));
			newRe.setContent(request.getParameter("content"));
			newRe.setRootid(momRootid);
			newRe.setRelevel(momRelevel + 1);
			newRe.setRecnt(originRecnt);

			reviewService.insertRe(newRe); // 새로운 댓글 db에 넣기
			
			// 원글이 댓글이 아닌 경우에만 recnt를 + 1해준다.
			if (momRelevel != 0) {
				reviewService.updateRecnt(originList); // recnt++하기
			}
		}
		%>
				<script>reAlert();</script>
	</body>
</html>