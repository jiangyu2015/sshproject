package com.hibtest1;

import com.hibtest1.entity.Users;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class TestAdd {
	public static void main(String[] args) {
		new TestAdd().addUser();
	}

	private void addUser() {
		Users user = new Users();
		user.setLoginName("lushifeng");
		user.setLoginPwd("123445566");
		Configuration config = new Configuration().configure();
		SessionFactory sessionFactory = config.buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			System.out.println("123");
			session.save(user);
			tx.commit();

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

}
