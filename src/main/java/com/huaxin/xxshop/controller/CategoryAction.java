package com.huaxin.xxshop.controller;

import com.huaxin.xxshop.entity.Category;
import com.huaxin.xxshop.service.CategoryService;
import org.apache.struts2.ServletActionContext;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


public class CategoryAction {
	private Category category;
	private CategoryService categoryService;
	private List<Category> categories;

	/*
	 * 添加商品分类
	 */
	public String add() {
		categoryService.addCategory(category);
		return "opersuc";
	}

	/*
	 * 显示所有的商品分类
	 */
	public String list() {
		categories = categoryService.getCategories();
		return "list";
	}

	/*
	 * 用来判断当前的这个上商品的类别名称是否已经存在
	 */
	public void isexist() {
		System.out.println(category.getName());
		boolean isexist = categoryService.getCategoryByName(category.getName());
		System.out.println(isexist);
		PrintWriter write = null;
		try {
			write = ServletActionContext.getResponse().getWriter();
			write.print(!isexist);
			write.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			write.close();
		}
	}

	/*
	 * 删除当前用户的点击的商品分类
	 */
	public String delete() {
		categoryService.deleteCategory(category.getId());
		return "opersuc";
	}

	/*
	 * 修改商品信息
	 */
	public void update() {
		System.out.println(category.getId() + "----"
				+ category.getName().trim());
		boolean isexist = categoryService.getCategoryByName(category.getName()
				.trim());
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			write.close();
		}
	}

	/*
	 * 接受表单的数据，将页面刷新一下
	 */
	public String refresh() {
		return "opersuc";
	}

	// getter 和setter
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

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

}
