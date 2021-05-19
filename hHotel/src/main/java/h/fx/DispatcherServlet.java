package h.fx;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(
		urlPatterns = {"/hd/*"},
		loadOnStartup = 10) 
public class DispatcherServlet extends HttpServlet {
	// dispatcher-servlet에 담겨있는 정보를 메모리에 로드될 때(init호출) 미리 넣어 놓을것이다.
	private Map<String, AbstractController> controllerMap = new HashMap<>();
	
	@Override
	public void init() throws ServletException {
		Properties prop = new Properties();
		try {
			prop.load(new FileInputStream(this.getClass().getResource("dispatcher-servlet.properties").getPath()));
			
			for(Object oKey : prop.keySet()) {
				String key = ((String)oKey).trim();
				Class className = Class.forName(prop.getProperty(key).trim());
				System.out.println("className: " + className);
				controllerMap.put(key, (AbstractController) className.getConstructor().newInstance());
				System.out.println("value: " + (AbstractController) className.getConstructor().newInstance());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String action = requestURI.substring(contextPath.length());
		System.out.println(action);
		
		// controllerMap에 있는 url 객체를 사용하기 
		AbstractController controller = controllerMap.get(action);
		ModelAndView mav = controller.handleRequestInternal(request, response);
		
		if (mav != null) {
			String viewName = mav.getViewName();
			
			if (viewName.startsWith("redirect:")) {
				response.sendRedirect(viewName.substring(9));
			} else {
				Map<String, Object> model = mav.getModel();
				for(String key : mav.getModel().keySet()) {
					request.setAttribute(key, model.get(key));
				}
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(viewName);
				dispatcher.forward(request, response);
			}
		} else {
			System.out.println("DispatcherServlet에서 에러");
		}
	}
}
