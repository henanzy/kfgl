package com.hnzy.hot.service;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.hnzy.hot.pojo.YhInfo;

public interface YhxxService {
	public List<Map<String,String>> findYhxx(@Param("xqName") String xqName,@Param("buildNO") String buildNO,@Param("cellNO") String cellNO,@Param("houseNO") String houseNO);
	public void addYhxx(YhInfo yhInfo);
	public void updateYhxx(YhInfo yhInfo);
	public List<String> findxqName();
	public List<String> findLd(@Param("xqName") String xqName);
	public List<String> findDy(@Param("xqName") String xqName,@Param("buildNO") String buildNO);
	public List<String> findHh(@Param("xqName") String xqName,@Param("buildNO") String buildNO,@Param("cellNO") String cellNO);
	public void delete(Integer id);
	public void importExcelInfo(InputStream in, MultipartFile file,Integer adminId) throws Exception;
	public void qdelete();
}
