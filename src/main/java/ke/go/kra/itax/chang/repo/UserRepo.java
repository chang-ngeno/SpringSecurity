package ke.go.kra.itax.chang.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ke.go.kra.itax.chang.model.User;

@Repository("userRepo")
public interface UserRepo extends JpaRepository<User, Long> {
    User findByEmail(String email);
}