package com.mahadev.common.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.SQLType;
import java.sql.Types;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.stereotype.Repository;

import com.utils.CommonUtility;

import oracle.jdbc.OracleTypes;

@Repository
public class CommonProcedureDao {

	@Autowired
	DataSource dataSource;
	
	private final DateFormat DATE_FORMAT_WITH_SLASH1 = new SimpleDateFormat("yyyy-MM-dd"); 
	
	//LALJI LILAPARA
	
	
		public Map<String, Object> getHrmsCommonWebService(Map<String, Object> map) throws Exception{
			Connection connection = null;
			ResultSetMetaData rsmd = null;
			Map<String, Object> returnMap = new HashMap<>();
			JSONArray json = new JSONArray();
			String serviceName = (String) map.get("serviceName");
			String serviceType = (String) map.get("serviceType");
			String reqstBody = (String) map.get("reqdata");
			String crtUser = (String) map.get("reqdata");
			String crtIp = (String) map.get("reqdata");
			try {
//				session = getSessionFactory().openSession();
//				connection = ((SessionImplementor) session).connection();
				connection = DataSourceUtils.getConnection(dataSource);

				CallableStatement query = connection.prepareCall("CALL PROC_GET_HRMS_WEB_DATA (?,?,?,?,?,?,?)");
				query.setString(1, serviceName);
				query.setString(2, serviceType);
				query.setString(3, reqstBody);
				query.setString(4, crtIp);
				query.setString(5, crtUser);
				query.registerOutParameter(6, java.sql.Types.REF_CURSOR);
				query.registerOutParameter(7, java.sql.Types.REF_CURSOR);

				query.executeUpdate();
				String out = query.getString(7);
				returnMap.put("msg", out);
				if (!CommonUtility.checkString(out)) {
//					if (("TRUE").equals(out)) {
						ResultSet rs = null;
						if (query.getObject(6) != null) {
							rs = (ResultSet) query.getObject(6);
							rsmd = rs.getMetaData();
							while (rs.next()) {
								int numColumns = rsmd.getColumnCount();
								JSONObject obj = new JSONObject();

								for (int i = 1; i < numColumns + 1; i++) {
									String column_name = rsmd.getColumnName(i).toLowerCase();

									if (rsmd.getColumnType(i) == java.sql.Types.ARRAY) {
										obj.put(column_name, rs.getArray(column_name));
									} else if (rsmd.getColumnType(i) == java.sql.Types.BIGINT) {
										obj.put(column_name, rs.getInt(column_name));
									} else if (rsmd.getColumnType(i) == java.sql.Types.BOOLEAN) {
										obj.put(column_name, rs.getBoolean(column_name));
									} else if (rsmd.getColumnType(i) == java.sql.Types.BLOB) {
										obj.put(column_name, rs.getBlob(column_name));
									} else if (rsmd.getColumnType(i) == java.sql.Types.DOUBLE) {
										obj.put(column_name, rs.getDouble(column_name));
									} else if (rsmd.getColumnType(i) == java.sql.Types.FLOAT) {
										obj.put(column_name, rs.getFloat(column_name));
									} else if (rsmd.getColumnType(i) == java.sql.Types.INTEGER) {
										obj.put(column_name, rs.getInt(column_name));
									} else if (rsmd.getColumnType(i) == java.sql.Types.NVARCHAR) {
										obj.put(column_name, rs.getNString(column_name) == null ? JSONObject.NULL
												: rs.getNString(column_name));
									} else if (rsmd.getColumnType(i) == java.sql.Types.VARCHAR) {
										obj.put(column_name, rs.getString(column_name) == null ? JSONObject.NULL
												: rs.getString(column_name));
									} else if (rsmd.getColumnType(i) == java.sql.Types.TINYINT) {
										obj.put(column_name, rs.getInt(column_name));
									} else if (rsmd.getColumnType(i) == java.sql.Types.SMALLINT) {
										obj.put(column_name, rs.getInt(column_name));
									} else if (rsmd.getColumnType(i) == java.sql.Types.NCLOB) {
										obj.put(column_name,
												rs.getNClob(column_name).getSubString(1,
														(int) rs.getNClob(column_name).length()) == null ? JSONObject.NULL
																: rs.getNClob(column_name).getSubString(1,
																		(int) rs.getNClob(column_name).length()));
									} else if (rsmd.getColumnType(i) == java.sql.Types.CLOB) {
										obj.put(column_name,
												rs.getClob(column_name).getSubString(1,
														(int) rs.getClob(column_name).length()) == null ? JSONObject.NULL
																: rs.getClob(column_name).getSubString(1,
																		(int) rs.getClob(column_name).length()));
										/*
										 * } else if (rsmd.getColumnType(i) == java.sql.Types.NULL) {
										 * obj.put(column_name, JSONObject.NULL);
										 */
									} else if (rsmd.getColumnType(i) == java.sql.Types.DATE) {
										/*
										 * if(rs.getDate(column_name) !=null) {
										 */
										obj.put(column_name, rs.getDate(column_name) == null ? JSONObject.NULL
												: DATE_FORMAT_WITH_SLASH1.format(rs.getDate(column_name)));
//									}
									} else if (rsmd.getColumnType(i) == java.sql.Types.TIMESTAMP) {
										/*
										 * if(rs.getTimestamp(column_name) !=null) {
										 */
										obj.put(column_name, rs.getTimestamp(column_name) == null ? JSONObject.NULL
												: DATE_FORMAT_WITH_SLASH1.format(rs.getTimestamp(column_name)));
//											rs.getTimestamp(column_name));
//									}
									} else {
										obj.put(column_name, rs.getObject(column_name) == null ? JSONObject.NULL
												: rs.getObject(column_name));
									}
								}
								json.put(obj);
							}
							returnMap.put("json", json);
						}
//					}
				}
			} catch (Exception e) {
				System.out.println(e);
				returnMap.put("errorMsg", e.toString());
//				returnMap.put("msg", "false");
			} finally {

				if (connection != null) {
					try {
						connection.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				connection.close();
			}
			return returnMap;

		}


		
		//LALJI LILAPARA
	
	
		//Start : Sajjad

		public Map<String, Object> getMahadevMasterWebServices(Map<String, Object> setMap) throws Exception {
			Connection connection = null;
			Map<String, Object> returnMap = new HashMap<>();
			String serviceName = (String) setMap.get("serviceName");
			String reqstBody = (String) setMap.get("reqdata");
			try {
				connection = DataSourceUtils.getConnection(dataSource);
				CallableStatement query = connection.prepareCall("CALL PROC_GET_MASTER_DATA (?,?,?)");
				query.setString(1, serviceName);
				query.setString(2, reqstBody);
				query.registerOutParameter(3, OracleTypes.VARCHAR);
				query.executeUpdate();
				String out = query.getString(3);
				returnMap.put("json", out);
			} catch (Exception e) {
				System.out.println(e);
				returnMap.put("errorMsg", e.toString());
				returnMap.put("msg", "false");
			} finally {
				if (connection != null) {
					try {
						connection.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				connection.close();
			}
			return returnMap;

		}
		public Map<String, Object> getUserManagementWebServices(Map<String, Object> map) throws Exception{
			Connection connection = null;
			ResultSetMetaData rsmd = null;
			Map<String, Object> returnMap = new HashMap<>();
			JSONArray json = new JSONArray();
			String serviceName = (String) map.get("serviceName");
			String serviceType = (String) map.get("serviceType");
			String reqstBody = (String) map.get("reqdata");
			try {
//				session = getSessionFactory().openSession();
//				connection = ((SessionImplementor) session).connection();
				connection = DataSourceUtils.getConnection(dataSource);

				CallableStatement query = connection.prepareCall("CALL panchatantra.PROC_GET_ADMIN_USER_WEB_DATA (?,?,?,?,?,?,?)");
				query.setString(1, serviceName);
				query.setString(2, serviceType);
				query.setString(3, reqstBody);
				query.setString(4, "ADMIN");
				query.setString(5, "0.0.0.1");
				query.registerOutParameter(6, java.sql.Types.REF_CURSOR);
				query.registerOutParameter(7, java.sql.Types.VARCHAR);

				query.executeUpdate();
				String out = query.getString(7);
				returnMap.put("msg", out);
				if (!CommonUtility.checkString(out)) {
//					if (("TRUE").equals(out)) {
						ResultSet rs = null;
						if (query.getObject(7) != null) {
							rs = (ResultSet) query.getObject(6);
							rsmd = rs.getMetaData();
							while (rs.next()) {
								int numColumns = rsmd.getColumnCount();
								JSONObject obj = new JSONObject();

								for (int i = 1; i < numColumns + 1; i++) {
									String column_name = rsmd.getColumnName(i).toLowerCase();

									if (rsmd.getColumnType(i) == java.sql.Types.ARRAY) {
										obj.put(column_name, rs.getArray(column_name));
									} else if (rsmd.getColumnType(i) == java.sql.Types.BIGINT) {
										obj.put(column_name, rs.getInt(column_name));
									} else if (rsmd.getColumnType(i) == java.sql.Types.BOOLEAN) {
										obj.put(column_name, rs.getBoolean(column_name));
									} else if (rsmd.getColumnType(i) == java.sql.Types.BLOB) {
										obj.put(column_name, rs.getBlob(column_name));
									} else if (rsmd.getColumnType(i) == java.sql.Types.DOUBLE) {
										obj.put(column_name, rs.getDouble(column_name));
									} else if (rsmd.getColumnType(i) == java.sql.Types.FLOAT) {
										obj.put(column_name, rs.getFloat(column_name));
									} else if (rsmd.getColumnType(i) == java.sql.Types.INTEGER) {
										obj.put(column_name, rs.getInt(column_name));
									} else if (rsmd.getColumnType(i) == java.sql.Types.NVARCHAR) {
										obj.put(column_name, rs.getNString(column_name) == null ? JSONObject.NULL
												: rs.getNString(column_name));
									} else if (rsmd.getColumnType(i) == java.sql.Types.VARCHAR) {
										obj.put(column_name, rs.getString(column_name) == null ? JSONObject.NULL
												: rs.getString(column_name));
									} else if (rsmd.getColumnType(i) == java.sql.Types.TINYINT) {
										obj.put(column_name, rs.getInt(column_name));
									} else if (rsmd.getColumnType(i) == java.sql.Types.SMALLINT) {
										obj.put(column_name, rs.getInt(column_name));
									} else if (rsmd.getColumnType(i) == java.sql.Types.NCLOB) {
										obj.put(column_name,
												rs.getNClob(column_name).getSubString(1,
														(int) rs.getNClob(column_name).length()) == null ? JSONObject.NULL
																: rs.getNClob(column_name).getSubString(1,
																		(int) rs.getNClob(column_name).length()));
									} else if (rsmd.getColumnType(i) == java.sql.Types.CLOB) {
										obj.put(column_name,
												rs.getClob(column_name).getSubString(1,
														(int) rs.getClob(column_name).length()) == null ? JSONObject.NULL
																: rs.getClob(column_name).getSubString(1,
																		(int) rs.getClob(column_name).length()));
										/*
										 * } else if (rsmd.getColumnType(i) == java.sql.Types.NULL) {
										 * obj.put(column_name, JSONObject.NULL);
										 */
									} else if (rsmd.getColumnType(i) == java.sql.Types.DATE) {
										/*
										 * if(rs.getDate(column_name) !=null) {
										 */
										obj.put(column_name, rs.getDate(column_name) == null ? JSONObject.NULL
												: DATE_FORMAT_WITH_SLASH1.format(rs.getDate(column_name)));
//									}
									} else if (rsmd.getColumnType(i) == java.sql.Types.TIMESTAMP) {
										/*
										 * if(rs.getTimestamp(column_name) !=null) {
										 */
										obj.put(column_name, rs.getTimestamp(column_name) == null ? JSONObject.NULL
												: DATE_FORMAT_WITH_SLASH1.format(rs.getTimestamp(column_name)));
//											rs.getTimestamp(column_name));
//									}
									} else {
										obj.put(column_name, rs.getObject(column_name) == null ? JSONObject.NULL
												: rs.getObject(column_name));
									}
								}
								json.put(obj);
							}
							returnMap.put("json", json);
						}
//					}
				}
			} catch (Exception e) {
				System.out.println(e);
				returnMap.put("errorMsg", e.toString());
//				returnMap.put("msg", "false");
			} finally {

				if (connection != null) {
					try {
						connection.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				connection.close();
			}
			return returnMap;

		}
		public Map<String, Object> getWebServicesData(Map<String, Object> setMap) throws Exception {
			Connection connection = null;
			JSONArray json = new JSONArray();
			Map<String, Object> returnMap = new HashMap<>();
			String serviceName = (String) setMap.get("serviceName");
			String reqstType = (String) setMap.get("serviceType");
			String reqstBody = (String) setMap.get("reqdata");
			String crtUser = (String) setMap.get("crt_user");
			String crtIp = (String) setMap.get("crt_ip");
			
			
			try {
				int j=0;
				int out = 0;
				
//				connection = getDataSource("trnServer");
				connection =  DataSourceUtils.getConnection(dataSource);
				CallableStatement cstmt = connection.prepareCall( "call PROC_GET_ADMIN_MASTER_DATA(?,?,?,?,?,?)" );  
				cstmt.setString(++j, serviceName);
				cstmt.setString(++j, reqstType);
				cstmt.setString(++j, reqstBody);
				cstmt.setString(++j, crtIp);
				cstmt.setString(++j, crtUser);
				out = ++j;
				cstmt.registerOutParameter(out, OracleTypes.VARCHAR);
				boolean hasMoreResultSets = cstmt.execute();  
				   ResultSet rs = null;
				   returnMap.put("msg", cstmt.getObject(out));
				   System.out.println(cstmt.getObject(out));
				    if ( hasMoreResultSets ) {  
				    	do
				    	{
				    	rs=cstmt.getResultSet();
				        ResultSetMetaData rsmd = rs.getMetaData();
				        while (rs.next()) {
				        	int col = rsmd.getColumnCount();
				        	JSONObject obj = new JSONObject();
				    		for (int i = 1; i < col + 1; i++) {
								String column_name = rsmd.getColumnName(i).toLowerCase();
								
								if (rsmd.getColumnType(i) == java.sql.Types.ARRAY) {
									obj.put(column_name, rs.getArray(column_name));
								} else if (rsmd.getColumnType(i) == java.sql.Types.BIGINT) {
									obj.put(column_name, rs.getLong(column_name));
								} else if (rsmd.getColumnType(i) == java.sql.Types.BOOLEAN) {
									obj.put(column_name, rs.getBoolean(column_name));
								} else if (rsmd.getColumnType(i) == java.sql.Types.BLOB) {
									obj.put(column_name, rs.getBlob(column_name));
								} else if (rsmd.getColumnType(i) == java.sql.Types.DOUBLE) {
									obj.put(column_name, rs.getDouble(column_name));
								} else if (rsmd.getColumnType(i) == java.sql.Types.FLOAT) {
									obj.put(column_name, rs.getFloat(column_name));
								} else if (rsmd.getColumnType(i) == java.sql.Types.INTEGER) {
									obj.put(column_name, rs.getInt(column_name));
								} else if (rsmd.getColumnType(i) == java.sql.Types.NVARCHAR) {
									obj.put(column_name, rs.getNString(column_name) == null ? JSONObject.NULL
											: rs.getNString(column_name));
								} else if (rsmd.getColumnType(i) == java.sql.Types.VARCHAR) {
									obj.put(column_name, rs.getString(column_name) == null ? JSONObject.NULL
											: rs.getString(column_name));
								} else if (rsmd.getColumnType(i) == java.sql.Types.TINYINT) {
									obj.put(column_name, rs.getInt(column_name));
								} else if (rsmd.getColumnType(i) == java.sql.Types.SMALLINT) {
									obj.put(column_name, rs.getInt(column_name));
								} else if (rsmd.getColumnType(i) == java.sql.Types.NCLOB) {
									obj.put(column_name,rs.getNClob(column_name).getSubString(1,
									(int) rs.getNClob(column_name).length()) == null ? JSONObject.NULL
									: rs.getNClob(column_name).getSubString(1,(int) rs.getNClob(column_name).length()));
								} else if (rsmd.getColumnType(i) == java.sql.Types.CLOB) {
									obj.put(column_name,rs.getClob(column_name).getSubString(1,
									(int) rs.getClob(column_name).length()) == null ? JSONObject.NULL: rs.getClob(column_name).getSubString(1,
									(int) rs.getClob(column_name).length()));
								} else if (rsmd.getColumnType(i) == java.sql.Types.DATE) {
									obj.put(column_name, rs.getDate(column_name) == null ? JSONObject.NULL
											: DATE_FORMAT_WITH_SLASH1.format(rs.getDate(column_name)));
								} else if (rsmd.getColumnType(i) == java.sql.Types.TIMESTAMP) {
									obj.put(column_name, rs.getTimestamp(column_name) == null ? JSONObject.NULL
											: DATE_FORMAT_WITH_SLASH1.format(rs.getTimestamp(column_name)));
								} else {
									obj.put(column_name, rs.getObject(column_name) == null ? JSONObject.NULL
											: rs.getObject(column_name));
								}
							}
				    		json.put(obj);
			            }
				        rs.close();
				    	}while(cstmt.getMoreResults());
				    	returnMap.put("json", json);
				    } 
			} catch (Exception e) {
				System.out.println(e);
				returnMap.put("errorMsg", e.toString());
				returnMap.put("msg", "false");
			} finally {
				if (connection != null) {
					try {
						connection.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				connection.close();
			}
			return returnMap;
			
			
		}
		
		//End : Sajjad
}
