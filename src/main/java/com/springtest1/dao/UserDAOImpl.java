package com.springtest1.dao;

import com.hibtest1.entity.Users;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.sql.SQLException;
import java.util.List;

public class UserDAOImpl extends HibernateDaoSupport implements UserDAO {
	/*
	 * public boolean login(String username, String password) { if
	 * (username.equals("admin") && password.equals("123")) { return true; }
	 * return false; }
	 * 
	 * /* public boolean validate(String loginName, String loginPwd) { // TODO
	 * Auto-generated method stub boolean flag = false; // ��װ��ѯ���� Users
	 * condition = new Users(); condition.setLoginName(loginName);
	 * condition.setLoginPwd(loginPwd); // ����BaseHibernateDAO���е�search����
	 * List list = super.search(Users.class, condition); if (list.size() > 0) {
	 * flag = true; } return flag; } Ϊ���
	 */

	/*
	 * public boolean login(String username, String password){ boolean flag =
	 * false; // ��װ��ѯ���� Users condition = new Users();
	 * condition.setLoginName(username); condition.setLoginPwd(password); //
	 * ����BaseHibernateDAO���е�search���� List list = super.search(Users.class,
	 * condition); if (list.size() > 0) { flag = true; } return flag; }
	 */

	public List search(final Users condition) {
		return super.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Criteria c = session.createCriteria(Users.class);
						if (condition != null) {
							if (condition.getLoginName() != null
									&& !condition.getLoginName().equals("")) {
								c.add(Restrictions.eq("loginName",
										condition.getLoginName()));
							}
							if (condition.getLoginPwd() != null
									&& !condition.getLoginPwd().equals("")) {
								c.add(Restrictions.eq("loginPwd",
										condition.getLoginPwd()));
							}
						}
						return c.list();
					}
				});
	}

	public void register(Users user) {
		super.getHibernateTemplate().save(user); // 新增用戶
	}

}
