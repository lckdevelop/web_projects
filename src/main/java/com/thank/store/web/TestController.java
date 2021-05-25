package com.thank.store.web;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.thank.store.dao.ManagerDAO;
import com.thank.store.dto.CvsProductDTO;
import com.thank.store.dto.ManPagingDTO;
import com.thank.store.dto.ManSearchDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TestController {
	@Autowired
	private ManagerDAO managerDAO;
	
	@GetMapping("/erer")
	public String index() throws SQLException {
		ManSearchDTO searchDTO = new ManSearchDTO();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

		searchDTO.setPagingDTO(new ManPagingDTO(2));
		searchDTO.setCvstore_no(1);
		log.info(searchDTO.getPagingDTO().getStartNum() + "STARTNUM");
		log.info(searchDTO.getPagingDTO().getEndNum() + "EndNUM");
		List<CvsProductDTO> allList = managerDAO.getAllProductList(searchDTO);
		log.info(allList.size() + "갯수");
		for (CvsProductDTO cvsProductDTO : allList) {
			long countTime = (cvsProductDTO.getCountTime());

			log.info(cvsProductDTO.getNo() + ": NO" );
			log.info(cvsProductDTO.getName() + ": name" );
			log.info(fmt.format(cvsProductDTO.getExpirationdate()) + ": Expirationdate" );
			log.info(countTime + ": countTime" );

			
			

		}
		return "lala";
	}
}
