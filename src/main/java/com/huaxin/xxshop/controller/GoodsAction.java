package com.huaxin.xxshop.controller;

import com.huaxin.xxshop.entity.Category;
import com.huaxin.xxshop.entity.Goods;
import com.huaxin.xxshop.entity.PageBean;
import com.huaxin.xxshop.service.CategoryService;
import com.huaxin.xxshop.service.GoodsService;
import com.huaxin.xxshop.util.XXShopUtil;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
@Controller
@RequestMapping("/goods")
public class GoodsAction {
	@Autowired
    private CategoryService categoryService;
    @Autowired
    private GoodsService goodsService;


	/**
	 * 商品搜索
	 * @author 小轲轲是个美男子 2018年1月19日
	 * @param word
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/search",method = RequestMethod.GET)
	public String search(String word, HttpSession session, Model model) {
		goodsService.createIndex();
		List<Goods> search_result = goodsService.search(word);
		System.out.println(word);
		int MAX = 8;
		List<Goods> hotGoodses = goodsService.getGoodsByRole(MAX);
		List<Category> categories = categoryService.getCategoriesForIndex();
		model.addAttribute("word", word);
		model.addAttribute("search_result",search_result);
		model.addAttribute("hotGoodses", hotGoodses);
		model.addAttribute("categories",categories);
		return "search_result";
	}

	/**
	 * 将商品的信息全部显示出来
	 * @param goods
	 * @param model
	 * @return
	 */
	@RequestMapping("/list")
	public String list(Goods goods, Model model) {
		List<Goods> goodses = goodsService.getGoods(goods);
		List<Category> categories = categoryService.getCategories();

		model.addAttribute("goodses", goodses);
		model.addAttribute("categories", categories);
		return "/admin/goods_list";
//		return "list";
	}


	/**
	 * 带有所有商品分类的分页，进行分页查询
	 * @param page
	 * @param goods
	 * @param model
	 * @return
	 */
	@RequestMapping("/listByPage")
//	public String listByPage(int page, Goods goods, Model model) {
	public String listByPage(Integer page, Goods goods, Model model) {
		System.out.println("page: " + page + ", goods:" + goods);
		List<Category> categories = categoryService.getCategories();
		if (page==null || page==0) {
			page = new Integer(1);
		}
		PageBean<Goods> pageBean = goodsService.getGoodsByPage(page, goods);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("categories", categories);
		return "admin/goods_list";
	}


	/**
	 * 得到添加商品页面的商品号和分类
	 * @param model
	 * @return
	 */
	@RequestMapping("/add")
	public String add(Model model) {
		String goodsNo = "XX" + XXShopUtil.getGoodsNo();
		List<Category> categories = categoryService.getCategories();
		model.addAttribute("goodsNo", goodsNo);
		model.addAttribute("categories", categories);
		return "/admin/goods_add";
	}


	/**
	 * 进行商品添加的操作
	 * 定义文件变量，用来接收来自前台页面的数据-->pic
	 * @param goods
	 * @param mv
	 * @param pic
	 * @param request
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping("/addoper")
	public ModelAndView addoper(@ModelAttribute("goods") Goods goods,
						  ModelAndView mv, MultipartFile pic,
						  HttpServletRequest request)
					throws IllegalStateException, IOException {
		System.out.println("now add goods: " + goods);
		/*
		 * dir 获取当前文件存放的目录地址
		 * suffix 用来获取当前上传的文件的扩展名
		 */
		String FILE_TARGET = "target";
		String basePath = request.getSession().getServletContext().getRealPath("/"); // "/": 表示获取根目录
		basePath = basePath.substring(0,basePath.lastIndexOf(FILE_TARGET));
		String dir = basePath + "src/main/webapp/goodsimage/";
		// 新图片的名称
		String originFileName = pic.getOriginalFilename();
		String newFileName = XXShopUtil.getId() +
				originFileName.substring(originFileName.lastIndexOf("."));
		// 新的图片
		File newFile = new File(dir + newFileName);
		// 将内存中的数据写入磁盘
		pic.transferTo(newFile);
//		String dir = ServletActionContext.getServletContext().getRealPath(
//				"/goodsimage");
//		String suffix = "";
//		String fileName = XXShopUtil.getId();
//		if (thumbnail != null) {
//			suffix = thumbnailFileName.substring(thumbnailFileName
//					.lastIndexOf("."));
//			// 组装成最后需要保存的文件的地址（包括文件的扩展名）
//			File saveFile = new File(new File(dir), fileName + suffix);
//			try {
//				// 上传文件 org.apache.commons.io.FileUtils 既可以实现将文件上传到服务器上对应的文件夹下面
//				FileUtils.copyFile(thumbnail, saveFile);
//			} catch (IOException e) {
//			}
//			// 将文件的地址信息添加到数据库中
//			goods.setThumbnail("goodsimage/" + fileName + suffix);
//		}
		if(goods != null) {
			goods.setThumbnail("goodsimage/" + newFileName);
			goodsService.addGoods(goods);
		}

		mv.setViewName("redirect:/goods/listByPage");
		return mv;
	}


	/**
	 * 跳转到更新的页面，将分类信息和商品信息带过去
	 * @param goodsId
	 * @param model
	 * @return
	 */
	@RequestMapping("/update")
	public String update(String goodsId, Model model) {
		List<Category> categories = categoryService.getCategories();
		Goods goods = goodsService.getGoodsById(goodsId);
		model.addAttribute("goods", goods);
		model.addAttribute("categories", categories);
		return "/admin/goods_update";
	}

	/**
	 * 更新商品
	 * @param goods
	 * @param mv
	 * @param pic
	 * @param request
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping("/updateoper")
	public ModelAndView updateoper(Goods goods, ModelAndView mv,
								   MultipartFile pic, HttpServletRequest request)
						throws IllegalStateException, IOException {

		System.out.println("Now update goods: " + goods);
		Goods originGoods = goodsService.getGoodsById(goods.getId());
		if(pic != null) {
			/*
			 * dir 获取当前文件存放的目录地址
			 * suffix 用来获取当前上传的文件的扩展名
			 */
			String FILE_TARGET = "target";
			String basePath = request.getSession().getServletContext().getRealPath("/"); // "/": 表示获取根目录
			basePath = basePath.substring(0,basePath.lastIndexOf(FILE_TARGET));
			String dir = basePath + "src/main/webapp/goodsimage/";
			String path = basePath + "src/main/webapp/";
			// 新图片的名称
			String originFileName = pic.getOriginalFilename();
			String newFileName = XXShopUtil.getId() +
					originFileName.substring(originFileName.lastIndexOf("."));
			// 新的图片
			File newFile = new File(dir + newFileName);
			// 将内存中的数据写入磁盘
			pic.transferTo(newFile);
			goods.setThumbnail("goodsimage/" + newFileName);
			(new File(path + originGoods.getThumbnail())).delete();
		}
//		String dir = ServletActionContext.getServletContext().getRealPath("/"); // 下面语句报Null错误
//		System.out.println(dir);
//		String suffix = "";
//		String fileName = XXShopUtil.getId();
//		if (thumbnail != null) {
//			suffix = thumbnailFileName.substring(thumbnailFileName
//					.lastIndexOf("."));
//			// 组装成最后需要保存的文件的地址（包括文件的扩展名）
//			File saveFile = new File(new File(dir + "/goodsimage"), fileName
//					+ suffix);
//			try {
//				// 上传文件 org.apache.commons.io.FileUtils 既可以实现将文件上传到服务器上对应的文件夹下面
//				FileUtils.copyFile(thumbnail, saveFile);
//			} catch (IOException e) {
//				System.out.println("IOException");
//			}
//			// 删除原先的缩略图
//			new File(dir + "/" + goods.getThumbnail()).delete();
//			// 将文件的地址信息添加到数据库中
//			goods.setThumbnail("goodsimage/" + fileName + suffix);
//		}

		// 此时预设只有thumbnail属性为空
		// 不知道前台select语句如何传值
		if(goods.getThumbnail() == null) {
			goods.setThumbnail(originGoods.getThumbnail());
			goods.setCategoryId(originGoods.getCategoryId());
		}

		System.out.println("Finally goods is: " + goods);
		goodsService.updateGoods(goods);

		mv.setViewName("redirect:/goods/listByPage");
		return mv;
	}

	/**
	 * 删除商品
	 * @param goodsId
	 * @return
	 */
	@RequestMapping("/delete")
	public String delete(String goodsId) {
		Goods goods = goodsService.getGoodsById(goodsId);
		goodsService.deleteGoods(goods);
		return "redirect:/goods/listByPage";
	}

	/**
	 * 商品分类展示
	 * goodsesWithOrder 带有顺序的商品集合
	 * order 用来接收页面传输过来的排序规则
	 * 通过categoryId来显示所有的商品
	 * @param goodsCategoryId
	 * @param order
	 * @param mv
	 * @return
	 */
	@RequestMapping("/listByCate")
//	public String listByCate(Goods goods, String order, Model model) {
	public ModelAndView listByCate(String goodsCategoryId, String order, ModelAndView mv) {
//		Category category = categoryService.getCategoryById(goods.getCategoryId());
		// 默认按销量排序
		if(order == null) {
			order = "sellnum";
		}
		Category category = categoryService.getCategoryById(goodsCategoryId);
		List<Category> categories = categoryService.getCategories();
		// 姑且只show6个商品
		int MAX = 6;
		int TEN = 10;

		List<Goods> goodses = goodsService.getGoodsByOrder(order, MAX, goodsCategoryId);
		List<Goods> goodsesWithOrder = goodsService.getGoodsBySellNum(TEN);

		System.out.println(goodsesWithOrder.size());

		mv.addObject("category", category);
        mv.addObject("categories", categories);
        mv.addObject("goodses", goodses);
        mv.addObject("goodsesWithOrder", goodsesWithOrder);
		mv.setViewName("goods_list");
		return mv;
	}

	/**
	 * 显示商品的信息
	 * @param goodsId
	 * @param mv
	 * @return
	 */
	@RequestMapping("/view")
	public ModelAndView view(String goodsId, ModelAndView mv) {
		Goods goods = goodsService.getGoodsById(goodsId);
		List<Category> categories = categoryService.getCategories();
//		model.addAttribute("goods", goods);
//		model.addAttribute("categories", categories);
		mv.addObject("goods", goods);
		mv.addObject("categories", categories);
//		session.setAttribute("goods", goods);
		mv.setViewName("goods_view");
		return mv;
	}


	/**
	 * 带有某一个商品类别的分页
	 * @param goods
	 * @param page
	 * @param model
	 * @return
	 */
	@RequestMapping("/listByPageCate")
	public String listByPageCate(Goods goods, Integer page, String order,Model model) {
		System.out.println(goods);
		System.out.println(page);
		System.out.println(order);
		Category category = categoryService.getCategoryById(goods.getCategoryId());
		if(order == null) {
			order = "sellnum";
		}
		if(page == null) {
			page = new Integer(1);
		}if (page == 0) {
			page = 1;
		}
		List<Category> categories = categoryService.getCategories();
		PageBean<Goods> pageBean = goodsService.getGoodsByPageAndOrder(page, goods, order);
		int ShowNum = 10;
		List<Goods> goodses = goodsService.getGoodsByOrder("sellNum",ShowNum,goods.getCategoryId());
		model.addAttribute("category", category);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("order",order);
		model.addAttribute("categories",categories);
		model.addAttribute("goodses",goodses);

		return "goods_list";
	}
//	@RequestMapping("/listByPageCate")
//	public String listByPageCate(Goods goods, Integer page, Model model) {
//		Category category = categoryService.getCategoryById(goods.getCategoryId());
//		if (page == 0) {
//			page = new Integer(1);
//		}
//		PageBean<Goods> pageBean = goodsService.getGoodsByPage(page, goods);
//		model.addAttribute("category", category);
//		model.addAttribute("pageBean", pageBean);
//		return "goods_list";
//	}


	// 下面可能是实现购物车小窗可视的关键代码
	/*
	 * 接受一个字符串，并返回一个字符串
	 */
	private String goodsIds;
	private String result;


	/**
	 * goodsIds用来接收来自前台的数据：包含了categoryId和num的json字符串
	 * result 则返回查询到的信息，也是封装成了一个json字符串
	 * @param goodsIds
	 * @param model
	 * @return
	 */
	@RequestMapping("/getGoodsesByIds")
	public String getGoodsesByIds(String goodsIds, Model model) {
//		System.out.println("goodsIds:" + goodsIds);
		String[] ids = goodsIds.split(",");
//		for (String s : ids) {
//			System.out.println("test:" + s);
//		}
//		System.out.println("test:" + ids.toString());
		List<Goods> goodses = goodsService.getGoodsByIds(ids);
		JsonConfig c = new JsonConfig();
		c.setExcludes(new String[] { "category", "goodsNo", "categoryId",
				"price1", "stock", "description", "role", "sellTime",
				"sellNum", "score" });
		JSONArray a = JSONArray.fromObject(goodses, c);
		String result = a.toString();
		model.addAttribute("result", result);
		System.out.println(result);
//		System.out.println("result:" + result);
		return "/TestJSP.jsp";
//		return "getgoodsesbyids";

	}


}
