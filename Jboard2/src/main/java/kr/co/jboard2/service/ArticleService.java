package kr.co.jboard2.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.jboard2.dao.ArticleDAO;
import kr.co.jboard2.vo.ArticleVO;
import kr.co.jboard2.vo.FileVO;

public enum ArticleService {
	
	INSTANCE;
	private ArticleDAO dao;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService() {
		dao = new ArticleDAO();
	}
	
	public int insertArticle(ArticleVO article) {
		return dao.insertArticle(article);
	}
	public void insertFile(int parent, String newName, String fname) {
		dao.insertFile(parent, newName, fname);
	}
	public ArticleVO selectArticle(String no) {
		return dao.selectArticle(no);
	}
	public List<ArticleVO> selectArticles(int limitStart) {
		return dao.selectArticles(limitStart);
	}
	public List<ArticleVO> selectArticlesByKeyword(String keyword, int start){
		return dao.selectArticlesByKeyword(keyword, start);
	}
	public FileVO selectFile(String parent) {
		return dao.selectFile(parent);
	}
	public List<ArticleVO> selectComments(String no) {
		return dao.selectComments(no);
	}
	public int selectCountTotal(String keyword) {
		return dao.selectCountTotal(keyword);
	}
	public void updateArticle(String no, String title, String content) {
		dao.updateArticle(no, title, content);
	}
	public void updateArticleHit(String no) {
		dao.updateArticleHit(no);
	}
	public void updateFileDownload(int fno) {
		dao.updateFileDownload(fno);
	}
	public void deleteArticle(String no) {
		dao.deleteArticle(no);
	}
	public String deleteFile(String no) {
		return dao.deleteFile(no);
	}
	
	
	// 추가적인 서비스 로직
	public MultipartRequest uploadFile(HttpServletRequest req, String savePath) throws IOException {
		int maxSize = 1024 * 1024 * 10;
		return new MultipartRequest(req, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	}
	
	public String renameFile(String fname, String uid, String path) {
		// 파일명 수정
		int i = fname.lastIndexOf(".");
		String ext = fname.substring(i);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_");
		String now = sdf.format(new Date());
		String newName = now+uid+ext;
		
		File f1 = new File(path+"/"+fname);
		File f2 = new File(path+"/"+newName);
		
		f1.renameTo(f2);
	
		return newName;
	}
	
	public int[] getPageGroupNum(int currentPage, int lastPageNum) {
		
		int PageGroupCurrent = (int) Math.ceil(currentPage / 10.0);
		int PageGroupStart = (PageGroupCurrent - 1) * 10 + 1;
		int PageGroupEnd = PageGroupCurrent * 10;
		
		if(PageGroupEnd > lastPageNum) {
			PageGroupEnd = lastPageNum;
		}
		
		int[] result = {PageGroupStart, PageGroupEnd};
		
		return result;
	
	}

}
