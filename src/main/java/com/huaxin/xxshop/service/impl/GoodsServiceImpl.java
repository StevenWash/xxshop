package com.huaxin.xxshop.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.huaxin.xxshop.dao.CategoryDao;
import com.huaxin.xxshop.dao.GoodsDao;
import com.huaxin.xxshop.entity.Goods;
import com.huaxin.xxshop.entity.PageBean;
import com.huaxin.xxshop.service.GoodsService;
import com.huaxin.xxshop.util.XXShopUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.apache.lucene.search.Query;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.BooleanClause;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.nio.file.FileSystems;


/**
 * 商品实体类对应的服务层实现
 * 
 * @author 没有蜡笔的小新 2015-12-26
 */
@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsDao goodsDao = null;
	@Autowired
	private CategoryDao categoryDao = null;

	/**
	 * 商品搜索
	 *
	 * @author 小轲轲是个美男子 2018年1月19日
	 */
	public static final String INDEX_PATH = "\\service";
	public void createIndex() {
		IndexWriter indexWriter = null;

		List<Goods> goodsList = getGoods(new Goods());


		try {
			Directory directory = FSDirectory.open(FileSystems.getDefault().getPath(INDEX_PATH));
			Analyzer analyzer = new IKAnalyzer(true);
			//Analyzer analyzer = new StandardAnalyzer();
			IndexWriterConfig indexWriterConfig = new IndexWriterConfig(analyzer);
			indexWriter = new IndexWriter(directory, indexWriterConfig);
			indexWriter.deleteAll();


			for (Goods goods : goodsList) {
				Document document = new Document();
				Field fieldID = new Field("ID", goods.getId(), TextField.TYPE_STORED);
				Field fieldName = new Field("Name", goods.getName(), TextField.TYPE_STORED);
				Field fieldDescription = new Field("Description", goods.getDescription(), TextField.TYPE_STORED);
				System.out.println(goods.getId());
				System.out.println(goods.getName());
				System.out.println(goods.getDescription());
				fieldID.setBoost((float) 2.0);
				fieldName.setBoost((float) 0.5);
				fieldDescription.setBoost((float) 0.1);
				document.add(fieldID);
				document.add(fieldName);
				document.add(fieldDescription);
				indexWriter.addDocument(document);
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (indexWriter != null)
					indexWriter.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public List<Goods> search(String keyWord) {
		DirectoryReader directoryReader = null;
		List<Goods> goods_result = new ArrayList<>();
		try {
			Directory directory = FSDirectory.open(FileSystems.getDefault().getPath(INDEX_PATH));
			directoryReader = DirectoryReader.open(directory);
			IndexSearcher indexSearcher = new IndexSearcher(directoryReader);

			Analyzer analyzer = new IKAnalyzer(true);

			String[] fields = {"ID", "Name", "Description"};
			BooleanClause.Occur[] clauses = {BooleanClause.Occur.SHOULD, BooleanClause.Occur.SHOULD,
					BooleanClause.Occur.SHOULD};
			Query multiFieldQuery = MultiFieldQueryParser.parse(keyWord, fields, clauses, analyzer);
			TopDocs topDocs = indexSearcher.search(multiFieldQuery, 100);
			//out.print("共搜索到<font color=red>" + topDocs.totalHits + "</font>条" + "关于<font color=red>" + keyWord
			//		+ "</font>的结果<br>");
			System.out.println("共搜索到<font color=red>" + topDocs.totalHits + "</font>条" + "关于<font color=red>" + keyWord
					+ "</font>的结果<br>");
			ScoreDoc[] scoreDocs = topDocs.scoreDocs;

			for (ScoreDoc scoreDoc : scoreDocs) {
				Document document = indexSearcher.doc(scoreDoc.doc);
				goods_result.add(getGoodsById(document.get("ID")));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (directoryReader != null)
					directoryReader.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return goods_result;
	}




	@Override
	public void addGoods(Goods goods) {
		goods.setId(XXShopUtil.getId());
		goodsDao.addGoods(goods);
		categoryDao.updateGoodsNum(goods.getCategoryId(), categoryDao
				.getCategoryById(goods.getCategoryId()).getGoodsNum() + 1);
	}

	@Override
	public List<Goods> getGoods(Goods goods) {
		return goodsDao.getGoods(goods);
	}

	@Override
	public Goods getGoodsById(String id) {
		return goodsDao.getGoodsById(id);
	}

	@Override
	public PageBean<Goods> getGoodsByPage(int page, Goods goods) {
		// 页面的大小
		int pageSize = 6;
		PageBean<Goods> pageBean = new PageBean<>();
		Map<String, Object> params = new HashMap<>();
		params.put("indexPage", (page - 1) * pageSize);
		params.put("pageSize", pageSize);
		params.put("goods", goods);

		List<Goods> data = goodsDao.getGoodsByPage(params);

		pageBean.setData(data);
		pageBean.setPage(page);
		pageBean.setPageSize(pageSize);
		pageBean.setActualPageSize(data.size());
		int totalNum = goodsDao.getGoodsNum(goods);
		pageBean.setTotalNum(totalNum);
		int totalPage = totalNum % pageSize == 0 ? totalNum / pageSize
				: totalNum / pageSize + 1;
		pageBean.setTotalPage(totalPage);
		return pageBean;
	}

	@Override
	public void updateGoods(Goods goods) {
		Goods oldGoods = goodsDao.getGoodsById(goods.getId());
		oldGoods.setName(goods.getName());
		oldGoods.setStock(goods.getStock());
		oldGoods.setPrice1(goods.getPrice1());
		oldGoods.setPrice2(goods.getPrice2());
		oldGoods.setThumbnail(goods.getThumbnail());
		oldGoods.setDescription(goods.getDescription());

		goodsDao.updateGoods(oldGoods);
	}

	@Override
	public void deleteGoods(Goods goods) {
		goodsDao.deleteGoods(goods.getId());
		categoryDao.updateGoodsNum(goods.getCategoryId(), categoryDao
				.getCategoryById(goods.getCategoryId()).getGoodsNum() - 1);
	}

	@Override
	public List<Goods> getGoodsByCateId(String cateId) {
		return goodsDao.getGoodsByCateId(cateId, 6);// 6表示显示的条数为6
	}

	@Override
	public List<Goods> getGoodsByIds(String... ids) {
		return goodsDao.getGoodsByIds(ids);
	}

	@Override
	public List<Goods> getGoodsByOrder(String order, int num, String cateId) {
		Map<String, Object> params = new HashMap<>();
		params.put("order", order);
		params.put("num", num);
		params.put("cateId", cateId);
		return goodsDao.getGoodsByOrder(params);
	}

	@Override
	public List<Goods> getGoodsBySellNum(int num) {
		return goodsDao.getGoodsBySellNum(10);
	}

	@Override
	public List<Goods> getGoodsBySellTime(int num) {
		return goodsDao.getGoodsBySellTime(num);
	}

	@Override
	public List<Goods> getGoodsByRole(int num) {
		return goodsDao.getGoodsByRole(10);
	}

	// getter 和setter
	public GoodsDao getGoodsDao() {
		return goodsDao;
	}

	public void setGoodsDao(GoodsDao goodsDao) {
		this.goodsDao = goodsDao;
	}

	public CategoryDao getCategoryDao() {
		return categoryDao;
	}

	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}

}
