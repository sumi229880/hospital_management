package com.neu.security;

import org.hibernate.Query;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.neu.dao.DAO;
import com.neu.pojo.User;

@Service("userDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService{
	
	@SuppressWarnings("deprecation")
	@Override
	@Transactional(readOnly=true)
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		Query query = (Query) DAO.getSession().createQuery("from User where emailId = :email");
		query.setString("email", email);
		User user = (User) query.uniqueResult();
		if(user != null){
/*		Collection<GrantedAuthority> grantedAuthority = new ArrayList<GrantedAuthority>();
		grantedAuthority.add( new GrantedAuthorityImpl("patient"));
		grantedAuthority.add(new GrantedAuthorityImpl("doctor"));
		grantedAuthority.add(new GrantedAuthorityImpl("admin"));
		grantedAuthority.add(new GrantedAuthorityImpl("receptionist"));
		
		org.springframework.security.core.userdetails.User securityUser= new org.springframework.
				security.core.userdetails.User(email,user.getPassword(),grantedAuthority); */
		return user; //securityUser
		}
		else{
			throw new UsernameNotFoundException("User does not exist!!");	
		}
	}

}