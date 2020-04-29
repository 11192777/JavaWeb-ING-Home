package pers.qingyu.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("favorite")
public class FavoriteController {

	@RequestMapping("homes")
	public String favoriteHoems(){
		return "favorite/homes";
	}
}
