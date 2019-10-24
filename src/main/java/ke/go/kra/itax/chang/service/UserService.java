package ke.go.kra.itax.chang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import ke.go.kra.itax.chang.model.Role;
import ke.go.kra.itax.chang.model.User;
import ke.go.kra.itax.chang.repo.RoleRepo;
import ke.go.kra.itax.chang.repo.UserRepo;

import java.util.Arrays;
import java.util.HashSet;

@Service("userService")
public class UserService {

    private UserRepo userRepo;
    private RoleRepo roleRepo;
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    public UserService(UserRepo userRepo,
                       RoleRepo roleRepo,
                       BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.userRepo = userRepo;
        this.roleRepo = roleRepo;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    public User findUserByEmail(String email) {
        return userRepo.findByEmail(email);
    }

    public void saveUser(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setActive(1);
        Role userRole = roleRepo.findByRole("ROLE_USER");
        user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
        userRepo.save(user);
    }

}