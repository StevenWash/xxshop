package com.huaxin.xxshop.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.huaxin.xxshop.entity.Category;
import com.huaxin.xxshop.entity.Goods;
import com.huaxin.xxshop.entity.PageBean;
import com.huaxin.xxshop.service.CategoryService;
import com.huaxin.xxshop.service.GoodsService;
import com.huaxin.xxshop.util.XXShopUtil;

public class GoodsAction {
	private CategoryService categoryService;
	private List<Category> categories;
	private Category category;

	// 商品的货号
	private String goodsNo;

	// 接受前端传递过来的goods参数
	private Goods goods;
	private GoodsService goodsService;

	// 定义文件变量和文件名，用来接收来自前台页面的数据
	private File thumbnail;
	private String thumbnailFileName;

	private List<Goods> goodses;
	private List<Goods> goodsesWithOrder;// 带有顺序的商品集合

	private PageBean<Goods> pageBean;
	private int page = 0;

	private int index;

	private String order;// 用来接收页面传输过来的排序规则

	/*
	 * 将商品的信息全部显示出来
	 */
	public String list() {
		goodses = goodsService.getGoods(goods);
		categories = categoryService.getCategories();
		return "list";
	}

	/*
	 * 带有所有商品分类的分页 进行分页查询
	 */
	public String listByPage() {
		categories = categoryService.getCategories();
		if (page == 0) {
			page = 1;
		}
		pageBean = goodsService.getGoodsByPage(page, goods);
		return "list";

	}

	/*
	 * 得到添加商品页面的商品号和分类
	 */
	public String add() {
		goodsNo = "XX" + XXShopUtil.getGoodsNo();
		categories = categoryService.getCategories();
		return "add";
	}

	/*
	 * 进行商品添加的操作
	 */
	public String addoper() {
		System.out.println(goods);
		/*
		 * dir 获取当前文件存放的目录地址 suffix 用来获取当前上传的文件的扩展名
		 */
		String dir = ServletActionContext.getServletContext().getRealPath(
				"/goodsimage");
		String suffix = "";
		String fileName = XXShopUtil.getId();
		if (thumbnail != null) {
			suffix = thumbnailFileName.substring(thumbnailFileName
					.lastIndexOf("."));
			// 组装成最后需要保存的文件的地址（包括文件的扩展名）
			File saveFile = new File(new File(dir), fileName + suffix);
			try {
				// 上传文件 org.apache.commons.io.FileUtils 既可以实现将文件上传到服务器上对应的文件夹下面
				FileUtils.copyFile(thumbnail, saveFile);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// 将文件的地址信息添加到数据库中
			goods.setThumbnail("goodsimage/" + fileName + suffix);
		}
		goodsService.addGoods(goods);
		return "opersuc";
	}

	/*
	 * 跳转到更新的页面，将分类信息和商品信息带过去
	 */
	public String update() {
		categories = categoryService.getCategories();
		goods = goodsService.getGoodsById(goods.getId());
		return "update";
	}

	/*
	 * 实际上的更新操作
	 */
	public String updateoper() {
		/*
		 * dir 获取当前文件存放的目录地址 suffix 用来获取当前上传的文件的扩展名
		 */
		String dir = ServletActionContext.getServletContext().getRealPath("/");
		String suffix = "";
		String fileName = XXShopUtil.getId();
		if (thumbnail != null) {
			suffix = thumbnailFileName.substring(thumbnailFileName
					.lastIndexOf("."));
			// 组装成最后需要保存的文件的地址（包括文件的扩展名）
			File saveFile = new File(new File(dir + "/goodsimage"), fileName
					+ suffix);
			try {
				// 上传文件 org.apache.commons.io.FileUtils 既可以实现将文件上传到服务器上对应的文件夹下面
				FileUtils.copyFile(thumbnail, saveFile);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// 删除原先的缩略图
			new File(dir + "/" + goods.getThumbnail()).delete();
			// 将文件的地址信息添加到数据库中
			goods.setThumbnail("goodsimage/" + fileName + suffix);
		}

		goodsService.updateGoods(goods);
		return "updatesuc";
	}

	/*
	 * 删除商品
	 */
	public String delete() {
		goodsService.deleteGoods(goods);
		return "delsuc";
	}

	/*
	 * 通过categoryId来显示所有的商品
	 */
	public String listByCate() {
		category = categoryService.getCategoryById(goods.getCategoryId());
		categories = categoryService.getCategories();
		goodses = goodsService.getGoodsByOrder(order, 6, goods.getCategoryId());
		goodsesWithOrder = goodsService.getGoodsBySellNum(10);

		return "bycate";
	}

	/*
	 * 显示商品的信息
	 */
	public String view() {
		goods = goodsService.getGoodsById(goods.getId());
		categories = categoryService.getCategories();
		return "view";
	}

	/*
	 * 带有某一个商品类别的分页
	 */
	public String listByPageCate() {
		category = categoryService.getCategoryById(goods.getCategoryId());
		if (page == 0) {
			page = 1;
		}
		pageBean = goodsService.getGoodsByPage(page, goods);
		return "listCate";
	}

	/*
	 * 接受一个字符串，并返回一个字符串
	 */
	private String goodsIds;
	private String result;

	/*
	 * goodsIds用来接收来自前台的数据：包含了categoryId和num的json字符串 result
	 * 则返回查询到的信息，也是封装成了一个json字符串
	 */
	public String getGoodsesByIds() {
		System.out.println("goodsIds:" + goodsIds);
		String[] ids = goodsIds.split(",");
		for (String s : ids) {
			System.out.println("test:" + s);
		}
		System.out.println("test:" + ids.toString());
		goodses = goodsService.getGoodsByIds(ids);
		JsonConfig c = new JsonConfig();
		c.setExcludes(new String[] { "category", "goodsNo", "categoryId",
				"price1", "stock", "description", "role", "sellTime",
				"sellNum", "score" });
		JSONArray a = JSONArray.fromObject(goodses, c);
		result = a.toString();
		System.out.println("result:" + result);
		return "getgoodsesbyids";

	}

	// getter 和 setter
	public CategoryService getCategoryService() {
		return categoryService;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public String getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(String goodsNo) {
		this.goodsNo = goodsNo;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public GoodsService getGoodsService() {
		return goodsService;
	}

	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}

	public File getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(File thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getThumbnailFileName() {
		return thumbnailFileName;
	}

	public void setThumbnailFileName(String thumbnailFileName) {
		this.thumbnailFileName = thumbnailFileName;
	}

	public List<Goods> getGoodses() {
		return goodses;
	}

	public void setGoodses(List<Goods> goodses) {
		this.goodses = goodses;
	}

	public PageBean<Goods> getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean<Goods> pageBean) {
		this.pageBean = pageBean;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getGoodsIds() {
		return goodsIds;
	}

	public void setGoodsIds(String goodsIds) {
		this.goodsIds = goodsIds;
	}
	

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public List<Goods> getGoodsesWithOrder() {
		return goodsesWithOrder;
	}

	public void setGoodsesWithOrder(List<Goods> goodsesWithOrder) {
		this.goodsesWithOrder = goodsesWithOrder;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

}
