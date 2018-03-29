package com.tsystems.javaschoolshop.service.impl;

import com.tsystems.javaschoolshop.dao.api.UserDao;
import com.tsystems.javaschoolshop.model.Address;
import com.tsystems.javaschoolshop.model.User;
import com.tsystems.javaschoolshop.service.api.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserServiceImpl implements UserService {

    private final UserDao userDao;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    public UserServiceImpl(final UserDao userDao,PasswordEncoder passwordEncoder) {
        this.userDao = userDao;
        this.passwordEncoder=passwordEncoder;    }

    @Override
    public User findUserByEmail(final String email) {
        if (email == null || email.isEmpty()) return null;
        return userDao.findUserByEmail(email);
    }

    @Override
    public User findUserFromSecurityContextHolder() {
        return findUserByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
    }

    @Override
    public boolean isEmailFree(final String email) {
        if (email == null || email.isEmpty() || email.trim().length()>45) return false;
        return userDao.findUserByEmail(email) == null;
    }

    @Override
    public boolean isPhoneFree(final String phone) {
        if (phone == null || phone.trim().length()>20) return false;
        return userDao.findUserByPhone(phone) == null;
    }

    @Override
    public void createUser(User user,String role) {
        if(user.getPhone().trim().length() == 0) user.setPhone(null);
        if(user.getLastNameUser().trim().length() == 0) user.setLastNameUser(null);
        user.setRole(role);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userDao.saveUser(user);
    }

    @Override
    public void changePassword(String oldPassword, String newPassword) {
        User user = findUserFromSecurityContextHolder();
        if(passwordEncoder.matches(oldPassword,user.getPassword())){
            user.setPassword(passwordEncoder.encode(newPassword));
            userDao.saveUser(user);
        }
    }

    @Override
    public void saveAddress(Address address) {
        User user = findUserFromSecurityContextHolder();
        address.setUser(user);
        user.getAddresses().add(address);
        userDao.saveUser(user);
    }

    @Override
    public void deleteAddress(int idAddress){
        User user = findUserFromSecurityContextHolder();
        user.getAddresses().remove(userDao.findAddressById(idAddress));
        userDao.saveUser(user);
    }

    @Override
    public Address findAddressById(int idAddress) {
        return userDao.findAddressById(idAddress);
    }

    @Override
    public void saveUser(User user) {
        userDao.saveUser(user);
    }

    @Override
    public List<User> findTopNUsers() {
        return userDao.findTopNUsers(3);
    }

    @Override
    public List<User> findSimpleAdmins() {
        return userDao.findSimpleAdmins();
    }

    @Override
    public void deleteUser(int id) {
        userDao.deleteUser(id);
    }

}
