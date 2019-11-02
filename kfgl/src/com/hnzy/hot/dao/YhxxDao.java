package com.hnzy.hot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.hnzy.hot.pojo.YhInfo;

public interface YhxxDao {
	public List<Map<String,String>> findYhxx(@Param("xqName") String xqName,@Param("buildNO") String buildNO,@Param("cellNO") String cellNO,@Param("houseNO") String houseNO);
	public void addYhxx(YhInfo yhInfo);
	public void updateYhxx(YhInfo yhInfo);
	public List<String> findLd(@Param("xqName") String xqName);
	public List<String> findDy(@Param("xqName") String xqName,@Param("buildNO") String buildNO);
	public List<String> findHh(@Param("xqName") String xqName,@Param("buildNO") String buildNO,@Param("cellNO") String cellNO);
	public List<String> findxqName();
	public void delete(Integer id);
	public void qdelete();
}
