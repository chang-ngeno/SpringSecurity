package ke.go.kra.itax.chang.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ke.go.kra.itax.chang.model.Role;

@Repository("roleRepo")
public interface RoleRepo extends JpaRepository<Role, Integer> {
    Role findByRole(String role);

}