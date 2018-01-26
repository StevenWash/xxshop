package com.huaxin.xxshop.controller;

import com.huaxin.xxshop.entity.Category;
import com.huaxin.xxshop.service.CategoryService;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryAction {
	@Autowired
	private CategoryService categoryService;


	/**
	 * 增加商品分类
	 * @param categoryName
	 * @return
	 */
	@RequestMapping("/add")
	public String add(String categoryName) {
		Category category = new Category();
		category.setName(categoryName);
		categoryService.addCategory(category);
		return "redirect:/category/list";
	}


	/**
	 * 显示所有的商品分类
	 * @param model
	 * @return
	 */
	@RequestMapping("/list")
	public String list(Model model) {
		List<Category> categories = categoryService.getCategories();
		model.addAttribute("categories", categories);
		return "/admin/category_list";
	}


	/**
	 * 用来判断当前商品是否已经存在
	 * @param category
	 */
	@RequestMapping("/isexist")
	public void isexist(Category category) {
//		System.out.println(category.getName());
		boolean isexist = categoryService.getCategoryByName(category.getName());
//		System.out.println(isexist);
		PrintWriter write = null;
		try {
			write = ServletActionContext.getResponse().getWriter();
			write.print(!isexist);
			write.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			write.close();
		}
	}


	/**
	 * 删除当前用户点击的商品分类
	 * @param categoryId
	 * @return
	 */
	@RequestMapping("/delete")
	public String delete(String categoryId) {
		System.out.println("Now delete category where categoryId is: " + categoryId);
		categoryService.deleteCategory(categoryId);
		return "redirect:/category/list";
	}


	/**
	 * unused
	 * 修改商品信息
	 * @param categoryId
	 * @param category
	 */
	@RequestMapping("/update")
	public void update(String categoryId, Category category) {
//		System.out.println(category.getId() + "----"
//				+ category.getName().trim());
		boolean isexist = (categoryService.getCategoryById(categoryId) == null);
//		boolean isexist = categoryService.getCategoryByName(category.getName().trim());
		PrintWriter write = null;
		try {
			write = ServletActionContext.getResponse().getWriter();
			if (!isexist) {
				categoryService.updateCategory(category.getId(),
						category.getName());
				write.print(!isexist);
				write.flush();
			} else {
				write.print(!isexist);
				write.flush();
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			write.close();
		}
	}

	/**
	 * unused
	 * 接受表单的数据，将页面刷新一下
	 * @return
	 */
	@RequestMapping("/refresh")
	public String refresh() {
		return "redirect:/category/list";
	}

}
